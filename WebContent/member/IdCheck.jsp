<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
// ----------------------- ����� �Է� ���̵� ���� �� ��ü ����
String UserId = request.getParameter("UserId");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	// -------------- JDBC ����
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
	// -------------- DB���� ������ ���̵� ����
	String Query1 = "SELECT count(UsrNo) FROM member WHERE UsrId='" + UserId + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	rs.next();
	int db_id = rs.getInt(1);

%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">	
	<TITLE>���̵� �ߺ� �˻�</TITLE>
	
	<SCRIPT LANGUAGE="javascript">
	
	function CheckForm(form) {
		if(!form.UserId.value) {
			alert('���̵� �Է��ϼ���.');
			form.UserId.focus();
			return;
		}
		form.submit();
	}
	
	function UseID() {
		opener.document.BeMember.UserId.value = '<%=UserId%>';
		self.close();
	}
	
	
	</SCRIPT>
	
</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>���̵� �ߺ��˻�</B></FONT></TD>
	</TR>
<%
  
  if(db_id > 0) {
		//-------------------------------���̵� �̹� �����ϴ� ���
%>

	<TR>
		<TD ALIGN=CENTER>

			<FORM NAME="IdCheck" METHOD=POST ACTION="IdCheck.jsp">
			
			<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<TD ALIGN=CENTER HEIGHT=70>
						�Է��Ͻ� <B><%=UserId %></B> ��(��) �̹� ��ϵ� ���̵��Դϴ�.<BR>�ٸ� ���̵� �����ϼ���.
					</TD>
				</TR>
				
				<TR>
					<TD ALIGN=CENTER HEIGHT=40>
 						<INPUT TYPE=TEXT NAME="UserId" SIZE=20 MAXLENGTH=20>
							<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE onClick="CheckForm(IdCheck)">
					</TD>
				</TR>
				
			</TABLE>
			
			</FORM>

		</TD>
	</TR>

<%
  } else {
		//------------------------------- ��� ������ ���̵��� ���
%>

	<TR>
		<TD ALIGN=CENTER>
		
			<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<TD ALIGN=CENTER HEIGHT=70>
						�Է��Ͻ� <B><%=UserId%></B>��(��) ��밡���� ���̵��Դϴ�.<BR>�� ���̵� ����Ͻðڽ��ϱ�?
					</TD>
				</TR>
				
				<TR>
					<TD ALIGN=CENTER HEIGHT=40>
						<IMG SRC="../images/btn_id_confirm.gif" BORDER=0 STYLE=CURSOR:HAND onClick="javascript:UseID()">
					</TD>
				</TR>
				
			</TABLE>
			
		</TD>
	</TR>

<%

  }
 
%>

<%
} catch(SQLException e) {
	
} finally {
	
}

%>

</TABLE>

</BODY>
</HTML>