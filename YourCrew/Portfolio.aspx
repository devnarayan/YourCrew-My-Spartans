<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Portfolio.aspx.cs" Inherits="Portfolio" %>

<%@ Register Src="~/album.ashx" TagPrefix="photo" TagName="album" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Contractor Profile
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
    <link href="js/slider/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="js/slider/1/js-image-slider.js" type="text/javascript"></script>
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

                                        var row = "<img src='ProfileContractor/UploadSlider/" + HiddenField1.Value + "/" + list[i].ToString() + "' width='100%' height='100%' />";
                                        
                                        Response.Write(row);
                                    }
                                    
                                %>
                                        <a href="#">
                                            <img src="images/slider/images/image-slider-1.jpg" alt="Welcome to Your Crew" />
                                        </a>
                                        <img src="images/slider/images/image-slider-2.jpg" alt="" />
                                        <img src="images/slider/images/image-slider-3.jpg" alt="Pure Javascript. No jQuery. No flash." />
                                        <img src="images/slider/images/image-slider-4.jpg" alt="#htmlcaption" />
                                        <img src="images/slider/images/image-slider-5.jpg" />
                                    </div>
                                    <div id="htmlcaption" style="display: none;">
                                        <%--<em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.--%>
                                    </div>
                                </div>
                                <%--<div class="headerProfile">     </div>--%>
                            </div>
                        </div>
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
                        <div class="row-fluid nomargin">
                            <!-- Item Project and Filter Name -->
                            <div class="span3" data-id="id-0" data-type="design">
                                <div class="team-box thumbnail text-left">
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
                            </div>
                            <div class="span9">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:LinkButton CssClass="btn btn-info" Text="Messages" PostBackUrl="#" runat="server" ID="lbtnSendTofriend"><i class="icon icon-forward" ></i> Send To Friend &nbsp;&nbsp;</asp:LinkButton>
                                        </td>
                                        <td>
                                            <a id="website" class="btn btn-info" runat="server" target="_blank"><i class="icon icon-info"></i>My Website &nbsp;&nbsp;</a>
                                        </td>
                                        <td>
                                            <asp:LinkButton Visible="false" CssClass="btn btn-primary aligncenter" Text="Messages" PostBackUrl="~/ProfileContractor/BusinessPlan.aspx" runat="server" ID="lbtnUpgrade"><i class="icon icon-signal" ></i> Upgrade &nbsp;&nbsp;</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton CssClass="btn btn-info " Text="Messages" PostBackUrl="#" runat="server" ID="lbtnEmail" Visible="false"><i class="icon icon-envelope" ></i> Email Us &nbsp;&nbsp;</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <%--<asp:Button ID="btnEditJobTitle" runat="server" CssClass="btn btn-mini btn-info js-open-popup-join js-gtm-event pull-right" Text="Edit" OnClick="btnEditJobTitle_Click" />--%>
                                <article class="type-page hentry clearfix ">
                                    <p class="team-box thumbnail" style="height:260px">
                                        <a href="#" title="info" style="font-size: x-large">&nbsp;About</a>
                                        <asp:Label ID="lblDescription" runat="server" Width="100%" Height="100%" CssClass="text-left"></asp:Label>
                                    </p>
                                    <table>
                                        <tr>
                                            <td class="noti_Container1">
                                                <asp:LinkButton CssClass="btn btn-success" Text="Work History" runat="server" ID="btnWork"><i class="icon icon-flag"></i> Work History</asp:LinkButton>
                                            </td>
                                            <td class="noti_Container2">
                                                <asp:LinkButton CssClass="btn btn-primary" PostBackUrl="~/ProfileContractor/ContractorPhoto.aspx" Text="Photos" runat="server" ID="btnPhoto"><i class="icon icon-picture"></i> Photos</asp:LinkButton>
                                            </td>
                                            <td class="noti_Container">
                                                <asp:LinkButton CssClass="btn btn-primary" PostBackUrl="~/ProfileContractor/ContractorVideo.aspx" Text="Videos" runat="server" ID="btnVideo"><i class="icon icon-play"></i> Video</asp:LinkButton>
                                            </td>
                                            <td class="noti_Container1">
                                                <asp:LinkButton CssClass="btn btn-primary" Text="Comments" PostBackUrl="~/ProfileContractor/ContractorComments.aspx" runat="server" ID="btnComments"><i class="icon icon-comment" ></i> Comments</asp:LinkButton>
                                                <div id="commentnotify" runat="server" class="noti_bubble">
                                                    3
                                                </div>
                                            </td>
                                            <td class="noti_Container1">
                                                <asp:LinkButton CssClass="btn btn-primary" Text="Messages" PostBackUrl="~/ProfileContractor/Invitation.aspx" runat="server" Visible="false" ID="btnInvite"><i class="icon icon-envelope" ></i> Invite Contractor &nbsp;</asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-primary" Text="Messages" PostBackUrl="~/Chat/Communication.aspx" runat="server" Visible="false" ID="btnMessage"><i class="icon icon-envelope" ></i> Messages &nbsp;</asp:LinkButton>
                                                <div id="notifymessage" runat="server" visible="false" class="noti_bubble">2</div>
                                            </td>
                                        </tr>
                                    </table>
                                </article>
                            </div>
                        </div>
                        <div class=" team-box thumbnail">
                            <div class="row-fluid nomargin">
                                <div class="span3 text-left">
                                    <b class="text-center">Experties</b>
                                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                        <EmptyDataTemplate>
                                            <br />
                                            No Experience submitted.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="color: green">
                                                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [Value] FROM [Profile] WHERE (([ContractorID] = @ContractorID) AND ([Type] = @Type)) ORDER BY [Value]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="ContractorID" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="Experties" Name="Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="span3">
                                    <b>
                                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                        Descriptions</b>
                                    <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">

                                        <EmptyDataTemplate>
                                            <br />
                                            Work Category description no found
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="">
                                                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>

                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [Value] FROM [Profile] WHERE (([ContractorID] = @ContractorID) AND ([Type] = @Type)) ORDER BY [Value]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="ContractorID" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="Category" Name="Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="span3">
                                    <b>Projects</b>
                                    <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4">
                                        <EmptyDataTemplate>
                                            <br />
                                            Projects not provided.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="">
                                                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [Value] FROM [Profile] WHERE (([ContractorID] = @ContractorID) AND ([Type] = @Type)) ORDER BY [Value]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="ContractorID" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="Project" Name="Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="span3">
                                    <b>Clients</b>
                                    <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5">
                                        <EmptyDataTemplate>
                                            <br />
                                            Clients proifle not added.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="">
                                                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                            <%-- <div style="">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>--%>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [Value] FROM [Profile] WHERE (([ContractorID] = @ContractorID) AND ([Type] = @Type)) ORDER BY [Value]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="ContractorID" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="Client" Name="Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <asp:HiddenField ID="Hiddencontractorid" runat="server" />
                                </div>
                            </div>
                            <div class="row-fluid nomargin">
                                <div class="span3 text-left">
                                </div>
                                <div class="span3">
                                    <b>
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                        Descriptions</b>
                                    <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource3">

                                        <EmptyDataTemplate>
                                            <br />
                                            Work Category description no found
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="">
                                                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>

                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [Value] FROM [Profile] WHERE (([ContractorID] = @ContractorID) AND ([Type] = @Type)) ORDER BY [Value]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="ContractorID" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="Category" Name="Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="span3">
                                    <b>Projects</b>
                                    <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource4">
                                        <EmptyDataTemplate>
                                            <br />
                                            Projects not provided.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="">
                                                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [Value] FROM [Profile] WHERE (([ContractorID] = @ContractorID) AND ([Type] = @Type)) ORDER BY [Value]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="ContractorID" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="Project" Name="Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="span3">
                                    <b>Clients</b>
                                    <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource5">
                                        <EmptyDataTemplate>
                                            <br />
                                            Clients proifle not added.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="">
                                                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                            <%-- <div style="">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>--%>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [Value] FROM [Profile] WHERE (([ContractorID] = @ContractorID) AND ([Type] = @Type)) ORDER BY [Value]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="ContractorID" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="Client" Name="Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                    <asp:HiddenField ID="HiddenField3" runat="server" />
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

