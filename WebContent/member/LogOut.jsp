<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<%
/*
// ------------------------- ������ ���� ����
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

// ------------------------- Ű���� ������ ����
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

// ------------------------- ���� �Ӽ� ����
session.invalidate();

// ------------------------- BoardList.jsp �������� �̵�
String retURL = "../main/Main.jsp";


out.println("<script language=\"javascript\">");
out.println("alert('�α׾ƿ� �Ǿ����ϴ�.')");
out.println("location.replace('" + retURL + "')");
out.println("</script>");
out.flush();

%>
