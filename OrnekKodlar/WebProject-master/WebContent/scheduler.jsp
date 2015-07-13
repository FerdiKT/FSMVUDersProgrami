<!--
					스케줄러 구현하기
-->
<!--
	본 페이지는 스케줄러 메인 화면으로써, 현재의 달을 출력하고 요약된 일정을 보여준다.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
    
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE>Web Programming Final Project   My Scheduler</TITLE>
<STYLE type="text/css">
<!--
	*{font-family:돋움,굴림,arial; font-size:10pt;}
-->
</STYLE>
</HEAD>
<%
Calendar today = Calendar.getInstance(); //지금의 날자를 받아옴 

String wantYear = request.getParameter("wantYear");
String wantMonth = request.getParameter("wantMonth");

if(wantYear != null && wantMonth != null){	//중간 실행으로 원하는 년도와 월이 지정됐을때
	int year = Integer.parseInt(wantYear);
	int month = Integer.parseInt(wantMonth);
	today.set(year,--month,1);
}
else{
	wantMonth = Integer.toString(today.get(Calendar.MONTH));	//월의 두자리수 맞추기 위한 작업
}

if(wantMonth.length()==1)	wantMonth="0"+wantMonth;

Calendar firstDay = Calendar.getInstance();	//firstDay
Calendar lastDay = Calendar.getInstance();	//lastDay
firstDay.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), 1);
lastDay.set(today.get(Calendar.YEAR),today.get(Calendar.MONTH)+1, 1);

int nYear = today.get(Calendar.YEAR);
int nMonth = today.get(Calendar.MONTH);
String link = null;
String link_sign = "signup.jsp";
String link_login = "login.jsp";
%>

<%@ include file="schedulerConnDB.jsp"%>
<%
try{
	String pnMonth = Integer.toString(nMonth+2);	//다음달의 쿼리문을 만드는데 필요
	if(pnMonth.length()==1)	pnMonth="0"+pnMonth;
	// Connection 클래스의 인스턴스로 부터 SQL 문 작성을 위한 Statement 준비
	String sql = "SELECT date,title FROM scheduletable WHERE date>="+Integer.toString(nYear)+wantMonth+
	"00 && date<"+Integer.toString(nYear)+pnMonth+"00 ORDER BY date";

	pstmt = conn.prepareStatement(sql);
	// username 값이 제대로 전달된 경우 sql 문장을 수행.
	rs = pstmt.executeQuery();
}catch(Exception e) {
	System.out.println(e);
}
%>

<BODY>
<div style="border-radius: 10px;
width:960px;height : 800px;margin:0 auto;background-color: #F2F2FF;">
<div style="float:right;margin:10px 50px;">
 <A href = "<%= link_sign %>">회원 가입</A> / 
 <A href = "<%= link_login %>">로그인</A>
</div>
<TABLE border="0" style="margin:0 auto;display:block;
border-spacing:0;background-color:snow;align:center;">
<th></th>
<TR style="background-color:azure">
	<TD style="padding:0">
<%
	int linkYear = nYear;
	int linkMonth = nMonth;
	if(nMonth == 0){	
		linkYear = nYear-1;
		linkMonth = 12;
	}
	else{
		linkMonth = nMonth;
	}
	link="scheduler.jsp?wantYear="+linkYear+"&wantMonth="+linkMonth;	//이전달 링크
%>
	<A href="<%= link %>" > 이전달</A>
	</TD>

	<TD colspan="5" style="padding:0;text-align:center;">
		<B>
		<%= today.get(Calendar.YEAR) %>년 
		<%= today.get(Calendar.MONTH)+1 %>월
		</B>
	</TD>

	<TD style="padding:0;text-align:right">
<%
	if(nMonth == 11){
		linkYear = nYear+1;
		linkMonth = -1;
	}
	linkMonth += 2;
	link="scheduler.jsp?wantYear="+linkYear+"&wantMonth="+linkMonth;	//다음달 링크
%>
	<A href="<%= link %>" > 다음달</A>
	</TD>
</TR>
<TR style="text-align:center;background-color:wheat;">
	<TD width="95"><FONT size="1" color="red"><B>SUN</B></FONT>		</TD>
	<TD width="95"><FONT size="1"><B>MON</B></FONT>		</TD>
	<TD width="95"><FONT size="1"><B>TUE</B></FONT>		</TD>
	<TD width="95"><FONT size="1"><B>WED</B></FONT>		</TD>
	<TD width="95"><FONT size="1"><B>THU</B></FONT>		</TD>
	<TD width="95"><FONT size="1"><B>FRI</B></FONT>		</TD>
	<TD width="95"><FONT size="1" color="blue"><B>SAT</B></FONT>		</TD>
</TR>

<TR>
<%
String day = "";
String span=" colspan=\"+"+firstDay.get(Calendar.DAY_OF_WEEK)+"\""; //쉘 병합

String rsDay = "0";		//리절트 셋에서 가져온 날자
String rsTitle = "";	//러절트 셋에서 가저온 제목

boolean key=true;
while(firstDay.before(lastDay)) {	// 세부 일 출력하기
	day = "" + firstDay.get(Calendar.DATE); // day . 날짜 값을 문자열로 에 저장한다
%>
	<TD align="right" <%=span %> nowrap>
		<TABLE border=0 cellspacing=0 cellpadding=0 style="width:110; height:65; table-layout:fixed;">
		<TR bgcolor="oldlace">
			<TH align="right">
				<A href="scheduleView.jsp?year=<%=firstDay.get(Calendar.YEAR)%>&
				month=<%=firstDay.get(Calendar.MONTH)+1%>&
				day=<%=day%>">	<!-- 날자 클릭시 내용 전달 -->
				<FONT size="1" color="gray"><%=day %></FONT>
				</A>
			</TH>
		</TR>
		<TR height="50" bgcolor="lavender">
			<TD>
			</TD>
		</TR>
		</TABLE>
	</TD>
<%	
	if ( firstDay.get(Calendar.DAY_OF_WEEK)%7==0){	
%>
</TR>
<TR>
<%
	}
	span="";
	firstDay.add(Calendar.DATE, 1);
}
%>
</TR>
</TABLE>

<!--	다른 년도와 월을 선택하여 이동하는 기능	-->
<FORM action="scheduler.jsp" method="GET">
<TABLE align="center">
<TR>
	<TD colspan="7" align="center"><FONT size="1">다른 날자보기</FONT>
	<SELECT name="wantYear">
<%	//현재의 년도와 월이 selected로 기본 옵션
	for(int selectYear=nYear-10; selectYear<nYear+10; selectYear++){	%>
		<OPTION value="<%=selectYear%>" <%if(selectYear==nYear)	out.print(" selected");%>
		><%=selectYear%>
<%	}	%>
	</SELECT>년&nbsp; 
	<SELECT name="wantMonth">
<%
	for(int selectMonth=1; selectMonth<=12; selectMonth++){	%>
		<OPTION value="<%=selectMonth%>" <%if(selectMonth==nMonth+1)	out.print(" selected");%>
		><%=selectMonth%>
<%	}	%>
	</SELECT>월&nbsp;
	<INPUT type="submit" value="확인">
	</TD>
</TABLE>
</FORM>

</div>
</BODY>
</HTML>