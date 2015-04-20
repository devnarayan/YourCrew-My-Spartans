using System;
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
using System.Net.Mail;

public partial class ActiveProfile : System.Web.UI.Page
{
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSand_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Conn"].ToString()))
        {
            Connection.Open_Connection(con);
            cmd = new SqlCommand("select Email from Login where Email='"+txtEmailID.Text+"'", con);
            string stremail = Convert.ToString(cmd.ExecuteScalar());
            if(stremail=="")
            {
                // not found;
                lblMessage.Text = "Wrong Email ID, Please Insert Registered Email ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
              string gid=  Guid.NewGuid().ToString().GetHashCode().ToString("x");
              cmd = new SqlCommand("spAvtiveProfile", con);
              cmd.CommandType = CommandType.StoredProcedure;
              cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
              cmd.Parameters.AddWithValue("@GID", gid.ToString());
              cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 500);
              cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
              cmd.ExecuteNonQuery();
              string name = cmd.Parameters["@Msg"].Value.ToString();
              if (name != "")
              {
                  Dictionary<String, String> replacements = new Dictionary<String, String>();
                  MailDefinition md = new MailDefinition();
                  md.From = "scriptWord@scriptword.com";
                  md.IsBodyHtml = true;
                  md.Subject = "Account Activation : Your Crews";
                  replacements.Add("<%Name%>", name);
                  replacements.Add("<%QTY%>", "");
                  replacements.Add("<%ItemNo%>", "");
                  replacements.Add("<%Description%>", "");
                  replacements.Add("<%UnitPrice%>", "");
                  replacements.Add("<%TotalPrice%>", "");
                  replacements.Add("<%OrderDate%>", "");
                  replacements.Add("<%OrderTotal%>", "");
                  replacements.Add("<%CreditTotal%>", "");
                  replacements.Add("<%BillingMethod%>", "");
                  replacements.Add("<%CardNo%>", "");
                  replacements.Add("<%Address1%>", "");
                  replacements.Add("<%Address2%>", "");
                  string link ="http://"+ HttpContext.Current.Request.Url.Authority.ToString() + "/ActivationConfirm.aspx?gid=" + gid.ToString();
                  replacements.Add("<%Password%>", link);
                  replacements.Add("<%Unsubscribe%>", "Unsubscribe");

                  MailMessage msg = md.CreateMailMessage("devnagar@live.com", replacements, body(), new System.Web.UI.Control());

                  SmtpClient smtp = new SmtpClient();
                  smtp.Host = "smtp.live.com";
                  // smtp.Host = "smtpout.secureserver.net";
                  //smtp.Port = 80;
                  smtp.Port = 587;
                  smtp.UseDefaultCredentials = false;
                  // smtp.Credentials = new System.Net.NetworkCredential("scriptWord@scriptword.com", "waroftheworld");
                  smtp.Credentials = new System.Net.NetworkCredential("devnagar@live.com", "waroftheworld");
                  smtp.EnableSsl = true;
                  smtp.Send(msg);
                  lblMessage.Text = "Your Activation Details Sent to your mail";
                  lblMessage.ForeColor = System.Drawing.Color.Green;
              }
              else
              {
                  lblMessage.Text = "Invalide Email ID.";
              }
            }

