using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using yourcrews;
using System.Data.SqlClient;
public partial class ProfileHirer_MyJob : System.Web.UI.Page
{
    CommanClass ccl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ccl = new CommanClass();
            if (ccl.isLogedin())
            {
                Hiddencontractorid.Value = Session["ProfileID"].ToString();
                fillJob();
            }
            else
            {
                Response.Redirect("../Login");
            }
        }
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "JobTitle")
        {

        }
    }
    private void fillJob()
    {
        using(SqlConnection con=new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            SqlCommand cmd = new SqlCommand("select * from Jobs where JID='" + Request.QueryString["jid"] + "'", con);
            SqlDataReader reader;
            Connection.Open_Connection(con);
            reader = cmd.ExecuteReader();
            if(reader.Read())
            {
                lblJobTitle.Text = reader["JobTitle"].ToString();
                lbldescription.Text=reader["Description"].ToString();
                lblStatus.Text = reader["Status"].ToString();
                if(lbldescription.Text.Length>50)
                {
                    lbldescription.Text = lbldescription.Text.Substring(0, 50) + "...";
                }
            }
            reader.Close();
            reader.Dispose();
            cmd.Dispose();
            Connection.Close_Connection(con);
        }
    }
}