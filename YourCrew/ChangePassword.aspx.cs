using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using yourcrews;
using System.Net.Mail;


public partial class ChangePassword : System.Web.UI.Page
{
    SqlCommand cmd; CommanClass ccl = new CommanClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
            {
                if (Request.QueryString.HasKeys())
                {
                    Connection.Open_Connection(con);
                    cmd = new SqlCommand("select UserName from Login where Answer='" + Request.QueryString["gid"] + "' ", con);
                    string status = Convert.ToString(cmd.ExecuteScalar());
                    if (status == "")
                    {
                        lblMessage.Text = "This Activation link is expired or invalide.";
                    }
                    else
                    {
                        txtUserName.Text = status;
                        txtOldPassword.Text = status;
                    }
                }
                else
                {
                   if(ccl.isLogedin()==false)
                   {
                       Response.Redirect("Default.aspx");
                   }
                }
            }
        }
    }
    protected void btnSend_Click(object sender, System.EventArgs e)
    {
        using(SqlConnection con=new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
        try
        {
            cmd=new SqlCommand("spRecoverPassword",con);
            Connection.Open_Connection(con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Password",txtNewPassword.Text);
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 500);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            lblMessage.Text = Convert.ToString(cmd.Parameters["@Msg"].Value);
        }
        catch(Exception ex)
        {
            lblMessage.Text = ex.ToString();
        }
        }
    }
}