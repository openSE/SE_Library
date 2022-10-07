package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import service.UserService;

@WebServlet("/logout")
public class UserLogoutController extends HttpServlet {
	private final Logger LOGGER = LoggerFactory.getLogger(UserLogoutController.class.getName());
	private UserService userService = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		LOGGER.info("[실행] UserLogoutController init");
		userService = new UserService();
		super.init(config);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("[실행] logout 실행");
		HttpSession session = req.getSession();
		session.invalidate();
		RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
		rd.forward(req, resp);
	}
}
