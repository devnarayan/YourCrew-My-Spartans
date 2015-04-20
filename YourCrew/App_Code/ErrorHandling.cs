using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;
using System.IO;

/// Summary description for ErrorHandling

public class ErrorHandling
{
    string ExceptionType;

    public void ShowError(Exception ex)
    {
        ExceptionType = ex.GetType().Name;

        switch (ExceptionType)
        {
            case "ArgumentException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            case "ArgumentNullException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            case "ArgumentOutOfRangeException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            case "FormatException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            case "InvalidOperationException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            case "NullReferenceException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            case "SqlException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            case "HttpException":
                HttpContext.Current.Session["errorMsg"] = ex.Message;
                break;
            default:
                HttpContext.Current.Session["errorMsg"] = "There is some server error in application, please try after some time.!";
                break;
        }
        HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.ToString());
    }

    public void ShowSuccess(string PageName)
    {
        HttpContext.Current.Session["successMsg"] = "Record successfully added in our system.!";
        HttpContext.Current.Response.Redirect(PageName);
    }
}