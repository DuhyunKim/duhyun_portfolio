package com.tie.util;

public class StringCheck {
	
	public static String nullToBlank(String tmp){
		return tmp == null ? "" : tmp;
	}
	
	public static int nullToOne(String tmp){
		int number = 1;
		if(isNumber(tmp)){
				number = Integer.parseInt(tmp);
		}	
		return number;	
	}
	
	private static boolean isNumber(String tmp){
		boolean flag = true;
		if(tmp != null){
			int len = tmp.length();
			for(int i=0;i<len;i++){
				int x= tmp.charAt(i) - 48;
				if(x < 0 || x > 9){
					flag = false;
					break;
				}
			}
		} else {
			flag = false;
		}
		return flag;
	}
}
