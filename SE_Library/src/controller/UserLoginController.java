package controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.User;
import service.UserService;

@WebServlet("/login")
public class UserLoginController extends HttpServlet {
	private final Logger LOGGER = LoggerFactory.getLogger(UserLoginController.class.getName());
	private UserService userService = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		LOGGER.info("[실행] UserLoginController init");
		userService = new UserService();
		super.init(config);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User(req.getParameter("username"), req.getParameter("password"));
		
		String role = userService.login(user);
		
		if (role.equals("error")) {
			resp.sendRedirect("login.jsp?error=1");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("id", user.getId());
			session.setAttribute("role", role);
			resp.sendRedirect("addBook.jsp");
		}
	}
}
