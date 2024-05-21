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
import com.javalab.vo.MemberVo;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/loginCheck")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 최초로 링크 연결 시 로그인 화면으로 이동
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding);
		
		System.out.println("로그인 페이지로 이동");
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/login/login.jsp");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax 방식으로 doPost 실행해서 객체 반환 값을 가져옴.
		System.out.println("LoginCheckServlet doPost()");
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding);
		response.setContentType("application/x-json; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDao dao = MemberDao.getInstance();
		MemberVo inputData = new MemberVo(id, pwd);
		MemberVo member = dao.ExistsMember(inputData);
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonData = gson.toJson(member);
		
		out.write(jsonData);
		
	}

}
