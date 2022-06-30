package resource;

import com.woniu.mybatis.entity.Category;
import com.woniu.mybatis.exception.ServiceException;
import com.woniu.mybatis.service.CategoryService;
import com.woniu.mybatis.service.ProxyFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @创建人 NST
 * @创建时间 2022/6/29
 * @描述
 */
@WebServlet("/admin/category")
public class AdminCategoryServlet extends HttpServlet {
    private CategoryService categoryService = ProxyFactory.getProxy(CategoryService.class);
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opr = req.getParameter("opr");
        if ("initAdd".equals(opr)) {
            doInitAdd(req, resp);
        } else if ("add".equals(opr)) {
            doAdd(req,resp);
        }else if("list".equals(opr)){
            doList(req,resp);
        }else if("initUpdate".equals(opr)){
            doInitUpdate(req,resp);
        }else if("update".equals(opr)){
            doUpdate(req,resp);
        }else if("delete".equals(opr)){
            doDeleted(req,resp);
        }else if("recover".equals(opr)){
            doRecover(req,resp);
        }else if("oprMany".equals(opr)){
            doDeleteMany(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void doInitAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/admin/category_add.jsp").forward(req, resp);
    }

    private void doAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String navigation = req.getParameter("navigation");
        if (navigation == null) {
            navigation = "n";
        }
        Category category = new Category();
        category.setNavigation(navigation);
        category.setName(name);
        try {
            categoryService.addCategory(category);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("category?opr=list");
    }

    private void doList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.selectCategory();
        req.setAttribute("categories",categories);//将控制器中的数据保存在请求作用域中 (属性名，属性值)
        req.getRequestDispatcher("/WEB-INF/admin/category_list.jsp").forward(req,resp);
    }

    private void doInitUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.getCategoryById(id);
        req.setAttribute("category",category);//将控制器中的数据保存在请求作用域中
        req.getRequestDispatcher("/WEB-INF/admin/category_update.jsp").forward(req,resp);
    }


    private void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Category category = new Category();
        category.setId(Integer.parseInt(req.getParameter("id")));
        category.setName(req.getParameter("name"));
        category.setDeleted(req.getParameter("deleted")==null?"n":"y");
        category.setNavigation(req.getParameter("navigation")==null?"n":"y");
        try {
            categoryService.updateCategory(category);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("category?opr=list");
    }
    private void doDeleted(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Category category = new Category();
        category.setId(id);
        category.setDeleted("y");
        try {
            categoryService.updateCategory(category);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("category?opr=list");
    }
    private void doRecover(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Category category = new Category();
        category.setId(id);
        category.setDeleted("n");
        try {
            categoryService.updateCategory(category);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("category?opr=list");
    }

    private void doDeleteMany(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] ids = req.getParameterValues("ids");
        int[] nums=new int[ids.length];
        for (int i = 0; i < ids.length; i++) {
            nums[i]=Integer.parseInt(ids[i]);
            Category category = new Category();
            category.setId(nums[i]);
            category.setDeleted("y");
            try {
                categoryService.updateCategory(category);
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
        resp.sendRedirect("category?opr=list");


    }



}
