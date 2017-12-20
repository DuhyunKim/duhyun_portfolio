package com.tie.util;

public class Convert {
	
	public static int[] stringConvert(String[] data){
		
		int[] num = new int[data.length]; ;
		for(int i=0; i<data.length; i++){
			num[i] = Integer.parseInt(data[i]); 
		}
		
		return num;
	}

}
