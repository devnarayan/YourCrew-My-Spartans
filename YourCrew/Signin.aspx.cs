using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using yourcrews;

public partial class Signin : System.Web.UI.Page
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
              //  Loaddata();
                Session["UserType"] = "Hirer";
             //   divprofile.Visible = true;
                if (ccl.isLogedin()==false)
                {
                  //  divusertype.Visible = true;
               //     divprofile.Visible = true;
                }
                else if (ccl.isLogedin()==true)
                {
                 //   divprofile.Visible = true;
                    if (ccl.UserType()== "Contractor")
                    {
                        divhirer.Visible = true;
                    }
                    else
                    {
                        divhirer.Visible = true;
                    }
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
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
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
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar, 50).Value = txtName.Text;
                cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = txtLastName.Text;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 15).Value = txtUserName.Text;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 30).Value = txtPassword.Text;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = txtEmail.Text;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 50).Value = txtAddress.Text;
                cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = ddlCity.Text;
                cmd.Parameters.Add("@Location", SqlDbType.VarChar, 20).Value = txtLocation.Text;
                cmd.Parameters.Add("@Mobile", SqlDbType.VarChar, 20).Value = txtContactno.Text;
                cmd.Parameters.Add("@CountryID", SqlDbType.VarChar, 5).Value = ddlCountry.SelectedValue.ToString();
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
                    Session["LoginUser"] = txtUserName.Text; Session["ProfileID"] = profileid;
                    Session["UserType"] = "Hirer"; Session["RegStep"] = "1";
                    lblSinginError.ForeColor = System.Drawing.Color.Green;
                    lblSinginError.Text = "Successfully Registered";
                    Response.Redirect("UpdatePics.aspx",false);
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
}