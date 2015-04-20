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


public partial class ProfileContractor_EditVideo : System.Web.UI.Page
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
                    loadMedia();
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
                        HiddenContractorID.Value = rw["ContractorID"].ToString();
                        lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
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
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("spSkillAdd", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Type", "Video");
            string teg =txtvideo.Text.ToString().Replace("<","&lt;");
            cmd.Parameters.AddWithValue("@Value", txtvideo.Text.ToString().Replace("<", "&lt;").Replace(">", "&gt;"));
            cmd.Parameters.AddWithValue("@ContractorID",Convert.ToInt32(HiddenContractorID.Value));
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("spSkillAdd", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Type", "VideoLink");
            cmd.Parameters.AddWithValue("@Value", txtVideo1.Text);
            cmd.Parameters.AddWithValue("@ContractorID", Convert.ToInt32(HiddenContractorID.Value));
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("spSkillAdd", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Type", "VideoLink");
            cmd.Parameters.AddWithValue("@Value", txtVideo2.Text);
            cmd.Parameters.AddWithValue("@ContractorID", Convert.ToInt32(HiddenContractorID.Value));
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("spSkillAdd", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Type", "VideoLink");
            cmd.Parameters.AddWithValue("@Value", txtVideo3.Text);
            cmd.Parameters.AddWithValue("@ContractorID", Convert.ToInt32(HiddenContractorID.Value));
            cmd.ExecuteNonQuery();

            Connection.Close_Connection(con);
        }
    }
    private void loadMedia()
    {
        using(SqlConnection con=new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("select Value from Profile where ContractorID='" + Convert.ToInt32(HiddenContractorID.Value) + "' and Type='Video'", con);
            string v = Convert.ToString(cmd.ExecuteScalar());
            divVideo.InnerHtml = v.ToString();
            txtvideo.Text = v.ToString();
           SqlDataAdapter ad=new SqlDataAdapter("select Value from Profile where ContractorID='" + Convert.ToInt32(HiddenContractorID.Value) + "' and Type='VideoLink'", con);
           DataTable dt = new DataTable();
           ad.Fill(dt);
            if(dt.Rows.Count>0)
            {
                if (dt.Rows.Count >= 1)
                {
                    txtVideo1.Text = dt.Rows[0]["Value"].ToString();
                }
                if(dt.Rows.Count>=2)
                {
                    txtVideo2.Text = dt.Rows[1]["Value"].ToString();
                }
                if(dt.Rows.Count>=3)
                {
                    txtVideo3.Text = dt.Rows[2]["Value"].ToString();
                }
               if(dt.Rows.Count>=4)
                {
                    txtVideo4.Text = dt.Rows[3]["Value"].ToString();
                }
            }
            divVideo.InnerHtml = v.ToString();
            Connection.Close_Connection(con);
        }
    }
}