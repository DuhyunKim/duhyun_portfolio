package com.tie.license.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.basic.model.EmpFileDto;
import com.tie.basic.model.EmployeesDto;
import com.tie.basic.model.service.EmployeesServiceImpl;
import com.tie.license.model.LicenseDto;
import com.tie.license.model.service.LicenseServiceImpl;

public class LicenseDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String certifiNum = request.getParameter("certifiNum");
		System.out.println("certifiNum : "+ certifiNum);
		LicenseDto licenseDto = LicenseServiceImpl.getLicenseService().licenseDelete(certifiNum);
		
		String rootDirectory2 = request.getServletContext().getRealPath("/upload");
		File fileDelete = new File(rootDirectory2+licenseDto.getSaveFolder()+licenseDto.getRightSaveName());
		System.out.println("fileDelete : "+fileDelete);
		fileDelete.delete();
		
	
			return "/license?act=licenseList&empId="+licenseDto.getEmpId();
		
		
			/*return "/basic/deletefail.jsp";*/
	}
}
