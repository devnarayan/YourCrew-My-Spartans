using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using yourcrews;
using System.Globalization;
using System.Configuration;
public partial class ProfileHirer_PostJob : System.Web.UI.Page
{
    FileUploader fu;
    DateTimeFormatInfo dtinfo = new DateTimeFormatInfo();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    SqlCommand cmd;
    CommanClass ccl;
    SqlDataReader dr;
    LoadControl LC = new LoadControl();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCetegory();
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CrewsdbConnectionString"].ConnectionString))
        {
            ccl = new CommanClass();
            try
            {

                string filename = "";
                if (FU_PJ_Attachment.PostedFile.ContentLength != 0)
                {
                    string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief", ".pdf", ".doc", ".xls", ".docx", ".xlsx", ".txt" };
                    fu = new FileUploader();
                    filename = fu.Upload(FU_PJ_Attachment, 1d, Session["LoginUser"].ToString() + "Attach" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "../Upload/AttachmentJob/", extension);
                }
                if (!string.IsNullOrEmpty(Session["ProfileID"].ToString()))
                {
                    string UserName = Session["ProfileID"].ToString();
                    dtinfo.ShortDatePattern = "dd/MM/yyyy";
                    dtinfo.DateSeparator = "/";
                    Connection.Open_Connection(con);
                    cmd = new SqlCommand("spPostJob", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ProfileID", SqlDbType.Int).Value = Convert.ToInt32(UserName);
                    cmd.Parameters.Add("@JobTitle", SqlDbType.VarChar, 20).Value = txtTitleofWork.Text.ToString();
                    cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = txtDescription.Text.ToString();
                    cmd.Parameters.Add("@Hours", SqlDbType.Decimal).Value = Convert.ToInt32(txtHours.Text.ToString());
                    cmd.Parameters.Add("@Budget", SqlDbType.Money).Value = txtAmount.Text.ToString();
                    cmd.Parameters.Add("@ExpDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txtDate.Text, dtinfo);
                    cmd.Parameters.Add("@CategoryName", SqlDbType.VarChar, 20).Value = ddlCategory.SelectedItem.Text;
                    cmd.Parameters.Add("@Attachment", SqlDbType.VarChar, 100).Value = filename;
                    cmd.Parameters.Add("@Msg", SqlDbType.VarChar, 500);
                    cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();
                    if (Convert.ToString(cmd.Parameters["@Msg"].Value) == "OK")
                    {
                        txtTitleofWork.Text = txtHours.Text = txtDescription.Text = txtAmount.Text = txtDate.Text = "";
                        lblError.Text = "Your Job successfully posted.";
                    }
                }
            }
            catch (Exception ex)
            {
                ccl.ShowError(ex);
            }
        }
    }

    public void LoadCetegory()
    {
        LoadControl LC = new LoadControl();
        DataTable dt = LC.LoadCetegory();

        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";

        ddlCategory.DataBind();
    }

}