package com.sist.book;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Vector;

public class OrderTestCUI {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc= new Scanner(System.in);
		int search_custid=0;
		System.out.println("검색할 고객번호를 입력하세요");
		search_custid= sc.nextInt();
		
		OrdersDAO dao= new OrdersDAO();
		ArrayList<OrdersVO> list=dao.searchOrders(search_custid);
		
		for(OrdersVO o:list) {
			System.out.println(o.getOrderid()+"\t"+o.getCustid()+"\t"+o.getBookid()+"\t"+o.getSaleprice()+"\t"+o.getOrderdate());
		}
	}

}
