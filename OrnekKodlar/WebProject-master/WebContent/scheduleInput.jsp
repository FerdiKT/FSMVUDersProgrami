<!-- 새로운 스케줄을 입력받는 폼을 형성하고
	입력할 내용을 다음으로 넘겨준다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");	
response.setContentType("text/html;charset=utf-8;");
//날자를 받아 오는 과정
Calendar today = Calendar.getInstance();
String inputYear = request.getParameter("year");
if(inputYear==null)	inputYear=""+today.get(Calendar.YEAR);
String inputMonth = request.getParameter("month");
if(inputMonth==null) inputMonth=""+today.get(Calendar.MONTH);
String inputDay = request.getParameter("day");
if(inputDay==null) inputDay=""+today.get(Calendar.DATE);
int intYear = Integer.parseInt(inputYear);
int intMonth = Integer.parseInt(inputMonth);
int intDay = Integer.parseInt(inputDay);
%>

<HTML>
<HEAD>
<STYLE type="text/css">
<!--
	*{font-family:돋움,굴림,arial; font-size:10pt;}
	#toAnotherDay {visibility:hidden }
-->
</STYLE>

</HEAD>
<!-- 새로운 스케줄 입력 폼 -->
<BODY>
<FORM name="newScheduleForm" action="scheduleInputAction.jsp" method="POST">
<TABLE border="0" cellspacing="1" style="background-color:wheat;width:500px">
<TR>
	<TD colspan="2">	</TD>
</TR>
<TR>
	<TD colspan="2" style="background-color:lavender; text-align:center"><B>새 스케줄 추가하기</TD>
</TR>
<TR style="background-color:oldlace">
	<TD sytle="text-align:center;width:40">제목</TD>
	<TD sytle="text-align:right">
		<INPUT name="title" type="text"  size="55">
	</TD>
</TR>
<TR style="background-color:oldlace">
	<TD  sytle="text-align:center">날자</TD>
	<TD> 
			<INPUT type="hidden" name="startYear" value="<%=inputYear%>">
			<INPUT type="hidden" name="startMonth" value="<%=inputMonth%>">
			<INPUT type="hidden" name="startDay" value="<%=inputDay%>">
		</TD>
	</TR>

	<TR style="background-color:oldlace">
		<TD sytle="text-align:center">내용</TD>
		<TD>
			<TEXTAREA name="context" rows="5" cols="55"></TEXTAREA>
		</TD>
	</TR>
	<TR style="background-color:oldlace">
		<TD colspan="2" sytle="text-align:center">
			<INPUT type="submit" value="저장하기">
		</TD>
	</TR>
	</TABLE>
	</FORM>
</BODY>
</HTML>