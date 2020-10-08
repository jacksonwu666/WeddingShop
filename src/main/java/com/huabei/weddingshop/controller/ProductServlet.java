package com.huabei.weddingshop.controller;

import com.huabei.weddingshop.entity.Product;
import com.huabei.weddingshop.service.CategoryService;
import com.huabei.weddingshop.service.ProductService;
import com.huabei.weddingshop.vo.PageVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductServlet extends BaseServlet {

    private ProductService service = new ProductService();
    private CategoryService categoryService = new CategoryService();

    //首页展示
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //热门商品
        List<Product> productsHot = service.viewHot();
        request.setAttribute("productsHot",productsHot);

        //跳转至index.jsp
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }

    //查看商品列表
    public void viewProductListByCid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //从请求参数中获取当前页
        String page = request.getParameter("pageNow");
        int pageNow = 1;  //默认查询第一页
        if(page!=null){
            pageNow = Integer.parseInt(page);
        }

        //从请求参数中获取查询条件  pname  cid
        String pname = request.getParameter("pname");
        if(pname==null){
            pname = "";  //默认查询所有
        }

        String cid = request.getParameter("cid");

//        执行service的分页方法
        PageVO<Product> vo = service.viewProductListByCid(cid, pname, pageNow);

        //将vo传递到页面中
        request.setAttribute("vo",vo);
        request.setAttribute("cid",cid);

        request.getRequestDispatcher("shop.jsp").forward(request,response);

    }


    //通过ID编号查询商品信息
    public void viewProductById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pid = request.getParameter("pid");
        //商品信息
        Product product = service.viewProductById(pid);
        request.setAttribute("product",product);

        //商品类别名称
        String cid = request.getParameter("cid");
        if(cid!=null){
            String cname = categoryService.viewCname(cid);
            request.setAttribute("cname",cname);
            request.setAttribute("cid",cid);
        }

        //获取当前页
        String pageNow = request.getParameter("pageNow");
        request.setAttribute("pageNow",pageNow);



        request.getRequestDispatcher("product-details.jsp").forward(request,response);

    }

}
