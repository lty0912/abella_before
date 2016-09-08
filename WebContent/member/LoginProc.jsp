<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%request.setCharacterEncoding("euc-kr");%>

<%
// ------------------------- 페이지 정보 추출
int m_cp = Integer.parseInt(request.getParameter("CurrentPage"));

// ------------------------- 키워드 데이터 추출
String m_column = request.getParameter("column");
if(m_column == null) m_column = "";

String m_encoded_key = null;

String m_key = request.getParameter("key");
if(m_key != null) {
	m_encoded_key = URLEncoder.encode(m_key,"euc-kr");
} else {
	m_key="";
}

// ------------------------- 전달된 아이디와 패스워드 추출
String user_id = request.getParameter("UserId");
String user_pass = request.getParameter("UserPass");

// ------------------------- 변수와 객체의 선언
String db_id = null;
String db_pass = null;
String db_name = null;

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
	
	// ------------------------ 입력한 아이디를 사용해 아이디와 패스워드 추출
	String Query1 = "SELECT UsrId, UsrPass, UsrName FROM member WHERE UsrId='" + user_id + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	
	if(rs.next()) {
		db_id = rs.getString(1);
		db_pass = rs.getString(2);
		db_name = rs.getString(3);
	} else {
		db_id = null;
		db_pass = null;
		db_name = null;
	}
	
	if( (user_id.equals(db_id)) && (user_pass.equals(db_pass)) ) {
		// ------------------------- 아이디와 패스워드가 일치할 경우
		session.setAttribute("member_id", user_id);
		session.setAttribute("member_name", db_name);
		
		rs.close();
		stmt.close();
		conn.close();
		
		
		
		out.println("<script language=\"javascript\">");
		out.println("window.opener.location.reload()");
		out.println("window.close();");
		out.println("alert('환영합니다.')");		
		out.println("</script>");
		out.flush();
	} else {
		// ------------------------ 아이디와 패스워드가 일치하지 않을 경우
		rs.close();
		stmt.close();
		conn.close();
		
		out.println("<script language=\"javascript\">");
		out.println("alert('아이디나 패스워드가 다릅니다.')");
		out.println("history.back()");
		out.println("</script>");
		out.flush();
	}
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