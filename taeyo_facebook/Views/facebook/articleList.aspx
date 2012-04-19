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


            $('#modal-post').bind('show', function () {
                $("#message").val("");
                $("#modal-footer").show();
            })

            $("#article_container").height($(window).height() - 430);


            GetMorePost();

        });

        var nextURL = "";
        

        function GetMorePost() {


            $("#loadMore").addClass("disabled");

            $.get("/facebook/retriveArticleList",
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
			        var isPicture = false;
			        var isIwasLike = false;
			        var isLikes = false;
			        var isComments = false;
			        var dummy;

			        html += "<img src=\"https://graph.facebook.com/" + o.data[i].from.id + "/picture?type=small\" align=\"top\" width=\"50\" height=\"50\"/>&nbsp;"
			        html += "<a href=\"http://facebook.com/" + o.data[i].from.id + "\" title=\"" + o.data[i].from.name + "\"   target=\"_blank\"><b>" + o.data[i].from.name + "</b></a><br /><br />"

			        if (o.data[i].picture) {

			            html += "<img src=\"" + o.data[i].picture + "\"/><br /><br />";

			        }

			        html += o.data[i].message + "<br /><br />";
			        html += " &#183; " + o.data[i].created_time + "<br /><br />";


			        try {

			            test = o.data[i].likes.count;
			            isLikes = true;

			        } catch (e) {

			            isLikes = false;

			        }

			        if (isLikes) {

			            var names = "";
			            var showCount = 0;

			            for (var j = 0; j < o.data[i].likes.data.length; j++) {

			                names += o.data[i].likes.data[j].name + "님 ";

			            }

			            if (parseInt(o.data[i].likes.count) == j)
			                html += "<div class=\"hero-unit-comment\">" + names + "이 좋아합니다.</div>";
			            else
			                html += "<div class=\"hero-unit-comment\">" + names + "외 " + (parseInt(o.data[i].likes.count) - o.data[i].likes.data.length) + "명이 좋아합니다.</div>";

			        }


			        try {

			            test = o.data[i].comments.data.length;
			            isComments = true;

			        } catch (e) {

			            isComments = false;

			        }

			        if (isComments) {

			            html += "<div class=\"hero-unit-comment\">";

			            for (var j = 0; j < o.data[i].comments.data.length; j++) {

			                html += "<img src=\"https://graph.facebook.com/" + o.data[i].comments.data[j].from.id + "/picture?type=small\" align=\"top\" width=\"50\" height=\"50\" />&nbsp;";
			                html += "&nbsp;";
			                html += "<a href=\"http://facebook.com/" + o.data[i].comments.data[j].from.id + "\" title=\"" + o.data[i].comments.data[j].from.name + "\"   target=\"_blank\"><b>" + o.data[i].comments.data[j].from.name + "</b></a>";
			                html += "<br /><br />";
			                html += o.data[i].comments.data[j].message;
			                html += "<br /><br />";
			                html += " &#183; ";
			                html += o.data[i].comments.data[j].created_time;

			                if (j < o.data[i].comments.data.length - 1) {

			                    html += "<hr style=\"border-bottom: 1px solid #000000;\" />";

			                }

			            }

			            html += "</div>";
			        }


			        html += "<hr/>";

			        $("#article_container").append(html);

			    }


			    $("#loadMore").removeClass("disabled");


			});
             
        }

        function SendFeed() {

            if (jQuery.trim($("#message").val()) == "") {

                alert("알면서.. ㅎㅎㅎㅎ");
                return;

            }

            $("#modal-footer").hide();

            //document.f.submit();
            alert(1);
            $.post("/facebook/post",
            { "message": jQuery.trim($("#message").val()) },
            function (data) {

                alert(2);

                $("#message").val();

                $('#modal-post').modal('hide');

                location.reload();

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
            <li class="active"><a href="javascript:dummy();">뉴스피드</a></li>
              <li><a href="/facebook/memberList">그룹멤버</a></li>  
          </ul>
          <p class="pull-right"><img src="<%=Session["SE_FACEBOOK_PROFILE_IMAGE_URL"]%>" align="top" width="28" height="28" style="margin-top:6px;"/>
          &nbsp;&nbsp;<a href="javascript:dummy();"><%=Session["SE_FACEBOOK_NAME"]%>(<%=Session["SE_FACEBOOK_ID"]%>)</a>
          
        </div>
      </div>
    </div>



     <div class="container-fluid" >  
        <!-- Main hero unit for a primary marketing message or call to action -->
 
         
          <div class="alert-message block-message info">
            <p>이 화면에서 사용되는 Graph API URL</p>
            <ul>
              <li>피드목록 : https://graph.facebook.com/<strong>177323639028540</strong>/feed</li> 
            </ul>
            <div class="alert-actions">
              <button class="btn primary" onclick="viewDoc();">관련 문서 보기</button>
            </div>
          </div>

        <div class="well">
            <button data-controls-modal="modal-post" data-backdrop="true" data-keyboard="true" class="btn large primary">글 쓰기</button>
        </div>


          <div id="article_container" style="overflow:auto;height:500px;"/>

          

      </div>  
      <br /><br />
        <div class="well">
            <a href="javascript:GetMorePost();" class="btn large primary disabled" id="loadMore">더 불러오기</a>
        </div>
        
              <footer>
          <p>Taeyo.NET의 히딩크가 불철주야 제작함</p>
        </footer>

        <div id="modal-post" class="modal hide fade">
            <div class="modal-header">
              <a href="#" class="close">&times;</a>
              <h3>무슨 말을 하고 싶으신가요?</h3>
            </div>
            <div class="modal-body">
              <textarea class="xxlarge" id="message" name="message" rows="5" style="width:100%;"></textarea>
            </div>
            <div class="modal-footer" id="modal-footer">
              <a href="javascript:$('#modal-post').modal('hide');" class="btn primary">취소</a>
              <a href="javascript:SendFeed();" class="btn secondary">확인</a>
            </div>
          </div>    

  </body>

</html>

