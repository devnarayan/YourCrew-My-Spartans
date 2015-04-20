<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs" Inherits="ProfileContractor_SendMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Contractor Profile
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
                                <div class="row-fluid">
                                    <div class="span2 align-left"><label for="txtTo">Contract: </label></div>
                                    <div class="span9 text-left">
                                        <asp:DropDownList ID="ddlJobTitle" runat="server" Width="100%" CssClass="input-large"  DataTextField="JobTitle" DataValueField="JobID"></asp:DropDownList>
                                </div>
                                    </div>
                             <%--  <div class="row">
                                    <div class="span1 align-left"><label for="txtTo">Subject </label></div>
                                    <div class="span6 text-left"><asp:TextBox ID="txtSubject" Width="100%" runat="server" CssClass="input-large"></asp:TextBox></div>
                                </div>--%>
                                <div class="row-fluid">
                                    <div class="span2 align-left"><label for="txtTo">Message</label></div>
                                    <div class="span9 text-left"><asp:TextBox ID="txtMessage" Columns="50" Width="100%" Rows="5" TextMode="MultiLine" runat="server" CssClass="input-xlarge"></asp:TextBox></div>
                                </div>
                                <div class="row-fluid margintop10">
                                    <div class="span2"><label for="txtTo">Attachment</label></div>
                                    <div class="span9 text-left">
                                           <asp:FileUpload Width="100%" ID="fuPhoto" runat="server" ToolTip="Upload your pics/company logo" /><br />
                                        Upload Only:{".jpg", ".gif", ".png", ".jpeg", ".gief",".pdf",".doc" ,".xml",".docx",".txt"}
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span2"></div>
                                    <div class="span8">
                                        <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label><br />
                                        <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" CssClass="btn btn-primary" /></div>
                                </div>
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
