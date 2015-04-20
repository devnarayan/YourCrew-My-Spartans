using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using yourcrews;

public partial class ProfileContractor_SendMessage : System.Web.UI.Page
{
    SqlCommand cmd;
    Contractor cont = new Contractor();
    CommanClass ccl=new CommanClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            getJobTitle();
        }
    }
    private void getJobTitle()
    {
        try
        {
            string usertyp = "";
            if (ccl.isLogedin() == true)
            {
                //  string username = StringCyper.Decrypt(Request.QueryString["id"], "devnagar");
                usertyp = ccl.UserType();
                string id = Session["ProfileID"].ToString();
                int profileid = Convert.ToInt32(id);
                ddlJobTitle.DataSource = cont.GetJobTitle(profileid, usertyp);
                ddlJobTitle.DataTextField = "JobTitle";
                ddlJobTitle.DataValueField = "JobID";
                ddlJobTitle.DataBind();
                if (ddlJobTitle.Items.Count == 0)
                    btnSend.Enabled = false;
            }
            else
            {
                Response.Redirect("../Default.aspx");
            }
        }
        catch(Exception ex)
        {
            lblMessage.Text = "Error";
        }
    }
    protected void lbtnInbox_Click(object sender, EventArgs e)
    {
        Response.Redirect("Communication.aspx");
    }
    protected void lbtnSent_Click(object sender, EventArgs e)
    {
        Response.Redirect("Communication.aspx");
    }
    protected void btnNewMsg_Click(object sender, EventArgs e)
    {
        Response.Redirect("SendMessage.aspx");
    }
    protected void lbtnArchive_Click(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            PostMessage(Convert.ToInt32(ddlJobTitle.SelectedValue), Convert.ToInt32(Session["ProfileID"]));
        }
        catch(Exception ex)
        {
            lblMessage.Text="Please Provide valide information.";
        }
    }
    private void PostMessage(int jobid,int profileid)
    {
        using(SqlConnection con=new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            string filename = "";
            if (fuPhoto.PostedFile.ContentLength != 0)
            {
                string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief",".pdf",".doc" ,".xml",".docx",".txt"};
                FileUploader  fu = new FileUploader();
                filename = fu.Upload(fuPhoto, 1d, Session["LoginUser"].ToString() + "" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "../Upload/AttachmentChat/", extension);
            }
            string usertype=ccl.UserType();
            cmd = new SqlCommand("spChat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Mode", "Post");
            cmd.Parameters.AddWithValue("@JobID", jobid);
            cmd.Parameters.AddWithValue("@UserType", usertype);
            cmd.Parameters.AddWithValue("@SendFrom", profileid);
            cmd.Parameters.AddWithValue("@SendTo", profileid);
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text);
            cmd.Parameters.AddWithValue("@PhotoURL", filename);
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 500);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            Connection.Open_Connection(con);
            cmd.ExecuteNonQuery();
            Connection.Close_Connection(con);
            string msg = Convert.ToString(cmd.Parameters["@Msg"].Value);
            if (msg == "OK")
            {
                lblMessage.Text = "Message Posted.";
            }
            else lblMessage.Text = "Please Profide valide information.";
            cmd.Dispose();
        }
    }
}