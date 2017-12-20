package com.tie.career.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.AppointActionFactory;
import com.tie.factory.CareerActionFactory;
import com.tie.util.PageMove;

@WebServlet("/career")
public class CareerController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "index.jsp";
		
		if("careerlist".equals(act)) {
			//path = "/appoint/appointlist.jsp";
			//path = AppointActionFactory.getAppointListAction().execute(request, response);
			path = CareerActionFactory.getCareerListAction().execute(request, response);
			System.out.println("career 리스트 path : "+path);
			PageMove.forward(path, request, response);
		} else if ("delete".equals(act)) {
			path = CareerActionFactory.getCareerDeleteAction().execute(request, response);
			PageMove.redirect(root+path, response);
		} else if ("update".equals(act)) {
			path = CareerActionFactory.getCareerUpdateAction().execute(request, response);
			System.out.println("career 업데이트 path : "+path);
			PageMove.redirect(root+path, response);
		} else if ("insert".equals(act)) {
			path = CareerActionFactory.getCareerInsertAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
