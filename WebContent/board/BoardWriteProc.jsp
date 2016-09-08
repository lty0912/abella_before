<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>

<%request.setCharacterEncoding("euc-kr"); %>

<%
// ------------------ 파일의 이름과 크기를 위한 변수 선언
String filename = null;
int filesize = 0;

// ------------------ 파일 업로드 폴더의 생성
String saveFolder = "upload_files";


// -------------------- MultipartRequest 객체 선언
MultipartRequest multi = null;

// ------------------ MultipartRequest 클래스 생성자의 파라미터 설정
ServletContext context = getServletContext();
String realFolder = context.getRealPath(saveFolder);

int sizeLimit = 10*1024*1024;
String encType = "euc-kr";
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

// ------------------ 객체 선언
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	// ----------------- JDBC 설정
	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	String jdbcId = "jspuser";
	String jdbcPw = "jsppass";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	
	// ----------------- MultipartRequest 객체 생성(파일업로드 발생)
	multi = new MultipartRequest(request, realFolder, sizeLimit, encType, policy);
	
	// ----------------- 업로드되어 서버에 저장된 파일 이름
	filename = multi.getFilesystemName("filename");
	
	// ----------------- 파일이 업로드 되면 실행되는 구문   file객체의 선언과 파일의 크기 추출
	if(filename != null) {
		// -------------------- <FORM>의 파일 입력양식 이름
		Enumeration files = multi.getFileNames();
		
		// -------------------- Enumeration 객체에 있는 파일의 이름을 추출
		String fname = (String)files.nextElement();
		// -------------------- 입력양식을 통해 업로드된 File 객체를 추출
		File file = multi.getFile(fname);
		
		// -------------------- 파일의 크기 출력 (바이트)
		filesize = (int)file.length();
		
	}
	
	// ------------------- 전송된 데이터 추출
	String name = multi.getParameter("name");
	String mail = multi.getParameter("mail");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String pass = multi.getParameter("pass");
	
	// -------------------- 새로운 레코드의 RcdNo와 GrpNo 생성
	String Query1 = "SELECT max(RcdNo), max(GrpNo) FROM board";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(Query1);
	
	rs.next();
	
	int uid = (rs.getInt(1)) + 1;
	int gid = (rs.getInt(2)) + 1;
	
	// -------------------- 기타 입력 데이터 생성
	
	int refer = 0;
	int level = 0;
	int order = 1;
	long now = System.currentTimeMillis();
	
	// --------------------- 입력 질의 수행
	String Query2 = "INSERT INTO board VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(Query2);
	pstmt.setInt(1,uid);
	pstmt.setInt(2,gid);
	pstmt.setString(3,name);
	pstmt.setString(4,mail);
	pstmt.setString(5,subject);
	pstmt.setString(6,content);
	pstmt.setString(7,pass);
	pstmt.setString(8,filename);
	pstmt.setInt(9,filesize);
	pstmt.setLong(10,now);
	pstmt.setInt(11,refer);
	pstmt.setInt(12,level);
	pstmt.setInt(13,order);
	
	pstmt.executeUpdate();
	
} catch (IOException e) {
	e.printStackTrace();
} catch (SQLException e) {
	out.print(e);
} finally {
	// ------------------------ 생성된 객체의 제거와 페이지 이동
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	response.sendRedirect("BoardList.jsp");
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