package com.tie.basic.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.basic.model.EmpFileDto;
import com.tie.basic.model.EmployeesDto;
import com.tie.basic.model.service.EmployeesServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String empRegNumber[]  = {"" ,""};
		String empExtention[] = {"","",""};
		String empPhone[] ={"","",""};
		String empEmail[] ={"",""};
		
		String empBirth[] = {"","",""};
		String empHireDate[] = {"","",""};
		int i = 0 ,count =0;
		
		String rootDirectory = request.getServletContext().getRealPath("/upload/empInfo");
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String today = df.format(new Date());
		String saveDirectory = rootDirectory + File.separator + today;
		
		File file = new File(saveDirectory);
		if(!file.exists()) file.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, 3 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		
		EmployeesDto employeesDto = new EmployeesDto();
		EmpFileDto empFileDto = new EmpFileDto();

		employeesDto.setEmpId(Integer.parseInt(multi.getParameter("empId")));
		employeesDto.setEmpPw(multi.getParameter("empPw"));
		employeesDto.setEmpName(multi.getParameter("empName"));

		
		StringTokenizer st1 = new StringTokenizer(multi.getParameter("empRegNumber"),"-");
		while (st1.hasMoreTokens()){
			empRegNumber[i++]=st1.nextToken();
			count++;
			
		} i = 0;
		if(count != 2){
			empRegNumber[1]=empRegNumber[0].substring(6, 13);
			empRegNumber[0]=empRegNumber[0].substring(0,6);
		}count=0;
		employeesDto.setEmpRegNumber1(empRegNumber[0]);
		employeesDto.setEmpRegNumber2(empRegNumber[1]);
		
		StringTokenizer st2 = new StringTokenizer(multi.getParameter("empExtention"),"-");
		while (st2.hasMoreTokens()){
			empExtention[i++]=st2.nextToken();
			count++;
		}i = 0;
		if(count != 3){
			empExtention[2]=empExtention[0].substring(6, 10);
			empExtention[1]=empExtention[0].substring(3, 6);
			empExtention[0]=empExtention[0].substring(0, 3);
		}count = 0; 
		employeesDto.setEmpExtention1(empExtention[0]);
		employeesDto.setEmpExtention2(empExtention[1]);
		employeesDto.setEmpExtention3(empExtention[2]);
		
		StringTokenizer st3 = new StringTokenizer(multi.getParameter("empPhone"),"-");
		while (st3.hasMoreTokens()){
			empPhone[i++]=st3.nextToken();
			count++;
		}i = 0;
		if(count != 3){
			empPhone[2]=empPhone[0].substring(7, 11);
			empPhone[1]=empPhone[0].substring(3, 7);
			empPhone[0]=empPhone[0].substring(0, 3);
		}count = 0; 
		
		employeesDto.setEmpPhone1(empPhone[0]);
		employeesDto.setEmpPhone2(empPhone[1]);
		employeesDto.setEmpPhone3(empPhone[2]);
		
		StringTokenizer st4 = new StringTokenizer(multi.getParameter("empEmail"),"@");
		while (st4.hasMoreTokens()){
			empEmail[i++]=st4.nextToken();
		}i = 0;
		employeesDto.setEmpEmail1(empEmail[0]);
		employeesDto.setEmpEmail2(empEmail[1]);
		
		StringTokenizer st5 = new StringTokenizer(multi.getParameter("empBirth"),"-");
		while (st5.hasMoreTokens()){
			empBirth[i++]=st5.nextToken();
			count++;
		}i = 0;
		if(count != 3){
			empBirth[2]=empBirth[0].substring(6, 8);
			empBirth[1]=empBirth[0].substring(4, 6);
			empBirth[0]=empBirth[0].substring(0, 4);
		}count = 0; 
		employeesDto.setEmpBirth(empBirth[0]+"-"+empBirth[1]+"-"+empBirth[2]);
		
		StringTokenizer st6 = new StringTokenizer(multi.getParameter("empHireDate"),"-");
		while (st6.hasMoreTokens()){
			empHireDate[i++]=st6.nextToken();
			count++;
		}i = 0;
		if(count != 3){
			empHireDate[2]=empHireDate[0].substring(6, 8);
			empHireDate[1]=empHireDate[0].substring(4, 6);
			empHireDate[0]=empHireDate[0].substring(0, 4);
		}count = 0; 
		employeesDto.setEmpHireDate(empHireDate[0]+"-"+empHireDate[1]+"-"+empHireDate[2]);
		
		employeesDto.setEmpFinalEdu(multi.getParameter("empFinalEdu"));
		
