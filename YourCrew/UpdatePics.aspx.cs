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

public partial class UpdatePics : System.Web.UI.Page
{
    FileUploader fu; SqlCommand cmd;
    CommanClass ccl;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadprofile();
        }
    }
    protected void btnSaveLogo_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
            {
                string filename = "";
                if (fuPhoto.PostedFile.ContentLength != 0)
                {
                    string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief" };
                    fu = new FileUploader();
                    filename = fu.Upload(fuPhoto, 1d, Session["LoginUser"].ToString() + "Logo" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "Upload/Logo/", extension);
                    Connection.Open_Connection(con);
                  if(Session["UserType"]=="Contractor")
                    cmd = new SqlCommand("Update ProfileContractor set PhotoURL='" + filename + "' where ContractorID='" + Convert.ToInt32(HiddenContractorID.Value) + "'", con);
                  else
                      cmd = new SqlCommand("Update ProfileHirer set PhotoURL='" + filename + "' where HirerID='" + Convert.ToInt32(HiddenContractorID.Value) + "'", con);
                    cmd.ExecuteNonQuery();
                    cmd = new SqlCommand("Update Login set Step='4' where UserName='" + Session["LoginUser"].ToString() + "'", con);
                    cmd.ExecuteNonQuery();
                    imgLogo.Src = filename;

                    Connection.Close_Connection(con);
                    cmd.Dispose();
                }
            }
        }
        catch(NullReferenceException ex)
        {
            Response.Redirect("Default.aspx");
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
                    loginid = Session["LoginUser"].ToString();
                    if (usertyp == "Contractor")
                    {
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
                                imgLogo.Src = "" + rw["PhotoURL"].ToString();
                                HiddenContractorID.Value = rw["ContractorID"].ToString();
                            }
                        }
                        dt.Clear();
                        dt.Dispose();
                        ad.Dispose();
                        cmd.Dispose();
                    }
                    else
                    {
                        Contractor cont = new Contractor();
                        DataTable dt = cont.getHirerProfile(Convert.ToInt32(Session["ProfileID"]));
                        if (dt.Rows.Count > 0)
                        {
                            DataRow rw = dt.Rows[0];
                            if (rw!=null)
                            {
                                imgLogo.Src = "" + rw["PhotoURL"].ToString();
                                HiddenContractorID.Value = rw["HirerID"].ToString();
                            }
                        }
                        dt.Clear();
                        dt.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
                //  ccl.ShowError(ex);
            }
            return contractorid;
        }
    }
    protected void btnSkip_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("Update Login set Step='4' where UserName='" + Session["LoginUser"].ToString() + "'", con);
            cmd.ExecuteNonQuery();

            Connection.Close_Connection(con);
            cmd.Dispose();
            if(Session["UserType"]=="Contractor")
            Response.Redirect("ProfileContractor/BusinessPlan.aspx");
            else
                Response.Redirect("Default.aspx");
        }
    }
}