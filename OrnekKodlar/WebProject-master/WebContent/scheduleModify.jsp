<!-- 
	본 페이지는 해당 스케줄에 대한 수정을 눌렀을때,
	수정하기 위한 폼을 출력한다.	-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
    
<% request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8;");

//해당 년도와 월을 받아온다.
String title = request.getParameter("title");
String context = request.getParameter("context");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
%>

<HTML>
<HEAD>
<STYLE type="text/css">
<!--
	*{font-family:돋움,굴림,arial; font-size:10pt;}
-->
</STYLE>
</HEAD>

<BODY>
<FORM action="scheduleModifyAction.jsp" method="POST">
<TABLE border="0" cellspacing="1" style="background-color:wheat; width:500">
<TR>
	<TD colspan="2">	</TD>
</TR>
	<TR>
		<TD colspan="2"  sytle="background-color:lavender; text-align:center"><B>스케줄 수정하기</TD>
	</TR>
	<TR style="background-color:oldlace">
		<TD style="text-align=:center;width:40">제목</TD>
		<TD style="text-align:left">
			<INPUT name="title" type="text" size="55" value="<%=title%>">
		</TD>
	</TR>
	<TR style="background-color:oldlace">
		<TD style="text-align:center">시간</TD>
		<TD> 
			<%=year%>년 <%=month%>월 <%=day%>일
		</TD>
	</TR>
	<TR style="background-color:oldlace">
		<TD align="center">내용</TD>
		<TD>
			<TEXTAREA name="context" rows="5" cols="55"><%=context%></TEXTAREA>
		</TD>
	</TR>
	<TR style="background-color:oldlace">
		<TD style="text-align:center">
			<INPUT type="submit" value="수정하기">
		</TD>
	</TR>
	</TABLE>
	<input type="hidden" name="id" value='<%=request.getParameter("id")%>'>
	<input type="hidden" name="startYear" value='<%=year%>'>
	<input type="hidden" name="startMonth" value='<%=month%>'>
	<input type="hidden" name="startDay" value='<%=day%>'>
</FORM>
</BODY>
</HTML>