            Connection.Close_Connection(con);
        }
    }


    private string body()
    {
        string body =
            @"

<!DOCTYPE HTML PUBLIC '-//W3C//DTD XHTML 1.0 Transitional //EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
    <title></title>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
    <meta name='viewport' content='width=320, target-densitydpi=device-dpi'>
    <style type='text/css'>
        /* Mobile-specific Styles */
        @media only screen and (max-width: 660px) {
            table[class=w0], td[class=w0] {
                width: 0 !important;
            }

            table[class=w10], td[class=w10], img[class=w10] {
                width: 10px !important;
            }

            table[class=w15], td[class=w15], img[class=w15] {
                width: 5px !important;
            }

            table[class=w30], td[class=w30], img[class=w30] {
                width: 10px !important;
            }

            table[class=w60], td[class=w60], img[class=w60] {
                width: 10px !important;
            }

            table[class=w125], td[class=w125], img[class=w125] {
                width: 80px !important;
            }

            table[class=w130], td[class=w130], img[class=w130] {
                width: 55px !important;
            }

            table[class=w140], td[class=w140], img[class=w140] {
                width: 90px !important;
            }

            table[class=w160], td[class=w160], img[class=w160] {
                width: 180px !important;
            }

            table[class=w170], td[class=w170], img[class=w170] {
                width: 100px !important;
            }

            table[class=w180], td[class=w180], img[class=w180] {
                width: 80px !important;
            }

            table[class=w195], td[class=w195], img[class=w195] {
                width: 80px !important;
            }

            table[class=w220], td[class=w220], img[class=w220] {
                width: 80px !important;
            }

            table[class=w240], td[class=w240], img[class=w240] {
                width: 180px !important;
            }

            table[class=w255], td[class=w255], img[class=w255] {
                width: 185px !important;
            }

            table[class=w275], td[class=w275], img[class=w275] {
                width: 135px !important;
            }

            table[class=w280], td[class=w280], img[class=w280] {
                width: 135px !important;
            }

            table[class=w300], td[class=w300], img[class=w300] {
                width: 140px !important;
            }

            table[class=w325], td[class=w325], img[class=w325] {
                width: 95px !important;
            }

            table[class=w360], td[class=w360], img[class=w360] {
                width: 140px !important;
            }

            table[class=w410], td[class=w410], img[class=w410] {
                width: 180px !important;
            }

            table[class=w470], td[class=w470], img[class=w470] {
                width: 200px !important;
            }

            table[class=w580], td[class=w580], img[class=w580] {
                width: 280px !important;
            }

            table[class=w640], td[class=w640], img[class=w640] {
                width: 300px !important;
            }

            table[class*=hide], td[class*=hide], img[class*=hide], p[class*=hide], span[class*=hide] {
                display: none !important;
            }

            table[class=h0], td[class=h0] {
                height: 0 !important;
            }

            p[class=footer-content-left] {
                text-align: center !important;
            }

            #headline p {
                font-size: 30px !important;
            }

            .article-content, #left-sidebar {
                -webkit-text-size-adjust: 90% !important;
                -ms-text-size-adjust: 90% !important;
            }

            .header-content, .footer-content-left {
                -webkit-text-size-adjust: 80% !important;
                -ms-text-size-adjust: 80% !important;
            }

            img {
                height: auto;
                line-height: 100%;
            }
        }
        /* Client-specific Styles */
        #outlook a {
            padding: 0;
        }
        /* Force Outlook to provide a 'view in browser' button. */
        body {
            width: 100% !important;
        }

        .ReadMsgBody {
            width: 100%;
        }

        .ExternalClass {
            width: 100%;
            display: block !important;
        }
        /* Force Hotmail to display emails at full width */
        /* Reset Styles */
        /* Add 100px so mobile switch bar doesn't cover street address. */
        body {
            background-color: #ececec;
            margin: 0;
            padding: 0;
        }

        img {
            outline: none;
            text-decoration: none;
            display: block;
        }

        br, strong br, b br, em br, i br {
            line-height: 100%;
        }

        h1, h2, h3, h4, h5, h6 {
            line-height: 100% !important;
            -webkit-font-smoothing: antialiased;
        }

            h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {
                color: blue !important;
            }

                h1 a:active, h2 a:active, h3 a:active, h4 a:active, h5 a:active, h6 a:active {
                    color: red !important;
                }
                /* Preferably not the same color as the normal header link color.  There is limited support for psuedo classes in email clients, this was added just for good measure. */
                h1 a:visited, h2 a:visited, h3 a:visited, h4 a:visited, h5 a:visited, h6 a:visited {
                    color: purple !important;
                }
        /* Preferably not the same color as the normal header link color. There is limited support for psuedo classes in email clients, this was added just for good measure. */
        table td, table tr {
            border-collapse: collapse;
        }

        .yshortcuts, .yshortcuts a, .yshortcuts a:link, .yshortcuts a:visited, .yshortcuts a:hover, .yshortcuts a span {
            color: black;
            text-decoration: none !important;
            border-bottom: none !important;
            background: none !important;
        }
        /* Body text color for the New Yahoo.  This example sets the font of Yahoo's Shortcuts to black. */
        /* This most probably won't work in all email clients. Don't include code blocks in email. */
        code {
            white-space: normal;
            word-break: break-all;
        }

        #background-table {
            background-color: #ececec;
        }
        /* Webkit Elements */
        #top-bar {
            border-radius: 6px 6px 0px 0px;
            -moz-border-radius: 6px 6px 0px 0px;
            -webkit-border-radius: 6px 6px 0px 0px;
            -webkit-font-smoothing: antialiased;
            background-color: #043948;
            color: #e7cba3;
        }

            #top-bar a {
                font-weight: bold;
                color: #e7cba3;
                text-decoration: none;
            }

        #footer {
            border-radius: 0px 0px 6px 6px;
            -moz-border-radius: 0px 0px 6px 6px;
            -webkit-border-radius: 0px 0px 6px 6px;
            -webkit-font-smoothing: antialiased;
        }
        /* Fonts and Content */
        body, td {
            font-family: HelveticaNeue, sans-serif;
        }

        .header-content, .footer-content-left, .footer-content-right {
            -webkit-text-size-adjust: none;
            -ms-text-size-adjust: none;
        }
        /* Prevent Webkit and Windows Mobile platforms from changing default font sizes on header and footer. */
        .header-content {
            font-size: 12px;
            color: #e7cba3;
        }

            .header-content a {
                font-weight: bold;
                color: #e7cba3;
                text-decoration: none;
            }

        #headline p {
            color: #e7cba3;
            font-family: HelveticaNeue, sans-serif;
            font-size: 36px;
            text-align: center;
            margin-top: 0px;
            margin-bottom: 30px;
        }

            #headline p a {
                color: #e7cba3;
                text-decoration: none;
            }

        .article-title {
            font-size: 18px;
            line-height: 24px;
            color: #9a9661;
            font-weight: bold;
            margin-top: 0px;
            margin-bottom: 18px;
            font-family: HelveticaNeue, sans-serif;
        }

            .article-title a {
                color: #9a9661;
                text-decoration: none;
            }

            .article-title.with-meta {
                margin-bottom: 0;
            }

        .article-meta {
            font-size: 13px;
            line-height: 20px;
            color: #ccc;
            font-weight: bold;
            margin-top: 0;
        }

        .article-content {
            font-size: 13px;
            line-height: 18px;
            color: #444444;
            margin-top: 0px;
            margin-bottom: 18px;
            font-family: HelveticaNeue, sans-serif;
        }

            .article-content a {
                color: #00707b;
                font-weight: bold;
                text-decoration: none;
            }

            .article-content img {
                max-width: 100%;
            }

            .article-content ol, .article-content ul {
                margin-top: 0px;
                margin-bottom: 18px;
                margin-left: 19px;
                padding: 0;
            }

            .article-content li {
                font-size: 13px;
                line-height: 18px;
                color: #444444;
            }

                .article-content li a {
                    color: #00707b;
                    text-decoration: underline;
                }

            .article-content p {
                margin-bottom: 15px;
            }

        .footer-content-left {
            font-size: 12px;
            line-height: 15px;
            color: #e2e2e2;
            margin-top: 0px;
            margin-bottom: 15px;
        }

            .footer-content-left a {
                color: #e7cba3;
                font-weight: bold;
                text-decoration: none;
            }

        .footer-content-right {
            font-size: 11px;
            line-height: 16px;
            color: #e2e2e2;
            margin-top: 0px;
            margin-bottom: 15px;
        }

            .footer-content-right a {
                color: #e7cba3;
                font-weight: bold;
                text-decoration: none;
            }

        #footer {
            background-color: #043948;
            color: #e2e2e2;
        }

            #footer a {
                color: #e7cba3;
                text-decoration: none;
                font-weight: bold;
            }

        #permission-reminder {
            white-space: normal;
        }

        #street-address {
            color: #e7cba3;
            white-space: normal;
        }
    </style>
    <!--[if gte mso 9]>
    <style _tmplitem='35' >
    .article-content ol, .article-content ul {
       margin: 0 0 0 24px;
       padding: 0;
       list-style-position: inside;
    }
    </style>
    <![endif]-->
