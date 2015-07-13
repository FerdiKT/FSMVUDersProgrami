<!-- 
	본 페이지는 스케줄 입력 내용에 대하여
	쿼리문을 만들어서 DB에 입력한뒤 복귀한다.	-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*, MyBean.DB.*" 
    %>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8;");
//해당 년도와 월을 받아오는 과정
String startYear = request.getParameter("startYear");
String startMonth = request.getParameter("startMonth");
if(startMonth.length()==1)	startMonth="0"+startMonth;
String startDay = request.getParameter("startDay");
if(startDay.length()==1)	startDay="0"+startDay;
String date = startYear + startMonth + startDay;
	out.print(date);
%>
<%@ include file="schedulerConnDB.jsp"%>
<%
try{
	// Connection 클래스의 인스턴스로 부터 SQL 문 작성을 위한 Statement 준비
	String sql = "INSERT INTO scheduletable (date,title,context) VALUES (?,?,?);";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, date);
	pstmt.setString(2, request.getParameter("title"));
	pstmt.setString(3, request.getParameter("context"));

	// username 값이 제대로 전달된 경우 sql 문장을 수행.
	if(true) {
		pstmt.executeUpdate();
	}
}catch(Exception e) {
	System.out.println(e);
}
%>
<HTML>
<BODY>
<jsp:forward page="scheduleView.jsp">
	<jsp:param name="year" value="<%=startYear%>" />
	<jsp:param name="month" value="<%=startMonth%>" />
	<jsp:param name="day" value="<%=startDay%>" />
</jsp:forward>
</BODY>
</HTML>