<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" AutoEventWireup="true" CodeFile="HireMe.aspx.cs" Inherits="ProfileHirer_HireMe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">Contractor Job Approval
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
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
                                <article>
                                    <div class="post-heading">
                                        <h4>
                                            <asp:Label ID="lblJobTitle" runat="server"></asp:Label></h4>
                                        <asp:Label ID="lbldescription" runat="server"></asp:Label>
                                    </div>
                                </article>
                                <article>
                                    <div class="post-heading">
                                        <h5>Job Proposals</h5>
                                    </div>
                                    
                                    
                                    
                                </article>

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