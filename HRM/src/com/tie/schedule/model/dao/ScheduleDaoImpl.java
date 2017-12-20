package com.tie.schedule.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tie.department.model.DepartmentDto;
import com.tie.schedule.model.ScheduleDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;


public class ScheduleDaoImpl implements ScheduleDao{
	
	private static ScheduleDao scheduleDaoImpl;
	
	static{
		scheduleDaoImpl = new ScheduleDaoImpl();
	}

	private ScheduleDaoImpl(){}
	
	public static ScheduleDao getScheduleDaoImpl() {
		return scheduleDaoImpl;
	}


	@Override
	public List<ScheduleDto> scheduleList(int empId) {
		// TODO Auto-generated method stub
		List<ScheduleDto> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {

			conn = DBConnection.makeConnection();
			System.out.println("연결");
			StringBuffer sb = new StringBuffer();
			sb.append("select * from schedule where scheduleck=1 or empid=?\n");

			pstmt = conn.prepareStatement(sb.toString());
			int idx = 0;
			pstmt.setInt(++idx, empId);

			rs = pstmt.executeQuery();

			list = new ArrayList<ScheduleDto>();
			
			while(rs.next()){
				ScheduleDto scheduleDto = new ScheduleDto();
				scheduleDto.setScheduleSeq(rs.getInt("scheduleseq"));
				scheduleDto.setScheduleCk(rs.getString("scheduleck"));
				scheduleDto.setScheduleTitle(rs.getString("scheduletitle"));
				scheduleDto.setScheduleStart(rs.getString("schedulestart"));
				scheduleDto.setScheduleEnd(rs.getString("scheduleend"));
				scheduleDto.setScheduleContents(rs.getString("schedulecontents"));
				scheduleDto.setEmpId(empId);
				
				list.add(scheduleDto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
			System.out.println("연결종료");
		}
		return list;
	}

	@Override
	public Map<String, Integer> scheduleInsert(ScheduleDto scheduleDto) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			
			conn.setAutoCommit(false);
			StringBuffer sb = new StringBuffer();

			sb.append("select schedule_seq.nextval from dual\n");
			
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			int nextNum;
			
			if(rs.next()){
				nextNum = rs.getInt(1);
				map.put("nextNum", nextNum);
			}
			conn.commit();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into schedule\n");
			sql.append("(scheduleseq, scheduleck, scheduletitle, schedulestart, scheduleend, schedulecontents, empid)\n");
			sql.append("values(schedule_seq.CURRVAL,?,?,?,?,?,?)\n");

			//pstmt.close();
			int idx = 0;
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(++idx, scheduleDto.getScheduleCk());
			pstmt.setString(++idx, scheduleDto.getScheduleTitle());
			pstmt.setString(++idx, scheduleDto.getScheduleStart());
			pstmt.setString(++idx, scheduleDto.getScheduleEnd());
			pstmt.setString(++idx, scheduleDto.getScheduleContents());
			pstmt.setInt(++idx, scheduleDto.getEmpId());
			int cnt = pstmt.executeUpdate();
			conn.commit();
			map.put("cnt", cnt);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return map;
	}

	@Override
	public int scheduleUpdate(ScheduleDto scheduleDto) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");

			StringBuffer sql = new StringBuffer();
			sql.append("update schedule\n");
			sql.append("set scheduleck = ?, scheduletitle = ?, schedulestart = ?, scheduleend = ?, schedulecontents= ?\n");
			sql.append("where scheduleseq = ? and empid = ?\n");

			int idx = 0;
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(++idx, scheduleDto.getScheduleCk());
			pstmt.setString(++idx, scheduleDto.getScheduleTitle());
			pstmt.setString(++idx, scheduleDto.getScheduleStart());
			pstmt.setString(++idx, scheduleDto.getScheduleEnd());
			pstmt.setString(++idx, scheduleDto.getScheduleContents());
			pstmt.setInt(++idx, scheduleDto.getScheduleSeq());
			pstmt.setInt(++idx, scheduleDto.getEmpId());
			
			cnt = pstmt.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

	@Override
	public int scheduleDelete(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("연결");
			
			StringBuffer sql = new StringBuffer();		
			sql.append("delete from schedule\n");
			sql.append("where scheduleseq = ? and empid = ?\n");

			int idx = 0;
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(++idx, map.get("seq"));
			pstmt.setInt(++idx, map.get("empId"));
			
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
			System.out.println("연결종료");
		}

		return cnt;
	}

}
