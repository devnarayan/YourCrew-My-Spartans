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
public partial class ProfileContractor_FindJob : System.Web.UI.Page
{
    CommanClass ccl;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ccl = new CommanClass();
            if (ccl.isLogedin() == false)
                Response.Redirect("../Login");
            LoadCetegory();

          ////  CountryService.countrySoapClient  d= new countrySoapClient();
          //  d.Open();
          //  WebResponse wrs;
          //  Response.Write(d.GetCountries());
          //  d.Close();
         datalistShowJobs.DataSource=   findjobs(null, null, null, "in", null, null, null, null);
         datalistShowJobs.DataBind();
        }
        
    }
    public void LoadCetegory()
    {
        LoadControl LC = new LoadControl();
        DataTable dt = LC.LoadCetegory();

        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";

        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0,new ListItem("All Category","-1"));
    }

    public DataTable findjobs(string category,string location,string state,string country,string postcode,string bedget,string hoursbilled,string fixedprice)
    {
        string query = "select p.CountryID,p.State,p.Location,p.PostCode, p.UserName,p.HirerName,p.HirerLastName,p.PhotoURL,qry1.JID,qry1.HirerID,qry1.JobTitle,qry1.Hours,qry1.PostDate,qry1.Budget,qry1.Description,qry1.JobType from ProfileHirer p inner join Jobs qry1 on p.HirerID=qry1.HirerID and JID not in(select JID from JobApply where ContractorID='" + Convert.ToInt32(Session["ProfileID"]) + "') where p.HirerID=qry1.HirerID";
        if (ddlCategory.SelectedValue != "-1")
            query = query + " and (qry1.CategoryID='" + ddlCategory.SelectedValue + "') ";
        if(!string.IsNullOrEmpty(country))
         query = query + " And (p.CountryID ='"+country+"')";
        if(!string.IsNullOrEmpty(state))
            query=query=" And (p.State = '"+state+"')";
        if(!string.IsNullOrEmpty(location))
         query=query+ " And (p.Location = '"+location+"')";
        if(!string.IsNullOrEmpty(postcode))
         query=query + " And (p.PostCode = '"+postcode+"')";
        if(!string.IsNullOrEmpty(bedget))
            query=query+" And (qry1.Budget <='"+bedget+"' )";
        if (hoursbilled == "HoursBilled" && fixedprice == "FixedPrice")
            query = query + " And (JobType =HoursBilled )  or (JobType = FixedPrice)";
        else if (fixedprice == "FixedPrice")
            query = query + " or (JobType = FixedPrice) ";
        else if(hoursbilled=="HoursBilled")
            query = query + " or (JobType =HoursBilled ) ";
        query = query + " order by qry1.PostDate";
        SqlDataAdapter ad = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string value = Request.Form["slider"];
    }
    protected void ProductsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Apply")
        {
            //Button Button2b = (Button)e.Item.FindControl("Button2");
            HiddenField HF_JID = (HiddenField)e.Item.FindControl("HF_FJ_JID") as HiddenField;
            Response.Redirect("~/ProfileContractor/ApplyJob?JobID=" + HF_JID.Value,false);
        }
    }
}