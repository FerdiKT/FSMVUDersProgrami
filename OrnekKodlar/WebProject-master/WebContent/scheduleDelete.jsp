<!-- 본 페이지는 해당스케줄의 삭제를 담당한다.
	쿼리문을 전송하여 DB 로부터 해당 스케줄을 삭제하고 복귀한다.	-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
    
<%request.setCharacterEncoding("utf-8");%>

<%@ include file="schedulerConnDB.jsp"%>
<%
try{
	// Connection 클래스의 인스턴스로 부터 SQL 문 작성을 위한 Statement 준비
	String sql = "DELETE from scheduletable WHERE id="+request.getParameter("id");
	pstmt = conn.prepareStatement(sql);
	// username 값이 제대로 전달된 경우 sql 문장을 수행.
	pstmt.executeUpdate();

	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e) {
	System.out.println(e);
}
%>

<HTML>
<BODY>
<jsp:forward page="scheduleView.jsp">
	<jsp:param name="year" value='<%=request.getParameter("year")%>' />
	<jsp:param name="month" value='<%=request.getParameter("month")%>' />
	<jsp:param name="day" value='<%=request.getParameter("day")%>' />
</jsp:forward>
</BODY>
</HTML>