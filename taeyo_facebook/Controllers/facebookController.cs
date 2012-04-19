using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc; 
using System.Collections;

using System.Data;
using System.Data.SqlClient;
using taeyo_facebook.classes;
 

namespace taeyo_facebook.Controllers
{
    public class facebookController : Controller
    {

        //
        // GET: /facebook/

        public ActionResult articleList()
        {

            if (Session["SE_LOGIN_FLAG"] == null)
            {
                return View("Login");

            }
            else
            {



                return View();

            }


        }

        public string retriveArticleList()
        {

            string nextUrl;

            if( Request.QueryString["nextURL"].ToString() == "" )
                nextUrl = "https://graph.facebook.com/177323639028540/feed?access_token=" + Session["SE_OAUTH_TOKEN"];
            else
                nextUrl = Request.QueryString["nextURL"].ToString() + "&access_token=" + Session["SE_OAUTH_TOKEN"];

            oAuthFacebook oFB = new oAuthFacebook();
            string message = oFB.WebRequest(oAuthFacebook.Method.GET, nextUrl, string.Empty);

            return message;

        }

        public ActionResult memberList()
        {

            if (Session["SE_LOGIN_FLAG"] == null)
            {
                return View("Login");

            }
            else
            {



                return View();

            }


        }


        public string retriveMemberList()
        {

            string nextUrl;

            if (Request.QueryString["nextURL"].ToString() == "")
                nextUrl = "https://graph.facebook.com/177323639028540/members?access_token=" + Session["SE_OAUTH_TOKEN"];
            else
                nextUrl = Request.QueryString["nextURL"].ToString() + "&access_token=" + Session["SE_OAUTH_TOKEN"];

            oAuthFacebook oFB = new oAuthFacebook();
            string message = oFB.WebRequest(oAuthFacebook.Method.GET, nextUrl, string.Empty);

            return message; 

        }

        [AcceptVerbs(HttpVerbs.Post)]
        public string post()
        {

            oAuthFacebook oFB = new oAuthFacebook();
            string message = oFB.WebRequest(
                    oAuthFacebook.Method.POST, "https://graph.facebook.com/177323639028540/feed", 
                    "access_token=" + Session["SE_OAUTH_TOKEN"] +  
                    "&message=" + Request.Form["message"].ToString()
            );

            return message;

        }  

        public RedirectResult LoginInitialize()
        {

            oAuthFacebook oFB = new oAuthFacebook();

            return new RedirectResult(oFB.AuthorizationLinkGet());

        }


        public ActionResult FacebookLoginCallBack()
        {

            if (Request.QueryString["code"] == null)
            {

                return View("FacebookLoginCallBackDenided");

            }

            oAuthFacebook oFB = new oAuthFacebook();

            oFB.AccessTokenGet(Request.QueryString["code"].ToString());

            string profile = oFB.WebRequest(oAuthFacebook.Method.GET, "https://graph.facebook.com/me?access_token=" + oFB.Token, string.Empty);

            Hashtable data = (Hashtable)JSonParser.JsonDecode(profile);
            
            Session["SE_LOGIN_FLAG"] = "FACEBOOK";
            Session["SE_OAUTH_TOKEN"] = oFB.Token;
            Session["SE_FACEBOOK_ID"] = data["id"].ToString();
            Session["SE_FACEBOOK_NAME"] = data["name"].ToString();
            Session["SE_FACEBOOK_PROFILE_IMAGE_URL"] = "http://graph.facebook.com/" + data["id"].ToString() + "/picture";
             

            data.Clear();
            data = null;

            return View();

        }


        
    }
}
