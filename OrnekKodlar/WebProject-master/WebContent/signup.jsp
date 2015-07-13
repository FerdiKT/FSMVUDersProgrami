<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%

	String errorMsg = null;

	String actionUrl;
	
	// 사용자 정보를 위한 변수 초기화
	String userid = "";
	String name = "";
	String pwd = "";
	String email = "";

	actionUrl = "register.jsp";
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div style="border-radius: 10px;
width:960px;height:800px;margin:0 auto;background-color:#F2F2FF;">
 <div class="container">
	  <div>
		  <form class="form-horizontal" action="<%=actionUrl%>" method="post">
			<fieldset>
        <legend class="legend">회원 가입</legend>
				<div class="control-group">
					<label class="control-label" for="userid">아이디</label>
					<div class="controls">
						<input type="text" name="userid" value="<%=userid%>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="name">별명</label>
					<div class="controls">
						<input type="text"  name="name" value="<%=name%>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="email">이메일</label>
					<div class="controls">
						<input type="email" placeholder="abc@never.com" name="email" value="<%=email%>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="pwd">비밀 번호</label>
					<div class="controls">
						<input type="password" name="pwd" value="<%=pwd%>">
					</div>
				</div>
				<div class="form-actions">
					<a href="scheduler.jsp" class="btn">달력 보기</a>
					<input type="submit" class="btn btn-primary" value="가입">
				</div>
			</fieldset>
		  </form>
    </div>
  </div>
  </div>
</body>
</html>