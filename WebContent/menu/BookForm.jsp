<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" import="java.util.*,java.sql.*,DAO.*,Bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dbcon" scope="session" class="DAO.ScheduleDB"></jsp:useBean>
<jsp:useBean id="menu" scope="session" class="Bean.Menu"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<LINK REL="stylesheet" type="text/css" href="../include/style.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<style>		
	IMG {cursor: pointer;}	
	</style>

<script type="text/javascript">	
	$(function() {
		var selectedDay = opener.scd.selectedDay.value;
		var userType = opener.scd.userType.value;
		var time = opener.scd.time.value;
		
		debugger;
		var year = selectedDay.substring(0, selectedDay.indexOf("년")+1).replace(/ /gi, '');
		var month = selectedDay.substring(selectedDay.indexOf("년")+1, selectedDay.indexOf("월")+1).replace(/ /gi, '');
		var day = selectedDay.substring(selectedDay.indexOf("월")+1, selectedDay.indexOf("일")+1).replace(/ /gi, '');
		
		$("#year").val(year);
		$("#month").val(month);
		$("#day").val(day);
		$("#sTime").val(time);
		$("#designer").val(userType);
		
		
	});

function checkBookForm(form) {	
	if(!form.Name.value) {
		alert('이름을 입력하세요.');
		form.Name.focus();
		return true;
	}
	if(!form.Tel1.value) {
		alert('휴대폰의 통신사를 입력하세요.');
		form.Tel1.focus();
		return true;
	}
	if(!form.Tel2.value) {
		alert('휴대폰 번호 앞자리를 입력하세요.');
		form.Tel2.focus();
		return true;
	}
	if(!form.Tel3.value) {
		alert('휴대폰 번호 뒷자리를 입력하세요.');
		form.Tel3.focus();
		return true;
	}
	if(!form.Menu.value) {
		alert('시술종목을 입력하세요.');
		form.Menu.focus();
		return true;
	}

	form.submit();	
	
}

function selectEvent(selectObj) {
	var Price = document.getElementById("Price");
	var Stime = document.getElementById("sTime");
	var Etime = document.getElementById("eTime");
				
	if(selectObj.value == "Menu1") {
		Price.value=(10000);
		Etime.value=(Stime.value*1)+1;
	}
				
	if(selectObj.value == "Menu2") {		
		Price.value=(40000);
		Etime.value=(Stime.value*1)+2;
	}
				
	if(selectObj.value == "Menu3") {
		Price.value=(50000);
		Etime.value=(Stime.value*1)+3;
	}
}
			
			
</script>
</head>
<body>

<%	

	Menu menu1 = new Menu();
	Menu menu2 = new Menu();
	Menu menu3 = new Menu();
	
	dbcon.connect();
	
	ArrayList<Menu> result = new ArrayList<Menu>();	
	
	result=dbcon.getAllMenu();
	if(result != null) {
		menu1 = result.get(0);
		menu2 = result.get(1);
		menu3 = result.get(2);
	}
	
	
	
	

%>



<TABLE WIDTH=500 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
  <TR BGCOLOR=#A0A0A0>
    <TD ALIGN=CENTER><FONT SIZE=4><B>예 약 하 기</B></FONT></TD>
  </TR>
</TABLE>

<FORM NAME="Reservation" METHOD=POST ACTION="ScheduleProc.jsp">
<TABLE WIDTH=500 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>
		<TD WIDTH=380>
			<INPUT TYPE=TEXT NAME="Name" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>휴대전화</B></TD>
		<TD WIDTH=500>
			<SELECT NAME="Tel1" SIZE=1>
				<OPTION VALUE="0" SELECTED>통신사
				<OPTION VALUE="010">010
				<OPTION VALUE="011">011
			</SELECT> -
			<INPUT TYPE=TEXT NAME="Tel2" SIZE=4 MAXLENGTH=4> -
			<INPUT TYPE=TEXT NAME="Tel3" SIZE=4 MAXLENGTH=4>
		</TD>
	</TR>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>종목</B></TD>
		<TD WIDTH=380>
			<select name="Menu" onChange="javascript:selectEvent(this)">
			<option value="Default" selected>종목</option>
			<option value="Menu1"><%=menu1.getMname() %></option>
			<option value="Menu2"><%=menu2.getMname() %></option>
			<option value="Menu3"><%=menu3.getMname() %></option>
		</select>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>날짜</B></TD>
		<TD WIDTH=380>
			<INPUT TYPE=TEXT ID="year" readonly="readonly" NAME="Year" SIZE=6 MAXLENGTH=6>		
			<INPUT TYPE=TEXT ID="month" readonly="readonly" NAME="Month" SIZE=4 MAXLENGTH=4>
			<INPUT TYPE=TEXT ID="day" readonly="readonly" NAME="Day" SIZE=4 MAXLENGTH=4>
			
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>시간</B></TD>
		<TD WIDTH=380>
			<INPUT TYPE=TEXT ID="sTime" readonly="readonly" NAME="Stime" SIZE=2 MAXLENGTH=2>
			시 ~			
			<INPUT TYPE=TEXT ID="eTime" readonly="readonly" NAME="Etime" SIZE=2 MAXLENGTH=2>			
			시
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>가격</B></TD>
		<TD WIDTH=380>
			<INPUT TYPE=TEXT ID="Price" readonly="readonly" NAME="Price" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>디자이너</B></TD>
		<TD WIDTH=380>
			<INPUT TYPE=TEXT ID="designer" readonly="readonly" NAME="Designer" SIZE=20 MAXLENGTH=10>
			
		</TD>
	</TR>   
	
		<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>코멘트</B></TD>
		<TD WIDTH=380>
			<textarea NAME="Comment" rows="10" cols="50"></textarea>
		</TD>
	</TR>  	
  
   
</TABLE>

</FORM>
<TABLE WIDTH=500 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD>
			<IMG SRC="../images/btn_schedule.png" STYLE=CURSOR:HAND onClick="javascript:checkBookForm(Reservation)"> &nbsp;&nbsp;
			<IMG SRC="../images/btn_schedule_cancel.png" STYLE=CURSOR:HAND onClick="self.close()" >			
		</TD>
	</TR>
	
</TABLE>


</body>
</html>