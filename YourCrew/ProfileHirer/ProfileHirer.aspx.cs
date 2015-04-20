using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfileHirer_ProfileHirer : System.Web.UI.Page
{
    CommanClass ccl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ccl = new CommanClass();
            if (ccl.isLogedin())
            {
                Hiddencontractorid.Value = Session["ProfileID"].ToString();
            }
            else
            {
                Response.Redirect("../Login");
            }
        }
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "JobTitle")
        {

        }
    }
}