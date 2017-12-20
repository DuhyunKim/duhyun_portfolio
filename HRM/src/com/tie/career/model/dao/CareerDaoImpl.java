package com.tie.career.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tie.career.model.CareerDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class CareerDaoImpl implements CareerDao {
private static  CareerDao careerDao;
	
	static {
		 careerDao = new  CareerDaoImpl();
	}
	
	private  CareerDaoImpl() {}
	
	public static  CareerDao getCareerDao() {
		return  careerDao;
	}

	@Override
	public List<CareerDto> careerList(int currentPage, int empId) {
		List<CareerDto> list = new ArrayList<CareerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sb = new StringBuffer();
			sb.append("select * from career where empid = ?\n");
			sb.append("order by careerId desc");
	
			pstmt = conn.prepareStatement(sb.toString());
			int idx = 0;
			pstmt.setInt(++idx, empId);
			rs = pstmt.executeQuery();
			
			CareerDto careerDto = null;
			
			while(rs.next()) {
				careerDto = new CareerDto();
				careerDto.setCareerId(rs.getInt("careerId"));
				careerDto.setEmpId(rs.getInt("empid"));
				careerDto.setCareerPeriod1(rs.getString("careerPeriod1"));
				careerDto.setCareerPeriod2(rs.getString("careerPeriod2"));
				careerDto.setCareerLocation(rs.getString("careerlocation"));
				careerDto.setCareerPosition(rs.getString("careerposition"));
				careerDto.setCareerDuty(rs.getString("careerduty"));
				careerDto.setCareerContents(rs.getString("careercontents"));
				list.add(careerDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int delete(int seq) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";

			sql += "delete from career \n";
			sql += "where careerId = ?\n";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn,pstmt);
			}
			return result;
	}

	@Override
	public int update(CareerDto careerDto) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			String sql = "update career\n";
			sql += "set careerlocation = ?, \n";
			sql += "careerposition = ?, \n";
			sql += "careerperiod1 = ?, \n";
			sql += "careerperiod2 = ?, \n";
			sql += "careerduty = ?, \n";
			sql += "careercontents = ? \n";
			sql += "where careerid = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, careerDto.getCareerLocation());
			pstmt.setString(2, careerDto.getCareerPosition());
			pstmt.setString(3, careerDto.getCareerPeriod1());
			pstmt.setString(4, careerDto.getCareerPeriod2());
			pstmt.setString(5, careerDto.getCareerDuty());
			pstmt.setString(6, careerDto.getCareerContents());
			pstmt.setInt(7, careerDto.getCareerId());
		
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn,pstmt);
			}
			return result;
	}

	@Override
	public int insert(CareerDto careerDto) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "insert into career values(careerseq.nextval,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			int idx= 0;
			pstmt.setInt(++idx, careerDto.getEmpId());
			pstmt.setString(++idx, careerDto.getCareerPeriod1());
			pstmt.setString(++idx, careerDto.getCareerPeriod2());
			pstmt.setString(++idx, careerDto.getCareerLocation());
			pstmt.setString(++idx, careerDto.getCareerPosition());
			pstmt.setString(++idx, careerDto.getCareerDuty());
			pstmt.setString(++idx, careerDto.getCareerContents());
		
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn,pstmt);
			}
		return result;
	}

	@Override
	public int totalCountList() {
		// TODO Auto-generated method stub
		return 0;
	}
}
