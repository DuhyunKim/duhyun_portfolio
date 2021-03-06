package com.tie.document.model.service;

import java.util.List;
import java.util.Map;

import com.tie.document.model.DocumentDto;
import com.tie.document.model.SettlementDto;

public interface DocumentService {
	
	List<SettlementDto> documentList(int empId);
	int documentInsert(List<SettlementDto> list);
	int documentUpdate(int docId);
	int documentDelete(int docId);
	List<Map<String, String>> personSearch(Map<String, String> map);

}
