using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using yourcrews;
using System.Configuration;
public partial class ProfileHirer_ConversationHirer : System.Web.UI.Page
{
    FileUploader fu=new FileUploader();
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    static DataTable dt;
   
  static  string Loginuser, Usertype;
    protected void Page_Load(object sender, EventArgs e)
    {
        Loginuser = Session["LoginUser"].ToString();
       Usertype = Session["UserType"].ToString();
        if (!IsPostBack)
        {
            DLConversion.DataSource = null;
            DLConversion.DataBind();
            BindContractorList();
          
        }

    }
    public void BindConversation()
    {
        if (Session["UserType"].ToString() != null)
        {

            Connection.Open_Connection(con);
            cmd = new SqlCommand("spGetConversation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Usertype == "Hirer")
            {
                cmd.Parameters.Add("@ContractorUserName", SqlDbType.VarChar, 50).Value = lblContractorUserName.Text;
                cmd.Parameters.Add("@HirerUserName", SqlDbType.VarChar, 50).Value =Loginuser;
            }
            else if (Usertype == "Contractor")
            {
                cmd.Parameters.Add("@ContractorUserName", SqlDbType.VarChar, 50).Value = Loginuser;
                cmd.Parameters.Add("@HirerUserName", SqlDbType.VarChar, 50).Value = lblContractorUserName.Text;
            }
            cmd.Parameters.Add("@Message", SqlDbType.VarChar, 255).Value = txtReplayMsg.Value;
            cmd.Parameters.Add("@SendBy", SqlDbType.VarChar, 50).Value = Loginuser;
            
            cmd.Parameters.Add("@UserType", SqlDbType.VarChar, 50).Value = Usertype;
            dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DLConversion.DataSource = dt;
            DLConversion.DataBind();
            con.Close();
            Connection.Close_Connection(con);
        }

        
    }
   
   public void BindContractorList()
    {
        if (Session["UserType"].ToString()!=null)
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("GetUserNameForConversation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserType", SqlDbType.NVarChar, 30).Value = Session["UserType"].ToString();
            DataTable dtCl = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dtCl);
            DLContractorList.DataSource = dtCl;
            DLContractorList.DataBind();
        }
    
    }
   protected void BtnSend_Click(object sender, EventArgs e)
   {
       if (Session["UserType"] != null)
       {
           string filename = "";
           if (FUAttachment.PostedFile.ContentLength != 0)
           {
               string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief", ".pdf", ".doc", ".xls", ".docx", ".xlsx", ".txt" };
               fu = new FileUploader();
               filename = fu.Upload(FUAttachment, 1d, Session["LoginUser"].ToString() + "AttachForApplyJob" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "~/Upload/Attachment/", extension);
           }


           
           Connection.Open_Connection(con);
           cmd = new SqlCommand("spInsertConversation", con);
           cmd.CommandType = CommandType.StoredProcedure;
           if (Usertype == "Hirer")
           {
               cmd.Parameters.Add("@ContractorUserName", SqlDbType.VarChar, 50).Value = lblContractorUserName.Text;
               cmd.Parameters.Add("@HirerUserName", SqlDbType.VarChar, 50).Value = Loginuser;
           }
           else if (Usertype == "Contractor")
           {
               cmd.Parameters.Add("@ContractorUserName", SqlDbType.VarChar, 50).Value = Loginuser;
               cmd.Parameters.Add("@HirerUserName", SqlDbType.VarChar, 50).Value = lblContractorUserName.Text;
           }
           //cmd.Parameters.Add("@ContractorUserName", SqlDbType.VarChar, 50).Value = lblContractorUserName.Text;
           //cmd.Parameters.Add("@HirerUserName", SqlDbType.VarChar, 50).Value = Session["LoginUser"].ToString();
           cmd.Parameters.Add("@Message", SqlDbType.VarChar, 255).Value = txtReplayMsg.Value;
           cmd.Parameters.Add("@SendBy", SqlDbType.VarChar, 50).Value = Loginuser;
           cmd.Parameters.Add("@Attachment", SqlDbType.VarChar, 100).Value = filename;
           cmd.Parameters.Add("@UserType", SqlDbType.VarChar, 50).Value = Usertype;
           cmd.ExecuteNonQuery();
           BindConversation();
       }
   }
   protected void DLContractorList_ItemCommand(object source, DataListCommandEventArgs e)
   {
       if (e.CommandName.Equals("ContractorUserName"))
       {
           lblContractorUserName.Text = Convert.ToString(DLContractorList.DataKeys[e.Item.ItemIndex].ToString());
           BindConversation();
       }  
   }

   //protected void Timer1_Tick(object sender, EventArgs e)
   //{
   //    BindConversation();
   //}
   protected void DLConversion_ItemCommand(object source, DataListCommandEventArgs e)
   {
       if (e.CommandName.Equals("Download"))
       {
          
       }  
   }
   protected void DLConversion_ItemDataBound(object sender, DataListItemEventArgs e)
   {
       
       for (int i = 0; i < dt.Rows.Count; i++)
       {
           HyperLink H1 = (HyperLink)e.Item.FindControl("HLDownload") as HyperLink;
           if (H1.NavigateUrl == "")
           {
               H1.Visible = false;

           }
           else
           {
               H1.Visible = true;
           }
         
       }
   }
   protected void DLConversion_ItemCreated(object sender, DataListItemEventArgs e)
   {
       
       
     
   }
}