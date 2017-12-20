package com.tie.common.model.service;

import com.tie.board.model.service.BoardServiceImpl;
import com.tie.department.model.service.DepartmentServiceImpl;
import com.tie.util.Constance;
import com.tie.util.PageNavigator;

public class CommonServiceImpl implements CommonService {
	
	private static CommonService commonservice;
	
	static{
		commonservice = new CommonServiceImpl();
	}
	
	private CommonServiceImpl(){}
	
	public static CommonService getCommonservice() {
		return commonservice;
	}
	
	@Override
	public PageNavigator getPageNavigator(int pg, String word, String menu) {
		PageNavigator navigator = new PageNavigator();
		navigator.setNowFirst(pg <= Constance.PAGE_SIZE);
		navigator.setPageNo(pg);
		int totalArticleCount = 0;
		if("board".equals(menu))
			totalArticleCount = BoardServiceImpl.getBoardservice().pageCount(word);
		else if("dept".equals(menu))
			totalArticleCount = DepartmentServiceImpl.getDepartmentService().pageCount(word);
			
		navigator.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / Constance.LIST_SIZE + 1;
		navigator.setTotalPageCount(totalPageCount);
		navigator.setNowEnd((totalPageCount - 1) / Constance.PAGE_SIZE * Constance.PAGE_SIZE < pg);

		return navigator;
	}

}
