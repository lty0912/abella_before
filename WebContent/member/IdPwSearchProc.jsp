<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
String code = request.getParameter("IdPw");

String viewPageURI = null;

if(code.equals("1")) {
	viewPageURI = "IdSearch.jsp";
} else if (code.equals("2")) {
	viewPageURI = "PwSearch.jsp";
}

%>

<jsp:forward page="<%=viewPageURI%>"/>

