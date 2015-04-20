using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using yourcrews;

public partial class Sql : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnExecute_Click(object sender, EventArgs e)
    {
       
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CrewsdbConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(txtQry.Text.ToString(), con);
                Connection.Open_Connection(con);
                cmd.ExecuteNonQuery();
                Connection.Close_Connection(con);
                lblMessage.Text = "Query Successfully Executed.";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.ToString();
        }

    }
}