package com.tie.license.model.service;

import java.util.List;

import com.tie.license.model.LicenseDto;

public interface LicenseService {
	int licenseInsert(LicenseDto licenseDto);
	List<LicenseDto> licenseList(String empId);
	LicenseDto licenseUpdateInfo(String certifiNum);
	int licenseUpdate(LicenseDto licenseDto);
	LicenseDto licenseDelete(String certifiNum);
}
