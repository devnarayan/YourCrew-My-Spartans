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


public partial class ProfileContractor_ContractorComments : System.Web.UI.Page
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
                    loadprofile();
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
                string username = StringCyper.Decrypt(Request.QueryString["id"], "devnagar");
                usertyp = Session["UserType"].ToString();
                if (Session["LoginUser"].ToString() != username)
                {
                    // enable edit
                    loginid = Session["LoginUser"].ToString();
                }
                else
                {
                    loginid = username;
                }
                // uncomment to use project gridview

                Connection.Open_Connection(con);
                cmd = new SqlCommand("spContractorGetProfile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 30).Value = loginid;
                cmd.Parameters.Add("@UserType", SqlDbType.VarChar, 15).Value = usertyp;
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
                            lblDescription.Text = rw["JobDescription"].ToString();
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
}