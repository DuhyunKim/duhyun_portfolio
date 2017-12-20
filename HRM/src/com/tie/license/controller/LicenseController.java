package com.tie.license.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.factory.LicenseActionFactory;
import com.tie.util.PageMove;

@WebServlet("/license")
public class LicenseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String empId = request.getParameter("empId");
		if(act == null){
			act = empId;
		}
		String path = "";
		if("licenseList".equals(act)){
			path = LicenseActionFactory.getLisenseListAction().execute(request, response);
			//PageMove.forward(path, response, request);
			PageMove.forward(path, request, response);
		}else if("licenseInsert".equals(act)){
			System.out.println("licenseInsert");
			path = LicenseActionFactory.getLisenseInsertAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("licenseUpdateInfo".equals(act)){
			System.out.println("licenseUpdateInfo");
			/*path = LicenseActionFactory.getLicenseUpdateInfoAction().execute(request, response);
			PageMove.forward(path, response, request);*/
			String data = LicenseActionFactory.getLicenseUpdateInfoAction().execute(request, response);
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(data);
		}else if("licenseUpdate".equals(act)){
			System.out.println("licenseUpdate");
			path = LicenseActionFactory.getLicenseUpdateAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}else if("delete".equals(act)){
			System.out.println("delete");
			path =  LicenseActionFactory.getLicenseDeleteAction().execute(request, response);
			PageMove.redirect(root+path, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
