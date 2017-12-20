package com.tie.document.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.tie.action.Action;
import com.tie.document.model.service.DocumentServiceImpl;

public class PersonSearchAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key = request.getParameter("key");
		String word = request.getParameter("word");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		
		List<Map<String, String>> list = DocumentServiceImpl.getDocumentService().personSearch(map);
		
		JSONObject json = new JSONObject();//list 정보
        JSONArray jarray = new JSONArray();//배열
        
		if(list != null){
			 for(Map i : list){
		        	JSONObject jobj = new JSONObject();
		        	jobj.put("empid", i.get("empid"));
		        	jobj.put("deptname", i.get("deptname"));
		        	jobj.put("jobname", i.get("jobname"));
		        	jobj.put("empname", i.get("empname"));
		        	
		        	jarray.add(jobj);
		        }
			 json.put("person", jarray);
			
		}else{
			System.out.println("Action 에러");
		}

		
		return json.toJSONString();
	}

}
