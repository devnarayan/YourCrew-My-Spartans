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

public partial class ProfileContractor_BusinessPlan : System.Web.UI.Page
{
    FileUploader fu; SqlCommand cmd;
    CommanClass ccl;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadprofile();
            selectMembership(HiddenContractorID.Value);
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("Update Login set Step='5' where UserName='" + Session["LoginUser"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("Update ProfileContractor set Membership='"+membership()+"' where UserName='" + Session["LoginUser"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            Connection.Close_Connection(con);
            cmd.Dispose();
            Response.Redirect("BusinessPlan.aspx");
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    }
    private string loadprofile()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            string contractorid = "0";
            try
            {
                ccl = new CommanClass();
                string loginid, usertyp;
                if (ccl.isLogedin() == true)
                {
                    usertyp = ccl.UserType();

                    if (usertyp == "Contractor")
                    {
                        loginid = Session["LoginUser"].ToString();
                    }
                    else
                    {
                        loginid = Session["LoginUser"].ToString();

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
                        HiddenContractorID.Value = rw["Membership"].ToString();
                        lblTitle.Text = HiddenContractorID.Value + " Contractor Account";

                    }
                }
                dt.Clear();
                dt.Dispose();
                ad.Dispose();
                cmd.Dispose();
                Connection.Close_Connection(con);
            }
            catch (Exception ex)
            {
                ex.ToString();
                //  ccl.ShowError(ex);
            }
            return contractorid;
        }
    }
    private string membership()
    {
        string name = "Free";
        if (rbtnSilver.Checked == true)
            name = "Silver";
        else if (rbtnGold.Checked == true)
            name = "Gold";
        else if (rbtnPlatinum.Checked == true)
            name = "Platinum";
        return name;
    }
    private void selectMembership(string membership)
    {
        if (membership == "Free")
            rbtnFree.Checked = true;
        else if (membership == "Silver")
            rbtnSilver.Checked = true;
        else if (membership == "Gold")
            rbtnGold.Checked = true;
        else if (membership == "Platinum")
            rbtnPlatinum.Checked = true;
    }
}