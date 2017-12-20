package com.tie.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.BoardActionFactory;
import com.tie.util.PageMove;

@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");

		String path = "/index.jsp";
		if ("main".equals(act)) {
			path = "/main/main.jsp";
			PageMove.redirect(root + path, response);
		} else if ("mvempinfo".equals(act)) {
			//path = EmpActionFactory.getEmpInfoAction().execute(request, response);
			PageMove.forward(path, request, response);
		} else if ("mvattendance".equals(act)) {
			path = "/attendence/user_check.jsp";
			PageMove.forward(path, request, response);
		} else if ("mvvacation".equals(act)) {
			path = "/vacation/vacation_main.jsp";
			PageMove.forward(path, request, response);
		} else if ("mvdocument".equals(act)) {
			path = "/document/document.jsp";
			PageMove.forward(path, request, response);
		} else if ("mvhr".equals(act)) {
			path = "/hr/hr_main.jsp";
			//path = "/basic/test.jsp";
			PageMove.forward(path, request, response);
		}else if ("mvboard".equals(act)) {
			path = BoardActionFactory.getBoardlistaction().execute(request, response);
			PageMove.forward(path, request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
