<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" AutoEventWireup="true" CodeFile="JobAppliced.aspx.cs" Inherits="ProfileContractor_JobAppliced" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
   Applied Contracts
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
                                <div class="team-box thumbnail">
                                     <ul>
                                        <li>
                                            <asp:LinkButton ID="lbtnJobApplied" runat="server" PostBackUrl="~/ProfileContractor/JobAppliced.aspx"><i class="icon icon-caret-right"></i> Contract Applied</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lbtnActiveJobs" runat="server" PostBackUrl="~/ProfileContractor/MyJobs.aspx"><i class="icon icon-caret-right"></i> Active Contract</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lbtnAllJobs" runat="server" PostBackUrl="~/ProfileContractor/MyJobs.aspx"><i class="icon icon-caret-right"></i> All Contract</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lbtnJobProposals" runat="server" PostBackUrl="~/ProfileContractor/JobPropoal.aspx"><i class="icon icon-caret-right"></i> Contract Proposals</asp:LinkButton></li>
                                    </ul>
                                </div>
                            </div>
                            <asp:HiddenField ID="Hiddencontractorid" runat="server" />
                            <div class="span9">
                                <asp:ListView ID="listJobPropoal" GroupItemCount="1"
                                    OnItemCommand="datalistShowJobs_ItemCommand"
                                    runat="server">
                                    <LayoutTemplate>
                                        <div class="span12">
                                            <div id="groupPlaceholder" runat="server"></div>
                                        </div>
                                    </LayoutTemplate>
                                    <GroupTemplate>
                                        <div class="span12">
                                            <div id="itemPlaceholder" runat="server">
                                            </div>
                                        </div>
                                    </GroupTemplate>
                                    <GroupSeparatorTemplate>
                                        <div class="span12">
                                            <div class="groupSeparator" runat="server">
                                            </div>
                                        </div>
                                    </GroupSeparatorTemplate>
                                    <EmptyDataTemplate>
                                        <div class="row-fluid">
                                            <div class="span12 text-center">
                                            </div>
                                        </div>
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <div class="row-fluid nomargin">
                                            <div class="span12">
                                        <h5> Contract Proposals</h5>
                                                <asp:Label ID="lbl_FJ_JobTitle" CssClass="nomargin text-info text-before-title" Font-Bold="true" Font-Size="Large" runat="server" Text='<%# Eval("JobTitle") %>'></asp:Label><br />
                                                <asp:Label ID="lblDescriptin" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                <asp:HiddenField ID="HF_FJ_JID" runat="server" Value='<%#Eval("JID") %>'></asp:HiddenField>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <ItemSeparatorTemplate>
                                        <div class="divider"></div>
                                    </ItemSeparatorTemplate>
                                </asp:ListView>
                                <article>
                                    <div class="post-heading">
                                        <h5>Contract Applied</h5>
                                    </div>
                                    <asp:ListView ID="listAllJobs" GroupItemCount="1"
                                        OnItemCommand="listAllJobs_ItemCommand"
                                        runat="server">
                                        <LayoutTemplate>
                                            <div class="span12">
                                                <div id="groupPlaceholder" runat="server"></div>
                                            </div>
                                        </LayoutTemplate>
                                        <GroupTemplate>
                                            <div class="span12">
                                                <div id="itemPlaceholder" runat="server">
                                                </div>
                                            </div>
                                        </GroupTemplate>
                                        <GroupSeparatorTemplate>
                                            <div class="span12">
                                                <div class="groupSeparator" runat="server">
                                                    <hr>
                                                </div>
                                            </div>
                                        </GroupSeparatorTemplate>
                                        <EmptyDataTemplate>
                                            <div class="row-fluid">
                                                <div class="span12 text-center">
                                                    Not Applied For Any Contract.
                                                </div>
                                            </div>
                                        </EmptyDataTemplate>

                                        <ItemTemplate>
                                            <div class="row-fluid nomargin">
                                                <div class="span12">
                                                  <a href='../JobInfo.aspx?jid=<%# Eval("JID") %>' title='<%# Eval("JobTitle") %>' >  <asp:Label ID="lbl_FJ_JobTitle" CssClass="nomargin text-info text-before-title" Font-Bold="true" Font-Size="Large" runat="server" Text='<%# Eval("JobTitle") %>'></asp:Label>
                                                      </a><br />

                                                    <asp:Label ID="lblDescriptin" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lbl_FJ_Hours" Font-Bold="true" runat="server" Text='<%# Eval("JobType") %>' Font-Size="16px"></asp:Label>
                                                            </td>
                                                            <td>&nbsp;Budegt -
                                            <asp:Label ID="lbl_FJ_Budget" runat="server" Text='<%# Eval("Budget","{0:C}") %>' Font-Size="16px"></asp:Label>
                                                            </td>
                                                            <td>&nbsp;&nbsp;Post On -<asp:Label ID="lbl_FJ_PostDate" runat="server" Text='<%# Eval("PostDate","{0:MMM dd-yyy hh:mm tt}") %>' Font-Size="16px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">Posted By: <a target="_blank" href="../ProfileHirer/ProfileHirer?HirerID=<%#Eval("UserName") %>">
                                                                <asp:Label ID="lbl_FJ_HirerFName" runat="server" Text='<%#Eval("HirerName") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;
                     <asp:Label ID="lbl_FJ_HirerLName" runat="server" Text='<%#Eval("HirerLastName")%>' Font-Size="Medium" Font-Bold="True"></asp:Label></a>
                                                            </td>
                                                            <td>
                                                                <%--<asp:Button ID="btnHireMe" runat="server" Text="Apply Job" CommandName="Apply" CssClass="btn btn-theme btn-mini  pull-right" />--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:HiddenField ID="HF_FJ_JID" runat="server" Value='<%#Eval("JID") %>'></asp:HiddenField>

                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <ItemSeparatorTemplate>
                                            <div class="divider"></div>
                                        </ItemSeparatorTemplate>
                                    </asp:ListView>

                                    <!-- The second DataPager control. -->

                                    <div class="row-fluid">
                                        <div class="span12">
                                            <div class="pull-right">
                                                <asp:DataPager runat="server" ID="DataPager1"
                                                    PagedControlID="listAllJobs"
                                                    PageSize="3">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Image"
                                                            ShowFirstPageButton="true"
                                                            ShowNextPageButton="false"
                                                            ShowPreviousPageButton="false"
                                                            FirstPageImageUrl="~/img/first.png" />
                                                        <asp:NumericPagerField ButtonCount="10" />
                                                        <asp:NextPreviousPagerField ButtonType="Image"
                                                            ShowLastPageButton="true"
                                                            ShowNextPageButton="false"
                                                            ShowPreviousPageButton="false"
                                                            LastPageImageUrl="~/img/last.png" />
                                                    </Fields>
                                                </asp:DataPager>
                                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                            </div>
                                        </div>
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