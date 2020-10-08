package com.huabei.weddingshop.controller;

import com.google.gson.Gson;

import com.huabei.weddingshop.entity.Admin;
import com.huabei.weddingshop.entity.Category;
import com.huabei.weddingshop.entity.Product;
import com.huabei.weddingshop.service.AdminService;
import com.huabei.weddingshop.utils.CommonUtils;
import com.huabei.weddingshop.utils.ExcelUtil;
import com.huabei.weddingshop.vo.HomeVO;
import com.huabei.weddingshop.vo.PageVO;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "AdminServlet",urlPatterns = "/admin")
@MultipartConfig
public class AdminServlet extends BaseServlet {

    private AdminService service = new AdminService();

    //登录
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminName = request.getParameter("adminName");
        String adminPwd = request.getParameter("adminPwd");

        HttpSession session = request.getSession();
        Admin admin = service.login(adminName, adminPwd);
        if(admin!=null){
           session.setAttribute("admin", admin);
           response.sendRedirect(request.getContextPath()+"/admin/home/home.jsp");
        }else{
            request.setAttribute("msg", "用户名或密码不匹配");
            request.getRequestDispatcher(request.getContextPath()+"/admin/adminlogin.jsp").forward(request, response);
        }
    }

    //登出
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect(request.getContextPath()+"/admin/adminlogin.jsp");
    }

    //查询所有(会员查询所有、商品查询所有、订单查询所有)
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("pageNow");
        String query = request.getParameter("query");

        int pageNow = 1;
        if(page!=null){
            pageNow = Integer.parseInt(page);
        }
        if(query==null){
            query = "";
        }

        String code = request.getParameter("code");
        PageVO vo = service.findAll(code, query, pageNow);

        request.setAttribute("vo", vo);
        request.setAttribute("query", query);

        switch (code){
            case "user":
                //若code是user时，跳转到会员管理界面
                request.getRequestDispatcher(request.getContextPath()+"/admin/user/user.jsp").forward(request, response);
                break;
            case "product":
                //若code是product时，跳转到商品管理界面
                request.getRequestDispatcher(request.getContextPath()+"/admin/product/product.jsp").forward(request, response);
                break;
            case "order":
                //若code是order时，跳转到订单管理界面
                request.getRequestDispatcher(request.getContextPath()+"/admin/order/order.jsp").forward(request, response);
                break;
            case "category":
                //若code是order时，跳转到订单管理界面
                request.getRequestDispatcher(request.getContextPath()+"/admin/category/category.jsp").forward(request, response);
                break;
        }
    }

    //查询单个
    public void findOneById(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        /**
         * code的值：user、product、order
         * 1.若code是user时，通过会员编号查询会员及拥有的订单信息
         * 2.若code是product时，通过商品编号查询商品信息及商品类别
         * 3.若code是order时，
         */
        String code = request.getParameter("code");
        String id = request.getParameter("id");
        List<Map<String, Object>> mapList = service.findOneById(code,id);
        if(code.equals("product")){
            for (Map<String, Object> map : mapList) {
                Date pdate = (Date)map.get("pdate");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String date = sdf.format(pdate);
                map.put("date",date);
            }
        }
        Gson gson = new Gson();
        String json = gson.toJson(mapList);
        response.getWriter().write(json);
    }


    //删除信息
    public void delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String code = request.getParameter("code");
        String[] ids = request.getParameterValues("id");
        //执行
        service.delete(code, ids);
        switch (code){
            case "user":
                //若code是user时，跳转到会员查询所有页面
                response.sendRedirect(request.getContextPath()+"/admin?method=findAll&code=user");
                break;
            case "product":
                //若code是product时，跳转到商品查询所有页面
                response.sendRedirect(request.getContextPath()+"/admin?method=findAll&code=product");
                break;
            case "order":
                //若code是order时，跳转到订单查询所有页面
                response.sendRedirect(request.getContextPath()+"/admin?method=findAll&code=order");
                break;
            case "category":
                //若code是order时，跳转到订单查询所有页面
                response.sendRedirect(request.getContextPath()+"/admin?method=findAll&code=category");
                break;
        }
    }

    //上架商品
    public void add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Product product = new Product();

        try {
            //将生日String转换成Date类型
            ConvertUtils.register(new Converter() {
                //实现类型转换，第一个参数：目标数据类型  第二个参数：需要转换的数据
                @Override
                public Object convert(Class cla, Object value) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = null;
                    try {
                        date = sdf.parse(value.toString());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return date;
                }
            }, Date.class);

            BeanUtils.populate(product, request.getParameterMap());
            //商品类别
            String cid = request.getParameter("categoryId");
            String cname = null;
            List<Map<String, Object>> mapListCategory = service.findOneById("category", cid);
            for (Map<String, Object> map : mapListCategory) {
                cname = (String)map.get("cname");
            }
            product.setCategory(new Category(cid,cname));
            //商品编号
            product.setPid(CommonUtils.getUUID().replace("-", ""));

            //图片处理
            Part file = request.getPart("file");
            if(file!=null){
                String oldName = file.getHeader("content-disposition");
                if(oldName!=null && oldName.indexOf(".")>0){
                    String newName = UUID.randomUUID()+oldName.substring(oldName.lastIndexOf("."),oldName.length()-1);

                    product.setPimage("pic/"+newName);
                    file.write("E:\\java\\5.project\\temp\\"+newName);
                }
            }

            service.add(product);
            response.sendRedirect(request.getContextPath()+"/admin?method=findAll&code=product");
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    //查询所有商品类别，返回json数据
    public void findAllCategory(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<Category> categoryList = service.findAllCategory();
        Gson gson = new Gson();
        String json = gson.toJson(categoryList);
        response.getWriter().write(json);
    }

    //修改商品
    public void update(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Product product = new Product();

        try {
            //将生日String转换成Date类型
            ConvertUtils.register(new Converter() {
                //实现类型转换，第一个参数：目标数据类型  第二个参数：需要转换的数据
                @Override
                public Object convert(Class cla, Object value) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = null;
                    try {
                        date = sdf.parse(value.toString());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return date;
                }
            }, Date.class);

            BeanUtils.populate(product, request.getParameterMap());
            String cid = request.getParameter("categoryId");
            String cname = null;
            List<Map<String, Object>> mapListCategory = service.findOneById("category", cid);
            for (Map<String, Object> map : mapListCategory) {
                cname = (String)map.get("cname");
            }
            product.setCategory(new Category(cid,cname));

            //图片处理
            Part file = request.getPart("file");
            if(file!=null){
                String oldName = file.getHeader("content-disposition");
                if(oldName!=null && oldName.indexOf(".")>0){
                    String newName = UUID.randomUUID()+oldName.substring(oldName.lastIndexOf("."),oldName.length()-1);

                    product.setPimage("pic/"+newName);
                    file.write("E:\\java\\5.project\\temp\\"+newName);
                }
            }

            String currentImg = product.getPimage();
            if(currentImg==null){  //未上传
                List<Map<String, Object>> mapList = service.findOneById("product", product.getPid());
                String img = null;
                for (Map<String, Object> map : mapList) {
                    img = (String)map.get("pimage");
                }
                //System.out.println("img = "+img);
                if(img!=null){
                    product.setPimage(img); //设置未原图片
                }
            }

            service.update(product);
            response.sendRedirect(request.getContextPath()+"/admin?method=findAll&code=product");
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    //商品导出
    public void download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //表格表头信息
        String[] title = {"商品编号","商品名称","商品描述","商品价格","商品图片","商品日期"};
        String[] prop = {"pid","pname","pdesc","shop_price","pimage","pdate"};
        //excel的名字
        String fileName = "goods.xls";
        //sheet页的名字
        String sheetName = "商品详情";
        //当前页码
        int pageNow = Integer.parseInt(request.getParameter("pageNow"));
        //数据
        List<Product> goods = service.findAll("product","",pageNow).getList();

        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title,prop, goods, null);

        //输出文件
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
        response.addHeader("Pargam", "no-cache");
        response.addHeader("Cache-Control", "no-cache");
        OutputStream os = response.getOutputStream();
        wb.write(os);
        os.flush();
        os.close();
    }

    //首页
    public void showIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HomeVO> list = service.findNumByMonth();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        response.getWriter().write(json);
    }

    //添加和修改商品类别
    public void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        Category category = new Category();
        if(code.equals("add")){  //添加商品类别
            category.setCid(CommonUtils.getUUID().replace("-",""));
        }else if(code.equals("update")){
            category.setCid(request.getParameter("cid"));
        }
        category.setCname(request.getParameter("cname"));
        service.updateCategory(code , category);
        response.sendRedirect(request.getContextPath()+"/admin?method=findAll&code=category");
    }
}
