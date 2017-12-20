package com.tie.license.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.license.model.LicenseDto;
import com.tie.license.model.service.LicenseServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class LicenseUpdateAction implements Action {

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
		
		LicenseDto licenseDto = new LicenseDto();
		licenseDto.setCertifiNum(multi.getParameter("certifiNum2"));
		licenseDto.setRightName(multi.getParameter("rightName2"));
		licenseDto.setRightInstitution(multi.getParameter("rightInstitution2"));
		licenseDto.setRightObtain(multi.getParameter("rightObtain2"));
		licenseDto.setRightEnd(multi.getParameter("rightEnd2"));
		licenseDto.setRightUpdate(multi.getParameter("rightUpdate2"));
		licenseDto.setRightErasure(multi.getParameter("rightErasure2"));
		licenseDto.setErasureContent(multi.getParameter("erasureContent2"));
		licenseDto.setRightImage(multi.getOriginalFileName("licenseImg2"));
		licenseDto.setRightSaveName(multi.getFilesystemName("licenseImg2"));
		licenseDto.setSaveFolder("/license/"+today+"/");
		licenseDto.setEmpId(multi.getParameter("empId2"));
		System.out.println(licenseDto);
		LicenseDto licenseUpdateInfo = LicenseServiceImpl.getLicenseService().licenseUpdateInfo(licenseDto.getCertifiNum());
		  //�ڰ������� ��ȸ
		if(licenseDto.getRightImage() != licenseUpdateInfo.getRightSaveName() && licenseDto.getRightImage() != null){
			String rootDirectory2 = request.getServletContext().getRealPath("/upload");
			File fileDelete = new File(rootDirectory2+licenseUpdateInfo.getSaveFolder()+licenseUpdateInfo.getRightSaveName());
			System.out.println("fileDelete : "+fileDelete);
			fileDelete.delete();
		}
		int cnt;
		if(licenseDto.getRightImage() == null){  
			licenseDto.setErasureContent(licenseUpdateInfo.getErasureContent());
			licenseDto.setRightImage(licenseUpdateInfo.getRightImage());
			licenseDto.setRightSaveName(licenseUpdateInfo.getRightSaveName());
			cnt = LicenseServiceImpl.getLicenseService().licenseUpdate(licenseDto);   
		}else{
			cnt = LicenseServiceImpl.getLicenseService().licenseUpdate(licenseDto);  
		}

		
		if(cnt == 1){
			return "/license?act=licenseList&empId="+licenseDto.getEmpId();
		}else{
			return "/license/licenseinsertfail.jsp";
		}
	
	}

}
