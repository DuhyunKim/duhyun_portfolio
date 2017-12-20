package com.tie.license.model.dao;

import java.util.List;

import com.tie.license.model.LicenseDto;

public interface LicenseDao {
	int licenseInsert(LicenseDto licenseDto);
	List<LicenseDto> licenseList(String empId);
	LicenseDto licenseUpdateInfo(String certifiNum);
	int licenseUpdate(LicenseDto licenseDto);
	LicenseDto licenseDelete(String certifiNum);
}
