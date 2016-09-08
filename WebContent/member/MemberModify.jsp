<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%request.setCharacterEncoding("euc-kr");%>

<%

// ------------------------ 아이디 추출
String user_id = (String)session.getAttribute("member_id");

//------------------------- 페이지 정보 추출
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

//------------------------- 키워드 데이터 추출
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
	
	// ----------------------- JDBC 설정
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
	// ----------------------- 수정을 위한 데이터 추출
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
    <TITLE>회원정보변경</TITLE>
    
    <SCRIPT type="text/javascript">       
    
    function CheckMemberForm(form) {        	
    	
    	if(!form.UserPass.value) {
    		alert("비밀번호 입력 란에 비밀번호를 입력하세요.");
    		form.UserPass.focus();
    		return true;
    	}
    	
    	if(!form.ReUserPass.value) {
    		alert("비밀번호 확인 란에 비밀번호를 입력하세요.");
    		form.ReUserPass.focus();
    		return true;
    	}
    	
    	if(!form.UserPass.value == form.ReUserPass.value) {
    		alert("입력된 비밀번호가 서로 다릅니다.");    		
    		return true;
    	}    	
    	
    	if(form.UserTel1.selectedIndex == 0) {
    		alert("휴대폰의 통신사를 선택하세요.");
    		return true;
    	}
    	
    	if(!form.UserTel2.value) {
    		alert("휴대폰 번호 앞자리를 입력하세요.");
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(!form.UserTel3.value) {
    		alert("휴대폰 번호 뒷자리를 입력하세요.");
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
		<TD ALIGN=CENTER><FONT SIZE=4><B>회원 정보 변경</B></FONT></TD>
	</TR>
</TABLE>
 
<FORM NAME="MemberModify" METHOD=POST ACTION="MemberModifyProc.jsp?CurrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>">

<TABLE WIDTH=620 BORDER="1" CELLSPACING="0" CELLPADDING="2" ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>
		<TD WIDTH="500"><%=name%></TD>
	</TR>

  	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>아이디</B></TD>
		<TD WIDTH="500"><%=id%></TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>패스워드</B></TD>
		<TD WIDTH="500">
			<INPUT TYPE=PASSWORD NAME="UserPass" SIZE=20 MAXLENGTH=10>
			* 패스워드를 변경하고자 할 경우에만 입력하세요.
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>패스워드 재입력</B></TD>
		<TD WIDTH="500">
			<INPUT TYPE=PASSWORD NAME="ReUserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR> 

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>휴대전화</B></TD>
		<TD WIDTH="500">
			<SELECT NAME="UserTel1" SIZE=1>
			<%
			if(tel1.equals("010")) {
				out.println("<OPTION VALUE=\"0\">통신사");
				out.println("<OPTION VALUE=\"010\" SELECTED>010");
				out.println("<OPTION VALUE=\"011\">011");
			} else if( tel1.equals("011")) {
				out.println("<OPTION VALUE=\"0\">통신사");
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


