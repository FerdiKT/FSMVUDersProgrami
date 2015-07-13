<!--
	본 페이지는 스케줄을 수정하기위해
	DB에 쿼리를 보내고 복귀한다.	-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
    
response.setContentType("text/html;charset=utf-8;");
request.setCharacterEncoding("utf-8");
%>

<%@ include file="schedulerConnDB.jsp"%>
<%
try{
	// Connection 클래스의 인스턴스로 부터 SQL 문 작성을 위한 Statement 준비
	String sql = "UPDATE scheduletable SET title=\" " + request.getParameter("title")
		+ " \",context=\" " + request.getParameter("context") + " \" WHERE id= " + request.getParameter("id");
out.print(sql);

	pstmt = conn.prepareStatement(sql);

	// username 값이 제대로 전달된 경우 sql 문장을 수행.
	if(true) {
		pstmt.executeUpdate();
	}
}catch(Exception e) {
	System.out.println(e);
}
%>
<HTML>
<HEAD>
</HEAD>
<BODY>
<jsp:forward page="scheduleView.jsp">
	<jsp:param name="year" value='<%=request.getParameter("startYear")%>' />
	<jsp:param name="month" value='<%=request.getParameter("startMonth")%>' />
	<jsp:param name="day" value='<%=request.getParameter("startDay")%>' />
</jsp:forward>
</BODY>
</HTML>