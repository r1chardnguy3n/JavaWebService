package com.webservice.Entity;

public class Vehicle {

	public String id, make, model, year, type, price;

	public Vehicle() {

	}

	public Vehicle(String id, String make, String model, String year, String type, String price) {
		super();
		this.id = id;
		this.make = make;
		this.model = model;
		this.year = year;
		this.type = type;
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return String.format("%-10s%-25s%-25s%-15s%-15s%-15s", id, make, model, year, type, price);
	}

}
