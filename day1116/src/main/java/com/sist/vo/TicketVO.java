package com.sist.vo;

import java.util.Date;

public class TicketVO {
private String theater_name; //�����̸�
private int cinema_number;//�󿵰���ȣ
private String title;//��ȭ����
private Date reserve;//��¥
private int seat_number;//�¼���ȣ
private int price;//����

public TicketVO(String theater_name, int cinema_number, String title, Date reserve, int seat_number, int price) {
	super();
	this.theater_name = theater_name;
	this.cinema_number = cinema_number;
	this.title = title;
	this.reserve = reserve;
	this.seat_number = seat_number;
	this.price = price;
}
public TicketVO() {
	super();
	// TODO Auto-generated constructor stub
}
public String getTheater_name() {
	return theater_name;
}
public void setTheater_name(String theater_name) {
	this.theater_name = theater_name;
}
public int getCinema_number() {
	return cinema_number;
}
public void setCinema_number(int cinema_number) {
	this.cinema_number = cinema_number;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Date getReserve() {
	return reserve;
}
public void setReserve(Date reserve) {
	this.reserve = reserve;
}
public int getSeat_number() {
	return seat_number;
}
public void setSeat_number(int seat_number) {
	this.seat_number = seat_number;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}


}
