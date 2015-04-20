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

public partial class _Default : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CrewsdbConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getTeam();
        }
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {

    }
    private void getTeam()
    {
        Connection.Open_Connection(con);
        cmd = new SqlCommand("spLoadTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@CategoryID", SqlDbType.SmallInt).Value = 0;
        cmd.Parameters.Add("@Limit", SqlDbType.Int).Value = 40;
        cmd.ExecuteNonQuery();
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        loadTeam(dt);
    }
    public void loadTeam(DataTable dt)
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
                    html+=@" <span class='name'><b>";
                                 html += dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString();
                                 html += @"</b></span>";
                    html += @"  <div class='row-fluid nomargin'>
                            <div class='span2'><img src='" + dt.Rows[i]["PhotoURL"].ToString() + "' alt='img' class='boxbottm' /></div>";
                     html+=@" <div class='span8'>Score: ";
                    html+=dt.Rows[i]["RatingPoints"].ToString();
                    html+= @"<br />
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
        divProfile.InnerHtml = design;
        //HtmlGenericControl mydiv = (HtmlGenericControl)contractordesing;
        //mydiv.InnerHtml = design;
        Connection.Close_Connection(con);
    }
    protected void btnSearchbelow_Click(object sender, EventArgs e)
    {

    }
    protected void LinkSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContractorFilter.aspx?zip=" + txtSearch.Text);
    }
}