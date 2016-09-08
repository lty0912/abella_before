<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR" import="java.util.*,java.sql.*,DAO.*,Bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dbcon" scope="session" class="DAO.ScheduleDB"></jsp:useBean>
<jsp:useBean id="schedule" scope="session" class="Bean.Schedule"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script> 
$(function() { 
   $( "#datepicker" ).datepicker( 
   { 
      showMonthAfterYear: true, 
      minDate: '-0d', 
      yearSuffix: '��', 
      monthNames:['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
      dayNamesMin: ['��','��','ȭ','��','��','��','��','��'],
      onSelect: function(dateText, datePicker) { 
         var sDate = new Date(dateText); 
         var dd = sDate.getDate(); 
         var mm = sDate.getMonth()+1; 
         if(mm<10) mm = "0" + mm; 
         if(dd <10) dd = "0" + dd; 
         $("#currentDate").val(sDate.getFullYear() +"�� "+mm+"�� "+dd+"�� ");           
         
         location.replace('Schedule.jsp?SelectedDay=' + currentDate.value);       
      }  
   });
   
   $(".schedule").on("click", function() {
		var selectedDay = $(this).data("selectedDay");
		var userType = $(this).data("userType");
		var time = $(this).data("time");


		$("#selectedDay").val(selectedDay);
		$("#userType").val(userType);
		$("#time").val(time);
		window.open('../menu/BookForm.jsp', 'Book', 'top=90px, left=400px, width=510px, height=400px',  'no');
   });
}); 

function reserve(selectedDay, userType, time) {
	var param = "?selectedDay=" + selectedDay
			  + "&userType=" + userType
			  + "&time=" + time;
	window.open('../menu/BookForm.jsp', 'Book', 'top=90px, left=400px, width=510px, height=400px',  'no');
}
</script> 


	<style>		
		
		#datepicker {margin-left:230px;}		
		#schedule_wrap {margin-top: 30px; margin-left: 150px;}
		#schedule_attr {background-color: rgb(120,193,255);}
		#schedule_attr td {color:white; width:90px; font-weight:bold;}
		#schedule_table {text-align: center; height: 800px; border-collapse:collapse; }
		#schedule_table tr, #schedule_table td {border:1px solid black;}
		.schedule {cursor:pointer; }
		#currentDate {margin-left: 300px;}	
		td { border : solid 1px white;}		
	</style>	

<title>�����ϱ�</title>
</head>
<body>
<form name="scd">
	<input type="hidden" id="selectedDay">
	<input type="hidden" id="userType">
	<input type="hidden" id="time">
</form>



<%	
	String SelectedDay ="";
	
if(request.getParameter("SelectedDay") != null) {
	SelectedDay = request.getParameter("SelectedDay");	
} else if(request.getAttribute("SelectedDay") != null) {
	SelectedDay = (String)request.getAttribute("SelectedDay");
}


%>

<div id="datepicker"> 
</div> 
<h3  id="currentDate"> <%=SelectedDay %></h3>
					<!-- ������ ����ϱ� -->
<div id="schedule_wrap" >
	<table id="schedule_table" cellspacing="0">
		<tr id="schedule_attr">
			<td></td>
			<td>���T</td>
			<td>�Ͽ�T</td>
			<td>�ſ�T</td>
			<td>�Ƹ�T</td>
		</tr>
		<% 		
		
		ArrayList<Schedule> Hui = new ArrayList<Schedule>();
		ArrayList<Schedule> Ha = new ArrayList<Schedule>();
		ArrayList<Schedule> Sin = new ArrayList<Schedule>();
		ArrayList<Schedule> Ah = new ArrayList<Schedule>();	
		
		dbcon.connect();
		
		ArrayList<Schedule> result = new ArrayList<Schedule>();
		result = dbcon.getBookedSchedule(SelectedDay);
		if(result != null) {
		for(Schedule sche : dbcon.getBookedSchedule(SelectedDay) ) {
			if(sche.getDesigner().equals("���T")) {
				Hui.add(sche);				
			}
			else if(sche.getDesigner().equals("�Ͽ�T")) {
				Ha.add(sche);
			}
			else if(sche.getDesigner().equals("�ſ�T")) {
				Sin.add(sche);
			}
			else if(sche.getDesigner().equals("�Ƹ�T")) {
				Ah.add(sche);
			}
			else {
				out.print(sche.getDesigner());
			}			
		}
		}
		
		int[] term = {0,0,0,0};
		for(int i=10; i<=21; i++) {
			%>
			<tr>
				<td> <%out.print(i+":00"); %></td>				
				<%
				// ------------------- ù��° �����̳� ���� ���
				for(int j=0; j<Hui.size(); j++) {
					if(Hui.get(j).getStart_time() == i) {
						term[0] = Hui.get(j).getEnd_time()-Hui.get(j).getStart_time();
						out.print("<td rowspan=");
						out.print(term[0]);
						out.print(" style=\"background-color:#FFBFFF;\" ");
						out.print(" >");
						out.print(Hui.get(j).getMenu());
						out.print("</td>");
					}
				}
				if(term[0] != 0) {
					term[0]--;
				} else {
					out.print("<td class='schedule' data-selected-day='"+SelectedDay+"' data-user-type='���T' data-time='"+i+"'></td>");
				}				
				
				// ------------------ �ι�° �����̳� ���� ���
				for(int j=0; j<Ha.size(); j++) {
					if(Ha.get(j).getStart_time() == i) {
						term[1] = Ha.get(j).getEnd_time()-Ha.get(j).getStart_time();
						out.print("<td rowspan=");
						out.print(term[1]);
						out.print(" style=\"background-color:#FFBFFF;\" ");
						out.print(">");
						out.print(Ha.get(j).getMenu());
						out.print("</td>");
					}
				}
				if(term[1] != 0) {
					term[1]--;
				} else {
					out.print("<td class='schedule' data-selected-day='"+SelectedDay+"' data-user-type='�Ͽ�T' data-time='"+i+"'></td>");
				}
				
				// --------------------- ����° �����̳� ���� ���
				for(int j=0; j<Sin.size(); j++) {
					if(Sin.get(j).getStart_time() == i) {
						term[2] = Sin.get(j).getEnd_time()-Sin.get(j).getStart_time();
						out.print("<td rowspan=");
						out.print(term[2]);
						out.print(" style=\"background-color:#FFBFFF;\" ");
						out.print(">");
						out.print(Sin.get(j).getMenu());
						out.print("</td>");
					}
				}
				if(term[2] != 0) {
					term[2]--;
				} else {
					out.print("<td class='schedule' data-selected-day='"+SelectedDay+"' data-user-type='�ſ�T' data-time='"+i+"'></td>");
				}
				
				// ------------------------- �׹�° �����̳� ���� ���
				for(int j=0; j<Ah.size(); j++) {
					if(Ah.get(j).getStart_time() == i) {
						term[3] = Ah.get(j).getEnd_time()-Ah.get(j).getStart_time();
						out.print("<td rowspan=");
						out.print(term[3]);
						out.print(" style=\"background-color:#FFBFFF;\" ");
						out.print(">");
						out.print(Ah.get(j).getMenu());
						out.print("</td>");
					}
				}
				if(term[3] != 0) {
					term[3]--;
				} else {
					out.print("<td class='schedule' data-selected-day='"+SelectedDay+"' data-user-type='�Ƹ�T' data-time='"+i+"'></td>");
				}				
		}
		dbcon.disconnect();
		
		%>
	
		
	</table>
	</div>
	
</body>
</html>