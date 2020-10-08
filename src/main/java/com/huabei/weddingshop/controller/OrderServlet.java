package com.huabei.weddingshop.controller;


import com.huabei.weddingshop.entity.*;
import com.huabei.weddingshop.service.OrderService;
import com.huabei.weddingshop.utils.CommonUtils;
import com.huabei.weddingshop.vo.PageVO;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 订单的控制层
 */
@WebServlet(urlPatterns = "/order")
public class OrderServlet extends BaseServlet{

    private OrderService service = new OrderService();

    //提交订单
    public void submitOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //大前提  当前必须是登录状态
        HttpSession session = request.getSession();

        //创建订单
        Orders orders = new Orders();
        //随机产生订单号
        orders.setOid(CommonUtils.getUUID().replaceAll("-",""));
        //设置下单时间
        orders.setOrdertime(new Date());

        //从会话中获取购物车信息
        Cart cart = (Cart)session.getAttribute("cart");
        //设置订单总金额
        orders.setTotal(cart.getTotal());

        //设置订单状态 0-未支付
        orders.setState(0);

        //从会话红获取登录用户的信息
        User user = (User) session.getAttribute("user");
        //设置下单者信息
        orders.setUser(user);

        //从会话中的购物车获取了所有的购物项
        Map<String, CartItem> cartMap = cart.getMap();
        for (Map.Entry<String, CartItem> entry : cartMap.entrySet()) {
            CartItem cartItem = entry.getValue();

            //创建订单明细
            OrderItem orderItem = new OrderItem();

            //设置明细编号
            orderItem.setItemid(CommonUtils.getUUID().replaceAll("-",""));
            //设置购买数量
            orderItem.setCount(cartItem.getBuyNum());
            //设置小计
            orderItem.setSubtotal(cartItem.getSubTotal());
            //设置购买商品信息
            orderItem.setProduct(cartItem.getProduct());
            //设置所属订单
            orderItem.setOrders(orders);

            //设置订单中的多个订单明细
            orders.getItemsList().add(orderItem);
        }

        //提交订单
        boolean flag = service.submitOrder(orders);
        if(flag){
            //提交成功
            session.setAttribute("orders",orders);
            response.sendRedirect("order.jsp");
        }else{
            //提交失败
            request.setAttribute("msg","当前订单提交失败，请重新提交");
            request.getRequestDispatcher("cart.jsp").forward(request,response);
        }

    }


    //确认订单
    public void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.收集表单数据
        Map<String, String[]> map = request.getParameterMap();

        HttpSession session = request.getSession();
        Orders orders = (Orders)session.getAttribute("orders");

        //2.更新订单中收货人信息
        int i = 0;
        try {
            BeanUtils.populate(orders,map);
            i = service.updateOrderUser(orders);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //3.跳转至支付页面
        if(i>0){
            response.sendRedirect(request.getContextPath()+"/alipay.trade.page.pay.jsp");
        }
    }

    //查看我的订单
    public void viewMyOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("pageNow");
        //默认查询第一页
        int pageNow = 1;
        if(page!=null){
            pageNow = Integer.parseInt(page);
        }

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user!=null){
            PageVO<Orders> vo = service.viewMyOrders(user.getUid(), pageNow);

            List<Orders> ordersList = vo.getList();

            if(ordersList!=null){
                for (Orders orders : ordersList) {

                    List<Map<String, Object>> mapList = service.viewOrderItem(orders.getOid());

                    for (Map<String, Object> map : mapList) {
                        //订单明细
                        OrderItem orderItem = new OrderItem();
                        //商品信息
                        Product product = new Product();

                        try {
                            BeanUtils.populate(orderItem,map);
                            BeanUtils.populate(product,map);
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                        } catch (InvocationTargetException e) {
                            e.printStackTrace();
                        }

                        //将商品信息装配至订单明细
                        orderItem.setProduct(product);
                        //将订单明细装配至订单
                        orders.getItemsList().add(orderItem);
                    }

                }
            }
            request.setAttribute("vo",vo);
        }


        request.getRequestDispatcher("order-list.jsp").forward(request,response);
    }

}
