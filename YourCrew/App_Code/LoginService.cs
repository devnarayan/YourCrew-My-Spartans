using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LoginService
/// </summary>
public class LoginService
{
	public LoginService()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void LoginRed(int step,string type)
    {
        if (type == "Contractor")
        {
            if (step == 0)
            {
                HttpContext.Current.Response.Redirect("ActiveProfile.aspx",false);
            }
            else if (step == 1)
            {
                HttpContext.Current.Response.Redirect("ContractorRegister.aspx",false);
            }
            else if (step == 2)
            {
                HttpContext.Current.Response.Redirect("ContractorRegister.aspx",false);
            }
            else if (step == 3)
            {
                HttpContext.Current.Response.Redirect("UpdatePics.aspx",false);
            }
            else if (step == 4)
            {
                HttpContext.Current.Response.Redirect("ProfileContractor/BusinessPlan.aspx", false);
            }
            else if (step == 5)
            {
                HttpContext.Current.Response.Redirect("Chat/Communication.aspx",false);
            }
        }
        else
        {
            HttpContext.Current.Response.Redirect("Chat/Communication.aspx", false);
            // Hirer
        }
    }
}