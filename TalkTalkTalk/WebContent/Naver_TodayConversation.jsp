<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup"  %>
 <%@ page import="org.jsoup.nodes.*"  %>
 <%@ page import="org.jsoup.select.Elements"  %>
 <%@ page import="java.io.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/JavaScript" src = "js/jquery-3.3.1.js"></script>

<style>
@font-face { font-family: 'BMJUA'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff'); font-weight: normal; font-style: normal; }
		body {
			margin : 0px;
		}

		#left_nav{
			float : left;
			background-color: #91C8E0;
			width : 17%;
			height : 960px;
			position : fixed;
		}
		
		#top_nav{
			font-family: 'BMJUA';
			background-color : #2C3E50;
			color : #ffffff;
			padding : 40px;
			border: none;
			margin : 0 auto;
		}
		
		div>a:hover {
			color : #D4DFE6;
		}
		div>a:active{
			color : #91C8E0;
		}
		
		div>span {
			font-size : 35px;
		}
		
		div>a {
			float:right;
			font-size:20px;
			padding : 8px;
		}
		
		img {
		    max-width: 10rem;
		    max-height: 10rem;
		    border: 0.5rem solid rgba(255, 255, 255, 0.5);
		    width : 250px;
		    height : 250px;
		    border-radius : 100%;
		    position : absolute;
		    left : 65px;
		    top : 150px;
		}
		ul{
		   list-style:none;
		   position : absolute;
		   left : 50px;
		   top : 370px;
		}
		.navibarmenu{
			color : #D4DFE6;
		/* 	color : #ff6600; 주황색*/
			font-family: 'BMJUA';
			font-size : 25px;
		}
		
		.navibarmenu:hover{
		color : #ffa366;
			
		}
		
		.navibarmenu:active{
			color : #ff6600;
		}
		
		#content {
			float : right;
			width : 83%;	
		}
}
	</style>
</head>

<body>
<%-- 네이버 오늘의 문장 --%>
	<%
		Document doc = Jsoup.connect("https://phrase.dict.naver.com/detail.nhn?bigCategoryNo="+(new Random().nextInt(14)+1)+"&targetLanguage=en").get();

		Elements mean = doc.select(".cont_info .info_txt");
		Elements sentence = doc.select(".cont_info .info_txt2");
	%>
	<script>
	$(document).ready(function() {
			$("#mean").text("<%=mean.first().text()%>");
			$("#sentence").text("<%=sentence.first().text()%>");
		});
	</script>
	<%-- 오늘의 문장 끝 --%>

<%-- 메모장 시작 --%>
<form method="get" action="/TalkTalkTalk/wordaa">
	<input name="word">
	<input name="word_mean">
	<input type="submit" value="등록">
</form>

<nav id="top_nav">
	<div>
		<span>CHAT CHAT</span>
		<a>HOME&nbsp;&nbsp;</a>
		<a>MY PAGE&nbsp;&nbsp;&nbsp;</a>
		<a>SNS&nbsp;&nbsp;&nbsp;</a>
	</div>
</nav>

<div>
	<nav id="left_nav">
		<span>
			<img src = "img/suji.jpg">
		</span>
		<div>
			<ul class="navi">
				<li>
					 <a class="navibarmenu">자기소개</a>
				</li>
				<br>
				<li>
					<a class="navibarmenu">상태메세지</a>
				</li>
				<br>
				<li>
					<a class="navibarmenu">메모장</a>
				</li>
				<br>
				<li>
					<a class="navibarmenu">스터디 플래너</a>
				</li>
				<br>
				<li>
					<a class="navibarmenu">비밀번호 변경</a>
				</li>
			</ul>
		</div>
	</nav>
</div>
	
<div id="content">
	<span class="txt" id="mean"></span><br>
	<span class="txt" id="sentence"></span>
	<span class="txt" id="word"></span><br>
	<span class="txt" id="word_mean"></span>
	
</div>

</body>
</html>