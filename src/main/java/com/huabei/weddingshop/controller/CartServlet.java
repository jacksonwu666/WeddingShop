package com.huabei.weddingshop.controller;

import com.huabei.weddingshop.entity.Cart;
import com.huabei.weddingshop.entity.CartItem;
import com.huabei.weddingshop.entity.Product;
import com.huabei.weddingshop.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet(urlPatterns = "/cart")
public class CartServlet extends BaseServlet {

    private ProductService service = new ProductService();

    //添加至购物车
    public void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //创建会话对象
        HttpSession session = request.getSession();

        //获取请求参数中的商品编号pid
        String pid = request.getParameter("pid");

        //获取请求参数中的购买数量buyNum
        int buyNum = Integer.parseInt(request.getParameter("buyNum"));

        //通过pid查询商品信息
        Product product = service.viewProductById(pid);

        //计算当前加入购物车的商品的小计
        double subTotal  =buyNum * product.getShop_price();

        //先从会话中获取购物车
        Cart cart = (Cart) session.getAttribute("cart");

        //若是第一次从会话中获取购物车
        if(cart==null){
            cart = new Cart();
        }

        double newSubTotal = subTotal;

        //获取会话中购物车明细
        Map<String, CartItem> cartItemMap = cart.getMap();

        //当前会话中是否存在正在添加的商品
        if(cartItemMap.containsKey(pid)){
            int oldNum = cartItemMap.get(pid).getBuyNum();
            //合并后的总数量
            buyNum += oldNum;
            //当前合并后，重新计算小计
            newSubTotal = buyNum * product.getShop_price();
        }


        //封装CartItem购物车明细
        CartItem cartItem = new CartItem(product,buyNum,newSubTotal);

        //封装购物车
        cartItemMap.put(pid,cartItem);
        //将购物车明细添加进来
        cart.setMap(cartItemMap);
        //将总金额添加进来
        double total = cart.getTotal() + subTotal;
        cart.setTotal(total);

        session.setAttribute("cart",cart);
        response.sendRedirect("cart.jsp");
    }

    //删除当前购物项
    public void delCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pid = request.getParameter("pid");

        //1.从会话中获取购物车
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");

        //2.获取购物车中的map集合（购物车明细）
        Map<String, CartItem> cartMap = cart.getMap();

        //3.重新计算总金额 = 原来购物车的总金额 - 当前移除的购物项的小计
        double total = cart.getTotal() - cartMap.get(pid).getSubTotal();

        //4.购物车移除当前购物项
        cartMap.remove(pid);

        //5.封装Cart对象
        cart.setTotal(total);

        //6.添加至会话中
        session.setAttribute("cart",cart);

        //7.跳转cart.jsp  避免重复提交表单
        response.sendRedirect("cart.jsp");
    }


    //清空购物车
    public void clearCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //清除会话中的购物车信息
        session.removeAttribute("cart");
        response.sendRedirect("cart.jsp");
    }

}
