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

public partial class ContractorRegister : System.Web.UI.Page
{
   
    SqlCommand cmd;
    CommanClass ccl;
    FileUploader fu;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ccl = new CommanClass();
                Session["UserType"] = "Contractor";
                if (ccl.isLogedin() == false)
                {
                    divprofile.Visible = true;
                    Session["RegStep"] = "0";
                }
                else if (ccl.isLogedin() == true)
                {
                    divContractorWork.Visible = true;
                    divprofile.Visible = true;
                   // Session["RegStep"] = "1";
                }
                if (Session["RegStep"] == "1" || Session["RegStep"] == "2")
                {
                    divWork.Visible = true;
                    divprofile.Visible = false;
                }
                else if(Session["RegStep"]=="3")
                {
                    Connection.Close_Connection(con);
                    Response.Redirect("UpdatePics.aspx");
                }
                else
                {
                    divWork.Visible = false;
                    divprofile.Visible = true;
                    Session["RegStep"] = "0";
                }
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
            //  ccl.ShowError(ex);
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            try
            {
                string filename = "";
                filename = "Upload/Logo/userbg.png";
                Connection.Open_Connection(con);
                cmd = new SqlCommand("spRegister", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@QueryType", SqlDbType.VarChar, 10).Value = "Insert";
                cmd.Parameters.Add("@RegisterType", SqlDbType.VarChar, 15).Value = Session["UserType"].ToString();
                cmd.Parameters.Add("@CategoryName", SqlDbType.VarChar, 20).Value = ddlCategory.SelectedValue.ToString();
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar, 50).Value = txtName.Text.ToString();
                cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = "";
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 15).Value = txtUserName.Text;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 30).Value = txtPassword.Text;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = txtEmailID.Text;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 50).Value = "All";
                cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = "All";
                cmd.Parameters.Add("@Location", SqlDbType.VarChar, 20).Value = "All";
                cmd.Parameters.Add("@Mobile", SqlDbType.VarChar, 20).Value = "All";
                cmd.Parameters.Add("@CountryID", SqlDbType.VarChar, 5).Value = "us";
                cmd.Parameters.AddWithValue("@PhotoURL", filename);
                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 255);
                cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ProfileID", SqlDbType.Int);
                cmd.Parameters["@ProfileID"].Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                int profileid;
                string msg = cmd.Parameters["@Msg"].Value.ToString();
                lblSinginError.Text = msg.ToString();
                profileid = Convert.ToInt32(cmd.Parameters["@ProfileID"].Value.ToString());
                if (msg == "OK")
                {
                    lblPortfolioCategory.Text = ddlCategory.SelectedItem.Text.ToString();
                    Session["LoginUser"] = txtUserName.Text; Session["ProfileID"] = profileid;
                    Session["UserType"] = "Contractor"; Session["RegStep"] = "1";
                    lblSinginError.ForeColor = System.Drawing.Color.Green;
                    lblSinginError.Text = "Successfully Registered";
                    //Response.Redirect(System.Web.HttpContext.Current.Request.Url.AbsoluteUri.ToString());
                    //Response.Redirect("Portfolio.aspx");
                    divprofile.Visible = false;
                    divWork.Visible = true;
                }
                else
                {
                    lblSinginError.Focus();
                }
            }
            catch (Exception ex)
            {
                ccl = new CommanClass();
                ccl.ShowError(ex);
            }
            finally
            {
                Connection.Close_Connection(con);
                Response.Redirect("ContractorRegister.aspx");
            }
        }
    }
    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            string red = "N";
            try
            {
                string filename = "";
                if (fuPhoto.PostedFile.ContentLength != 0)
                {
                    string[] extension = { ".jpg", ".gif", ".png", ".jpeg", ".gief" };
                    fu = new FileUploader();
                    filename = fu.Upload(fuPhoto, 1d, Session["LoginUser"].ToString() + "Logo" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString(), "Upload/Logo/", extension);
                }
                else filename = "Upload/Logo/userbg.png";
                cmd = new SqlCommand("spProfileContractor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Website", txtWebSite.Text);
                cmd.Parameters.AddWithValue("@ContractorNo", txtContractor.Text);
                cmd.Parameters.Add("@JobTitle", SqlDbType.VarChar, 100).Value = txtJobTitle.Text;
                cmd.Parameters.Add("@JobDescription", SqlDbType.NVarChar, 500).Value = txtPortfolioWorkDescription.Text;
                cmd.Parameters.Add("@Logo", SqlDbType.VarChar, 50).Value = filename;
                cmd.Parameters.Add("@Rate", SqlDbType.Money).Value = txtRate.Text;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 30).Value = Session["LoginUser"].ToString();
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 50).Value = txtAddress.Text;
                cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = ddlCity.SelectedValue.ToString();
                cmd.Parameters.Add("@Location", SqlDbType.VarChar, 20).Value = txtLocation.Text;
                cmd.Parameters.Add("@Mobile", SqlDbType.VarChar, 20).Value = txtContactno.Text;
                cmd.Parameters.Add("@CountryID", SqlDbType.VarChar, 5).Value = ddlCountry.SelectedValue.ToString();


                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 255);
                cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                string msg = cmd.Parameters["@Msg"].Value.ToString();
                lblSinginError.Text = msg.ToString();
                Connection.Close_Connection(con);
                cmd.Dispose();
                if (msg != "OK")
                {
                    lblWorkError.Text = lblSinginError.Text;
                    lblWorkError.Focus();
                }
                else
                {
                    lblWorkError.ForeColor = System.Drawing.Color.Green;
                    lblWorkError.Text = "Successfully Submitted.";
                    red = "Y";
                }
            }
            catch (Exception ex)
            {
                ccl = new CommanClass();
                ccl.ShowError(ex);
            }
            finally
            {

            }
            if (red == "Y")
                Response.Redirect("UpdatePics.aspx", true);
        }

    }
}