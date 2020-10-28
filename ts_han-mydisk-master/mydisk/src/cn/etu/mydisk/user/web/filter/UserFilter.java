package cn.etu.mydisk.user.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import cn.etu.mydisk.domain.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(
		filterName = "UserFilter", 
		urlPatterns = { "/jsps/user/*" }, 
		servletNames = { 
				"DownloadServlet", 
				"FileServlet", 
				"UploadServlet"
		})
public class UserFilter implements Filter {

    /**
     * Default constructor. 
     */
    public UserFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		User user = (User) req.getSession().getAttribute("session_user");
		if (null == user) {
			req.setAttribute("msg", "您还没有登陆，请登陆后再访问本资源！");
			req.getRequestDispatcher("/jsps/login.jsp").forward(req, response);
		} else if (user.getAdmin()) {
			req.setAttribute("msg", "为了保护用户隐私，管理员无法访问用户数据！请用普通用户账号登陆！");
			req.getRequestDispatcher("/jsps/login.jsp").forward(req, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
