package com.tie.license.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.license.model.LicenseDto;
import com.tie.license.model.service.LicenseServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class LicenseInsertAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String rootDirectory = request.getServletContext().getRealPath("/upload/license");
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String today = df.format(new Date());
		String saveDirectory = rootDirectory + File.separator + today;
		
		File file = new File(saveDirectory);
		if(!file.exists()) file.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, 3 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		
		LicenseDto lisenseDto = new LicenseDto();
		lisenseDto.setCertifiNum(multi.getParameter("certifiNum"));
		lisenseDto.setRightName(multi.getParameter("rightName"));
		lisenseDto.setRightInstitution(multi.getParameter("rightInstitution"));
		lisenseDto.setRightObtain(multi.getParameter("rightObtain"));
		lisenseDto.setRightEnd(multi.getParameter("rightEnd"));
		lisenseDto.setRightUpdate(multi.getParameter("rightUpdate"));
		lisenseDto.setRightErasure(multi.getParameter("rightErasure"));
		lisenseDto.setErasureContent(multi.getParameter("erasureContent"));
		lisenseDto.setRightImage(multi.getOriginalFileName("licenseImg"));
		lisenseDto.setRightSaveName(multi.getFilesystemName("licenseImg"));
		lisenseDto.setSaveFolder("/license/"+today+"/");
		lisenseDto.setEmpId(multi.getParameter("empId"));
		
		int cnt = LicenseServiceImpl.getLicenseService().licenseInsert(lisenseDto);
		String path = "/license?act=licenseList&empId="+lisenseDto.getEmpId();
		System.out.println("cnt = " + cnt);
		if(cnt == 1){
			return path;
		}else{
			return "/license/licenseinsertfail.jsp";
		}
	}

}
