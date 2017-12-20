package com.tie.document.model.service;

import java.util.List;
import java.util.Map;

import com.tie.document.model.DocumentDto;
import com.tie.document.model.SettlementDto;
import com.tie.document.model.dao.DocumentDaoImpl;

public class DocumentServiceImpl implements DocumentService{

	private static DocumentService documentService;
	
	static{
		documentService = new DocumentServiceImpl();
	}
	
	public static DocumentService getDocumentService() {
		return documentService;
	}

	@Override
	public List<SettlementDto> documentList(int empId) {
		// TODO Auto-generated method stub
		return DocumentDaoImpl.getDocumentDao().documentList(empId);
	}

	@Override
	public int documentInsert(List<SettlementDto> list) {
		// TODO Auto-generated method stub
		return DocumentDaoImpl.getDocumentDao().documentInsert(list);
	}

	@Override
	public int documentUpdate(int docId) {
		// TODO Auto-generated method stub
		return DocumentDaoImpl.getDocumentDao().documentUpdate(docId);
	}

	@Override
	public int documentDelete(int docId) {
		// TODO Auto-generated method stub
		return DocumentDaoImpl.getDocumentDao().documentDelete(docId);
	}

	@Override
	public List<Map<String, String>> personSearch(Map<String, String> map) {
		// TODO Auto-generated method stub
		return DocumentDaoImpl.getDocumentDao().personSearch(map);
	}
}
