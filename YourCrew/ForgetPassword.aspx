<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Recover Your Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/prettyPhoto.css" rel="stylesheet" />
    <link href="css/camera.css" rel="stylesheet" />
    <link href="css/jquery.bxslider.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <!-- Theme skin -->
    <link id="colors" href="color/green.css" rel="stylesheet" />
    <!-- color picker -->
    <link rel="stylesheet" href="colorpicker/css/colorpicker.css" type="text/css" />
    <!-- boxed bg -->
    <link id="bodybg" href="boxedbg/bg1.css" rel="stylesheet" type="text/css" />
    <link href="css/notify.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <div class="team-box thumbnail">
                              <div class="row-fluid nomargin" id="divhirer" runat="server">
                                            <div class="span12">
                                               <h1>Recover Your Password</h1>
                                                <label>Enter your registered email id and send recovery message.</label><br />
                                                <asp:Label ID="lblMessage" runat="server" ></asp:Label><br />
                                                <asp:TextBox ID="txtEmailID" runat="server" Type="email" Width="30%"></asp:TextBox>
                                                <asp:Button ID="btnSand" runat="server" CssClass="btn btn-primary" OnClick="btnSand_Click"  Text="Recover" />
                                                <br /><br />
                                                <br /><br />
                                                <br /><br />
                                            </div>
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
    <script src="js/jquery.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/bootstrap.js"></script>

    <script src="js/modernizr.custom.js"></script>
    <script src="js/toucheffects.js"></script>
    <script src="js/google-code-prettify/prettify.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>

    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/portfolio/jquery.quicksand.js"></script>
    <script src="js/portfolio/setting.js"></script>
    <script src="js/jquery.tweet.js"></script>

    <script src="js/jquery.flexslider.js"></script>
    <script src="js/animate.js"></script>
    <script src="js/inview.js"></script>
    <script src="js/validate.js"></script>
    <script src="js/custom.js"></script>

    <script src="js/jquery.cookie.js"></script>
    <script src="colorpicker/js/colorpicker.js"></script>
    <script src="js/optionspanel.js"></script>
</asp:Content>
