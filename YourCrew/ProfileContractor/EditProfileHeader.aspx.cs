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


public partial class ProfileContractor_EditProfileHeader : System.Web.UI.Page
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
                    HiddenContractorID.Value = rw["ContractorID"].ToString();
                    if (usertype == "Hirer")
                    {
                        lblUsername.Text = rw["HirerName"].ToString() + " " + rw["HirerLastName"].ToString();
                    }
                    else if (usertype == "Contractor")
                    {
                        lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                        lblWorkTitle.Text = rw["JobTitle"].ToString();
                       // lblDescription.Text = rw["JobDescription"].ToString();
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
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string filename = "";
        if (fuslide.PostedFile.ContentLength != 0)
        {
            string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief" };
            fu = new FileUploader();
            filename = fu.Upload(fuslide, 1d, Session["LoginUser"].ToString() + "" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "UploadSlider/" + HiddenContractorID.Value + "/", extension);
        }
    }
}