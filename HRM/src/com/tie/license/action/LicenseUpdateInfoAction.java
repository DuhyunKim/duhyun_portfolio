package com.tie.license.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.tie.action.Action;
import com.tie.license.model.LicenseDto;
import com.tie.license.model.service.LicenseServiceImpl;

public class LicenseUpdateInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String certifiNum = request.getParameter("certifiNum");
		
		LicenseDto licenseUpdateInfo = LicenseServiceImpl.getLicenseService().licenseUpdateInfo(certifiNum);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		JSONObject jobj = new JSONObject();
		jobj.put("certifiNum", licenseUpdateInfo.getCertifiNum());
		jobj.put("rightName", licenseUpdateInfo.getRightName());
		jobj.put("rightInstitution", licenseUpdateInfo.getRightInstitution());
		jobj.put("rightObtain", licenseUpdateInfo.getRightObtain());
		jobj.put("rightEnd", licenseUpdateInfo.getRightEnd());
		jobj.put("rightUpdate", licenseUpdateInfo.getRightUpdate());
		jobj.put("rightErasure", licenseUpdateInfo.getRightErasure());
		jobj.put("erasureContent",licenseUpdateInfo.getErasureContent());
		jobj.put("rightImage", licenseUpdateInfo.getRightImage());
		jobj.put("rightSaveName", licenseUpdateInfo.getRightSaveName());
		jobj.put("saveFolder", licenseUpdateInfo.getSaveFolder());
		jobj.put("empId", licenseUpdateInfo.getEmpId());
		jarray.add(jobj);
		json.put("licenseUpdateInfo", jarray);
		
	
		return json.toJSONString();
		//request.setAttribute("licenseUpdateInfo", licenseUpdateInfo);
		
		//return "/basic/licenseUpdateInfoModal.jsp";
	}

}
