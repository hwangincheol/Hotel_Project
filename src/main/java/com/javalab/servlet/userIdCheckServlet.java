package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.dao.MemberDao;

@WebServlet("/idCheck")
public class userIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public userIdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");
		
		String user_id = request.getParameter("id");
		
		MemberDao dao = MemberDao.getInstance();
		String result = dao.isExistMember(user_id);
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(result);
		out.write(jsonData);
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
