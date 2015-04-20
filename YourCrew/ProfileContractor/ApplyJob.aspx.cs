using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yourcrews;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Configuration;
public partial class ProfileContractor_ApplyJob : System.Web.UI.Page
{
    FileUploader fu = new FileUploader();
    DateTimeFormatInfo dtinfo = new DateTimeFormatInfo();
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    CommanClass ccl = new CommanClass();
    static string AttachfileUrl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["JobID"] != null)
            {
                string Jid = Request.QueryString["JobID"].ToString();
               
                FillControl();
            }
            else
            {
                Response.Redirect("~/ProfileContractor/FindJob.aspx");
            }
        }
    }
    public void FillControl()
    {
        Connection.Open_Connection(con);
        cmd = new SqlCommand("GetApplyJobData", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@JID", SqlDbType.Int).Value = Request.QueryString["JobID"].ToString();

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblJobTitle.Text = dr["JobTitle"].ToString();
            lblDesc.Text = dr["Description"].ToString();
            lblHours.Text = dr["Hours"].ToString();
            lblExpDate.Text = dr["PostDate"].ToString();
            lblBudget.Text = dr["Budget"].ToString();
            AttachfileUrl = dr["Attachment"].ToString();
            lblFName.Text = dr["HirerName"].ToString();
            lblLName.Text = dr["HirerLastName"].ToString();
            lblPostedDate.Text = dr["PostDate"].ToString();
            lblCity.Text = dr["City"].ToString();
           attachment.HRef= dr["PhotoURL"].ToString();
           if (attachment.HRef != "") attachment.Name = "Attachment";
        }
        dr.Close();
        Connection.Close_Connection(con);

    }
    protected void btnApply_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            try
            {
                if (Session["ProfileID"] != null)
                {
                    string filename = "";
                    if (FU_ApplyJob_AttachFile.PostedFile.ContentLength != 0)
                    {
                        string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief", ".pdf", ".doc", ".xls", ".docx", ".xlsx", ".txt" };
                        fu = new FileUploader();
                        filename = fu.Upload(FU_ApplyJob_AttachFile, 1d, Session["LoginUser"].ToString() + "AttachForApplyJob" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "../Upload/Attachment/", extension);
                    }
                    DateTime ReqDatedt = DateTime.Parse(lblPostedDate.Text);

                    string UserName = Session["ProfileID"].ToString();
                    dtinfo.ShortDatePattern = "dd/MM/yyyy";
                    dtinfo.DateSeparator = "/";
                    Connection.Open_Connection(con);
                    cmd = new SqlCommand("spApplyJob", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ContractorID", SqlDbType.VarChar, 50).Value = Convert.ToInt32(UserName.ToString());
                    cmd.Parameters.Add("@JID", SqlDbType.Int).Value = Request.QueryString["JobID"].ToString();
                    cmd.Parameters.Add("@Message", SqlDbType.NVarChar, 255).Value = txtRepaly.InnerHtml;
                    cmd.Parameters.Add("@RequestDate", SqlDbType.DateTime).Value = Convert.ToDateTime(ReqDatedt, dtinfo);
                    cmd.Parameters.Add("@Attachment", SqlDbType.VarChar, 100).Value = filename;
                    cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 500);
                    cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    Connection.Close_Connection(con);
                    if(cmd.Parameters["@Msg"].Value.ToString().Trim()=="OK")
                    {
                        con.Dispose(); cmd.Dispose();
                        Dispose();
                        Response.Write("<script>alert('Contract Successfully Submitted.'); </script>");
                        Response.Redirect("~/ProfileContractor/FindJob.aspx", false);
                    }
                    {

                    }
                    cmd.Dispose();
                }
            }
            catch (Exception ex)
            {
                ccl.ShowError(ex);
            }
        }
    }
    protected void lbDownload_Click(object sender, EventArgs e)
    {
        if (AttachfileUrl != null)
        {
            string strURL = AttachfileUrl;
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + Server.MapPath(strURL) + "\"");
            byte[] data = req.DownloadData(Server.MapPath(strURL));
            response.BinaryWrite(data);
            response.End();
        }
    }

  
}