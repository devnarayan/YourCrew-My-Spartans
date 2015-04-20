using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using yourcrews;
using System.Net.Mail;
using System.Web.Services;
using System.Web.Script;


public partial class MasterPage : System.Web.UI.MasterPage
{

    SqlCommand cmd;
    CommanClass ccl = new CommanClass();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ddlCategory.Items.Add(new System.Web.UI.WebControls.ListItem("All", ""));
                if (Session["errorMsg"] != null)
                {
                  //  Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('" + Session["errorMsg"].ToString() + "')", true);
                    Session["errorMsg"] = null;
                }

                if (ccl.isLogedin() == true)
                {
                        lbtnUserName.Text = Session["LoginUser"].ToString();
                    divUser.Visible = true;
                    if (ccl.UserType() == "Contractor")
                    {
                        divVisitor.Visible = false;
                        lbtnUserName.PostBackUrl = "Portfolio.aspx";
                        lbtnSettings.PostBackUrl = "ProfileContractor/EditExperience.aspx";
                        lbtnApplyJob.Visible = true;
                    }
                    else {
                        divVisitor.Visible = false;
                        lbtnUserName.PostBackUrl = "ProfileHirer/ProfileHirer.aspx";
                        lbtnSettings.Visible = false;
                        lbtnPostJob.Visible = true; lbtnFindCrew.Visible = true; }
                }
                else { divVisitor.Visible = true; }
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            try
            {
                // localhost.MyService d = new localhost.MyService();
                // d.Emailme();
                Connection.Open_Connection(con);
                cmd = new SqlCommand("LoginSp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Type", SqlDbType.VarChar, 10).Value = "Login";
                cmd.Parameters.Add("@UserName", SqlDbType.VarChar, 30).Value = txtUserName.Value;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 30).Value = txtPassword.Value;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = "";
                cmd.Parameters.Add("@Msg", SqlDbType.VarChar, 255);
                cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@UserType", SqlDbType.VarChar, 20);
                cmd.Parameters["@UserType"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                if (Convert.ToString(cmd.Parameters["@Msg"].Value) == "OK")
                {
                    string[] a = cmd.Parameters["@UserType"].Value.ToString().Split(':');
                    Session["UserType"] = a[0].ToString();
                    Session["LoginUser"] = txtUserName.Value; Session["ProfileID"] = a[1];
                    Session["RegStep"] = a[2].ToString();
                    LoginService l = new LoginService();
                   // LoginRed(Convert.ToInt32(a[2]));
                   l.LoginRed(Convert.ToInt32(a[2]), a[0]);
                    //Response.Redirect(System.Web.HttpContext.Current.Request.Url.AbsoluteUri.ToString());
                    // ccl.redirect();
                }
                else
                {
                    lblSignInError.Text = "Invalide username and password.";
                    lblSignInError.ForeColor = System.Drawing.Color.Red;
                    Response.Write("<script> alert('Invalide Username or Password.')");
                    Response.Write("</script>");
                   // ccl.redirect();
                }
            }
            catch (Exception ex)
            {
                ccl.ShowError(ex);
            }
            finally
            {
                Connection.Close_Connection(con);
            }
        }
    }

    protected void btnForgetPassword_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            try
            {
                Connection.Open_Connection(con);
                cmd = new SqlCommand("LoginSp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Type", SqlDbType.VarChar, 10).Value = "Forget";
                cmd.Parameters.Add("@UserName", SqlDbType.VarChar, 30).Value = "";
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 30).Value = "";
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = txtForgetEmail.Value;
                cmd.Parameters.Add("@Msg", SqlDbType.VarChar, 255);
                cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@UserType", SqlDbType.VarChar, 15);
                cmd.Parameters["@UserType"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                if (Convert.ToString(cmd.Parameters["@Msg"].Value) == "OK")
                {
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    ad.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow rw = dt.Rows[0];
                        string username = rw["UserName"].ToString();
                        string password = rw["Password"].ToString();
                        MailMessage mail = new MailMessage();
                        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                        mail.From = new MailAddress("devnarayan.nagar@gmail.com");
                        mail.To.Add(txtForgetEmail.Value);
                        mail.Subject = "Your Crew's Password Recovery";
                        mail.IsBodyHtml = true;
                        mail.Body = "<html><body><h1> Wel come to Your Crew's  .</p><br /> your User Name: " + username + " <br><p>  Password:  " + password + "</p><br /><br /><b>Follo the link to Logiin </b><br /><br /> <a href=www.cse08.com/login.aspx >Click Here !(Login)</a><br/><br/><br/><p><BR><br><br /></body></html>";
                        SmtpServer.Port = 587;
                        SmtpServer.Credentials = new System.Net.NetworkCredential("devnarayan.nagar@gmail.com", "HelloWorld");
                        SmtpServer.EnableSsl = true;
                        SmtpServer.Send(mail);
                    }
                }
            }
            catch (Exception ex)
            {
                ccl.ShowError(ex);
            }
            finally
            {
                Connection.Close_Connection(con);
            }
        }
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void ibtnSearch_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        Response.Redirect("~/ContractorSearch?cid=" + ddlCategory.SelectedValue+"&s=zip");
    }
    protected void btnMyJobs_Click(object sender, EventArgs e)
    {
        if (ccl.UserType() == "Contractor")
        {
            Response.Redirect("ProfileContractor/MyJobs.aspx");
        }
        else
        {
            Response.Redirect("ProfileHirer/ActiveProject.aspx");
        }
    }
}