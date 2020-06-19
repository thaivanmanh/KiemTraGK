using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KTGK.Models;

namespace KTGK.Controllers
{
    public class HomeController : Controller
    {
        private ManageProduct db = new ManageProduct();

        public ActionResult Index(int page = 1 , int pageSize =7 , string search = "")
        {
            List<Product> product = db.Products.ToList();
            return View(product);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}