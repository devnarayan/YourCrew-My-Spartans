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
using System.Web.Handlers;
using System.Web.Services;
public partial class ProfileContractor_EditPhoto : System.Web.UI.Page
{
    Contractor ccl = new Contractor();
    SqlCommand cmd;
    FileUploader fu;
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
        return ccl.GetSlider(HiddenContractorID.Value);
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
                        imgLogo.Src = "../" + rw["PhotoURL"].ToString();
                        flag.Attributes.Add("Class", "flag " + rw["CountryID"].ToString());

                        lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                        lblWorkTitle.Text = rw["JobTitle"].ToString();
                        HiddenContractorID.Value = rw["ContractorID"].ToString();
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
    public List<string> getphoto()
    {
        return ccl.GetPics(HiddenContractorID.Value);
    }
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string filename = "";
        if (fuPics.PostedFile.ContentLength != 0)
        {
            string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief" };
            fu = new FileUploader();
            filename = fu.Upload(fuPics, 1d, Session["LoginUser"].ToString() + "" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "UploadPics/"+HiddenContractorID.Value+"/", extension);
        }
    }
}