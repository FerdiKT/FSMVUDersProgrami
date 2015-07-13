<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" buffer="8kb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
  .error {background:#936; color:#fff; padding:10px; margin:10px 0;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/schedule";
String dbUser = "admin";
String dbPassword = "1234";

String sessionID = session.getId();


String userid=request.getParameter("userid");
String pwd=request.getParameter("pwd");


if (request.getMethod() == "POST") {
 try{
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword); 
	String sql="select userid,pwd from member where id=?";
  pstmt=conn.prepareStatement(sql);
  pstmt.setString(1,userid);
 
  rs=pstmt.executeQuery(); //rs는 테이블 형식, 처음 커서 위치는 열이름에 위치함, 커서 이동을 위해 next()함수를 사용
  if(rs.next()){//아이디가 있고
   //해당 아이디의 pwd,name을 가져옴!
   if(pwd.equals(rs.getString("pwd"))){//로그인
    out.print("로그인 성공");
    //일정한 내용을 세션 속성으로 지정
    //이 속성값을 이용하여 로그인 여부를 판단!
    session.setAttribute("sid",userid);
    session.setAttribute("sname",rs.getString("name"));
    response.sendRedirect("scheduler.jsp");
   }else{//패스워드 오류
    out.print("패스워드 오류");
   }
  }else{//해당 아이디 없음!
   out.write("아이디 오류");
  }//if
 }catch(Exception ex){
  out.print(ex);
 }finally{//자원정리
  //con,pstmt,rs
  try{
   if(rs!=null)rs.close();
   if(pstmt!=null)pstmt.close();
   if(conn!=null)conn.close();
  }catch(Exception ex2){}
 }
}
%>

<div style="border-radius: 10px;
width:960px;height:800px;margin:0 auto;background-color:#F2F2FF;">
<div style="margin-left:50px;">
<form method="post">
	ID: <input type="text" name="userid">
	Password: <input type="password" name="pwd">
	<input type="submit" value="login">
	<a href="scheduler.jsp">뒤로 가기</a>
</form>

</div>
</div> 
</html>

