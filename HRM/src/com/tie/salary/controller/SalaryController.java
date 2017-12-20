package com.tie.salary.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.SalaryActionFactory;
import com.tie.util.PageMove;

/**
 * Servlet implementation class SalaryController
 */
@WebServlet("/salary")
public class SalaryController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String root = request.getContextPath();
		System.out.println(root);
		String act = request.getParameter("act");;
		System.out.println("act: " + act);
		String path = "salary/salarylist.jsp";
		
		if("salaryList".equals(act)){
			path = SalaryActionFactory.getSalaryListAction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("salaryUpdate".equals(act)){
			path = SalaryActionFactory.getSalaryUpdateAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("salaryDelete".equals(act)){
			path = SalaryActionFactory.getSalaryDeleteAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
