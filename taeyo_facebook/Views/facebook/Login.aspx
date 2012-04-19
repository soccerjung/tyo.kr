<!DOCTYPE html>
<html lang="en" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
  <head>
    <meta property="og:title" content="Taeyo.NET 세미나 데모"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="http://www.tyo.kr/"/>
    <meta property="og:image" content="http://taeyo.net/images/taeyologo.gif"/>
    <meta property="og:description" content="Taeyo.NET 4월 세미나의 Facebook Graph API 연동 데모 입니다." />
    <meta charset="utf-8">
    <title>ASP.NET Korea User Group</title> 
 
    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
 
    <!-- Le styles -->
    <script type="text/javascript" src="/Scripts/jquery-1.7.min.js"></script>

    <link href="/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>

    <script language="javascript">

        function openLogin() {

            var url = "/facebook/LoginInitialize";
            var login_win = window.open(url, 'facebook', 'top=0,left=0,width=900, height=800, resizable=yes, scrollbars=yes');
            login_win.focus();

        }

        function dummy() { }
        /*
        $(document).ready(function () {
            alert();
            alert($(document).height());

        });
        */

    </script>

  
  </head>
 
   <body>
 
    <div class="topbar">
      <div class="topbar-inner">
        <div class="container-fluid">
          <p class="brand">ASP.NET Korea User Group</p>
          <ul class="nav">
            <li class="active"><a href="javascript:dummy();">시작하기</a></li>
              <li><a href="javascript:alert('로그인 부터 하세요.');">뉴스피드</a></li>
              <li><a href="javascript:alert('로그인 부터 하세요.');">그룹멤버</a></li> 
          </ul>
          <!--<p class="pull-right">Logged in as <a href="#">username</a></p>-->
        </div>
      </div>
    </div>
 
    <div class="container-fluid">  
        <!-- Main hero unit for a primary marketing message or call to action -->
        <div class="hero-unit">
            <h1>Hello, Facebook Graph API!</h1>
            <Br />
            <p>이 웹사이트는 Facebook Graph API를 사용하여 "ASP.NET Korea User Group"를 연동한 웹사이트 입니다. 지금 당장 Facebook 계정으로 로그인 하세요!</p>
            <Br />
            <p><a class="btn primary large" onclick="openLogin();">Facebook 계정으로 로그인 &raquo;</a></p> 
        </div> 

        <footer>
          <p>Taeyo.NET의 히딩크가 불철주야 제작함</p>
        </footer>
      </div> 
 
  </body>

</html>

