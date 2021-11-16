package com.sist.vo;

public class TheaterVO {
 private int cinema_number;
 private int theater_number;
 private String title;
 private int price;
 private int seats;
public TheaterVO(int cinema_number, int theater_number, String title, int price, int seats) {
	super();
	this.cinema_number = cinema_number;
	this.theater_number = theater_number;
	this.title = title;
	this.price = price;
	this.seats = seats;
}
public TheaterVO() {
	super();
	// TODO Auto-generated constructor stub
}
public int getCinema_number() {
	return cinema_number;
}
public void setCinema_number(int cinema_number) {
	this.cinema_number = cinema_number;
}
public int getTheater_number() {
	return theater_number;
}
public void setTheater_number(int theater_number) {
	this.theater_number = theater_number;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getSeats() {
	return seats;
}
public void setSeats(int seats) {
	this.seats = seats;
}
 
}