/*		employeesDto.setEmpDeptHighName(empDeptName[0]);
		employeesDto.setEmpDeptName(empDeptName[1]);*/
/*		employeesDto.setEmpJobName(request.getParameter("empJobName"));*/
		employeesDto.setEmpHireName(multi.getParameter("empHireName"));
		employeesDto.setEmpDetail(multi.getParameter("empDetail"));
		employeesDto.setDeptId(Integer.parseInt((multi.getParameter("empDeptName"))));
		employeesDto.setJobId(Integer.parseInt((multi.getParameter("empJobName"))));
		employeesDto.setHireId(Integer.parseInt((multi.getParameter("empHireName"))));
		employeesDto.setZipNo(multi.getParameter("zipNo"));
		employeesDto.setRoadAddrPart1(multi.getParameter("roadAddrPart1"));
		employeesDto.setJibunAddr(multi.getParameter("jibunAddr"));
		employeesDto.setAddrDetail(multi.getParameter("addrDetail"));
		

		EmpFileDto empFileDto2 = EmployeesServiceImpl.getEmployeeService().empFileDto(Integer.parseInt(multi.getParameter("empId")));
		String rootDirectory2 = request.getServletContext().getRealPath("/upload");
		empFileDto.setEmpId(Integer.parseInt(multi.getParameter("empId")));
		if(multi.getOriginalFileName("faceImg") != null && multi.getFilesystemName("faceImg") != empFileDto2.getFaceSaveName()){
			empFileDto.setFaceOriginal(multi.getOriginalFileName("faceImg"));
			empFileDto.setFaceSaveName(multi.getFilesystemName("faceImg"));
			
			
			File fileDelete = new File(rootDirectory2+empFileDto2.getSaveFolder()+empFileDto2.getFaceSaveName());
			System.out.println(fileDelete);
		    fileDelete.delete();
			
		}else{
			empFileDto.setFaceOriginal("noimages.jpg");
			empFileDto.setFaceSaveName("noimages.jpg");
		}
		if(multi.getOriginalFileName("degreeImg") != null  && multi.getFilesystemName("degreeImg") != empFileDto2.getDegreeSaveName()){
			empFileDto.setDegreeOriginal(multi.getOriginalFileName("degreeImg"));
			empFileDto.setDegreeSaveName(multi.getFilesystemName("degreeImg"));
			File fileDelete = new File(rootDirectory2+empFileDto2.getSaveFolder()+empFileDto2.getDegreeSaveName());
			System.out.println(fileDelete);
		    fileDelete.delete();
		}else{
			empFileDto.setDegreeOriginal("없음");
			empFileDto.setDegreeSaveName("없음");
		}
		if(multi.getOriginalFileName("joinImg") != null && multi.getFilesystemName("joinImg") != empFileDto2.getJoinSaveName()){
			empFileDto.setJoinOriginal(multi.getOriginalFileName("joinImg"));
			empFileDto.setJoinSaveName(multi.getFilesystemName("joinImg"));	
			File fileDelete = new File(rootDirectory2+empFileDto2.getSaveFolder()+empFileDto2.getJoinSaveName());
			System.out.println(fileDelete);
		    fileDelete.delete();
		}else{
			empFileDto.setJoinOriginal("없음");
			empFileDto.setJoinSaveName("없음");
		}
		empFileDto.setSaveFolder("/empInfo/"+today+"/");
		
		
		int cnt =EmployeesServiceImpl.getEmployeeService().modfiy(employeesDto,empFileDto);

		if(cnt >= 2){
			return "/user?act=employeeslist";
		}else{
			return "/basic/registerfail.jsp";
		}
		
	}

}
