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

public partial class Portfolio : System.Web.UI.Page
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
                loadprofile();
                //Session["errorMsg"] = "Please Login or Signup your profile.";
                //Response.Redirect("Default.aspx");
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    private void loadprofile()
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
                    lbtnUpgrade.Visible = true;
                    btnMessage.Visible = true;
                    lbtnEmail.Visible = true;
                    notifymessage.Visible = true;
                }
                else if (usertyp == "Contractor")
                {
                    loginid = Session["LoginUser"].ToString();

                    lbtnUpgrade.Visible = true;
                    btnMessage.Visible = true;
                    lbtnEmail.Visible = true;
                    notifymessage.Visible = true;
                }
                else
                {
                    // Hirer
                    loginid = username;

                    if (loginid == "")
                    {
                        Response.Redirect("../ProfileHirer/ProfileHirer.aspx");
                    }
                    btnInvite.Visible = true;
                    lbtnEmail.Visible = true;
                }
            }
            else
            {
             //   loginid = StringCyper.Decrypt(Request.QueryString["id"], "devnagar");
                loginid = Request.QueryString["id"];
                if (loginid == "" || loginid==null)
                {
                    Response.Redirect("Default.aspx");
                }
                usertyp = "Contractor";
                // Visotor
            }
            // uncomment to use project gridview
            Hiddencontractorid.Value = loginid.ToString();

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
                    imgLogo.Src = rw["PhotoURL"].ToString();
                    flag.Attributes.Add("Class", "flag " + rw["CountryID"].ToString());

                    lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                    lblWorkTitle.Text = rw["JobTitle"].ToString();
                    lblDescription.Text = rw["JobDescription"].ToString();
                    HiddenField1.Value = rw["ContractorID"].ToString();
                    lblLocation.Text = rw["Location"].ToString();
                    lblAddress.Text = rw["Address"].ToString();
                    lblCityCountry.Text = rw["City"].ToString();
                    website.HRef = rw["Website"].ToString();
                    if (rw["Varified"].ToString() == "Yes")
                    {
                        mystory.InnerText = rw["Story"].ToString();
                        varified.Visible = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
            //  ccl.ShowError(ex);
        }
    }
    public List<string> getslider()
    {
        return ccl.GetSlider(HiddenField1.Value);
    }
    protected void btnEditJobTitle_Click(object sender, EventArgs e)
    {
        Application["Profile"] = "Edit";
    }
}