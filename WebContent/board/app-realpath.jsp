<%@ page language="java" contentType="text.html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	String realFolder = "";
	String saveFolder = "upload_files";
	
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	out.println("저장경로 : " + realFolder + "<BR>");

%>