</head>
<body>
    <table width='100%' cellpadding='0' cellspacing='0' border='0' id='background-table'>
        <tbody>
            <tr>
                <td align='center' bgcolor='#ececec'>
                    <table class='w640' style='margin:0 10px;' width='640' cellpadding='0' cellspacing='0' border='0'>
                        <tbody>
                            <tr><td class='w640' width='640' height='20'></td></tr>

                            <tr>
                                <td class='w640' width='640'>
                                    <table id='top-bar' class='w640' width='640' cellpadding='0' cellspacing='0' border='0' bgcolor='#00707b'>
                                        <tbody>
                                            <tr>
                                                <td class='w15' width='15'></td>
                                                <td class='w325' width='350' valign='middle' align='left'>
                                                    <table class='w325' width='350' cellpadding='0' cellspacing='0' border='0'>
                                                        <tbody>
                                                            <tr><td class='w325' width='350' height='8'></td></tr>
                                                        </tbody>
                                                    </table>
                                                    <div class='header-content'><webversion>Web Version</webversion><span class='hide'>&nbsp;&nbsp;|&nbsp; <preferences lang='en'>Update preferences</preferences>&nbsp;&nbsp;|&nbsp; <unsubscribe>Unsubscribe</unsubscribe></span></div>
                                                    <table class='w325' width='350' cellpadding='0' cellspacing='0' border='0'>
                                                        <tbody>
                                                            <tr><td class='w325' width='350' height='8'></td></tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td class='w30' width='30'></td>
                                                <td class='w255' width='255' valign='middle' align='right'>
                                                    <table class='w255' width='255' cellpadding='0' cellspacing='0' border='0'>
                                                        <tbody>
                                                            <tr><td class='w255' width='255' height='8'></td></tr>
                                                        </tbody>
                                                    </table>
                                                    <table cellpadding='0' cellspacing='0' border='0'>
                                                        <tbody>
                                                            <tr>

                                                                <td valign='middle'><fblike><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAOCAYAAAASVl2WAAAAdUlEQVR42rWRMQ6AIAxFHWVi0EXu4VG8Fydy7G1Y6UalxG9IQ0wc/MkvJP+VPzCJSHPVXL1Uh84eoYsx7jnnUzopBGBlZkIwArZSCiMgouOpuEewm/qqVk8IrbSyQRYwNe6twrerjhGgxzcgpSTwP4C3nwTgAkAB/svJgCf5AAAAAElFTkSuQmCC' border='0' width='8' height='14' alt='Facebook icon' =''></fblike></td>
                                                                <td width='3'></td>
                                                                <td valign='middle'><div class='header-content'><fblike>Like</fblike></div></td>


                                                                <td class='w10' width='10'></td>
                                                                <td valign='middle'><tweet><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAANCAYAAABPeYUaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowMTVEQkVFNTc0QzAxMUUyQkM3MERGMkM5MTY0MDlCMiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDowMTVEQkVFNjc0QzAxMUUyQkM3MERGMkM5MTY0MDlCMiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjAxNURCRUUzNzRDMDExRTJCQzcwREYyQzkxNjQwOUIyIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjAxNURCRUU0NzRDMDExRTJCQzcwREYyQzkxNjQwOUIyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+eawvgwAAAaZJREFUeNqMU79Lw1AQTmoR22gRpFAK+g+kg07OLs7+CS6Ci4VKUenWxc5CB5cWHKtLUZwLLg4ZuhhSm0CK2h8YqKHQpE2axLuaJ+mjlH5wvF/3fe/e3TvW8zyGZVkGEGL+4DKzwH3ON8QQzMIJcMc4holjLpdL9Xq9cblc/oC1GRDZaLfbV4lE4gQvAJ8SrN8mk4kFlz9OhTASQFRRlAvTNIVMJsMjEQzDi4iieOpRAIGuJElneD7l+yKRRqORJg7NZjPN8/wO7G/puv5Ai1iWpRYKhT04XwmKhLLZbAoEPomj4zi6YRgvSKBFQPgeOJvIDYpEZVk+B6LmLQHIyw0+mYiQipj5fP4ZNkbMEmi1Wq+kQoxfJjJdr9VqR/Ckr0VRYM78fLF0JIiRqqrfULbYoijg2ddQsR+8f14k+GdixWJxfzAYPM2LAiuFCQ1yg4kNVyqVg3q9ftzv9+9c1zUovqNp2m0ymdwG31Va5P+rC4Kgwa9McRy3i2s4HNq2/Q6ipWq1ehiPxy87nU53JqE+WKp3sD/WAu3ggGF/GGA2TSap+BVgABAiomFDqIyrAAAAAElFTkSuQmCC' border='0' width='17' height='13' alt='Twitter icon' =''></tweet></td>
                                                                <td width='3'></td>
                                                                <td valign='middle'><div class='header-content'><tweet>Tweet</tweet></div></td>


                                                                <td class='w10' width='10'></td>
                                                                <td valign='middle'><forwardtoafriend lang='en'><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAAOCAYAAADNGCeJAAABU0lEQVR42o2Sy0qFUBSGhS6TTtgkDudMgt7AQdA4DJoEQS/QE/QcQRCOHAYRBE0EIYcmOA4c5jQItIEXJExD3a0fEhZmnr3gZ2/X+vfn2heFYoOkkhakpaTg3cFaIYTSC6GmaXrXdd2nkAx4syy7B3AIW8KQ5/ljVVUvq0DwwIs51o7CEHEc30A0bUY4DauLlTBEFEXXnuedNU3z1ucwRw41fMvCsN0H0zQPLcs6KorCItmYI4eaNAzn4bruadu2H9TNu2EYBxA6Qw41eH53cEVrd0lbf2Awh2F4yW8VQL5d1OCBV9O0vbquXzkQsSDTd5IktxjFP0HbfQqC4ELX9X000DfBgYCpAImJQDeO45yUZflMXRW8NgAq6wBOvXjbto+p668hhB8H+eY4uEnhleMWceC4DP4TDiLNZGCbvu+f07hNWmP5OQchh4IUcCQ34yDoB00LvFnsGuMQAAAAAElFTkSuQmCC' border='0' width='19' height='14' alt='Forward icon' =''></forwardtoafriend></td>
                                                                <td width='3'></td>
                                                                <td valign='middle'><div class='header-content'><forwardtoafriend lang='en'>Forward</forwardtoafriend></div></td>

                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table class='w255' width='255' cellpadding='0' cellspacing='0' border='0'>
                                                        <tbody>
                                                            <tr><td class='w255' width='255' height='8'></td></tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td class='w15' width='15'></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                                <td id='header' class='w640' width='640' align='center' bgcolor='#00707b'>

                                    <table class='w640' width='640' cellpadding='0' cellspacing='0' border='0'>
                                        <tbody>
                                            <tr><td class='w30' width='30'></td><td class='w580' width='580' height='30'></td><td class='w30' width='30'></td></tr>
                                            <tr>
                                                <td class='w30' width='30'></td>
                                                <td class='w580' width='580'>
                                                    <div align='center' id='headline'>
                                                        <h2>
