package com.tie.common.model.service;

import com.tie.util.PageNavigator;

public interface CommonService {
	PageNavigator getPageNavigator(int pg, String word, String menu);
}
