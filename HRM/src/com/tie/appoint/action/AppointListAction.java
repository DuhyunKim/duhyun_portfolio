package com.tie.appoint.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.appoint.model.dao.AppointDaoImpl;
import com.tie.appoint.model.service.AppointServiceImpl;
import com.tie.util.StringCheck;

public class AppointListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int empId = -1;
		String empName;
		
		if(request.getParameter("empId") != null){
			empId = Integer.parseInt(request.getParameter("empId"));
			empName = request.getParameter("empName");
			request.setAttribute("empId", empId);
			request.setAttribute("empName", empName);
		}
		
		Map<String, List<Object>> map = null;

		int currentPage = 1;

		int pageSize = 7;  
		int pageGroupSize = 4; 

		int totalCount = AppointServiceImpl.getAppointService().totalCountList();
		System.out.println("test: " + totalCount);

		int finalPage = (totalCount + (pageSize - 1)) / pageSize;

		int pageGroupCount = 0;
		int numPageGroup = 0;

		String val = request.getParameter("serch");
		if(val == null){
			val ="전체";
		}

		if(request.getParameter("currentPage") == null){
			map = AppointServiceImpl.getAppointService().appointList(val, currentPage, empId);
			pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1); 
			numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);

		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			map = AppointServiceImpl.getAppointService().appointList(val, currentPage, empId);

			pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1);
			numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);

		}
		
		request.setAttribute("pageSize", pageSize);
	    request.setAttribute("pageGroupSize", pageGroupSize);
	    request.setAttribute("numPageGroup", numPageGroup);
	    request.setAttribute("pageGroupCount", pageGroupCount);
	    request.setAttribute("totalCount", totalCount);
	    request.setAttribute("finalPage", finalPage);
	    
	    System.out.println("카운트 사이즈 : "+map.get("list1").size());
		request.setAttribute("count", map.get("list1").size());
		request.setAttribute("appointlist", map);
		request.setAttribute("val33", val);

		//select box  
		List<String> empNames = AppointDaoImpl.getMemberDao().getEmpName();
		request.setAttribute("empnames", empNames);

		return "/appoint/appoint.jsp";
	}
}
