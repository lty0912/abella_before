<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<%
/*
//---------------------- ������ ���� ����
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

//---------------------- Ű���� ������ ����
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
    <TITLE>ȸ������</TITLE>
    
    <SCRIPT language="javascript">       
    
    function CheckMemberForm(form) {    	
    	
    	if(!form.UserName.value) {
    		alert('�̸��� �Է��ϼ���.');
    		form.UserName.focus();
    		return true;
    	}
    	
    	if(!form.UserId.value) {
    		alert('����� ���̵� �Է��ϼ���.');
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(!form.UserPass.value) {
    		alert('��й�ȣ�� �Է��ϼ���.');
    		form.UserPass.focus();
    		return true;
    	}
    	
    	if(!form.ReUserPass.value) {
    		alert('��й�ȣ Ȯ���� �Է��ϼ���.');
    		form.ReUserPass.focus();
    		return true;
    	}
    	
    	if(!form.UserPass.value == form.ReUserPass.value) {
    		alert('�Էµ� ��й�ȣ�� ���� �ٸ��ϴ�.');    		
    		return true;
    	}
    	
    	if(form.PassQ.selectedIndex == 0) {
    		alert('��й�ȣ ��Ʈ ������ �����ϼ���.');
    		return true;
    	}
    	
    	if(!form.PassA.value) {
    		alert('��й�ȣ ��Ʈ�� ���� �Է��ϼ���.');
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(form.UserTel1.selectedIndex == 0) {
    		alert('�޴����� ��Ż縦 �����ϼ���.');
    		return true;
    	}
    	
    	if(!form.UserTel2.value) {
    		alert('�޴��� ��ȣ ���ڸ��� �Է��ϼ���.');
    		form.UserId.focus();
    		return true;
    	}
    	
    	if(!form.UserTel3.value) {
    		alert('�޴��� ��ȣ ���ڸ��� �Է��ϼ���.');
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
    <TD ALIGN=CENTER><FONT SIZE=4><B>ȸ �� �� ��</B></FONT></TD>
  </TR>
</TABLE>

<FORM NAME="BeMember" METHOD=POST ACTION="BeMemberProc.jsp?CurrentPage=<%=m_cp%>&column=<%=m_column%>&key=<%=m_encoded_key%>">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�̸�</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserName" SIZE=20 MAXLENGTH=20 style="ime-mode:active">
		</TD>
	</TR>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>���̵�</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserId" SIZE=20 MAXLENGTH=10 style="ime-mode:inactive">
			<IMG SRC="../images/btn_dup_id_3.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND onClick="javascript:IdCheck('IdCheck.jsp','BeMember','UserId','CheckId',380,200,'no')">
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>��й�ȣ</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="UserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>��й�ȣ Ȯ��</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="ReUserPass" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>��й�ȣ ��Ʈ ����</B></TD>
		<TD WIDTH=500>
			<SELECT NAME="PassQ" SIZE=1>
				<OPTION VALUE="0" SELECTED>������ �������ּ���.
				<OPTION VALUE="school">��� �ʵ��б���?
				<OPTION VALUE="mother">��Ӵ��� ������?
				<OPTION VALUE="space">�߾��� ��Ҵ�?
			</SELECT>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>��й�ȣ ��Ʈ ��</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="PassA" SIZE=60 MAXLENGTH=90 style="ime-mode:inactive">
		</TD>
	</TR>    
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�޴���ȭ</B></TD>
		<TD WIDTH=500>
			<SELECT NAME="UserTel1" SIZE=1>
				<OPTION VALUE="0" SELECTED>��Ż�
				<OPTION VALUE="010">010
				<OPTION VALUE="011">011
			</SELECT> -
			<INPUT TYPE=TEXT NAME="UserTel2" SIZE=4 MAXLENGTH=4> -
			<INPUT TYPE=TEXT NAME="UserTel3" SIZE=4 MAXLENGTH=4>
		</TD>
	</TR> 
	
		<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>����</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="UserBirth" SIZE=20 MAXLENGTH=90 style="ime-mode:inactive"> ��) 9�� 12�� �� 0912
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