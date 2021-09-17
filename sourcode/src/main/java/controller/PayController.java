package controller;

import dao.OrdersDao;
import model.Cart;
import model.Orders;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PayController
 */
@WebServlet("/PayController")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession(true);
			if (session.getAttribute("cart") != null) {
				OrdersDao dao = new OrdersDao();
				Cart c = (Cart) session.getAttribute("cart");
				String name = request.getParameter("name");
				String address = request.getParameter("address");
				String discount = request.getParameter("discount");
				long millis=System.currentTimeMillis();   
				java.sql.Date date = new java.sql.Date(millis);
				Orders d = new Orders(2, date, address, name, discount);
				dao.insertOrder(d, c);			
				response.sendRedirect("homeController");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
