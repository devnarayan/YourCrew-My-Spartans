using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using yourcrews;

public partial class SignInHirer : System.Web.UI.Page
{
    SqlCommand cmd;
    CommanClass ccl;
    FileUploader fu;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["LoginUser"]!=null)
            {
                Response.Redirect("ProfileHirer/FindCrew.aspx");
            }
            if (!IsPostBack)
            {
                ccl = new CommanClass();
              //  Loaddata();
                Session["UserType"] = "Hirer";
                divprofile.Visible = true;
                divhirer.Visible = true;
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
        try
        {
            string filename = "";
            filename = "Upload/Logo/userbg.png";
            Connection.Open_Connection(con);
            cmd = new SqlCommand("spRegister", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@QueryType", SqlDbType.VarChar, 10).Value = "Insert";
            cmd.Parameters.Add("@RegisterType", SqlDbType.VarChar, 15).Value = Session["UserType"].ToString();
            cmd.Parameters.Add("@CategoryName", SqlDbType.VarChar, 20).Value = "";
            cmd.Parameters.Add("@Firstname", SqlDbType.VarChar, 50).Value = txtName.Value.ToString();
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = txtLastName.Value.ToString();
            cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 15).Value = txtUserName.Value;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 30).Value = txtPassword.Value;
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = txtEmail.Value;
            cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 50).Value = txtAddress.Value;
            cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = ddlCity.Value;
            cmd.Parameters.Add("@Location", SqlDbType.VarChar, 20).Value = txtLocation.Value;
            cmd.Parameters.Add("@Mobile", SqlDbType.VarChar, 20).Value = txtContactno.Value;
            cmd.Parameters.Add("@CountryID", SqlDbType.VarChar, 5).Value = ddlCountry.SelectedValue;
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
                Session["LoginUser"] = txtUserName.Value; Session["ProfileID"] = profileid;
                lblSinginError.ForeColor = System.Drawing.Color.Green;
                lblSinginError.Text = "Successfully Registered";
                //Response.Redirect(System.Web.HttpContext.Current.Request.Url.AbsoluteUri.ToString());
                divprofile.Visible = false;
                Response.Redirect("ProfileHirer/FindCrew.aspx");
            }
            else lblSinginError.Focus();
        }
        catch (Exception ex)
        {
            ccl = new CommanClass();
            ccl.ShowError(ex);
        }
        finally
        {
            Connection.Close_Connection(con);
        }
    }
}