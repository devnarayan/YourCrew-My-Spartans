using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContractorSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["cid"] == "1")
                lblCategoryLabel.Text = "Find a Home Professional";
            else if (Request.QueryString["cid"] == "2")
                lblCategoryLabel.Text = "Find Out Door Professional";
            else if (Request.QueryString["cid"] == "3")
                lblCategoryLabel.Text = "Find Health Professional";
            else if (Request.QueryString["cid"] == "4")
                lblCategoryLabel.Text = "Find Auto Professional";
            else if (Request.QueryString["cid"] == "5")
                lblCategoryLabel.Text = "Find Education Professional";
            else if (Request.QueryString["cid"] == "6")
                lblCategoryLabel.Text = "Find Technology Professional";
            else if (Request.QueryString["cid"] == "7")
                lblCategoryLabel.Text = "Find Food Professional";
            else if (Request.QueryString["cid"] == "8")
                lblCategoryLabel.Text = "Find Electrician Professional";
            else if (Request.QueryString["cid"] == "9")
                lblCategoryLabel.Text = "Find Property Professional";
            else if (Request.QueryString["cid"] == "10")
                lblCategoryLabel.Text = "Find Your Crew";
            else if (Request.QueryString["cid"] == "11")
                lblCategoryLabel.Text = "Find Your Crew";
            else if (Request.QueryString["cid"] == "12")
                lblCategoryLabel.Text = "Find Your Crew";
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Result.aspx?cid=" + Request.QueryString["cid"].ToString() + "&s=" + txtSearch.Text);
    }
    protected void btnfind1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContractorSearch.aspx?cid=" + Request.QueryString["cid"].ToString() + "&s=" + zip.Text);
    }
    protected void btnfind2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContractorSearch.aspx?cid=" + Request.QueryString["cid"].ToString() + "&s=" + name.Text);
    }
    protected void btnfind3_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContractorSearch.aspx?cid=" + Request.QueryString["cid"].ToString() + "&s=" + licence.Text);

    }
}