<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="PostJob.aspx.cs" Inherits="ProfileHirer_PostJob" %>

<asp:Content ID="Content5" ContentPlaceHolderID="Title" runat="Server">
    Hirer || Your Crews
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="head" runat="Server">
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

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Content" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <br />
                        <div class="row-fluid">
                            <div class="span3">
                               <aside class="left-sidebar">
                                    <div class="widget">
                                        <h5 class="widgetheading">Contract Links</h5>
                                        <ul class="cat">
                                            <li><i class="icon-angle-right"></i><a href="FindCrew.aspx">Find Contractor</a><span> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="PostJob.aspx">Post New Contract</a><span> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="PostedJob.aspx">Posted Contract</a><span class="circle"> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="ActiveProject.aspx" class="text-info">Active Contract</a><span class="circle"> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="ProfileHirer.aspx">Completed Contract</a><span class="circle"> </span></li>
                                        </ul>
                                        <h5 class="widgetheading">Profile Links</h5>
                                        <ul class="cat">
                                            <li><i class="icon-angle-right"></i><a href="../UpdatePics.aspx">Change Pics</a><span class="circle"> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="../ChangePassword.aspx">Change Password</a><span class="circle"> </span></li>
                                        </ul>
                                    </div>
                                </aside>
                            </div>
                            <div class="span9">

                                <h5>Post New Job</h5>
                                <div id="sendmessage">
                                    <h2>Post Job's for Crews</h2>

                                </div>

                                <%-- <form id="validateform">--%>
                                <div class="row-fluid marginbot10">
                                    <div class="span3">Category of Crews</div>
                                    <div class="span9">
                                        <asp:DropDownList ID="ddlCategory" CssClass="input-large" Width="50%" runat="server">
                                        </asp:DropDownList>
                                    </div>

                                </div>

                                <div class="row-fluid marginbot10">
                                    <div class="span3">Title of work</div>
                                    <div class="span9 ">
                                        <asp:TextBox ID="txtTitleofWork" MaxLength="100" runat="server" CssClass="input-large" Width="50%"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row-fluid marginbot10">
                                    <div class="span3">Description</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtDescription" MaxLength="4000" runat="server" Width="50%" Height="150px" CssClass="input-large" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row-fluid marginbot10">
                                    <div class="span3">Hours to billed</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtHours" MaxLength="10" min="0" CssClass="input-large" Type="number" runat="server" Width="50%"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row-fluid marginbot10">
                                    <div class="span3">Apply Till</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="input-large" Type="Date" Width="50%" MaxLength="10" required></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row-fluid marginbot10">
                                    <div class="span3">Budget of Work</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtAmount" runat="server" MaxLength="20" Width="50%" CssClass="input-large" required></asp:TextBox>
                                        <span>(USD)</span>
                                    </div>
                                </div>

                                <div class="row-fluid marginbot10">
                                    <div class="span3">Attachment</div>
                                    <div class="span9">
                                        <asp:FileUpload ID="FU_PJ_Attachment" runat="server" Class="validate[required]"></asp:FileUpload>
                                    </div>
                                </div>
                                <div class="row-fluid margintop10">
                                    <div class="span3"></div>
                                    <div class="span9">
                                        <asp:Label ID="lblError" Font-Bold="true" CssClass="label-info" runat="server"></asp:Label><br />
                                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-theme btn-medium margintop10" Text="Post" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btncancel" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-default btn-medium margintop10" Text="Cancel" />

                                    </div>
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
