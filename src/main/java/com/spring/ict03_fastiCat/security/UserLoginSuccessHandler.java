package com.spring.ict03_fastiCat.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.spring.ict03_fastiCat.dto.UserVO;

// 로그인 성공시 작동 
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private SqlSession sqlSession;

	public UserLoginSuccessHandler(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 로그인 성공시 자동으로 실행하는 메서드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("<<< UserLoginSuccessHandler - onAuthenticationSuccess 진입 >>>");

		UserVO vo = (UserVO) authentication.getPrincipal();
		System.out.println("UserVO : " + vo.getUsername());

		String msg = authentication.getName() + "님 환영합니다.";

		String authority = sqlSession.selectOne("com.spring.ict03_fastiCat.dao.CustomerDAO.authorityCheck",
				authentication.getName());

		request.setAttribute("msg", msg);
		request.getSession().setAttribute("sessionID", authentication.getName()); // 세션추가
		request.setAttribute("authority", authority);

		// int grade = 0;
		String viewPage = "";

		if (authority.equals("ROLE_USER")) {
			// grade = 1;
			viewPage = "/main.do";
		} else if (authority.equals("ROLE_ADMIN")) {
			// grade = 1;
			request.getSession().setAttribute("ROLE", authority);
			viewPage = "/ad_dashboard.ad";
		} else {
			// grade = 0;
			viewPage = "/join.do";
		}

		// 프로젝트명(컨텍스트 경로) 가져오기
		String contextPath = request.getContextPath();

		// sendRedirect를 사용하여 리다이렉트
		response.sendRedirect(contextPath + viewPage);

	}

}
