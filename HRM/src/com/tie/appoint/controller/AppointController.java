package com.tie.appoint.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.AppointActionFactory;
import com.tie.util.PageMove;

@WebServlet("/appoint")
public class AppointController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "index.jsp";
		if("mvlist".equals(act)) {
			//path = "/appoint/appointlist.jsp";
			path = AppointActionFactory.getAppointListAction().execute(request, response);
			PageMove.forward(path, request, response);
		} else if ("delete".equals(act)) {
			path = AppointActionFactory.getAppointDeleteAction().execute(request, response);
			PageMove.redirect(root+path, response);
		} else if ("update".equals(act)) {
			path = AppointActionFactory.getAppointUpdateAction().execute(request, response);
			PageMove.redirect(root+path, response);
		} else if("insert".equals(act)) {
			path = AppointActionFactory.getAppointInsertAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
