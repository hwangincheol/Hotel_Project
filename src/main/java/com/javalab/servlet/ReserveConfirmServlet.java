package com.javalab.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.vo.ReserveInfoVo;

@WebServlet("/reserveConfirm")
public class ReserveConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReserveConfirmServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveConfirmServlet doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("ReserveConfirmServlet doPost()");
		String user_id = request.getParameter("user_id");
		String hotelName = request.getParameter("hotelName");
		String roomName = request.getParameter("roomName");
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		String numOfuser = request.getParameter("numOfuser");
		String diffDay = request.getParameter("diffDay");
		String price = request.getParameter("price");

		
		System.out.println("before" + price);
		
		int price_sum = Integer.parseInt(price) * Integer.parseInt(diffDay.replace("박", ""));
		price = String.valueOf(price_sum);
		
		
		System.out.println("after" + price);
		
		ReserveInfoVo reserveInfo = new ReserveInfoVo(user_id, hotelName, roomName, checkin, checkout, numOfuser, diffDay, price);
		request.setAttribute("reserveInfo", reserveInfo);
		

		RequestDispatcher rd = request.getRequestDispatcher("reserve/reserveConfirm.jsp");
		rd.forward(request, response);
		
	}

}
