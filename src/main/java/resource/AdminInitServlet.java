package resource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @创建人 NST
 * @创建时间 2022/6/29
 * @描述
 */
@WebServlet("/admin")//WebServlet中value是URL地址，以/开头
public class AdminInitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          req.getRequestDispatcher("/WEB-INF/admin/goods_list.jsp").forward(req,resp);
    }
}
