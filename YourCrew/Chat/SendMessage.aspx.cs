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

public partial class Chat_SendMessage : System.Web.UI.Page
{
    SqlCommand cmd;
    Contractor cont = new Contractor();
    CommanClass ccl = new CommanClass();
    ChatService chat = new ChatService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
        catch (Exception ex)
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
            string filename = "";
            if (fuPhoto.PostedFile.ContentLength != 0)
            {
                string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief", ".pdf", ".doc", ".xml", ".docx", ".txt" };
                FileUploader fu = new FileUploader();
                filename = fu.Upload(fuPhoto, 1d, Session["LoginUser"].ToString() + "" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "../Upload/AttachmentChat/", extension);
            }
          lblMessage.Text= chat.PostMessage(Convert.ToInt32(ddlJobTitle.SelectedValue), Convert.ToInt32(Session["ProfileID"]),txtMessage.Text,filename);
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Please Provide valide information.";
        }
    }
   
}