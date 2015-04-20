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


public partial class ProfileContractor_EditExperience : System.Web.UI.Page
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
                    imgLogo.Src = "../" + rw["PhotoURL"].ToString();
                    flag.Attributes.Add("Class", "flag " + rw["CountryID"].ToString());
                    hiddenContractorId.Value = rw["ContractorID"].ToString();
                    lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                    lblWorkTitle.Text = rw["JobTitle"].ToString();

                    if (rw["Varified"].ToString() == "Yes")
                    {
                        mystory.InnerText = rw["Story"].ToString();
                        varified.Visible = true;
                    } lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                    lblWorkTitle.Text = rw["JobTitle"].ToString();
                    ddlCategory.Text = rw["CategoryID"].ToString();
                    txtContractor.Text = rw["ContractorNo"].ToString();
                    txtJobTitle.Text = rw["JobTitle"].ToString();
                   txtDescription.Text= rw["JobDescription"].ToString();
                    txtWebSite.Text = rw["WebSite"].ToString();
                    lblLocation.Text = rw["Location"].ToString();
                    lblAddress.Text = rw["Address"].ToString();
                    lblCityCountry.Text = rw["City"].ToString();
                }
            }
            dt.Clear();
            dt.Dispose();
            ad.Dispose();
            cmd.Dispose();

            loadexp();
            Connection.Close_Connection(con);
        }
        catch (Exception ex)
        {
            ex.ToString();
            //  ccl.ShowError(ex);
        }
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("spJobDescription", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@QueryType", SqlDbType.VarChar, 15).Value = "Update";
            cmd.Parameters.AddWithValue("@Website", txtWebSite.Text);
            cmd.Parameters.AddWithValue("@ContractorNo", txtContractor.Text);
            cmd.Parameters.Add("@JobTitle", SqlDbType.VarChar, 100).Value = txtJobTitle.Text;
            cmd.Parameters.Add("@JobDescription", SqlDbType.NVarChar, 500).Value =txtDescription.Text;
            cmd.Parameters.Add("@Logo", SqlDbType.VarChar, 50).Value = "";
            cmd.Parameters.Add("@Rate", SqlDbType.Money).Value = "0";
            cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 30).Value = Session["LoginUser"].ToString();
            cmd.Parameters.Add("@UserType", SqlDbType.VarChar, 15).Value = Session["UserType"].ToString();
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 255);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();
            string msg = cmd.Parameters["@Msg"].Value.ToString();
            if (msg == "OK")
            {
                lblMessage.Text = "Profile Updated.";
            }
            Connection.Close_Connection(con);
            cmd.Dispose();
        }
    }
    private void loadexp()
    {
        cmd = new SqlCommand("select Type, Value from Profile where ContractorID='" + Convert.ToInt32(hiddenContractorId.Value) + "'", con);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            var a = dt.AsEnumerable();
            var b = a.Where(d => d["Type"].ToString() == "Experties");
            DataTable ddd = b.CopyToDataTable();
            foreach (DataRow d in ddd.Rows)
            {
                TextBox t1 = new TextBox();
                t1.Attributes.Add("name", "skill");
                t1.Attributes.Add("type", "text");
                t1.Attributes.Add("value", d["Value"].ToString());
                divskill.Controls.Add(t1);
                //int i=d
            }

            //Category Description
            b = a.Where(d => d["Type"].ToString() == "Category");
           
            ddd = b.CopyToDataTable();
            foreach (DataRow d in ddd.Rows)
            {
                TextBox t1 = new TextBox();
                t1.Attributes.Add("name", "category");
                t1.Attributes.Add("type", "text");
                t1.Attributes.Add("value", d["Value"].ToString());
                divcategory.Controls.Add(t1);
                //int i=d
            }


            //Project
            b = a.Where(d => d["Type"].ToString() == "Project");
            if(b!=null)
                
            ddd = b.CopyToDataTable();
            foreach (DataRow d in ddd.Rows)
            {
                TextBox t1 = new TextBox();
                t1.Attributes.Add("name", "project");
                t1.Attributes.Add("type", "text");
                t1.Attributes.Add("value", d["Value"].ToString());
                divproject.Controls.Add(t1);
                //int i=d
            }

            // Clients
            b = a.Where(d => d["Type"].ToString() == "Client");
            ddd = b.CopyToDataTable();
            foreach (DataRow d in ddd.Rows)
            {
                TextBox t1 = new TextBox();
                t1.Attributes.Add("name", "client");
                t1.Attributes.Add("type", "text");
                t1.Attributes.Add("value", d["Value"].ToString());
                divclient.Controls.Add(t1);
                //int i=d
            }
        }
    }

    // Save Skill property in Project Table
    private void saveprofile()
    {
        string profile = Request.Form["Skill"];
        string[] profiles ;
        if (profile != null)
        {
            profiles = profile.Split(',');
            foreach (string s in profiles)
            {
                saveSkills("Experties", s, Convert.ToInt32(hiddenContractorId.Value));
            }
        }

        profile = Request.Form["category"];
        if (profile != null)
        {
            profiles = profile.Split(',');
            foreach (string s in profiles)
            {
                saveSkills("Category", s, Convert.ToInt32(hiddenContractorId.Value));
            }
        }

        profile = Request.Form["project"];
        if (profile != null)
        {
            profiles = profile.Split(',');
            foreach (string s in profiles)
            {
                saveSkills("Project", s, Convert.ToInt32(hiddenContractorId.Value));
            }
        }

        profile = Request.Form["client"];
        if (profile != null)
        {
            profiles = profile.Split(',');
            foreach (string s in profiles)
            {
                saveSkills("Client", s, Convert.ToInt32(hiddenContractorId.Value));
            }
        }

    }
    private void saveSkills(string type, string value, int contractorid)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("spSkillAdd", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Type", type);
            cmd.Parameters.AddWithValue("@Value", value);
            cmd.Parameters.AddWithValue("@ContractorID", contractorid);
            cmd.ExecuteNonQuery();
            Connection.Close_Connection(con);
        }
    }
    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        saveprofile();
        loadexp();
    }
}