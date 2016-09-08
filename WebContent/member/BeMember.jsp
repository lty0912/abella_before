<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<%
/*
//---------------------- 페이지 정보 추출
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

//---------------------- 키워드 데이터 추출
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

int m_cp = 0;
String m_column = "";
String m_encoded_key = "";
%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<SCRIPT language="javascript" SRC="../include/scripts.js"></SCRIPT>
    <TITLE>회원가입</TITLE>
    
    <SCRIPT language="javascript">       
    
    function CheckMemberForm(form) {    	
    	
    	if(!form.UserName.value) {
    		alert('이름을 입력하세요.');
    		form.UserName.focus();
    		return true;
    	}
    	
    	if(!form.UserId.value) {
    		alert('사용자 아이디를 입력하세요.');
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(!form.UserPass.value) {
    		alert('비밀번호를 입력하세요.');
    		form.UserPass.focus();
    		return true;
    	}
    	
    	if(!form.ReUserPass.value) {
    		alert('비밀번호 확인을 입력하세요.');
    		form.ReUserPass.focus();
    		return true;
    	}
    	
    	if(!form.UserPass.value == form.ReUserPass.value) {
    		alert('입력된 비밀번호가 서로 다릅니다.');    		
    		return true;
    	}
    	
    	if(form.PassQ.selectedIndex == 0) {
    		alert('비밀번호 힌트 질문을 선택하세요.');
    		return true;
    	}
    	
    	if(!form.PassA.value) {
    		alert('비밀번호 힌트의 답을 입력하세요.');
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(form.UserTel1.selectedIndex == 0) {
    		alert('휴대폰의 통신사를 선택하세요.');
    		return true;
    	}
    	
    	if(!form.UserTel2.value) {
    		alert('휴대폰 번호 앞자리를 입력하세요.');
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(!form.UserTel3.value) {
    		alert('휴대폰 번호 뒷자리를 입력하세요.');
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
    <TD ALIGN=CENTER><FONT SIZE=4><B>회 원 가 입</B></FONT></TD>
  </TR>
</TABLE>

<FORM NAME="BeMember" METHOD=POST ACTION="BeMemberProc.jsp?CurrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserName" SIZE=20 MAXLENGTH=20 style="ime-mode:active">
		</TD>
	</TR>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>아이디</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserId" SIZE=20 MAXLENGTH=10 style="ime-mode:inactive">
			<IMG SRC="../images/btn_dup_id_3.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND onClick="javascript:IdCheck('IdCheck.jsp','BeMember','UserId','CheckId',380,200,'no')">
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>비밀번호</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="UserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>비밀번호 확인</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="ReUserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>비밀번호 힌트 질문</B></TD>
		<TD WIDTH=500>
			<SELECT NAME="PassQ" SIZE=1>
				<OPTION VALUE="0" SELECTED>질문을 선택해주세요.
				<OPTION VALUE="school">출신 초등학교는?
				<OPTION VALUE="mother">어머니의 성함은?
				<OPTION VALUE="space">추억의 장소는?
			</SELECT>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>비밀번호 힌트 답</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="PassA" SIZE=60 MAXLENGTH=90 style="ime-mode:inactive">
		</TD>
	</TR>    
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>휴대전화</B></TD>
		<TD WIDTH=500>
			<SELECT NAME="UserTel1" SIZE=1>
				<OPTION VALUE="0" SELECTED>통신사
				<OPTION VALUE="010">010
				<OPTION VALUE="011">011
			</SELECT> -
			<INPUT TYPE=TEXT NAME="UserTel2" SIZE=4 MAXLENGTH=4> -
			<INPUT TYPE=TEXT NAME="UserTel3" SIZE=4 MAXLENGTH=4>
		</TD>
	</TR> 
	
		<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>생일</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserBirth" SIZE=20 MAXLENGTH=90 style="ime-mode:inactive"> 예) 9월 12일 → 0912
		</TD>
	</TR>    
  
   
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD>
			<IMG SRC="../images/btn_be_member_3.gif" STYLE=CURSOR:HAND onClick="javascript:CheckMemberForm(BeMember)"> &nbsp;&nbsp;
			<IMG SRC="../images/btn_mb_cancel_3.gif" STYLE=CURSOR:HAND onClick="javascript:location.replace('http://localhost:8080/Abella/main/Main.jsp')" >			
		</TD>
	</TR>
	
</TABLE>

</BODY>
</HTML>