using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class Chat_Communication : System.Web.UI.Page
{
    ChatService chat = new ChatService();
    CommanClass ccl = new CommanClass();
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void btnSend_Click(object sender, EventArgs e)
    {

    }
    protected void lbtnArchive_Click(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public DataTable MyMessages()
    {
        string userstype=ccl.UserType();
        string id=Session["ProfileID"].ToString();
       return chat.MyMessages(Convert.ToInt32(id), userstype);
    }
}