<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<%request.setCharacterEncoding("euc-kr"); %>

<%
String name = request.getParameter("UserName");
String userTel1 = request.getParameter("UserTel1");
String userTel2 = request.getParameter("UserTel2");
String userTel3 = request.getParameter("UserTel3");

String user_id = null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
	// ------------------------ ����� ���̵� ����
	String Query1 = "SELECT UsrId FROM member WHERE UsrName='" + name + "' AND UsrTel1='" + userTel1 + "' AND UsrTel2='" + userTel2 + "' AND UsrTel3='" + userTel3 + "';";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	
	if(rs.next()) {
		user_id = rs.getString(1);
	} else {
		user_id=null;
	}

 %>
<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>���̵� ã��</TITLE>
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>���̵� ã��</B></FONT></TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
			<BR>
			<%
				if(user_id == null) {
					out.println("��ġ�ϴ� ���̵� �����ϴ�.<BR>");
					out.println("ȸ�������� �Ǿ��ִ��� Ȯ���ϼ���.");
				} else {
					out.println("<B>" + name + "</B>�� �ȳ��ϼ���<BR>");
					out.println("<B>" + name + "</B>���� ���̵�� <B>" + user_id + "</B>�Դϴ�.");
				}
			%>
		</TD>
	</TR>

	<TR>
		<TD HEIGHT=50 ALIGN=CENTER>
			<IMG SRC="../images/btn_id_confirm.gif" STYLE=CURSOR:HAND onClick="javascript:self.close();">
		</TD>
	</TR>

</TABLE>

</BODY>
</HTML>


<%

}catch (SQLException e) {
	e.printStackTrace();
	} finally {
	rs.close();
	stmt.close();
	conn.close();
	}
%>