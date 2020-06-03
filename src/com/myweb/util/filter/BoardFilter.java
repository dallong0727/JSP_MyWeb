package com.myweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//1. Filter 인터페이스를 상속받습니다.
//2. @WebFilter 어노테이션, web.xml에 필터 설정

@WebFilter({"/board/write.board", "/board/regist.board"})
public class BoardFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("user_id");
		
		if(id == null) {
			
			res.setContentType("text/html; charset=utf-8"); //응답에 대한 내용 선언
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.')");
			out.println("location.href='/main.do"); //홈 화면
			out.println("/<script>");
			res.sendRedirect("board_auth_fail.jsp");
			return; //필터의 종료
		}
		
	}



	
}

