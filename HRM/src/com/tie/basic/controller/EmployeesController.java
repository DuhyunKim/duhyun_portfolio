package com.tie.basic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.BasicActionFactory;
import com.tie.util.PageMove;

@WebServlet("/user")
public class EmployeesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//license
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "";
		if("employeeslist".equals(act)){
			path= BasicActionFactory.getEmployeesListAction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("modfiy".equals(act)){
			 BasicActionFactory.getRegisterAction().execute(request, response);
			path = "/user?act=employeeslist";
			 PageMove.redirect(root+path, response);
		}else if("employeesmodify".equals(act)){
			path= BasicActionFactory.getModifyInfoAction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("delete".equals(act)){
			path = BasicActionFactory.getDeleteAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("employeesinsert".equals(act)){
			path = BasicActionFactory.getInsertInfoAction().execute(request, response);
			PageMove.forward(path, request, response);
			//BasicActionFactory.getInsertAction().execute(request, response);
		}/*else if("employeesinsertOk".equals(act)){
			path = BasicActionFactory.getInsertAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}*/else if("idcheck".equals(act)){
			path = BasicActionFactory.getIdCheckAction().execute(request, response);
			System.out.println(path);
			PageMove.forward(path, request, response);
		}else if("downfile".equals(act)){
			BasicActionFactory.getDownFileAction().execute(request, response);
		}else if("login".equals(act)){
			path = BasicActionFactory.getLoginAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("mvlogin".equals(act)){
			path = "/index.jsp";
			PageMove.redirect(root+path, response);
		}else if("logout".equals(act)){
			path = BasicActionFactory.getLogoutAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
