<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" AutoEventWireup="true" CodeFile="Communication.aspx.cs" Inherits="Chat_Communication" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    My Messages
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="../css/flexslider.css" rel="stylesheet" />
    <link href="../css/prettyPhoto.css" rel="stylesheet" />
    <link href="../css/camera.css" rel="stylesheet" />
    <link href="../css/jquery.bxslider.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <!-- Theme skin -->
    <link id="colors" href="../color/green.css" rel="stylesheet" />
    <!-- color picker -->
    <link rel="stylesheet" href="../colorpicker/css/colorpicker.css" type="text/css" />
    <!-- boxed bg -->
    <link id="bodybg" href="../boxedbg/bg1.css" rel="stylesheet" type="text/css" />
    <link href="../css/notify.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <div class="row-fluid nomarginmarginbot10">
                            <h4 class="title">Your Crew <strong>Communication</strong>  <strong><b>
                                <asp:Label ID="lblCityName" ForeColor="Green" runat="server"></asp:Label></b></strong></h4>
                            <div class="">
                                <div class="span2 team-box">
                                    <br />
                                    <asp:Button ID="btnNewMsg" runat="server" Text="New Message" CssClass="btn btn-success" OnClick="btnNewMsg_Click" />
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="lbtnInbox" runat="server" Text="Inbox" OnClick="lbtnInbox_Click"><i class="icon icon-envelope"></i> Inbox</asp:LinkButton><br />
                                    <br />
                                    <asp:LinkButton ID="lbtnSent" runat="server" Text="Sent" OnClick="lbtnSent_Click"><i class="icon icon-trash"></i> Sent</asp:LinkButton><br />
                                    <br />
                                    <asp:LinkButton ID="lbtnArchive" runat="server" Text="Sent" OnClick="lbtnArchive_Click"><i class="icon icon-user"></i> Archive</asp:LinkButton><br />
                                </div>
                            </div>
                            <div class="span10 team-box">
                                <%
                                    var data = MyMessages();
                                    string html = "";
                                    for(int i=0;i<data.Rows.Count;i++)
                                    {
                                       
                                      html+="   <div class='row-fluid nomargin'>";
                                         html+="       <a href='Chats.aspx?id="+data.Rows[i]["JobID"]+"'>'";
                                        html+="<div class='span1'><img src='../"+data.Rows[i]["PhotoURL"]+"' height='50px' width='50px'";
                                        html+=@" class='thumbnail pull-left' />
                                                    </div>
                                                    <div class='span3 text-left'>";
                                        html += "<b>" + data.Rows[i]["HirerName"] + " </b><br /><span>" + Convert.ToDateTime(data.Rows[i]["PostDate"]).ToString("dd-MMM-yyyy hh:mm tt") + "</span></div>";
                                                  html+=" <div class='span7 text-left'><b>"+data.Rows[i]["JobTitle"]+"</b><br/>";
                                                   html+="<span>"+data.Rows[i]["Message"]+"</span>";
                                                   html += @"</div>
                                                </a>
                                              
                                            </div><div class='row-fluid nomargin'><hr/><div class='span11'><hr/></div></div>";
                                       
                                    }
                                    Response.Write(html);
                                     %>
                               
                                
                            </div>
                        </div><br />
                        <div class="row-fluid nomargin team-box thumbnail">
                            <div class="span12">
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>
    <!-- javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.easing.1.3.js"></script>
    <script src="../js/bootstrap.js"></script>

    <script src="../js/modernizr.custom.js"></script>
    <script src="../js/toucheffects.js"></script>
    <script src="../js/google-code-prettify/prettify.js"></script>
    <script src="../js/jquery.bxslider.min.js"></script>

    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/portfolio/jquery.quicksand.js"></script>
    <script src="../js/portfolio/setting.js"></script>
    <script src="../js/jquery.tweet.js"></script>

    <script src="../js/jquery.flexslider.js"></script>
    <script src="../js/animate.js"></script>
    <script src="../js/inview.js"></script>
    <script src="../js/validate.js"></script>
    <script src="../js/custom.js"></script>

    <script src="../js/jquery.cookie.js"></script>
    <script src="../colorpicker/js/colorpicker.js"></script>
    <script src="../js/optionspanel.js"></script>
</asp:Content>
