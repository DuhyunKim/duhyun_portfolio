package com.tie.basic.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.basic.model.EmpFileDto;
import com.tie.action.Action;
import com.tie.basic.model.service.EmployeesServiceImpl;
import com.tie.license.model.LicenseDto;
import com.tie.license.model.service.LicenseServiceImpl;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String empId = request.getParameter("empId");
		
		List<LicenseDto> list = LicenseServiceImpl.getLicenseService().licenseList(empId);
		System.out.println("list : "+list.toString());
		if(!list.isEmpty()){
			for(LicenseDto licenseDto : list) {
				String rootDirectory = request.getServletContext().getRealPath("/upload");
				File fileDelete = new File(rootDirectory+licenseDto.getSaveFolder()+licenseDto.getRightSaveName());
				fileDelete.delete();
			}
		}
		
		EmpFileDto empFileDto  = EmployeesServiceImpl.getEmployeeService().delete(empId);
		System.out.println("empFileDto: "+empFileDto);
		if(!empFileDto.getFaceSaveName().equals("noimages.jpg")){
			String rootDirectory = request.getServletContext().getRealPath("/upload");
			File fileDelete = new File(rootDirectory+empFileDto.getSaveFolder()+empFileDto.getFaceSaveName());
			System.out.println("fileDelete:"+fileDelete);
			fileDelete.delete();
		}
		if(!empFileDto.getDegreeOriginal().equals("없음")){
			String rootDirectory = request.getServletContext().getRealPath("/upload");
			File fileDelete = new File(rootDirectory+empFileDto.getSaveFolder()+empFileDto.getDegreeSaveName());
			System.out.println("fileDelete : "+fileDelete);
			fileDelete.delete();
		}
		if(!empFileDto.getJoinSaveName().equals("없음")){
			String rootDirectory = request.getServletContext().getRealPath("/upload");
			File fileDelete = new File(rootDirectory+empFileDto.getSaveFolder()+empFileDto.getJoinSaveName());
			System.out.println("fileDelete :" +fileDelete);
			fileDelete.delete();
		}
		
		return "/user?act=employeeslist";
		
		/*return "/basic/deletefail.jsp";*/
	}
}
