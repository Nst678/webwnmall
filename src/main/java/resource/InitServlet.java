package resource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(value = "/init", loadOnStartup = 1)//容器启动初始化
public class InitServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		String contextPath = getServletContext().getContextPath();
		System.out.println(contextPath);
		getServletContext().setAttribute("context", contextPath);//获取上下文,
	}

}
