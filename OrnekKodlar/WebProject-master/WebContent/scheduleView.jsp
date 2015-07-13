<!--
	본 페이지는 해당 날자의 스케줄의 내용을 출력하는 화면이다.	-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String context = request.getParameter("context");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
if(year==null)	year="2007";
if(month==null)	month="06";
if(day==null)	day="01";
if(month.length()==1)	month="0"+month;
if(day.length()==1)	day="0"+day;
String date = year+month+day;
String link_main = "scheduler.jsp";
%>

<%@ include file="schedulerConnDB.jsp"%>
<%
try{
	// select 문장을 문자열 형태로 구성한다.
	String sql = "SELECT * FROM scheduletable where date = "+date;
	pstmt = conn.prepareStatement(sql);
	// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
	rs = pstmt.executeQuery();
%>

<HTML>

<HEAD>
<TITLE>Schedule Viewer</TITLE>
<STYLE type="text/css">
<!--
	*{font-family:돋움,굴림,arial; font-size:10pt;}
-->
</STYLE>

<SCRIPT language="JavaScript">
function del(id){
	if(	confirm( "<%=year%>년 <%=month%>월 <%=day%>일의 이 일정을 삭제하시겠습니까?" ) ){
		location.href ='scheduleDelete.jsp?id='+id+'&year=<%=year%>&month=<%=month%>&day=<%=day%>';
	}
	return;
}
function modify(){
	return;
};


</SCRIPT>
</HEAD>

<BODY>
<div style="border-radius: 10px;
width:960px;height:800px;margin:0 auto;background-color:#F2F2FF;">
<SCRIPT language="JAVASCRIPT">
	opener.location.reload();
</SCRIPT>
<TABLE  style="margin:0 auto;display:block;">
<TR>
	<TD></TD>
</TR>
<TR>
	<TD>

	<TABLE style="margin-top:200px;width:500px;background-color:snow""border="0" cellspacing="1" cellpadding="0" >
	<TR>
		<TD colspan="2" style="background-color:lavender;width:600px">
			<CENTER><B><%=year%>년 <%=month%>월 <%=day%>일 스케줄 보기</CENTER>
		</TD>
	</TR>
	<TR>
		<TD>
<%
	//해당 날자에 몇개의 스케줄이 입력되어있는지 계산한다.
	rs.last();
	int recordCount =  rs.getRow();
	rs.beforeFirst();
	
	if(recordCount>0){
		out.print ("&nbsp;- "+recordCount + "개의 등록된 스케줄이 있습니다. -");
	}
	else{
		out.print("&nbsp;- 등록된 스케줄이 없습니다. -<BR>");
	}



	// 마지막 데이터까지 반복함.
	while(rs.next()) {
%>
		<TABLE border="0" cellspacing="1" cellpadding="0" style= "background-color:wheat; width:500">
		<TR>
			<TD colspan="3" style="background-color:skyblue"></TD>
		</TR>
		<TR style="background-color:lavender">
			<TD style="text-align:center; width:40px;">제목	</TD>
			<TD style="width:300px"><%=rs.getString("title")%></TD>
			<TD width="60" align="right">
				<A onClick="modify()" href='scheduleModify.jsp?year=<%=year%>&month=<%=month%>&day=<%=day%>&title=<%=rs.getString("title")%>&context=<%=rs.getString("context")%>&id=<%=rs.getString("id")%>'>
				<U>수정</U></A>&nbsp;
				<A onClick='del(<%=rs.getString("id")%>)' href="#" ><U>삭제</U></A>
			</TD>		
		</TR>
		<TR>
			<TD style="background-color:oldlace; align:center">내용</TD>
			<TD style="background-color:oldlace;" colspan="2"><%=rs.getString("context")%></TD>
		</TR>
		</TABLE>
<%
	}
	// 사용한 자원의 반납.
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e) {
	System.out.println(e);
}
%>
		</TD>
	</TR>
	<TR>
		<TD>
			<BR><%@ include file="scheduleInput.jsp"%>
		</TD>
	</TR>
</TR>
</TABLE>
<A href = "<%= link_main %>">달력 보기</A>
</div>
</BODY>
</HTML>