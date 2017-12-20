package com.tie.board.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.tie.action.Action;
import com.tie.basic.model.EmpFileDto;
import com.tie.basic.model.EmployeesDto;
import com.tie.basic.model.service.EmployeesServiceImpl;
import com.tie.board.model.BoardCommentDto;
import com.tie.board.model.BoardDto;
import com.tie.board.model.BoardFileDto;
import com.tie.board.model.service.BoardServiceImpl;
import com.tie.util.StringCheck;

public class BoardSelectAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String act = request.getParameter("act");
		int bbsSeq = StringCheck.nullToOne(request.getParameter("bbsSeq"));
		Map<String, Object> map = BoardServiceImpl.getBoardservice().boardSelect(bbsSeq);
		BoardDto boardDto = null; 
		BoardFileDto boardFileDto = null; 
		if(map.get("boardDto") != null)
			boardDto = (BoardDto) map.get("boardDto");
		if(map.get("boardFileDto") != null)
			boardFileDto = (BoardFileDto) map.get("boardFileDto");
		
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		if("detail".equals(act)){
			if(!employeesDto.getEmpName().equals(boardDto.getBbsEname())){
				//�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�궎 �뜝��琉꾩삕�뜝�룞�삕�뜝�룞�삕
				Cookie cookies[] = request.getCookies();
				Cookie viewCookie = null;
				if(cookies != null){
					for(Cookie cookie : cookies){
						System.out.println("�뜝�룞�삕�궎�뜝�떛紐뚯삕  === " + cookie.getName() + "\t�뜝�룞�삕�궎�뜝�룞�삕 === " + cookie.getValue());
						if("read_count".equals(cookie.getName()))
							viewCookie = cookie;
					}
				}
				
				if(viewCookie == null){
					Cookie newCookie = new Cookie("read_count", "|"+bbsSeq+"|");
					newCookie.setMaxAge(60*60*24*7);
					response.addCookie(newCookie);
					BoardServiceImpl.getBoardservice().boardVc(bbsSeq);
				}else{
					String cookieValue = viewCookie.getValue();
					if(cookieValue.indexOf("|"+bbsSeq+"|") < 0){
						cookieValue += "|"+bbsSeq+"|";
						viewCookie.setValue(cookieValue);
						viewCookie.setMaxAge(60*60*24*7);
						response.addCookie(viewCookie);
						BoardServiceImpl.getBoardservice().boardVc(bbsSeq);
					}
				}
			}
		}
		JSONObject json = new JSONObject();
		JSONArray jaArray = new JSONArray();
		JSONArray jaArray2 = new JSONArray();
		JSONObject jobj = new JSONObject();
		if(boardDto != null){			
			jobj.put("bbsSeq", bbsSeq);
			jobj.put("bbsEname", boardDto.getBbsEname());
			jobj.put("bbsDate", boardDto.getBbsDate());
			jobj.put("bbsTitle", boardDto.getBbsTitle());
			jobj.put("bbsContent", boardDto.getBbsContent());
			
			if(boardFileDto != null){
				jobj.put("boardFileName", boardFileDto.getBoardFileName());		
			}
			jaArray.add(jobj);
			
			if("detail".equals(act)){
				List<BoardCommentDto> list = BoardServiceImpl.getBoardservice().boardReply(bbsSeq);
				EmpFileDto empFileDto = null;
				//request.setAttribute("commentList", list);
				if(list.size() > 0){
					for(BoardCommentDto boardCommentDto: list){
						empFileDto = EmployeesServiceImpl.getEmployeeService().empFileDto(boardCommentDto.getBbsCommentEnum());
						JSONObject jobj2 = new JSONObject();
						jobj2.put("commentNum", boardCommentDto.getBbsCommentNum());
						jobj2.put("empName", boardCommentDto.getBbsCommentEname());
						jobj2.put("commentDate", boardCommentDto.getBbsCommentDate());
						jobj2.put("commentContent", boardCommentDto.getBbsCommentContent());
						if(empFileDto != null){
							jobj2.put("empImage", empFileDto.getFaceOriginal());						
							jobj2.put("empImageFolder", empFileDto.getSaveFolder());						
						}
						jaArray2.add(jobj2);
					}
					json.put("boardcomments", jaArray2);				
				}	
			}
		}
		json.put("boardInfo", jaArray);
		return json.toJSONString();
	}
}
