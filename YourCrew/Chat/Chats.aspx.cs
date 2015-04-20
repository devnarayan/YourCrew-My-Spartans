using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Chat_Chats : System.Web.UI.Page
{
    ChatService chat = new ChatService();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            chattitle();
        }
        chatMessage();
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
            string id = Request.QueryString["id"].ToString();
            lblMessage.Text = chat.PostMessage(Convert.ToInt32(id), Convert.ToInt32(Session["ProfileID"]), txtMessage.Text, filename);
            chatMessage();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Please Provide valide information.";
        }
    }
    private void chattitle()
    {
        DataRow row;
        string usertype=chat.UserType();
        string id=Request.QueryString["id"].ToString();
        row = chat.ChatTitle(Convert.ToInt32(Session["ProfileID"]), usertype, Convert.ToInt32(id));
        pics.Src ="../"+ row["PhotoURL"].ToString();
        lblName.Text = row["Name"].ToString();
        lblJobTitle.Text = row["JobTitle"].ToString();
    }

    private void chatMessage()
    {
        DataTable dt=new DataTable();
        CommanClass ccl = new CommanClass();
        string usertype=ccl.UserType();
        string id=Request.QueryString["id"].ToString();
        dt = chat.ChatMessages(Convert.ToInt32(Session["ProfileID"]), usertype, Convert.ToInt32(id));
        repeater2.DataSource=dt;
        repeater2.DataBind();
    }
}