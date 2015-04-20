using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using yourcrews;
using System.Web.Services;

public partial class ProfileContractor_JobPropoal : System.Web.UI.Page
{
    Contractor ccl = new Contractor();
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (ccl.isLogedin() == true)
                {
                    loadprofile();
                    myjobs();
                }
                else
                {
                    Session["errorMsg"] = "Please Login or Signup your profile.";
                    Response.Redirect("../Default.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    [WebMethod]
    public List<string> getslider()
    {
        return ccl.GetSlider(Hiddencontractorid.Value);
    }
    private void loadprofile()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            try
            {
                string loginid, usertyp;
                if (ccl.isLogedin() == true)
                {
                    //  string username = StringCyper.Decrypt(Request.QueryString["id"], "devnagar");
                    string username = Request.QueryString["id"];
                    usertyp = ccl.UserType();

                    if (Session["LoginUser"].ToString() == username)
                    {
                        // Login as Contractor (My Profile)
                        loginid = Session["LoginUser"].ToString();
                    }
                    else if (usertyp == "Contractor")
                    {
                        loginid = Session["LoginUser"].ToString();
                    }
                    else
                    {
                        // Hirer
                        loginid = username;
                        if (loginid == "")
                        {
                            Response.Redirect("../ProfileHirer/ProfileHirer.aspx");
                        }
                    }
                }
                else
                {
                    //   loginid = StringCyper.Decrypt(Request.QueryString["id"], "devnagar");
                    loginid = Request.QueryString["id"];
                    if (loginid == "")
                    {
                        Response.Redirect("Default.aspx");
                    }
                    usertyp = "Contractor";
                    // Visotor
                }
                // uncomment to use project gridview

                Connection.Open_Connection(con);
                cmd = new SqlCommand("spContractorGetProfile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 30).Value = loginid;
                cmd.Parameters.Add("@UserType", SqlDbType.VarChar, 15).Value = "Contractor";
                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 255);
                cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DataRow rw = dt.Rows[0];
                    if (cmd.Parameters["@Msg"].Value.ToString() == "OK")
                    {
                        string usertype = Session["UserType"].ToString();
                        imgLogo.Src = "../" + rw["PhotoURL"].ToString();
                        flag.Attributes.Add("Class", "flag " + rw["CountryID"].ToString());
                        lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                        Hiddencontractorid.Value = rw["ContractorID"].ToString();

                        lblWorkTitle.Text = rw["JobTitle"].ToString();
                        if (rw["Varified"].ToString() == "Yes")
                        {
                            mystory.InnerText = rw["Story"].ToString();
                            varified.Visible = true;
                        }
                        lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                        lblWorkTitle.Text = rw["JobTitle"].ToString();
                        lblLocation.Text = rw["Location"].ToString();
                        lblAddress.Text = rw["Address"].ToString();
                        lblCityCountry.Text = rw["City"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
                //  ccl.ShowError(ex);
            }
        }
    }
    protected void datalistShowJobs_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //if (e.CommandName == "Apply")
        //{
        //    //Button Button2b = (Button)e.Item.FindControl("Button2");
        //    HiddenField HF_JID = (HiddenField)e.Item.FindControl("HF_FJ_JID") as HiddenField;
        //    Response.Redirect("~/ProfileContractor/ApplyJob?JobID=" + HF_JID.Value, false);
        //}
    }
    private void myjobs()
    {
        // Active Jobs
        string query = "select JID ,JobTitle,Price,ProposalDate, Description,StartDate,ProfileHirer.HirerID,ProfileHirer.HirerName,ProfileHirer.HirerLastName,ContractorID,Budget from ContractJobView inner join ProfileHirer on ContractJobView.HirerID=ProfileHirer.HirerID where ContractorID='" + Convert.ToInt32(Session["ProfileID"]) + "' and Status='Proposal' order by Status, StartDate";
      SqlDataAdapter  ad = new SqlDataAdapter(query, con);
      DataTable  dt = new DataTable();
        ad.Fill(dt);
        listActiveJobs.DataSource = dt;
        listActiveJobs.DataBind();
    }
    protected void listAllJobs_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

    }
}