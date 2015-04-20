<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">Change Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server"> <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <div class="team-box thumbnail">
                                     <div class="row-fluid nomargin">
                                            <div class="span6">
                                               <h3>Recover Your Password</h3>
                                                <b>Old Password:</b><br />
                                                <asp:TextBox ID="txtOldPassword"  Width="70%" TextMode="Password" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                              <div class="row-fluid nomargin margintop10">
                                            <div class="span6">
                                                <b>User Name:</b><br />
                                                <asp:TextBox ID="txtUserName" Width="70%" runat="server"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="A" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                             <div class="row-fluid nomargin margintop10">
                                            <div class="span6">
                                                <b>New Password:</b><br />
                                                <asp:TextBox ID="txtNewPassword" Width="70%" TextMode="Password" runat="server"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="reqpass" runat="server" ErrorMessage="*" ValidationGroup="A" ControlToValidate="txtNewPassword"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                             <div class="row-fluid nomargin margintop10">
                                            <div class="span6">
                                                <b>Confirm New Password:</b><br />
                                                <asp:TextBox ID="txtNewPasswordConfirm" Width="70%" TextMode="Password" runat="server"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="A" ControlToValidate="txtNewPasswordConfirm"></asp:RequiredFieldValidator>
                                               <br /> <asp:CompareValidator ID="comparepassword" runat="server" ControlToValidate="txtNewPasswordConfirm" ControlToCompare="txtNewPassword" ErrorMessage="Must Require Same Password" ValidationGroup="A" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>

                                            </div>
                                        </div>
                             <div class="row-fluid nomargin margintop20">
                                 <div class="span6">
                                 <b><asp:Label ID="lblMessage" runat="server"></asp:Label></b><br />
                                 <asp:Button ID="btnSend" runat="server" ValidationGroup="A" CssClass="btn btn-primary" OnClick="btnSend_Click"  Text="Save" />
                                               &nbsp;&nbsp;&nbsp; &nbsp;
                                     <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" PostBackUrl="~/Login.aspx"></asp:LinkButton> <br /><br /><br /><br />
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
