package com.tie.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.WorkActionFactory;
import com.tie.util.PageMove;

/**
 * Servlet implementation class WorkController
 */
@WebServlet("/work")
public class WorkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String root = request.getContextPath();
		System.out.println(root);
		String act = request.getParameter("act");;
		System.out.println("act: " + act);
		String path = "work/workList.jsp";
		
		if("workRegister".equals(act)){
			path = WorkActionFactory.getWorkInsertAction().execute(request, response);
			System.out.println(root+path);
			PageMove.redirect(root+path, response);
		}else if("workInsertForm".equals(act)){
			path = "/work/workregister.jsp";
			PageMove.redirect(root+path, response);
		}else if("workList".equals(act)){
			path = WorkActionFactory.getWorkListAction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("workUpdateForm".equals(act)){
			path = WorkActionFactory.getWorkUpdateFormAction().execute(request, response);
			PageMove.forward(path, request, response);
		}else if("workUpdateRegister()".equals(act)){
			path = WorkActionFactory.getWorkUpdateAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("workDelete".equals(act)){
			path = WorkActionFactory.getWorkDeleteAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
