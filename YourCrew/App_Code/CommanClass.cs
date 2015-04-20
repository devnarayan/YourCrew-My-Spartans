using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;
using System.IO;

/// <summary>
/// Summary description for CommanClass
/// </summary>
public class CommanClass:yourcrews.Connection
{
	
    private string userName;
    private string userType;

    public string Username
    {
        get
        {
            return userName;
        }
        set
        {
            if (String.IsNullOrEmpty(System.Web.HttpContext.Current.Session["LoginUser"].ToString()) == false)
                userName = HttpContext.Current.Session["LoginUser"].ToString();
            else userName = "";
        }
       
    }
    public string UserName()
    {
        if (String.IsNullOrEmpty(System.Web.HttpContext.Current.Session["LoginUser"].ToString()) == false)
          return   HttpContext.Current.Session["LoginUser"].ToString();
        else return "";
    }
   
    public string UserType()
    {
        if (String.IsNullOrEmpty(System.Web.HttpContext.Current.Session["UserType"].ToString()) == false)
            return System.Web.HttpContext.Current.Session["UserType"].ToString();
        else return "";
    }
    public void redirect()
    {
        HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.ToString());        
    }
    public bool isLogedin()
    {
        if (System.Web.HttpContext.Current.Session["LoginUser"] == null || String.IsNullOrEmpty(System.Web.HttpContext.Current.Session["LoginUser"].ToString()))
        {
            return false;
        }
        else return true;

    }
}