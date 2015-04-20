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

public partial class ActivationConfirm : System.Web.UI.Page
{
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            using(SqlConnection con=new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
            {
                Connection.Open_Connection(con);
                cmd = new SqlCommand("select Answer from Login where Answer='" + Request.QueryString["gid"] + "'", con);
                string status = Convert.ToString(cmd.ExecuteScalar());
                if(status=="")
                {
                    lblMessage.Text = "This Activation link is expired or invalide.";
                }
                else
                {
                    cmd = new SqlCommand("Update Login set Step='1' where Answer='" + Request.QueryString["gid"] + "'", con);
                    cmd.ExecuteNonQuery();
                    Session["RegStep"] = "1";
                    Connection.Close_Connection(con);
                    Response.Redirect("ContractorRegister.aspx");
                }
            }
        }
    }
}