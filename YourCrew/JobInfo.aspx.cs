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
using System.Web.Services;
public partial class JobInfo : System.Web.UI.Page
{
    Contractor ccl = new Contractor();
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (ccl.isLogedin() == true)
                {
                    loadprofile();
                    int hirer = jobprofile();
                    HirerProfile(hirer);
                }
                else
                {
                    Session["errorMsg"] = "Please Login or Signup your profile.";
                    Response.Redirect("Default.aspx", false);
                }
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    [WebMethod]
    public List<string> getslider()
    {
        return ccl.GetSlider(Hiddencontractorid.Value);
    }
    private void loadprofile()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"]))
        {
            try
            {
                string loginid, usertyp;
                if (ccl.isLogedin() == true)
                {
                    usertyp = ccl.UserType();
                    if (usertyp == "Contractor")
                    {
                        loginid = Session["LoginUser"].ToString();
                    }
                    else
                    {
                        loginid = ccl.GetContractorUserName(Convert.ToInt32(Request.QueryString["cid"]));
                    }

                    Connection.Open_Connection(con);
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
                            string usertype = Session["UserType"].ToString();
                            imgLogo.Src = "../" + rw["PhotoURL"].ToString();
                            flag.Attributes.Add("Class", "flag " + rw["CountryID"].ToString());
                            lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                            Hiddencontractorid.Value = rw["ContractorID"].ToString();

                            //   lblWorkTitle.Text = rw["JobTitle"].ToString();
                            if (rw["Varified"].ToString() == "Yes")
                            {
                                mystory.InnerText = rw["Story"].ToString();
                                varified.Visible = true;
                            }
                            lblUsername.Text = rw["FirstName"].ToString() + " " + rw["LastName"].ToString();
                            lblWorkTitle.Text = rw["JobTitle"].ToString();
                            lblLocation.Text = rw["Location"].ToString();
                            lblAddress.Text = rw["Address"].ToString();
                            lblCityCountry.Text = rw["City"].ToString();
                        }
                    }
                }
                else
                {
                    loginid = "";
                    Response.Redirect("Default.aspx", false);
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
                //  ccl.ShowError(ex);
            }
        }
    }
    protected void datalistShowJobs_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //if (e.CommandName == "Apply")
        //{
        //    //Button Button2b = (Button)e.Item.FindControl("Button2");
        //    HiddenField HF_JID = (HiddenField)e.Item.FindControl("HF_FJ_JID") as HiddenField;
        //    Response.Redirect("~/ProfileContractor/ApplyJob?JobID=" + HF_JID.Value, false);
        //}
    }
    protected void listAllJobs_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

    }
    protected void btnSendContract_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("spPlacePraposal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Mode", "Insert");
            cmd.Parameters.AddWithValue("@HirerID", Convert.ToInt32(HiddenHirerID.Value));
            cmd.Parameters.AddWithValue("@ContractorID", Convert.ToInt32(Hiddencontractorid.Value));
            cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtStartDate.Text));
            cmd.Parameters.AddWithValue("@CompletionDate", Convert.ToDateTime(txtCompletionDate.Text));
            cmd.Parameters.AddWithValue("@ContractTerm", txtTerms.Text);
            cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@JID", Convert.ToInt32(Request.QueryString["jid"]));
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 500);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            string msg = Convert.ToString(cmd.Parameters["@Msg"].Value);
            if (msg == "OK")
            {
                lblMessage.Text = "Contract  Placed To Contractor.";
            }
            else
            {
                lblMessage.Text = "Please Provide valide information.";
            }
            Connection.Close_Connection(con);
            cmd.Dispose();
        }

    }
    private int jobprofile()
    {
        int hirer;
        string jid = Request.QueryString["jid"];
        if (jid != "")
        {
            int jd = Convert.ToInt32(jid);
            DataRow row = ccl.JobProfile(jd);
            lblCategory.Text = row["CategoryName"].ToString();
            lblWorkTitle.Text = row["JobTitle"].ToString();
            lblDescription.Text = row["Description"].ToString();
            lblPostDate.Text = row["PostDate"].ToString();
            lblDuration.Text = row["Hours"].ToString();
            lblBudget.Text = row["Budget"].ToString();
            lblJobStatus.Text = row["JobStatus"].ToString();
            attachment.HRef = row["Attachment"].ToString();
            lblStartDate.Text = row["StartDate"].ToString();
            lblEndDate.Text = row["ExpDate"].ToString();

            txtStartDate.Text = row["StartDate"].ToString();
            lblCompletionDate.Text = txtCompletionDate.Text = row["CompletionDate"].ToString();
            lblPrice.Text = txtPrice.Text = row["Price"].ToString();
            lblTerms.Text = txtTerms.Text = row["ContractTerm"].ToString();

            if (ccl.UserType() == "Contractor")
            {
                if (lblJobStatus.Text != "Posted")
                {
                    acceptContract.Visible = true;
                    if (lblJobStatus.Text == "Proposal")
                        btnAccept.Visible = true;
                }
            }
            else
            {
                //Hirer
                if (lblJobStatus.Text == "Posted" || lblJobStatus.Text == "Cancel")
                {
                    sendContract.Visible = true; btnSendContract.Visible = true;
                }
                else if (lblJobStatus.Text == "Proposal")
                {
                    sendContract.Visible = true;
                    btnUpdateContract.Visible = true;
                }
                else if(lblJobStatus.Text=="Hold" || lblJobStatus.Text=="Cancel")
                {
                    sendContract.Visible = true;
                    btnProcessAgain.Visible = true;
                }
                else
                {
                    sendContract.Visible = true;
                    btnHold.Visible = true; btnCancel.Visible = true;
                }
            }

            return Convert.ToInt32(row["Hirer"].ToString());
        }
        else
        {
            divjobnotfound.Visible = true;
            divjobProfile.Visible = false;
            return hirer = 0;
        }
    }
    private void HirerProfile(int hirerid)
    {
        Contractor cont = new Contractor();
        DataTable dt = cont.getHirerProfile(hirerid);
        if (dt.Rows.Count > 0)
        {
            DataRow rw = dt.Rows[0];
            if (cmd.Parameters["@Msg"].Value.ToString() == "OK")
            {
                imgHirer.Src = "" + rw["PhotoURL"].ToString();
                HiddenHirerID.Value = rw["HirerID"].ToString();
                lblHirerName.Text = rw["HirerName"].ToString();
            }
        }
        dt.Clear();
        dt.Dispose();
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        UpdateStatus("Process");
    }
    protected void btnUpdateContract_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        UpdateStatus("Cancel");
    }
    protected void btnHold_Click(object sender, EventArgs e)
    {
        UpdateStatus("Hold");
    }
    protected void btnProcessAgain_Click(object sender, EventArgs e)
    {
        UpdateStatus("Process");
    }
    private void UpdateStatus(string status)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("spPlacePraposal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Mode", status);
            cmd.Parameters.AddWithValue("@HirerID", Convert.ToInt32(HiddenHirerID.Value));
            cmd.Parameters.AddWithValue("@ContractorID", Convert.ToInt32(Hiddencontractorid.Value));
            cmd.Parameters.AddWithValue("@JID", Convert.ToInt32(Request.QueryString["jid"]));
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 500);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            string msg = Convert.ToString(cmd.Parameters["@Msg"].Value);
            if (msg == "OK")
            {
                lblMessage.Text = "Your Contractor Updated.";
            }
            else
            {
                lblMessage.Text = "Please Provide valide information.";
            }
            Connection.Close_Connection(con);
            cmd.Dispose();
        }

    }
   
}