<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobInfo.aspx.cs" Inherits="JobInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    My Contract
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
                                <div class="span12">
                                    <div id="sliderFrame">
                                    <div id="slider">
                                         <%
                                   
                                    var list = getslider();
                                    int count=0;
                                    for (var i = 0; i < list.Count; i++)
                                    {
                                        Response.Write("");

                                        var row = "<img src='UploadSlider/" + Hiddencontractorid.Value + "/" + list[i].ToString() + "' width='100%' height='100%' />";
                                        
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
                        </div>
                        <div class="row-fluid nomargin marginbot10">
                            <div class="span12">
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
                                        <h5>
                                            <span id="flag" runat="server"></span>&nbsp;
                                            <asp:Label ID="lblUsername" runat="server" CssClass="text-center"></asp:Label></h5>
                                        <br />
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
                                                <img src="images/verify.png" />
                                                <span>
                                                    <img class="callout" src="images/callout.gif" />
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
                                <div class="team-box thumbnail">
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="lbtnJobApplied" runat="server"><i class="icon icon-caret-right"></i> Contract Applied</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lbtnActiveJobs" runat="server"><i class="icon icon-caret-right"></i> Active Contract</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lbtnAllJobs" runat="server"><i class="icon icon-caret-right"></i> All Contract</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lbtnJobProposals" runat="server"><i class="icon icon-caret-right"></i> Contract Proposals</asp:LinkButton></li>
                                    </ul>
                                </div>
                            </div>
                            <asp:HiddenField ID="Hiddencontractorid" runat="server" />
                            <div class="span6" id="divjobProfile" runat="server">
                                <div class="row-fluid nomargin">
                                    <div class="span12">
                                        <h5>Contract Info:</h5>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3"><b>Category:</b></div>
                                    <div class="span9">
                                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <%--  <div class="row-fluid">
                                    <div class="span3"><b>Contract Title:</b></div>
                                    <div class="span9"><asp:Label ID="lblTitle" runat="server"></asp:Label></div>
                                </div>--%>
                                <div class="row-fluid">
                                    <div class="span3"><b>Description:</b></div>
                                    <div class="span9">
                                        <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3"><b>Posted On:</b></div>
                                    <div class="span9">
                                        <asp:Label ID="lblPostDate" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3"><b>Duration:</b></div>
                                    <div class="span9">
                                        <asp:Label ID="lblDuration" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3"><b>Budget:</b></div>
                                    <div class="span9">
                                        <asp:Label ID="lblBudget" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3"><b>Status:</b></div>
                                    <div class="span9">
                                        <asp:Label ID="lblJobStatus" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3"><b>Attachment:</b></div>
                                    <div class="span9"><a id="attachment" runat="server"></a></div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span6">
                                        <b>Post Date:</b>
                                        <asp:Label ID="lblEndDate" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row-fluid nomargin">
                                    <div class="span12">
                                        <h5>Contract Order:</h5>
                                    </div>
                                </div>
                                <div id="sendContract" runat="server" visible="false">

                                    <div class="row-fluid nomargin">
                                        <div class="span6">
                                            <b>Start Date:</b>
                                            <div class="form-group input-group">
                                                <asp:TextBox ID="txtStartDate" runat="server" Type="Date" CssClass="form-control" Width="100%"></asp:TextBox>
                                                <span class="input-group-addon"><i class="icon icon-calendar"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="span6">
                                            <b>Completion Date:</b>
                                            <div class="form-group input-group">

                                                <asp:TextBox ID="txtCompletionDate" Type="Date" CssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                                <span class="input-group-addon"><i class="icon icon-calendar"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span6">
                                            <b>Price:</b>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon"><i class="icon icon-dollar"></i>
                                                </span>
                                                <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">

                                        <div class="span12">
                                            <b>Contract Term</b>

                                            <asp:TextBox ID="txtTerms" runat="server" TextMode="MultiLine" Height="200px" Width="100%" MaxLength="4000"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12">
                                            <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
                                            <asp:Button ID="btnSendContract" runat="server" OnClientClick="javascript: confirm('Are you sure send contract ?')" Text=" Send Contract " Visible="false" CssClass="btn btn-success " OnClick="btnSendContract_Click" />
                                            <asp:Button ID="btnUpdateContract" runat="server" Text=" Update Contract " Visible="false" CssClass="btn btn-success " OnClick="btnUpdateContract_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text=" Cancel Contract " Visible="false" CssClass="btn btn-success " OnClick="btnCancel_Click" />
                                            <asp:Button ID="btnHold" runat="server" Text=" Hold Contract " Visible="false" CssClass="btn btn-success " OnClick="btnHold_Click" />
                                            <asp:Button ID="btnProcessAgain" runat="server" Text=" Process Again " Visible="false" CssClass="btn btn-success " OnClick="btnProcessAgain_Click" />

                                        </div>
                                    </div>
                                </div>
                                <div id="acceptContract" runat="server" visible="false">
                                    <div class="row-fluid nomargin">
                                        <div class="span6">
                                            <b>Start Date:</b>
                                            <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                                        </div>
                                        <div class="span6">
                                            <b>Completion Date:</b>
                                            <asp:Label ID="lblCompletionDate" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span6">
                                            <b>Price:</b>
                                            <asp:Label ID="lblPrice" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">

                                        <div class="span12">
                                            <b>Contract Term</b>
                                            <asp:Label ID="lblTerms" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnAccept" OnClientClick="javascript: confirm('Are you sure accept contract ?')" runat="server" Visible="false" Text=" Accept Contract " CssClass="btn btn-success " OnClick="btnAccept_Click" />
                                </div>
                            </div>
                            <div class="span6" id="divjobnotfound" runat="server" visible="false">
                                <br />
                                <br />
                                <h3 class="aligncenter">Job Details not found !!!</h3>
                                <br />
                                <br />
                            </div>
                            <div class="span3" data-id="id-0" data-type="design">
                                <div class="team-box thumbnail">
                                    <div class="profilephoto">
                                        <asp:HiddenField ID="HiddenHirerID" runat="server" />
                                        <img id="imgHirer" runat="server" height="150" class="pull-left" />
                                    </div>
                                    <div class="caption">
                                        <h5>
                                            <span id="Span1" runat="server"></span>&nbsp;
                                            <asp:Label ID="lblHirerName" runat="server" CssClass="text-center"></asp:Label></h5>
                                        <br />
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span8">
                                            <b>Total Contracts:</b>
                                            <asp:Label ID="lblToContract" runat="server"></asp:Label><br />
                                            <b>Total Crews:</b>
                                            <asp:Label ID="lblToCrews" runat="server"></asp:Label><br />
                                        </div>
                                        <div class="span2" runat="server" id="Div1" visible="false">
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <%-- <b>Location</b><br />
                                    <!--1. Location 2. Address 3.City and Country -->
                                    <asp:Label ID="Label3"  Text="My Location" runat="server"></asp:Label><br />
                                    <asp:Label ID="Label4" Text="My Address" runat="server"></asp:Label><br />
                                    <asp:Label ID="Label5" Text="My City Indore-452001" runat="server"></asp:Label><br />--%>
                                </div>
                                <div class="team-box thumbnail">
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
