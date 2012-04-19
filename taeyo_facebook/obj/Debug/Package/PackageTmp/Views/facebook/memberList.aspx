<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>ASP.NET Korea User Group</title>
 
    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    <script type="text/javascript" src="/Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap-modal.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap-twipsy.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap-popover.js"></script>

    <!-- Le styles -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>

    <script language="javascript">


        function viewDoc() {

            window.open("http://developers.facebook.com/docs/reference/api/group/");

        }

        function dummy() { }


        $(document).ready(function () {

            $("#member_container").height($(window).height() - 223);
            GetMoreMember();
            

        
        });

        var nextURL = "";

        function GetMoreMember() {

         

            $.get("/facebook/retriveMemberList",
			{ "nextURL": nextURL },
			function (data) {
             
			    var o = jQuery.parseJSON(data);

			    try {

			        nextURL = o.paging.next;

			    } catch (e) {

			        nextURL = "";

			    }

			    for (var i = 0; i < o.data.length; i++) {

			        var html = "";
			        var isLikes = false;
			        var isComments = false;
			        var dummy;

			        html += "<li>";
			        html += "<a href=\"http://facebook.com/" + o.data[i].id + "\" title=\"" + o.data[i].name + "\"   target=\"_blank\">";
			        html += "<img class=\"thumbnail\" src='https://graph.facebook.com/" + o.data[i].id + "/picture' alt='" + o.data[i].name + "' >";
			        html += "</a>";
			        html += "</li>";


			        $("#memberGrid").append(html);

			    }


			}); 

        }
    </script>         

  
  </head>
 
   <body id="bootstrap-js"> 
    <div class="topbar">
      <div class="topbar-inner">
        <div class="container-fluid">
          <font class="brand">ASP.NET Korea User Group</font>
          <ul class="nav">
            <li><a href="/facebook/articleList">뉴스피드</a></li>  
            <li class="active"><a href="javascript:dummy();">그룹멤버</a></li>

          </ul>
          <p class="pull-right"><img src="<%=Session["SE_FACEBOOK_PROFILE_IMAGE_URL"]%>" align="top" width="28" height="28" style="margin-top:6px;"/>
          &nbsp;&nbsp;<a href="javascript:dummy();"><%=Session["SE_FACEBOOK_NAME"]%>(<%=Session["SE_FACEBOOK_ID"]%>)</a>
          
        </div>
      </div>
    </div>



     <div class="container-fluid">  
        <!-- Main hero unit for a primary marketing message or call to action -->
 
         
          <div class="alert-message block-message info">
            <p>이 화면에서 사용되는 Graph API URL</p>
            <ul>
              <li>멤버목록 : https://graph.facebook.com/<strong>177323639028540</strong>/members</li> 
            </ul>
            <div class="alert-actions">
              <button class="btn primary" onclick="viewDoc();">관련 문서 보기</button>
            </div>
          </div>
        <div id="member_container" style="overflow:auto;">
        <ul class="media-grid" id="memberGrid"/> 
        </div>
                      <footer>
          <p>Taeyo.NET의 히딩크가 불철주야 제작함</p>
        </footer>

      </div>   
       
         

  </body>

</html>

