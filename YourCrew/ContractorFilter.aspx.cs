using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using yourcrews;

public partial class ContractorFilter : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CrewsdbConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string s = Request.QueryString["zip"];
                if (s != null)
                {
                    ZipSearch("0");
                }
                else
                {
                    lblCityName.Text = Request.QueryString.Get(0);
                    txtLocation.Text = "All";
                    loadTeam("0");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("default.aspx");
        }
    }
    public void loadTeam(string categoryid)
    {
        string value = getRating();
        Connection.Open_Connection(con);
        cmd = new SqlCommand("spLoadTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@CategoryID", SqlDbType.SmallInt).Value = Convert.ToInt32(categoryid);
        if (Request.QueryString["ct"] != "")
        {
            cmd.Parameters.Add("@Location", SqlDbType.VarChar, 20).Value = txtLocation.Text;
            cmd.Parameters.Add("@Stars", SqlDbType.Float).Value = Convert.ToDecimal(value);
            cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = lblCityName.Text;
        }
        else lblCityName.Text = "All";
        cmd.Parameters.Add("@Limit", SqlDbType.Int).Value = 40;
        cmd.ExecuteNonQuery();
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        //HtmlGenericControl mydiv = (HtmlGenericControl)contractordesing;
        //mydiv.InnerHtml = design;
        Connection.Close_Connection(con);
        fill(dt);
        //   Request.Form["slider"] = value;
    }

    private string getRating()
    {
        string star = "0";
        if (chkratelist.Items[0].Selected == true)
        {
            star = "6";
        }
        else if (chkratelist.Items[1].Selected == true)
        { star = "0"; }
        else if (chkratelist.Items[2].Selected == true)
        {
            //star = "1";
            //string s = Request.Form["slider"];
            //if (s == null) s = "0";
            //if (Convert.ToDecimal(s) > 0)

            if (chkScore.Items[4].Selected == true)
                star = "1";
            if (chkScore.Items[3].Selected == true)
                star = "2";
            if (chkScore.Items[2].Selected == true)
                star = "3";
            if (chkScore.Items[1].Selected == true)
                star = "4";
            if (chkScore.Items[0].Selected == true)
                star = "5";
        }
        return star;
    }

    private void fill(DataTable dt)
    {
        var design = "";
        int j = 1;
        int i = 0;

        while (i < dt.Rows.Count)
        {
            var html = "";
            html += "<div class='row'>";
            html += "<div class='grid cs-style-4'>";
            try
            {
                if (string.IsNullOrEmpty(dt.Rows[i].ToString()))
                { }
                else
                {
                    //string username = StringCyper.Encrypt(dt.Rows[i]["UserName"].ToString(), "devnagar");
                    string username = dt.Rows[i]["UserName"].ToString();
                    html += " <div class='span3'> ";
                    html += "<div class='team-box thumbnail'>";
                    html += " <div class='bigbox'>";
                    html += "   <div class='boxgrid captionfull'>";
                    html += "    <a href='Portfolio.aspx?id=" + username + "'>";
                    html += "         <img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' class='attachment-home-post-thumbnail wp-post-image' alt='Your Crews Home' title='Your Crews Home' height='197' width='292'>";
                    html += "        <span style='top: 200px;' class='cover boxcaption'>";
                    html += "          <span class='descr'>Slider Javascript</span>";
                    html += "             <span class='title'>" + dt.Rows[i]["JobTitle"].ToString() + "</span>";
                    html += "    <span class='caption'>House, Banglow</span>";
                    html += "      </span>";
                    html += "           </a>";
                    html += "    </div>";
                    html += @" <span class='name'><b>";
                    html += dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                    html += @"</b></span>";
                    html += @"  <div class='row-fluid nomargin'>
                            <div class='span2'><img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' alt='img' class='boxbottm' /></div>";
                    html += @" <div class='span8'>Score: ";
                    html += dt.Rows[i]["RatingPoints"].ToString();
                    html += @"<br />
                                            <a href='#'><i class='icon-circled icon-star nomargin'></i>
                                                <i class='icon-circled icon icon-star'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-empty'></i>
                                            </a>
                                        </div>
                                        <div class='span2' runat='server' id='varified' visible='false'>";
                    if (dt.Rows[i]["varified"].ToString() == "Yes")
                    {
                        html += @" <a href='#' class='verify'>
                                                <img src='images/verify.png' />
                                                <span>
                                                    <img class='callout' src='images/callout.gif' />
                                                    <strong>My Story</strong><br />
                                                    <i id='mystory' runat='server'></i>
                                                </span>
                                            </a>";
                    }
                    html += @"
                                           
                                        </div>
                                    </div>";
                    html += "   </div>";
                    html += "</div>";
                    html += "</div>";
                }
                ///2
                ///
                i++;
                if (string.IsNullOrEmpty(dt.Rows[i].ToString()))
                { }
                else
                {
                    string username = dt.Rows[i]["UserName"].ToString();
                    html += " <div class='span3'> ";
                    html += "<div class='team-box thumbnail'>";
                    html += " <div class='bigbox'>";
                    html += "   <div class='boxgrid captionfull'>";
                    html += "    <a href='Portfolio.aspx?id=" + username + "'>";
                    html += "         <img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' class='attachment-home-post-thumbnail wp-post-image' alt='Your Crews Home' title='Your Crews Home' height='197' width='292'>";
                    html += "        <span style='top: 200px;' class='cover boxcaption'>";
                    html += "          <span class='descr'>Slider Javascript</span>";
                    html += "             <span class='title'>" + dt.Rows[i]["JobTitle"].ToString() + "</span>";
                    html += "    <span class='caption'>House, Banglow</span>";
                    html += "      </span>";
                    html += "           </a>";
                    html += "    </div>";
                    html += @" <span class='name'><b>";
                    html += dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                    html += @"</b></span>";
                    html += @"  <div class='row-fluid nomargin'>
                            <div class='span2'><img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' alt='img' class='boxbottm' /></div>";
                    html += @" <div class='span8'>Score: ";
                    html += dt.Rows[i]["RatingPoints"].ToString();
                    html += @"<br />
                                            <a href='#'><i class='icon-circled icon-star nomargin'></i>
                                                <i class='icon-circled icon icon-star'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-empty'></i>
                                            </a>
                                        </div>
                                       <div class='span2' runat='server' id='varified' visible='false'>";
                    if (dt.Rows[i]["varified"].ToString() == "Yes")
                    {
                        html += @" <a href='#' class='verify'>
                                                <img src='images/verify.png' />
                                                <span>
                                                    <img class='callout' src='images/callout.gif' />
                                                    <strong>My Story</strong><br />
                                                    <i id='mystory' runat='server'></i>
                                                </span>
                                            </a>";
                    }
                    html += @"
                                           
                                        </div>
                                    </div>";
                    html += "   </div>";
                    html += "</div>";
                    html += "</div>";
                }
                ///3
                ///
                i++;
                if (string.IsNullOrEmpty(dt.Rows[i].ToString()))
                { }
                else
                {
                    string username = dt.Rows[i]["UserName"].ToString();
                    html += " <div class='span3'> ";
                    html += "<div class='team-box thumbnail'>";
                    html += " <div class='bigbox'>";
                    html += "   <div class='boxgrid captionfull'>";
                    html += "    <a href='Portfolio.aspx?id=" + username + "'>";
                    html += "         <img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' class='attachment-home-post-thumbnail wp-post-image' alt='Your Crews Home' title='Your Crews Home' height='197' width='292'>";
                    html += "        <span style='top: 200px;' class='cover boxcaption'>";
                    html += "          <span class='descr'>Slider Javascript</span>";
                    html += "             <span class='title'>" + dt.Rows[i]["JobTitle"].ToString() + "</span>";
                    html += "    <span class='caption'>House, Banglow</span>";
                    html += "      </span>";
                    html += "           </a>";
                    html += "    </div>";
                    html += @" <span class='name'><b>";
                    html += dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                    html += @"</b></span>";
                    html += @"  <div class='row-fluid nomargin'>
                            <div class='span2'><img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' alt='img' class='boxbottm' /></div>";
                    html += @" <div class='span8'>Score: ";
                    html += dt.Rows[i]["RatingPoints"].ToString();
                    html += @"<br />
                                            <a href='#'><i class='icon-circled icon-star nomargin'></i>
                                                <i class='icon-circled icon icon-star'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-empty'></i>
                                            </a>
                                        </div>
                                        <div class='span2' runat='server' id='varified' visible='false'>";
                    if (dt.Rows[i]["varified"].ToString() == "Yes")
                    {
                        html += @" <a href='#' class='verify'>
                                                <img src='images/verify.png' />
                                                <span>
                                                    <img class='callout' src='images/callout.gif' />
                                                    <strong>My Story</strong><br />
                                                    <i id='mystory' runat='server'></i>
                                                </span>
                                            </a>";
                    }
                    html += @"
                                           
                                        </div>
                                    </div>";
                    html += "   </div>";
                    html += "</div>";
                    html += "</div>";
                    ///4
                    ///
                }
                i++;
                if (string.IsNullOrEmpty(dt.Rows[i].ToString()))
                { }
                else
                {
                    string username = StringCyper.Encrypt(dt.Rows[i]["UserName"].ToString(), "devnagar");
                    html += " <div class='span3'> ";
                    html += "<div class='team-box thumbnail'>";
                    html += " <div class='bigbox'>";
                    html += "   <div class='boxgrid captionfull'>";
                    html += "    <a href='Portfolio.aspx?id=" + username + "'>";
                    html += "         <img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' class='attachment-home-post-thumbnail wp-post-image' alt='Your Crews Home' title='Your Crews Home' height='197' width='292'>";
                    html += "        <span style='top: 200px;' class='cover boxcaption'>";
                    html += "          <span class='descr'>Slider Javascript</span>";
                    html += "             <span class='title'>" + dt.Rows[i]["JobTitle"].ToString() + "</span>";
                    html += "    <span class='caption'>House, Banglow</span>";
                    html += "      </span>";
                    html += "           </a>";
                    html += "    </div>";
                    html += @" <span class='name'><b>";
                    html += dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                    html += @"</b></span>";
                    html += @"  <div class='row-fluid nomargin'>
                            <div class='span2'><img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' alt='img' class='boxbottm' /></div>";
                    html += @" <div class='span8'>Score: ";
                    html += dt.Rows[i]["RatingPoints"].ToString();
                    html += @"<br />
                                            <a href='#'><i class='icon-circled icon-star nomargin'></i>
                                                <i class='icon-circled icon icon-star'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-half-empty'></i>
                                                <i class='icon-circled icon icon-star-empty'></i>
                                            </a>
                                        </div>
                                         <div class='span2' runat='server' id='varified' visible='false'>";
                    if (dt.Rows[i]["varified"].ToString() == "Yes")
                    {
                        html += @" <a href='#' class='verify'>
                                                <img src='images/verify.png' />
                                                <span>
                                                    <img class='callout' src='images/callout.gif' />
                                                    <strong>My Story</strong><br />
                                                    <i id='mystory' runat='server'></i>
                                                </span>
                                            </a>";
                    }
                    html += @"
                                           
                                        </div>
                                    </div>";
                    html += "   </div>";
                    html += "</div>";
                    html += "</div>";
                }
            }
            catch (IndexOutOfRangeException ex)
            {

            }
            html += "</div></div>";
            design += html;
            j++;
            i++;
        }
        if (dt.Rows.Count == 0)
        {
            var html = "";
            html += "<div class='row'>";
            html += "<div class='grid cs-style-4'>";
            html += " <div class='span12'> ";
            html += "<div class='team-box thumbnail'>";
            html += " <div class='bigbox'>";
            html += "<h2>No Crew Found In Search</h2>";
            html += "</div></div></div>";
            html += "</div></div>";
            design += html;

        }
        divProfile.InnerHtml = design;

    }
    protected void btnSearchbelow_Click(object sender, EventArgs e)
    {
        loadTeam(ddlCategory.SelectedValue);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ZipSearch(ddlCategory.SelectedValue);
    }
    private void ZipSearch(string categoryid)
    {
        lblCityName.Text = "ZipCode: " + txtSearch.Text;
        string value = getRating();
        Connection.Open_Connection(con);
        cmd = new SqlCommand("spLoadTeamZipCode", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@CategoryID", SqlDbType.SmallInt).Value = Convert.ToInt32(categoryid);
        cmd.Parameters.Add("@ZipCode", SqlDbType.NVarChar, 50).Value = txtSearch.Text;
        cmd.ExecuteNonQuery();
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        //HtmlGenericControl mydiv = (HtmlGenericControl)contractordesing;
        //mydiv.InnerHtml = design;
        Connection.Close_Connection(con);
        fill(dt);
    }
}