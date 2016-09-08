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

// ------------------------- 전달된 데이터 추출
String user_pass = request.getParameter("UserPass");
String tel1 = request.getParameter("UserTel1");
String tel2 = request.getParameter("UserTel2");
String tel3 = request.getParameter("UserTel3");

// ------------------------- 객체의 선언
Connection conn = null;
PreparedStatement pstmt = null;

try {	
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

	// --------------------- 패스워드가 입력된 경우 패스워드 변경
	if(!user_pass.equals("")) {
		String Query1 = "UPDATE member SET UsrPass=? WHERE UsrId='" + user_id + "'";
		
		pstmt = conn.prepareStatement(Query1);
		pstmt.setString(1, user_pass);
		pstmt.executeUpdate();
	}
	
	// --------------------- 패스워드를 제외한 정보의 변경
	String Query2 = "UPDATE member SET UsrTel1=?, UsrTel2=?, UsrTel3=? WHERE UsrId='" + user_id + "'";
	
	pstmt = conn.prepareStatement(Query2);
	pstmt.setString(1, tel1);
	pstmt.setString(2, tel2);
	pstmt.setString(3, tel3);
	
	pstmt.executeUpdate();
	
	// ---------------------- 객체의 제거와 페이지의 이동
	pstmt.close();
	conn.close();
	
	String retURL = "../board/BoardList.jsp?column=" + m_column + "&key=" + m_encoded_key + "&CurrentPage=" + m_cp;
	
	out.println("<script language=\"javascript\">");
	out.println("alert('회원정보가 수정되었습니다.')");
	out.println("location.replace('" + retURL + "')");
	out.println("</script>");
	out.flush();
	
} catch(SQLException e) {
	e.printStackTrace();
}	

%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>