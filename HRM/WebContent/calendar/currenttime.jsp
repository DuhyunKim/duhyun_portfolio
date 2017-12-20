<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, java.text.*"%>
<%
DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String ct = df.format(new Date());
%>
<%=ct %>