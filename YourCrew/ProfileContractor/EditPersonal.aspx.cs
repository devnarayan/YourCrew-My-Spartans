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


public partial class ProfileContractor_EditPersonal : System.Web.UI.Page
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
        return ccl.GetSlider(hiddenContractorId.Value);
    }
    private void loadprofile()
    {
        try
        {
           string loginid, usertyp;
            if (ccl.isLogedin() == true)
            {
                string username = StringCyper.Decrypt(Request.QueryString["id"], "devnagar");
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
                loginid = StringCyper.Decrypt(Request.QueryString["id"], "devnagar");
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
                    imgLogo.Src = "../"+rw["PhotoURL"].ToString();
                    flag.Attributes.Add("Class", "flag " + rw["CountryID"].ToString());

                    lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                    lblWorkTitle.Text = rw["JobTitle"].ToString();
                    hiddenContractorId.Value = rw["ContractorID"].ToString();
                    if (rw["Varified"].ToString() == "Yes")
                    {
                        mystory.InnerText = rw["Story"].ToString();
                        varified.Visible = true;
                    }
                        lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                        lblWorkTitle.Text = rw["JobTitle"].ToString();
                      txtFirstName.Text= rw["FirstName"].ToString();
                      txtLastName.Text= rw["LastName"].ToString();
                       txtEmail.Text= rw["EmailID"].ToString();
                      txtMobile.Text= rw["Mobile"].ToString();
                        txtAddress.Text = rw["Address"].ToString();
                        ddlCountry.SelectedValue = rw["CountryID"].ToString();
                        txtCity.Text = rw["City"].ToString();
                        txtLocation.Text = rw["Location"].ToString();
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

    protected void btnSAve_Click(object sender, EventArgs e)
    {
        using(SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("spRegister", con);
           cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@QueryType", SqlDbType.VarChar, 10).Value = "Update";
            cmd.Parameters.Add("@RegisterType", SqlDbType.VarChar, 15).Value ="Contractor";
            cmd.Parameters.Add("@CategoryName", SqlDbType.VarChar, 20).Value = "";
            cmd.Parameters.Add("@Firstname", SqlDbType.VarChar, 50).Value = txtFirstName.Text;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = txtLastName.Text;
            cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 15).Value =Session["LoginUser"].ToString();
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 30).Value = "";
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = txtEmail.Text;
            cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 50).Value =txtAddress.Text;
            cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value =txtCity.Text;
            cmd.Parameters.Add("@Location", SqlDbType.VarChar, 20).Value = txtLocation.Text;
            cmd.Parameters.Add("@Mobile", SqlDbType.VarChar, 20).Value = txtMobile.Text;
            cmd.Parameters.Add("@CountryID", SqlDbType.VarChar, 5).Value = ddlCountry.SelectedValue;
            cmd.Parameters.AddWithValue("@PhotoURL", "");
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 255);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@ProfileID", SqlDbType.Int);
            cmd.Parameters["@ProfileID"].Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();
            Connection.Close_Connection(con);
            int profileid;
            string msg = cmd.Parameters["@Msg"].Value.ToString();
            profileid = Convert.ToInt32(cmd.Parameters["@ProfileID"].Value.ToString());
            if (msg == "OK")
            {
                lblMessage.Text = "Profile Updated.";
            }
            cmd.Dispose();
        }
    }
}