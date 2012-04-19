using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace taeyo_facebook.Controllers
{
    public class webController : Controller
    {
        //
        // GET: /web/

        public RedirectResult Index()
        {
            return new RedirectResult("/facebook/articleList");
        }

    }
}
