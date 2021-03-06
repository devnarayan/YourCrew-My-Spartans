﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="EditPersonal.aspx.cs" Inherits="ProfileContractor_EditPersonal" %>

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
     <!---Slider---->
    <link href="../js/slider/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="../js/slider/1/js-image-slider.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <div class="row-fluid marginbot10">
                            <div class="span12">
                                    <div id="sliderFrame">
                                    <div id="slider">
                                         <%
                                   
                                    var list = getslider();
                                    int count=0;
                                    for (var i = 0; i < list.Count; i++)
                                    {
                                        Response.Write("");

                                        var row = "<img src='UploadSlider/" + hiddenContractorId.Value + "/" + list[i].ToString() + "' width='100%' height='100%' />";
                                        
                                        Response.Write(row);
                                    }
                                    
                                %>
                                        <a href="#">
                                            <img src="../images/slider/images/image-slider-1.jpg" alt="Welcome to Your Crew" width="100%" height="250" />
                                        </a>
                                        <img src="../images/slider/images/image-slider-2.jpg" alt="" width="100%" />
                                        <img src="../images/slider/images/image-slider-3.jpg" alt="Pure Javascript. No jQuery. No flash." />
                                        <img src="../images/slider/images/image-slider-4.jpg" alt="#htmlcaption" />
                                        <img src="../images/slider/images/image-slider-5.jpg" />
                                    </div>
                                    <div id="htmlcaption" style="display: none;">
                                        <%--<em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:HiddenField ID="hiddenContractorId" runat="server" />
                        <div class="row-fluid nomargin marginbot10">
                            <div class="span3">
                                <div class="form-group input-group">
                                    <asp:TextBox ID="txtbox" CssClass="form-control" runat="server"></asp:TextBox>
                                    <span class="input-group-addon">
                                        <asp:LinkButton CssClass="" Text="Messages" PostBackUrl="~/ProfileContractor/BusinessPlan.aspx" runat="server" ID="LinkButton6"><i class="icon icon-search" ></i> </asp:LinkButton></span>
                                </div>
                            </div>
                            <div class="span9">
                                <h2>
                                    <asp:Label ID="lblWorkTitle" runat="server" Width="100%" CssClass="text-center btn btn-success btn-medium pull-left"></asp:Label></h2>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <!-- Item Project and Filter Name -->
                            <div class="span3" data-id="id-0" data-type="design">
                                <div class="team-box thumbnail">
                                    <div class="profilephoto">
                                        <img id="imgLogo" runat="server" height="150" class="pull-left" />
                                    </div>
                                       <div class="caption">
                                        <h5><span id="flag" runat="server"></span>
                                            <asp:Label ID="lblUsername" runat="server" CssClass="text-center"></asp:Label></h5>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span8">
                                            Score
                                            <asp:Label ID="lblScore" runat="server"></asp:Label><br />
                                            <a href="#"><i class="icon-circled icon-star nomargin"></i>
                                                <i class="icon-circled icon icon-star"></i>
                                                <i class="icon-circled icon icon-star-half-empty"></i>
                                                <i class="icon-circled icon icon-star-half-empty"></i>
                                                <i class="icon-circled icon icon-star-empty"></i>
                                            </a>
                                        </div>
                                        <div class="span2" runat="server" id="varified" visible="false">
                                            <br />
                                            <a href="#" class="verify">
                                                <img src="../images/verify.png" />
                                                <span>
                                                    <img class="callout" src="../images/callout.gif" />
                                                    <strong>My Story</strong><br />
                                                    <i id="mystory" runat="server"></i>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                    <b>Location</b><br />
                                    <!--1. Location 2. Address 3.City and Country -->
                                    <asp:Label ID="lblLocation" Text="My Location" runat="server"></asp:Label><br />
                                    <asp:Label ID="lblAddress" Text="My Address" runat="server"></asp:Label><br />
                                    <asp:Label ID="lblCityCountry" Text="My City Indore-452001" runat="server"></asp:Label><br />
                                </div>
                                <ul>
                                    <li><a href="EditPersonal.aspx">Personal Profile</a></li>
                                    <li><a href="EditExperience.aspx">Work Profile</a></li>
                                    <li><a href="EditVideo.aspx">Video</a></li>
                                    <li><a href="../UpdatePics.aspx">Profile Logo</a></li>
                                    <li><a href="EditPhoto.aspx">Profile Pics</a></li>
                                    <li><a href="EditProfileHeader.aspx">Profile Header Slides</a></li>
                                </ul>
                            </div>
                            <div class="span9">
                                <h5>Edit Personal Profile</h5>
                                 <div class="row-fluid marginbot10">
                                    <div class="span3">First Name:</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" CssClass="input-large" Width="50%" required></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="row-fluid marginbot10">
                                    <div class="span3">Last Name:</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="50" CssClass="input-large" Width="50%" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row-fluid marginbot10">
                                    <div class="span3">Email:</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtEmail" Type="Email" runat="server" MaxLength="50" Width="50%" CssClass="input-large" required></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="row-fluid marginbot10">
                                    <div class="span3">Mobile:</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtMobile" Type="number" runat="server" MaxLength="20" Width="50%" CssClass="input-large" required></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="row-fluid marginbot10">
                                    <div class="span3">Country :</div>
                                    <div class="span9">
                                         <asp:DropDownList ID="ddlCountry" Width="50%" CssClass="input-large" runat="server" DataSourceID="CountryDataSource1" DataTextField="CountryName" DataValueField="Countryid"></asp:DropDownList>
                                        <asp:SqlDataSource ID="CountryDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="spGetCountry" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                     </div>
                                </div>
                                 <div class="row-fluid marginbot10">
                                    <div class="span3">City:</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="input-large" Width="50%" MaxLength="50" required></asp:TextBox>
                                     </div>
                                </div>
                                 <div class="row-fluid marginbot10">
                                    <div class="span3">Location:</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtLocation" runat="server" MaxLength="20" CssClass="input-large" Width="50%" required></asp:TextBox>
                                     </div>
                                </div>
                                 <div class="row-fluid marginbot10">
                                    <div class="span3">Address:</div>
                                    <div class="span9">
                                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="200" CssClass="input-large" Width="50%" required></asp:TextBox>
                                     </div>
                                </div>
                                <div class="row-fluid marginbot10">
                                    <div class="text-left span3"></div>
                                    <div class="span9">
                                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                        <br />
                                        <asp:Button ID="btnSAve" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnSAve_Click" /> <asp:LinkButton ID="lbtnClose" runat="server" PostBackUrl="~/ProfileContractor/EditPersonal.aspx" Text="Refresh" CssClass="btn btn-default"></asp:LinkButton><br>
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
