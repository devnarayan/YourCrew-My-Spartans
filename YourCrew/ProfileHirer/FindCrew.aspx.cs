using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using yourcrews;
using System.Configuration;
using CountryService;
using System.Net;
using System.Web.Services;

public partial class ProfileHirer_FindCrew : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string value = Request.Form["slider"];
            Response.Write(value);

            ////  CountryService.countrySoapClient  d= new countrySoapClient();
            //  d.Open();
            //  WebResponse wrs;
            //  Response.Write(d.GetCountries());
            //  d.Close();
        }

    }

    protected void DL_FJ_BindDL_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Hire")
        {
            //Button Button2b = (Button)e.Item.FindControl("Button2");
            HiddenField HF_JID = (HiddenField)e.Item.FindControl("HF_FJ_JID") as HiddenField;
            HiddenField HF_HI = (HiddenField)e.Item.FindControl("HF_FJ_HirerId") as HiddenField;
            Label lblJTitle = (Label)e.Item.FindControl("lbl_FJ_JobTitle") as Label;
            Label lblPostedDate = (Label)e.Item.FindControl("lbl_FJ_PostDate") as Label;
            Response.Redirect("~/ProfileContractor/ApplyJob.aspx?JobID=" + HF_JID.Value + "&HirerId=" + HF_HI.Value + "");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string value = Request.Form["slider"];
    }
}