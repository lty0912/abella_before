<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<%

/*

// ---------------------- 페이지 정보 추출
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

// ---------------------- 키워드 데이터 추출
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

int m_cp=0;
String m_column="";
String m_encoded_key="";



%>

	<SCRIPT language="javascript" SRC="../include/scripts.js"></SCRIPT>

<SCRIPT language="javascript">
	function CheckMemberForm(form) {
		if(!form.UserId.value) {
			alert('아이디를 입력하세요.');
			form.UserId.focus();
			return;
		}
		
		if(!form.UserPass.value) {
			alert('패스워드를 입력하세요.');
			form.UserPass.focus();
			return;
		}
		form.submit();		
	}

</SCRIPT>

<FORM NAME="Login" METHOD=POST ACTION="../member/LoginProc.jsp?CurrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>">

<TABLE id="loginForm" WIDTH=230 HEIGHT=100 BORDER=0 ALIGN=RIGHT CELLSPACING=0 CELLPADDING=0>

	<TR>
		<TD ALIGN=LEFT WIDTH=180 HEIGHT=30 >
			 아이디  &nbsp     <INPUT TYPE=TEXT NAME="UserId" SIZE=10 MAXLENGTH=20 STYLE="ime-mode:inactive">&nbsp;&nbsp;
		</TD>
			
		<TD rowspan="2">
			<IMG SRC="../images/btn_login.png" WIDTH=50 HEIGHT=60 onClick="javascript:CheckMemberForm(Login)" STYLE=CURSOR:HAND align="left" >
		</TD>
	</TR>
	<TR>
		<TD ALIGN=LEFT WIDTH=180 HEIGHT=30>
			 패스워드 <INPUT TYPE=PASSWORD NAME="UserPass" SIZE=10 MAXLENGTH=20 STYLE="ime-mode:inactive">
		</TD>
	</TR>
	<TR>
		
		<TD colspan="2" ALIGN=CENTER HEIGHT=40>			
			
			<IMG SRC="../images/btn_idpw_srch.gif" onClick="javascript:IdPwSearchWin('../member/IdPwSearch.jsp', 'IDPW', 377, 200, 'no')" STYLE=CURSOR:HAND >
		</TD>  
	</TR>
	
	
</TABLE>

</FORM>