package com.tie.license.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tie.license.model.LicenseDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class LicenseDaoImpl implements LicenseDao {

	private static LicenseDao licenseDao;

	static {
		licenseDao = new LicenseDaoImpl();
	}

	private LicenseDaoImpl() {
	}

	public static LicenseDao getLicenseDao() {
		return licenseDao;
	}

	@Override
	public int licenseInsert(LicenseDto licenseDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			System.out.println("=====DB licenseInsert=====");

			sql.append("insert INTO license \n");
			sql.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?) \n");

			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, licenseDto.getCertifiNum());
			pstmt.setInt(++idx, Integer.parseInt(licenseDto.getEmpId()));
			pstmt.setString(++idx, licenseDto.getRightName());
			pstmt.setString(++idx, licenseDto.getRightInstitution());
			pstmt.setString(++idx, licenseDto.getRightObtain());
			pstmt.setString(++idx, licenseDto.getRightEnd());
			pstmt.setString(++idx, licenseDto.getRightUpdate());
			pstmt.setString(++idx, licenseDto.getRightErasure());
			pstmt.setString(++idx, licenseDto.getErasureContent());
			pstmt.setString(++idx, licenseDto.getRightImage());
			pstmt.setString(++idx, licenseDto.getRightSaveName());
			pstmt.setString(++idx, licenseDto.getSaveFolder());
	
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("=====DB licenseInsert =====");
		}

		return cnt;
	}

	@Override
	public List<LicenseDto> licenseList(String empId) {
		List<LicenseDto> list = new ArrayList<LicenseDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int id = Integer.parseInt(empId);
		System.out.println(empId);


		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			System.out.println("=====DB licenseList=====");
			
			sql.append("SELECT *  \n");
			sql.append("FROM license \n");
			sql.append("WHERE empId = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			 

			while (rs.next()) {
				LicenseDto licenseDto = new LicenseDto();

				licenseDto.setCertifiNum(rs.getString("certifiNum"));
				licenseDto.setRightName(rs.getString("rightName"));
				licenseDto.setRightInstitution(rs.getString("rightInstitution"));
				licenseDto.setRightObtain(rs.getString("rightObtain"));
				licenseDto.setRightEnd(rs.getString("rightEnd"));
				licenseDto.setRightUpdate(rs.getString("rightUpdate"));
				licenseDto.setRightErasure(rs.getString("rightErasure"));
				licenseDto.setErasureContent(rs.getString("erasureContent"));
				licenseDto.setRightImage(rs.getString("rightImage"));
				licenseDto.setRightSaveName(rs.getString("rightSaveName"));
				licenseDto.setEmpId(Integer.toString(rs.getInt("empId")));
				licenseDto.setSaveFolder(rs.getString("saveFolder"));
				list.add(licenseDto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("=====DB  licenseList  =====");
		}

		return list;
	}

	@Override
	public LicenseDto licenseUpdateInfo(String certifiNum) {
		
		LicenseDto licenseDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			System.out.println("=====DB licenseUpdateInfo =====");
			
			sql.append("SELECT * \n");
			sql.append("FROM license \n");
			sql.append("where certifiNum = ? \n");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, certifiNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				licenseDto = new LicenseDto();
				licenseDto.setCertifiNum(rs.getString("certifiNum"));
				licenseDto.setRightName(rs.getString("rightName"));
				licenseDto.setRightInstitution(rs.getString("rightInstitution"));
				licenseDto.setRightObtain(rs.getString("rightObtain"));
				licenseDto.setRightEnd(rs.getString("rightEnd"));
				licenseDto.setRightUpdate(rs.getString("rightUpdate"));
				licenseDto.setRightErasure(rs.getString("rightErasure"));
				licenseDto.setErasureContent(rs.getString("erasureContent"));
				licenseDto.setRightImage(rs.getString("rightImage"));
				licenseDto.setRightSaveName(rs.getString("rightSaveName"));
				licenseDto.setSaveFolder(rs.getString("saveFolder"));
				licenseDto.setEmpId(Integer.toString(rs.getInt("empId")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("=====DB licenseUpdateInfo=====");
		}

		return licenseDto;
	}

	@Override
	public int licenseUpdate(LicenseDto licenseDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			System.out.println("=====DB licenseUpdate =====");
			System.out.println("DB licenseDto :"+licenseDto);
			sql.append("UPDATE license \n");
			sql.append("SET certifiNum = ?, rightName = ?, \n");
			sql.append(" 	rightInstitution = ?, rightObtain = ?, \n");
			sql.append("	rightEnd = ?, rightUpdate = ?, \n");
			sql.append("	rightErasure = ?, erasureContent = ?, \n");
			sql.append("	rightImage = ?, rightSaveName = ?, \n");
			sql.append("	saveFolder = ?, empId = ?  \n");
			sql.append("where certifiNum  = ? ");
				
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, licenseDto.getCertifiNum());
			pstmt.setString(++idx, licenseDto.getRightName());
			pstmt.setString(++idx, licenseDto.getRightInstitution());
			pstmt.setString(++idx, licenseDto.getRightObtain());
			pstmt.setString(++idx, licenseDto.getRightEnd());
			pstmt.setString(++idx, licenseDto.getRightUpdate());
			pstmt.setString(++idx, licenseDto.getRightErasure());
			pstmt.setString(++idx, licenseDto.getErasureContent());
			pstmt.setString(++idx, licenseDto.getRightImage());
			pstmt.setString(++idx, licenseDto.getRightSaveName());
			pstmt.setString(++idx, licenseDto.getSaveFolder());
			pstmt.setInt(++idx, Integer.parseInt(licenseDto.getEmpId()));
			pstmt.setString(++idx, licenseDto.getCertifiNum());
			cnt = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("=====DB licenseUpdate =====");
		}

		return cnt;
	}

	@Override
	public LicenseDto licenseDelete(String certifiNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LicenseDto licenseDto = new LicenseDto();
		
		try {
			System.out.println("=====DB licenseDelete  =====");
			
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * \n");
			sql.append("FROM license \n");
			sql.append("WHERE certifiNum = ? \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, certifiNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				licenseDto.setCertifiNum(rs.getString("certifiNum"));
				licenseDto.setRightName(rs.getString("rightName"));
				licenseDto.setRightInstitution(rs.getString("RightInstitution"));
				licenseDto.setRightObtain(rs.getString("rightObtain"));
				licenseDto.setRightEnd(rs.getString("rightEnd"));
				licenseDto.setRightUpdate(rs.getString("rightUpdate"));
				licenseDto.setRightErasure(rs.getString("rightErasure"));
				licenseDto.setErasureContent(rs.getString("erasureContent"));
				licenseDto.setRightImage(rs.getString("rightImage"));
				licenseDto.setRightSaveName(rs.getString("rightSaveName"));
				licenseDto.setSaveFolder(rs.getString("saveFolder"));
				licenseDto.setEmpId(Integer.toString(rs.getInt("empId")));
			}

			sql.setLength(0);  
			pstmt = null;
			conn.commit();
			
			sql.append("DELETE \n");
			sql.append("FROM license \n");
			sql.append("WHERE certifiNum = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, certifiNum);
			pstmt.executeUpdate();
			sql.setLength(0);  //sql �ʱ�ȭ
			pstmt = null;
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("=====DB licenseDelete=====");
		}

		return licenseDto;
	}

	
	
}
