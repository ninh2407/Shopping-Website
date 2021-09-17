package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Product> items;
	
	public Cart() {
		items = new ArrayList<>();
	}
	
	public void setItems(List<Product> items) {
		this.items = items;
	}

	//add a new product to cart
	public void add(Product ci) {
		for (Product x: items) {
			if (ci.getId() == x.getId()) {
				x.setNumber(x.getNumber() + 1);
				return;
			}
		}
		items.add(ci);
	}
	
	// remove a product form cart
	public void remove(int id) {
		for (Product x : items) {
			if (x.getId() == id) {
				items.remove(x);
				return;
			}
		}
	}
	
	// return total amount of cart
	public double getAmount() {
		double s = 0;
		for (Product x : items) {
			s += x.getPrice() * x.getNumber();
		}
		return Math.round(s* 100.0)/100.0;
	}
	
	//return list of product in cart
	public List<Product> getItems() {
		return items;
	}
}
