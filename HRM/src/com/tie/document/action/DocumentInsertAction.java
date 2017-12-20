package com.tie.document.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.document.model.SettlementDto;
import com.tie.document.model.service.DocumentServiceImpl;

public class DocumentInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String documentDate = request.getParameter("documentDate");
		int docTypeId = Integer.parseInt(request.getParameter("docTypeId"));
		String docName = request.getParameter("docName");
		String docContent = request.getParameter("docContent");
		String[] personId = request.getParameterValues("personId");
		for(int i =0; i<personId.length; i++){
			System.out.println("test: " + personId[i]);
		}

		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");

		List<SettlementDto> list = new ArrayList<SettlementDto>();
		for(int i=1; i<=personId.length; i++){
			SettlementDto settlementDto = new SettlementDto();
			settlementDto.setSignStep(i);
			settlementDto.setPersonId(Integer.parseInt(personId[i-1]));
			settlementDto.setEmpId(employeesDto.getEmpId());
			settlementDto.setDocTypeId(docTypeId);
			settlementDto.setDocDDate(documentDate);
			settlementDto.setDocName(docName);
			settlementDto.setDocContent(docContent);
			list.add(settlementDto);
		}

		int result = DocumentServiceImpl.getDocumentService().documentInsert(list);

		return "/document/documentform.jsp";
	}

}
