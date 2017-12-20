package com.tie.basic.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto1;
import com.tie.basic.model.service.EmployeesServiceImpl;
import com.tie.util.Constance;
import com.tie.util.StringCheck;

public class EmployeesListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 Map<String, String> map = new HashMap();
	      
	      int currentPage = 1;
	      String word = null;
	      
	      int pageSize = 5;  
	      int pageGroupSize = 3; 
	      
	      int totalCount = EmployeesServiceImpl.getEmployeeService().totalCountList();
	      System.out.println("totalCount: " + totalCount);
	      
	      int finalPage = (totalCount + (pageSize - 1)) / pageSize;
	      
	      int pageGroupCount = 0;
	      int numPageGroup = 0;
	      List<EmployeesDto1> mapList = null;
	      
	      map.put("pageSize", Integer.toString(pageSize));
	      if(request.getParameter("currentPage") == null){
	         map.put("currentPage", String.valueOf(currentPage));
	         
	         if(request.getParameter("word") != null){
	            word = request.getParameter("word");
	            map.put("word", word);
	         }
	         
	          mapList = EmployeesServiceImpl.getEmployeeService().employeesList(map);
	         
	         pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1); 
	         numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
	      }else{
	         currentPage = Integer.parseInt(request.getParameter("currentPage"));
	         map.put("currentPage", String.valueOf(currentPage));

	         if(request.getParameter("word") != null){
	            word = request.getParameter("word");
	            map.put("word", word);
	         }
	         mapList = EmployeesServiceImpl.getEmployeeService().employeesList(map);
	         
	         pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1);
	         numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
	   
	      }
	      
	      
	      request.setAttribute("pageSize", pageSize);
	      request.setAttribute("pageGroupSize", pageGroupSize);
	      request.setAttribute("numPageGroup", numPageGroup);
	      request.setAttribute("pageGroupCount", pageGroupCount);
	      request.setAttribute("totalCount", totalCount);
	      request.setAttribute("finalPage", finalPage);
	      
	      
	      ////////////////////////////////////////////////////////////////////////////////////////

		
		request.setAttribute("employeesList", mapList);
		return "/basic/employeesList.jsp";
		
	}

}
