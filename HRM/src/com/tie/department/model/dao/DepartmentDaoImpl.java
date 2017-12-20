package com.tie.department.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tie.department.model.DepartmentDto;
import com.tie.util.DB.DBClose;
import com.tie.util.DB.DBConnection;

public class DepartmentDaoImpl implements DepartmentDao {
	private static DepartmentDao departmentDao;
	
	static{
		departmentDao = new DepartmentDaoImpl();
	}
	
	private DepartmentDaoImpl(){}

	public static DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	@Override
	public List<DepartmentDto> deptList(Map<String, String> map) {
		List<DepartmentDto> list = new ArrayList<DepartmentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int deptId = Integer.parseInt(map.get("deptId"));
		
		StringBuffer sql = new StringBuffer();
		sql.append("select r, b.* \n");
		sql.append("from  \n");
		sql.append("( \n");
		sql.append("	select rownum r, a.* \n");
		sql.append("	from \n");
		sql.append("	( \n");
		sql.append("		select deptid, highdept, deptname, depthead \n");
		sql.append("		from department b \n");
		if(deptId > 10){
			sql.append("	where deptid = ? \n");			
		}
		sql.append("		order by deptid \n");
		sql.append("	) a \n");
		sql.append("	where rownum <= ? \n");
		sql.append(") b \n");
		sql.append("where r > ?");
		int idx = 0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				DepartmentDto departmentDto = new DepartmentDto();
				departmentDto.setDeptId(rs.getInt("deptid"));
				departmentDto.setHighDept(rs.getString("highdept"));
				departmentDto.setDeptName(rs.getString("deptname"));
				departmentDto.setDeptHead(rs.getString("depthead"));
				
				list.add(departmentDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int pageCount(String word) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) cnt \n");
		sql.append("from department \n");
//		if(!word.isEmpty())
//			sql.append("and bbstitle like '%'||?||'%' or bbscontent like '%'||?||'%' ");
		int idx = 0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			;
			if(!word.isEmpty()){
				pstmt.setString(++idx, word);
				pstmt.setString(++idx, word);
			}
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}

	@Override
	public List<DepartmentDto> selectDept() {
		List<DepartmentDto> list = new ArrayList<DepartmentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("		select deptid, highdept, deptname, depthead \n");
		sql.append("		from department b \n");
		sql.append("		order by deptid \n");
		int idx = 0;
		try {
			conn = DBConnection.makeConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				DepartmentDto departmentDto = new DepartmentDto();
				departmentDto.setDeptId(rs.getInt("deptid"));
				departmentDto.setHighDept(rs.getString("highdept"));
				departmentDto.setDeptName(rs.getString("deptname"));
				departmentDto.setDeptHead(rs.getString("depthead"));
				
				list.add(departmentDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}
}
