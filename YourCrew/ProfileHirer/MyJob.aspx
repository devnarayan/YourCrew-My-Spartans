<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" AutoEventWireup="true" CodeFile="MyJob.aspx.cs" Inherits="ProfileHirer_MyJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Hirer || Your Crews
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
                                        <asp:Label ID="lblStatus" runat="server" Visible="false"></asp:Label>
                                    </div>
                                </article>
                                <article>
                                    <div class="post-heading">
                                        <h5>Contract Proposals</h5>
                                    </div>
                                    <asp:ListView ID="ListView1" GroupItemCount="1"
                                        DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand"
                                        runat="server" DataKeyNames="JID">
                                        <LayoutTemplate>
                                            <div id="itemPlaceholderContainer" runat="server">
                                                <div class="row-fluid nomargin">
                                                    <div class="span3 text-center  text-warning nomargin" style="font-weight: bolder">Contractor</div>
                                                    <div class="span5 text-center  text-warning" style="font-weight: bolder">Message</div>
                                                    <div class="span2 text-center  text-warning" style="font-weight: bolder">Date</div>
                                                    <div class="span1 text-center text-warning nomargin" style="font-weight:bolder"><i class="icon icon-link"></i></div>
                                                    <div class="span1 text-center text-warning" style="font-weight:bolder">Hire</div>
                                                </div>
                                                <div class="row" id="itemPlaceholder" runat="server">
                                                </div>
                                            </div>
                                        </LayoutTemplate>
                                        <EmptyDataTemplate>
                                            <div class="row-fluid">
                                                <div class="span12 text-center">
                                                    No Contractor Applied.....
                                                </div>
                                            </div>
                                        </EmptyDataTemplate>

                                        <ItemTemplate>
                                            <div class="row-fluid nomargin">
                                                <div class="span3">
                                                    <%# Eval("ContractorNo") %><br />
                                                    <a href="../Portfolio.aspx?id=<%# Eval("ContractorID") %>" target="_blank">
                                                        <asp:Label ID="JobTitleLink" Font-Bold="true" CssClass="text-info" Font-Size="Large" runat="server" Text='<%# Eval("FirstName") %>' CommandName="JobTitle"></asp:Label>
                                                    </a>
                                                </div>
                                                <div class="span5">
                                                    <asp:Label ID="JIDLabel" runat="server" Text='<%# Eval("Message") %>' />
                                                </div>
                                                <div class="span2">
                                                    <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("RequestDate","{0:MM-dd-yyyy}") %>' />
                                                </div>
                                                <div class="span1"><a href='<%# Eval("Attachment") %>' target="_blank"><i class="icon icon-download"></i></a></div>
                                                <div class="span1"><a href='../JobInfo.aspx?cid=<%# Eval("ContractorID") %>&jid=<%# Request.QueryString["jid"] %>' class="btn btn-warning">Hire Me</a></div>
                                            </div>
                                        </ItemTemplate>
                                        <ItemSeparatorTemplate>
                                            <div class="divider"></div>
                                        </ItemSeparatorTemplate>
                                    </asp:ListView>

                                    <!-- The second DataPager control. -->
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>"
                                        SelectCommand="select JobApply.JID, ProfileContractor.ContractorID, ProfileContractor.ContractorNo,ProfileContractor.FirstName,(SUBSTRING(JobApply.Message,0,100)+'...') as Message, JobApply.Attachment, JobApply.RequestDate,JobApply.Status from JobApply inner join ProfileContractor on JobApply.ContractorID=ProfileContractor.ContractorID where JobApply.JID=@JID  order by JobApply.RequestDate desc">
                                        <SelectParameters>
                                            <asp:QueryStringParameter ConvertEmptyStringToNull="true" QueryStringField="jid" Name="JID" DefaultValue="0" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="row-fluid">
                                        <div class="span12">
                                            <div class="pull-right">
                                                <asp:DataPager runat="server" ID="DataPager2"
                                                    PagedControlID="ListView1"
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
                                                <asp:HiddenField ID="Hiddencontractorid" runat="server" />
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