Your Crews
                                                                  </h2>
                                                    </div>
                                                </td>
                                                <td class='w30' width='30'></td>
                                            </tr>
                                        </tbody>
                                    </table>


                                </td>
                            </tr>

                            <tr><td class='w640' width='640' height='30' bgcolor='#ffffff'></td></tr>
                            <tr id='simple-content-row'>
                                <td class='w640' width='640' bgcolor='#ffffff'>
                                    <table class='w640' width='640' cellpadding='0' cellspacing='0' border='0'>
                                        <tbody>
                                            <tr>
                                                <td class='w30' width='30'></td>
                                                <td class='w580' width='580'>
                                                    <repeater>

                                                        <layout label='Text only'>
                                                            <table class='w580' width='580' cellpadding='0' cellspacing='0' border='0'>
                                                                <tbody>
                                                                    <tr>
                                                                        <td class='w580' width='580'>
                                                                            <p align='left' class='article-title'><singleline label='Title'>Hello <%Name%></singleline></p>
                                                                            <div align='left' class='article-content'>
                                                                                <multiline label='Description'>Welcome to Your Crews: please find activation link below: <br/>
<a href='<%Password%>' target='_blank' title='Active'>Active</a>
</multiline>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td class='w580' width='580' height='10'></td></tr>
                                                                </tbody>
                                                            </table>
                                                        </layout>
                                                    </repeater>
                                                </td>
                                                <td class='w30' width='30'></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr><td class='w640' width='640' height='15' bgcolor='#ffffff'></td></tr>

                            <tr>
                                <td class='w640' width='640'>
                                    <table id='footer' class='w640' width='640' cellpadding='0' cellspacing='0' border='0' bgcolor='#043948'>
                                        <tbody>
                                            <tr><td class='w30' width='30'></td><td class='w580 h0' width='360' height='30'></td><td class='w0' width='60'></td><td class='w0' width='160'></td><td class='w30' width='30'></td></tr>
                                            <tr>
                                                <td class='w30' width='30'></td>
                                                <td class='w580' width='360' valign='top'>
                                                    <span class='hide'><p id='permission-reminder' align='left' class='footer-content-left'><span> </span></p></span>
                                                    <p align='left' class='footer-content-left'><preferences lang='en'><span style='font-family:Edwardian Script ITC;'>S</span><span style='font-family:Harrington;'>cript</span><span style='font-family:Edwardian Script ITC;'>W</span><span style='font-family:Harrington;'>ord <sub>&copy;</sub></span></preferences>
                                                     | <unsubscribe><a href='#' target='_blank'> Unsubscribe</a></unsubscribe></p>
                                                </td>
                                                <td class='hide w0' width='60'></td>
                                                <td class='hide w0' width='160' valign='top'>
                                                    <p id='street-address' align='right' class='footer-content-right'></p>
                                                </td>
                                                <td class='w30' width='30'></td>
                                            </tr>
                                            <tr><td class='w30' width='30'></td><td class='w580 h0' width='360' height='15'></td><td class='w0' width='60'></td><td class='w0' width='160'></td><td class='w30' width='30'></td></tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr><td class='w640' width='640' height='60'></td></tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
";
        return body;
    }
}