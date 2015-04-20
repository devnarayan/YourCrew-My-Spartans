using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfileContractor_Communication : System.Web.UI.Page
{
    ChatService chat = new ChatService();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["id"].ToString() != "")
            {
                Message.Visible = true; lblMessage.Text = Request.QueryString["id"].ToString();
            }
            else
            {
                Message.Visible = false;
            }
        }
        catch(NullReferenceException ex)
        {
            Message.Visible = false;
        }
    }
    protected void lbtnInbox_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Chat/Communication.aspx");
    }
    protected void lbtnSent_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Chat/Communication.aspx");
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
}