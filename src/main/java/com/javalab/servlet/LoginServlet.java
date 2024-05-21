package com.javalab.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.MemberDao;
import com.javalab.vo.MemberVo;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginServlet doPost()");
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding);
		
		String id = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		MemberDao dao = MemberDao.getInstance();
		MemberVo inputData = new MemberVo(id, pwd);
		MemberVo member = dao.ExistsMember(inputData);
		
		HttpSession session = request.getSession();
		session.setAttribute("member", member); // session에 member 객체 저장
		session.setAttribute("createTime", new Date(session.getLastAccessedTime()).getTime()); // 세션 마지막 접근 시간 저장
		session.setMaxInactiveInterval(60 * 5); // 세션 만료 시간을 5분으로 설정
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/main/main.jsp");
	}

}
