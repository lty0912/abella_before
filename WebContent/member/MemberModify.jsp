<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%request.setCharacterEncoding("euc-kr");%>

<%

// ------------------------ ���̵� ����
String user_id = (String)session.getAttribute("member_id");

//------------------------- ������ ���� ����
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

//------------------------- Ű���� ������ ����
String m_column = request.getParameter("column");
if(m_column == null) m_column = "";

String m_encoded_key = null;

String m_key = request.getParameter("key");
if(m_key != null) {
	m_encoded_key = URLEncoder.encode(m_key,"euc-kr");
} else {
	m_key="";
}

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
	
	// ----------------------- JDBC ����
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
	// ----------------------- ������ ���� ������ ����
	String Query1 = "SELECT UsrName, UsrId, UsrTel1, UsrTel2, UsrTel3 FROM member WHERE UsrId='" + user_id + "'";
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	rs.next();
	
	String name = rs.getString(1);
	String id = rs.getString(2);
	String tel1 = rs.getString(3);
	String tel2 = rs.getString(4);
	String tel3 = rs.getString(5);

%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<SCRIPT language="javascript" SRC="../include/scripts.js"></SCRIPT>
    <TITLE>ȸ����������</TITLE>
    
    <SCRIPT type="text/javascript">       
    
    function CheckMemberForm(form) {        	
    	
    	if(!form.UserPass.value) {
    		alert("��й�ȣ �Է� ���� ��й�ȣ�� �Է��ϼ���.");
    		form.UserPass.focus();
    		return true;
    	}
    	
    	if(!form.ReUserPass.value) {
    		alert("��й�ȣ Ȯ�� ���� ��й�ȣ�� �Է��ϼ���.");
    		form.ReUserPass.focus();
    		return true;
    	}
    	
    	if(!form.UserPass.value == form.ReUserPass.value) {
    		alert("�Էµ� ��й�ȣ�� ���� �ٸ��ϴ�.");    		
    		return true;
    	}    	
    	
    	if(form.UserTel1.selectedIndex == 0) {
    		alert("�޴����� ��Ż縦 �����ϼ���.");
    		return true;
    	}
    	
    	if(!form.UserTel2.value) {
    		alert("�޴��� ��ȣ ���ڸ��� �Է��ϼ���.");
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(!form.UserTel3.value) {
    		alert("�޴��� ��ȣ ���ڸ��� �Է��ϼ���.");
    		form.UserId.focus();
    		return true;
    	}
    	
    	form.submit();
    	
    	
    	
    	
    }
    
    
    
    </SCRIPT>
    
    
</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER><FONT SIZE=4><B>ȸ�� ���� ����</B></FONT></TD>
	</TR>
</TABLE>
 
<FORM NAME="MemberModify" METHOD=POST ACTION="MemberModifyProc.jsp?CurrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>">

<TABLE WIDTH=620 BORDER="1" CELLSPACING="0" CELLPADDING="2" ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�̸�</B></TD>
		<TD WIDTH="500"><%=name%></TD>
	</TR>

  	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>���̵�</B></TD>
		<TD WIDTH="500"><%=id%></TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�н�����</B></TD>
		<TD WIDTH="500">
			<INPUT TYPE=PASSWORD NAME="UserPass" SIZE=20 MAXLENGTH=10>
			* �н����带 �����ϰ��� �� ��쿡�� �Է��ϼ���.
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�н����� ���Է�</B></TD>
		<TD WIDTH="500">
			<INPUT TYPE=PASSWORD NAME="ReUserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR> 

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�޴���ȭ</B></TD>
		<TD WIDTH="500">
			<SELECT NAME="UserTel1" SIZE=1>
			<%
			if(tel1.equals("010")) {
				out.println("<OPTION VALUE=\"0\">��Ż�");
				out.println("<OPTION VALUE=\"010\" SELECTED>010");
				out.println("<OPTION VALUE=\"011\">011");
			} else if( tel1.equals("011")) {
				out.println("<OPTION VALUE=\"0\">��Ż�");
				out.println("<OPTION VALUE=\"010\">010");
				out.println("<OPTION VALUE=\"011\" SELECTED>011");
			}			
			%>
			</SELECT> -
			<INPUT TYPE=TEXT NAME="UserTel2" SIZE=4 MAXLENGTH=4 STYLE="ime-mode:disabled" VALUE='<%=tel2%>'> -
			<INPUT TYPE=TEXT NAME="UserTel3" SIZE=4 MAXLENGTH=4 STYLE="ime-mode:disabled" VALUE='<%=tel3%>'>
		</TD>
	</TR> 
   
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD>		
			<IMG SRC="../images/btn_mdfy.gif" onClick="javascript:CheckMemberForm(MemberModify)" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<IMG SRC="../images/btn_cancel.gif" onClick="javascript:location.replace('../board/BoardList.jsp?CurrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>')" STYLE=CURSOR:HAND>
		</TD>
	</TR>
	
</TABLE>

</BODY>
</HTML>

<%
} catch(Exception e) {
	e.printStackTrace();
} finally {
	rs.close();
	stmt.close();
	conn.close();
}
%>


