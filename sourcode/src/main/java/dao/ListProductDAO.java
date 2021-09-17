package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getFloat(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)												
						));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return list;
	}
	
	public List<Product> search(String characters) throws Exception {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products where product_name like ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%"+characters+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getFloat(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)												
						));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return list;
	}
	
	public Product getProduct(String characters) {
		Product p = null;
		String query = "select * from Products where product_id= ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1,characters);
			rs = ps.executeQuery();
			while(rs.next()) {
				p = new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getFloat(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)												
						);
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		return p;
	}
	
	public int getAmountProduct() {
		String query = "select count(*) from Products";
		int count = 0;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		return count;
	}
	
	public List<Product> paging(int index) {
		List<Product> list = new ArrayList<>();
		String query = "SELECT * FROM Products\r\n"
				+ "ORDER BY product_id\r\n"
				+ "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, (index - 1)*5);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getFloat(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)												
						));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return list;
	}
	
	public int getAmountProductSearch(String s) {
		String query = "select count(*) from Products where product_name like ?";
		int count = 0;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1,"%"+s+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		return count;
	}
	
	public List<Product> pagingSearch(String s, int index) {
		List<Product> list = new ArrayList<>();
		String query = "SELECT * FROM Products\r\n"
				+ "where product_name like ?\n"
				+ "ORDER BY product_id\r\n"
				+ "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1,"%"+s+"%");
			ps.setInt(2, (index - 1)*5);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getFloat(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)												
						));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return list;
	}
	
}
