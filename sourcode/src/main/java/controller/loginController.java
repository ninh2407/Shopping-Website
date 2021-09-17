package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/loginController")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		try {
			String userMail = request.getParameter("usermail");
			String password = request.getParameter("password");
			Account acc = null;
			AccountDAO dao = new AccountDAO();
			acc = dao.getAccount(userMail, password);
			
			if (acc != null && acc.getRole() == 0) {
				HttpSession session = request.getSession(true);
				session.setAttribute("acc", acc);
				session.setAttribute("formDisplay", "none");
				session.setAttribute("accDisplay", "flex");				
				if (request.getParameterValues("remember") != null) {
					Cookie cookie1 = new Cookie("userMail", userMail);
					Cookie cookie2 = new Cookie("userPass", password);
					cookie1.setMaxAge(180);
					cookie2.setMaxAge(180);
					response.addCookie(cookie1);
					response.addCookie(cookie2);
				}
				response.sendRedirect("homeController");
			}
			if (acc != null && acc.getRole() == 1) {
				HttpSession session = request.getSession(true);
				session.setAttribute("admin", acc);
				if (request.getParameterValues("remember") != null) {
					Cookie cookie1 = new Cookie("adminMail", userMail);
					Cookie cookie2 = new Cookie("adminPass", password);
					cookie1.setMaxAge(180);
					cookie2.setMaxAge(180);
					response.addCookie(cookie1);
					response.addCookie(cookie2);
				}
				response.sendRedirect("adminPage.jsp");
			}
			if (acc == null) {
				request.setAttribute("mess", "Wrong username or password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
