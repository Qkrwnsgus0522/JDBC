package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 인터페이스는 클래스와 유사한데
	// 클래스는 아니라서 "생성자"가 없음
	// "객체와(인스턴스화)"도 안됨
	// "메서드 오버라이딩 강제"하려고 존재하는 문법
	void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	// 디폴트 설정으로 abstract 키워드가 존재함
	// public 또한 디폴트 설정
}
