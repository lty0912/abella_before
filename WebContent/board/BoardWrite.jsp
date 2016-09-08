<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<%
	String encoded_key="";

	String column = request.getParameter("column");
	if(column == null) column="";
	
	String key = request.getParameter("key");
	if(key!=null) {
		encoded_key = URLEncoder.encode(key,"euc-kr");
	} else {
		key="";
	}
	
	int CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));
	
%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
		
	
	<TITLE>게시글 입력</TITLE>
	
	<SCRIPT type="text/javascript">
	
	function CheckForm(form) {   // 데이터 오류 검사
		
	if(!form.name.value) {
		alert('성명을 입력하세요.');
		form.name.focus();
		return true;
	}
	
	if(!form.subject.value) {
		alert('게시판의 제목을 입력하세요.');
		form.subject.focus();
		return true;
		}	
	
	if(!form.pass.value) {
		alert('패스워드를 입력하세요.');
		form.pass.focus();
		return true;
	}
	
		form.submit();
	
	
	
	}

	</SCRIPT>
	
	
	
</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER><FONT SIZE=4><B>게시판 ( 게시글 입력 )</B></FONT></TD>
	</TR>
</TABLE>

<%
//------------------------------- 세션 속성에 따른 문서 선택 
%>

<FORM NAME="BoardWrite" METHOD=POST ACTION="BoardWriteProc.jsp" ENCTYPE="multipart/form-data">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>  
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="name" SIZE=20 style="ime-mode:active">
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>전자우편</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="mail" SIZE=60 style="ime-mode:inactive">
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="subject" SIZE=70>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="content" COLS=70 ROWS=8></TEXTAREA>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>파일첨부</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=FILE NAME="filename" SIZE=60>
		</TD>
	</TR> 
	 
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>패스워드</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="pass" SIZE=20>
		</TD>
	</TR>
	
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=110 ALIGN=LEFT>
			<IMG SRC="../images/btn_list.gif" onClick="javascript:location.replace('BoardList.jsp?column=<%=column%>&key=<%=encoded_key%>')" STYLE=CURSOR:HAND)>
		</TD>
		<TD WIDTH=400 ALIGN=CENTER>		
			<IMG SRC="../images/btn_save.gif" STYLE=CURSOR:HAND onClick="javascript:CheckForm(BoardWrite)">&nbsp;&nbsp;
			
			<IMG SRC="../images/btn_cancel.gif" STYLE=CURSOR:HAND onClick="javascript:location.replace('BoardList.jsp?column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>')">
		</TD>
		<TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>   
	</TR>
	
</TABLE>

</BODY>
</HTML>