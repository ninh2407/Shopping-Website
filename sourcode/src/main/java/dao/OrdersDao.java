package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import context.DBContext;
import model.Account;
import model.Cart;
import model.Orders;
import model.Product;
import model.ProductOrders;

public class OrdersDao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//inser infomation of Order to data source, that including list of Product in cart (c) and infomation if buyer in Oerders
	public void insertOrder(Orders o, Cart c) {
		String query1 = "INSERT INTO Orders\r\n"
				+ "           ([user_mail]\r\n"
				+ "           ,[order_status]\r\n"
				+ "           ,[order_date]\r\n"
				+ "           ,[order_discount_code]\r\n"
				+ "           ,[order_address])\r\n"
				+ "VALUES (?, ?, ?, ?, ?)";
		String query2 = "INSERT INTO [dbo].[Orders_detail]\r\n"
				+ "           ([order_id]\r\n"
				+ "           ,[product_id]\r\n"
				+ "           ,[amount_product]\r\n"
				+ "           ,[price_product])\r\n"
				+ "     VALUES (?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query1);
			ps.setString(1, o.getUserMail());
			ps.setInt(2, o.getStatus());
			ps.setDate(3, o.getOrderDate());
			ps.setString(4, o.getDiscount());
			ps.setString(5, o.getAddress());
			ps.execute();
			ps = conn.prepareStatement("SELECT TOP (1) order_id FROM Orders\r\n"
					+ "ORDER BY order_id DESC");
			rs = ps.executeQuery();
			while(rs.next()) {
				o.setOrderID(rs.getInt(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query2);
			
			for (Product p : c.getItems()) {
				ps.setInt(1, o.getOrderID());
				ps.setInt(2, p.getId());
				ps.setInt(3, p.getNumber());
				ps.setFloat(4, p.getPrice());
				ps.execute();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public List<Orders> getOrderByEmail(String userEmail) {
		List<Orders> list = new ArrayList<>();
		String query = "SELECT O.order_id, O.order_status, O.order_date, O.user_mail, O.order_discount_code, SUM(OD.price_product*OD.amount_product) FROM Orders O \r\n"
				+ "JOIN Orders_detail OD ON O.order_id = OD.order_id\r\n"
				+ "WHERE user_mail = ?\r\n"
				+ "GROUP BY O.order_id, O.order_status, O.order_date, O.user_mail, O.order_discount_code";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, userEmail);
			rs = ps.executeQuery();			
			while(rs.next()) {
				list.add(new Orders(
						rs.getInt(1),
						rs.getInt(2),
						rs.getDate(3),
						rs.getString(4),
						rs.getString(5),
						rs.getFloat(6)
						));				
			}			
			for (Orders o : list) {
				o.setLp(getOrderProduct(o.getOrderID()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ProductOrders> getOrderProduct(int orderId) {
		List<ProductOrders> list = new ArrayList<>();
		String query = "SELECT OD.order_id, P.product_id, OD.amount_product, P.product_name FROM Orders_detail OD JOIN Products P ON P.product_id = OD.product_id\r\n"
				+ "WHERE order_id = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, orderId);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new ProductOrders(
						rs.getInt(1),
						rs.getInt(2),
						rs.getInt(3),
						rs.getString(4)						
						));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	public static void main(String[] args) {
		OrdersDao dao = new OrdersDao();
		System.out.print(dao.getOrderByEmail("ninh2407@gmail.com"));
	}
}

