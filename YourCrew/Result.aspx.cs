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

public partial class Result : System.Web.UI.Page
{
    SqlCommand cmd;
    LoadControl lc = new LoadControl();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CrewsdbConnectionString"].ToString());
    StringCyper sc = new StringCyper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadsearchtitle();
            loadTeam();
            txtSearch.Text = Request.QueryString["s"].ToString();
        }
    }
    private void loadsearchtitle()
    {
        string catname = lc.CategoryName(Convert.ToInt32(Request.QueryString["cid"]));
        var html="";
        html+="<div class='icon'>";
        html+="";
        html+="</div>";
        html+="<div class='text pull-left'>";
        html += "<h4><i class='icon icon-circled icon-bgdark icon-star active icon-3x'></i> Popular <strong>" + catname + "</strong> Professional</h4>";
        html+="<p>";
        html+="";
        html += " </p>";
            html+="</div>";
      //  searchtitle.InnerHtml = html;
    }
    public void loadTeam()
    {
        Connection.Open_Connection(con);
        cmd = new SqlCommand("spLoadTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@CategoryID", SqlDbType.SmallInt).Value = Convert.ToInt32(Request.QueryString["cid"]);
        cmd.Parameters.Add("@Limit", SqlDbType.Int).Value = 40;
        cmd.ExecuteNonQuery();
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
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
                    html += "      <span class='boxbottm'>";
                    html += "         <img src='#' alt='Img' />";
                    html += "        <span class='name'>" + dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString() + "</span>";
                    html += "         <br />";
                    html += "        <ul class='social-network nomargin'>";
                    html += "             <li><a href='#' title='" + dt.Rows[i]["HoursBilled"].ToString() + "'><i class='icon-circled  icon-time'></i></a></li>";
                    html += "            <li><a href='#' title='" + dt.Rows[i]["RatingPoints"].ToString() + "'><i class='icon-circled icon-star-half-full'></i></a></li>";
                    html += "            <li><a href='#' title='$-" + dt.Rows[i]["Rate"].ToString() + "'><i class='icon-circled  icon-dollar'></i></a></li>";
                    html += "        </ul>";
                    html += "     </span>";
                    html += "   </div>";
                    html += "</div>";
                    html += "   </div>";
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
                    html += "      <span class='boxbottm'>";
                    html += "         <img src='#' alt='Img' />";
                    html += "        <span class='name'>" + dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString() + "</span>";
                    html += "         <br />";
                    html += "        <ul class='social-network nomargin'>";
                    html += "             <li><a href='#' title='" + dt.Rows[i]["HoursBilled"].ToString() + "'><i class='icon-circled  icon-time'></i></a></li>";
                    html += "            <li><a href='#' title='" + dt.Rows[i]["RatingPoints"].ToString() + "'><i class='icon-circled icon-star-half-full'></i></a></li>";
                    html += "            <li><a href='#' title='$-" + dt.Rows[i]["Rate"].ToString() + "'><i class='icon-circled  icon-dollar'></i></a></li>";
                    html += "        </ul>";
                    html += "     </span>";
                    html += "   </div>";
                    html += "</div>";
                    html += "   </div>";
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
                    html += "      <span class='boxbottm'>";
                    html += "         <img src='#' alt='Img' />";
                    html += "        <span class='name'>" + dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString() + "</span>";
                    html += "         <br />";
                    html += "        <ul class='social-network nomargin'>";
                    html += "             <li><a href='#' title='" + dt.Rows[i]["HoursBilled"].ToString() + "'><i class='icon-circled  icon-time'></i></a></li>";
                    html += "            <li><a href='#' title='" + dt.Rows[i]["RatingPoints"].ToString() + "'><i class='icon-circled icon-star-half-full'></i></a></li>";
                    html += "            <li><a href='#' title='$-" + dt.Rows[i]["Rate"].ToString() + "'><i class='icon-circled  icon-dollar'></i></a></li>";
                    html += "        </ul>";
                    html += "     </span>";
                    html += "   </div>";
                    html += "</div>";
                    html += "   </div>";
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
                    html += "      <span class='boxbottm'>";
                    html += "         <img src='#' alt='Img' />";
                    html += "        <span class='name'>" + dt.Rows[i]["FirstName"].ToString() + " " + dt.Rows[i]["LastName"].ToString() + "</span>";
                    html += "         <br />";
                    html += "        <ul class='social-network nomargin'>";
                    html += "             <li><a href='#' title='" + dt.Rows[i]["HoursBilled"].ToString() + "'><i class='icon-circled  icon-time'></i></a></li>";
                    html += "            <li><a href='#' title='" + dt.Rows[i]["RatingPoints"].ToString() + "'><i class='icon-circled icon-star-half-full'></i></a></li>";
                    html += "            <li><a href='#' title='$-" + dt.Rows[i]["Rate"].ToString() + "'><i class='icon-circled  icon-dollar'></i></a></li>";
                    html += "        </ul>";
                    html += "     </span>";
                    html += "   </div>";
                    html += "</div>";
                    html += "   </div>";
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
}