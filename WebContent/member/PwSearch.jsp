<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>�н����� ã��</TITLE>
	
	<SCRIPT LANGUAGE="javascript" SRC="../include/scripts.js"></SCRIPT>
	
	<SCRIPT LANGUAGE="javascript">
	
	function CheckMemberForm(form) {
		if(!form.UserName.value) {
			alert('�̸��� �Է��ϼ���.');
			form.UserName.focus();
			return true;
		}
		
		if(!form.UserId.value) {
			alert('���̵� �Է��ϼ���.');
			form.UserId.focus();
			return true;
		}
		
    	if(form.PassQ.selectedIndex == 0) {
    		alert("��й�ȣ ��Ʈ ������ �����ϼ���.");
    		return true;
    	}
    	
    	if(!form.PassA.value) {
    		alert("��й�ȣ ��Ʈ�� ���� �Է��ϼ���.");
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
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>�н����� ã��</B></FONT></TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
		
			<FORM NAME="PwSearch" METHOD=POST ACTION="PwSearchProc.jsp">
			
			<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<BR>
					<TD WIDTH=100>�̸�</TD>
					<TD WIDTH=150><INPUT TYPE=TEXT NAME="UserName" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:inactive"></TD>
				</TR>
				
				<TR>
					<TD WIDTH=100>���̵�</TD>
					<TD WIDTH=150><INPUT TYPE=TEXT NAME="UserId" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:active"></TD>
				</TR>
				
				<TR>
					<TD WIDTH=100>����</TD>
					<TD WIDTH=150>
						<SELECT NAME="PassQ" SIZE=1>
							<OPTION VALUE="0" SELECTED>������ �������ּ���.
							<OPTION VALUE="school">��� �ʵ��б���?
							<OPTION VALUE="mother">��Ӵ��� ������?
							<OPTION VALUE="space">�߾��� ��Ҵ�?
						</SELECT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH=100>��</TD>
					<TD WIDTH=150><INPUT TYPE=TEXT NAME="PassA" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:active"></TD>
				</TR>
				
			</TABLE>
			
			</FORM>
			
		</TD>
	</TR>

	<TR>
		<TD HEIGHT=50 ALIGN=CENTER>
			<IMG SRC="../images/btn_idpw_srch_ok.gif" onClick="javascript:CheckMemberForm(PwSearch)" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<IMG SRC="../images/btn_idpw_srch_cancel.gif" onClick="javascript:window.open('about:blank', '_self').close();" STYLE=CURSOR:HAND>
		</TD>
	</TR>

</TABLE>

</BODY>
</HTML>