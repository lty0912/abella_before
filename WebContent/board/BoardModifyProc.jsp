<%@ page language="java" contentType="text.html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%request.setCharacterEncoding("euc-kr");%>

<%
	// --------------------- 전달된 레코드 식별자 추출

	int rno = Integer.parseInt(request.getParameter("rno"));

	int CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String encoded_key="";
	
	// ---------------------- 키워드 데이터 추출
	String column = request.getParameter("column");
	if(column == null) column="";
	
	String key = request.getParameter("key");
	if(key!=null) {
		encoded_key = URLEncoder.encode(key,"euc-kr");
	} else {
		key = "";
	}
	
	String realFolder = "";
	String saveFolder = "upload_files";
	String encType = "euc-kr";
	int sizeLimit = 10*1024*1024;
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	MultipartRequest multi = null;
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
		String jdbcId = "jspuser";
		String jdbcPw = "jsppass";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		
		multi = new MultipartRequest(request, realFolder, sizeLimit, encType, new DefaultFileRenamePolicy());
		String filename = multi.getFilesystemName("filename");
		
		// -------------------------- 전달된 데이터의 추출
		String mail = multi.getParameter("mail");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String passwd = multi.getParameter("passwd");
		
		// -------------------------- 레코드 패스워드 추출
		String Query1 = "SELECT UsrPass, UsrFileName FROM board WHERE RcdNo=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,rno);
		rs = pstmt.executeQuery();
		
		rs.next();
		String dbPass = rs.getString(1);
		String oldFilename = rs.getString(2);
		
		// -------------------------- 패스워드 비교와 레코드의 삭제
		if(passwd.equals(dbPass)) {
			
			if(filename != null) {	// ----- 새로운 업로드 파일이 존재하는 경우
				
				if(oldFilename != null) {  // ----- 첨부 파일이 이미 존재하는 경우 제거 
					
					String PathAndName = realFolder + "\\" + oldFilename;
					File file1 = new File(PathAndName);
					if(!file1.delete()) {
						out.println("파일 삭제에 실패했습니다.");
					}					 
				}
			
				// --------------------------- 새로 업로드되는 파일의 크기 추출
				Enumeration files = multi.getFileNames();
				String fname = (String)files.nextElement();
				File file = multi.getFile(fname);
				int filesize = (int)file.length();
				
				// --------------------------- 파일정보를 포함한 DB 갱신
				String Query2 = "UPDATE board SET UsrMail=?, UsrSubject=?, UsrContent=?, UsrFileName=?, UsrFileSize=? WHERE RcdNo=?";
				pstmt = conn.prepareStatement(Query2);
				pstmt.setString(1,mail);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setString(4, filename);
				pstmt.setInt(5, filesize);
				pstmt.setInt(6, rno);
				
				pstmt.executeUpdate();			
			
			} else {
				// ---------------------------- 파일정보를 포함하지 않은 DB 갱신
			
			
			String Query2 = "UPDATE board SET UsrMail=?, UsrSubject=?, UsrContent=? WHERE RcdNo=?";
			pstmt = conn.prepareStatement(Query2);
			pstmt.setString(1, mail);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setInt(4,rno);
			
			pstmt.executeUpdate();
			
			rs.close();
			pstmt.close();
			conn.close();
			String retUrl = "BoardContent.jsp?rno=" + rno + "&column=" + column + "&key=" + encoded_key + "&CurrentPage=" + CurrentPage;
			response.sendRedirect(retUrl);			
		
			} 
			
		} else {
			rs.close();
			pstmt.close();
			conn.close();
			out.println("<script language=\"javascript\">");
			out.println("alert('패스워드가 틀렸습니다.')");
			out.println("</script>");
			out.flush();
		}
	
		
	} catch (IOException ie) {
		out.println(ie);
	}	
	catch(SQLException e) {
		out.println(e);
	}
%>
		
		
		
		
		
		
		
		
		
		
		
		