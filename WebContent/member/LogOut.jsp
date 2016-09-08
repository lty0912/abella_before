<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<%
/*
// ------------------------- 페이지 정보 추출
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

// ------------------------- 키워드 데이터 추출
String m_column = request.getParameter("column");
if(m_column == null) m_column = "";

String m_encoded_key = null;

String m_key = request.getParameter("key");
if(m_key != null) {
	m_encoded_key = URLEncoder.encode(m_key,"euc-kr");
} else {
	m_key="";
}
*/

// ------------------------- 세션 속성 제거
session.invalidate();

// ------------------------- BoardList.jsp 문서로의 이동
String retURL = "../main/Main.jsp";


out.println("<script language=\"javascript\">");
out.println("alert('로그아웃 되었습니다.')");
out.println("location.replace('" + retURL + "')");
out.println("</script>");
out.flush();

%>
