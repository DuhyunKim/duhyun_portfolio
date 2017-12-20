package com.tie.license.model.service;

import java.util.List;

import com.tie.license.model.LicenseDto;
import com.tie.license.model.dao.LicenseDaoImpl;

public class LicenseServiceImpl implements LicenseService {

		private static LicenseServiceImpl licenseService;
		
		
		static{
			licenseService = new LicenseServiceImpl();
		}
		public LicenseServiceImpl(){} 
		public static LicenseServiceImpl getLicenseService() {
			return licenseService;
		}
		
		@Override
		public int licenseInsert(LicenseDto licenseDto) {
			// TODO Auto-generated method stub
			return LicenseDaoImpl.getLicenseDao().licenseInsert(licenseDto);
		}
		@Override
		public List<LicenseDto> licenseList(String empId) {
			// TODO Auto-generated method stub
			return LicenseDaoImpl.getLicenseDao().licenseList(empId);
		}
		@Override
		public LicenseDto licenseUpdateInfo(String certifiNum) {
			// TODO Auto-generated method stub
			return LicenseDaoImpl.getLicenseDao().licenseUpdateInfo(certifiNum);
		}
		@Override
		public int licenseUpdate(LicenseDto licenseDto) {
			// TODO Auto-generated method stub
			return LicenseDaoImpl.getLicenseDao().licenseUpdate(licenseDto);
		}
		@Override
		public LicenseDto licenseDelete(String certifiNum) {
			// TODO Auto-generated method stub
			return LicenseDaoImpl.getLicenseDao().licenseDelete(certifiNum);
		}
		
		
		
		

		
		
	
		
		
		
}
