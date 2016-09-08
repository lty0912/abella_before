<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>아이디 찾기</TITLE>
	
	<SCRIPT LANGUAGE="javascript" SRC="../include/script.js"></SCRIPT>
	<SCRIPT LANGUAGE="javascript">
	
	function CheckMemberForm(form) {
		
		if(!form.UserName.value) {
			alert('이름을 입력하세요.');
			form.UserName.focus();
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

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>아이디 찾기</B></FONT></TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
		
		<FORM NAME="IdSearch" METHOD=POST ACTION="IdSearchProc.jsp">
		
		<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

			<TR>
				<BR>
				<TD WIDTH=100 HEIGHT=30>이름</TD>
				<TD WIDTH=200 HEIGHT=30>
					<INPUT TYPE=TEXT NAME="UserName" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:active">
				</TD>
			</TR>

			<TR>
				<TD WIDTH=100 HEIGHT=30>휴대폰 번호</TD>
				<TD WIDTH=200 HEIGHT=30>
					<SELECT NAME="UserTel1" SIZE=1>
						<OPTION VALUE="0" SELECTED>통신사
						<OPTION VALUE="010">010
						<OPTION VALUE="011">011
					</SELECT> -
			<INPUT TYPE=TEXT NAME="UserTel2" SIZE=4 MAXLENGTH=4 STYLE="ime-mode:active"> -
			<INPUT TYPE=TEXT NAME="UserTel3" SIZE=4 MAXLENGTH=4 STYLE="ime-mode:active">
			</SELECT>
				</TD>
			</TR>
			

		</TABLE>
		
		</FORM>
		
		</TD>
	</TR>

	<TR>
		<TD HEIGHT=50 ALIGN=CENTER>
			<IMG SRC="../images/btn_idpw_srch_ok.gif" STYLE=CURSOR:HAND onClick="javascript:CheckMemberForm(IdSearch)" >&nbsp;&nbsp;
			<IMG SRC="../images/btn_idpw_srch_cancel.gif" STYLE=CURSOR:HAND onClick="javascript:window.open('about:blank', '_self').close();">
		</TD>
	</TR>

</TABLE>

</BODY>
</HTML>