<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="FindCrew.aspx.cs" Inherits="ProfileHirer_FindCrew" %>

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
                                        <div class="">
                                            Country:<br />
                                            <asp:DropDownList ID="ddlCountry" Width="100%" CssClass="input-large" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="CountryName" DataValueField="Countryid"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="spGetCountry" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            <br />
                                            City:<br />
                                            <asp:DropDownList ID="ddlState" Width="100%" CssClass="input-large" AutoPostBack="false" runat="server" DataSourceID="STATEDataSource3" DataTextField="City" DataValueField="City"></asp:DropDownList>
                                            <asp:SqlDataSource ID="STATEDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="select distinct(City) from ProfileContractor where CountryID=@CountryID">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlCountry" DefaultValue="us" Name="CountryID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <br />
                                            Location<br />
                                            <asp:DropDownList ID="ddlLocation" Width="100%" CssClass="input-large" AutoPostBack="true" runat="server" DataSourceID="LocationDataSource3" DataTextField="Location" DataValueField="Location"></asp:DropDownList>
                                            <asp:SqlDataSource ID="LocationDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="select distinct(Location) from ProfileContractor where CountryID=@CountryID and City=@City">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlCountry" DefaultValue="us" Name="CountryID" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="ddlState" DefaultValue="" Name="City" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <br />
                                            Zip code:<br />
                                            <asp:TextBox ID="txtPostcode" Width="100%" CssClass="input-large" runat="server"></asp:TextBox><br />
                                        </div>
                                        <div class="accordion" id="accordion2">
                                            <div class="accordion-group">
                                                <div class="accordion-heading">
                                                    <a class="accordion-toggle active" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                                        <i class="icon-minus"></i>Additional Search </a>
                                                </div>
                                                <div id="collapseOne" class="accordion-body">
                                                    <div class="accordion-inner">
                                                        <b>Ratings</b>
                                                        <label for="slider" id="range" class="ui-hidden-accessible">
                                                            0
                                                        </label>
                                                        <input type="range" width="100%" class="input-large" onchange="showvalue(this.value)" name="slider" aria-valuenow="3" id="slidstep" step=".5" value="0" min="0" max="5" /><br />
                                                        <b>Budget</b><br />
                                                        <asp:TextBox ID="txtBudget" Width="100%" CssClass="input-large" runat="server"></asp:TextBox><br />
                                                        Hours Billed:<br />
                                                        <asp:DropDownList ID="ddlHOuserBilled" Width="100%" CssClass="input-large" runat="server">
                                                            <asp:ListItem Value="AnyHours" Text="Any Hours" />
                                                            <asp:ListItem Value="1Hr" Text="At least 1 Hr or $8 earned" />
                                                            <asp:ListItem Value="100Hr" Text="At least 100 Hours" />
                                                            <asp:ListItem Value="1000Hr" Text="At least 1000 Hours" />
                                                        </asp:DropDownList><br />
                                                        Last Activity:<br />
                                                        <asp:DropDownList ID="ddlLastActivity" Width="100%" CssClass="input-large" runat="server">
                                                            <asp:ListItem Value="AnyTime" Text="Any Time"></asp:ListItem>
                                                            <asp:ListItem Value="Within2Week" Text="With in 2 week" />
                                                            <asp:ListItem Value="Within2Month" Text="With in 2 months" />
                                                            <asp:ListItem Value="Within6Month" Text="With in last 6 months only"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Button ID="btnSearchbelow" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn btn-theme pull-right" />
                                    </div>
                                </aside>
                                <aside class="left-sidebar">
                                    <div class="widget">
                                        <h5 class="widgetheading">Usefull Links</h5>
                                        <ul class="cat">
                                            <li><i class="icon-angle-right"></i><a href="FindCrew.aspx">Find Contractor</a><span> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="PostJob.aspx">Post New Job</a><span> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="PostedJob.aspx">Job Posted</a><span class="circle"> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="ActiveProject.aspx" class="text-info">Active Project</a><span class="circle"> </span></li>
                                            <li><i class="icon-angle-right"></i><a href="ProfileHirer.aspx">Completed Project</a><span class="circle"> </span></li>
                                        </ul>
                                    </div>
                                </aside>
                            </div>
                            <div class="span9">
                                <h5>Search Contractor</h5>
                                <div class="input-append">
                                    <i class="icon-filter icon-2x"></i>
                                    <asp:DropDownList ID="ddlCategory" runat="server" Width="30%" CssClass="input-large" DataSourceID="CategoryDataSource3" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="CategoryDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster]"></asp:SqlDataSource>
                                    <asp:TextBox ID="txtSubCategory" Width="30%" runat="server"></asp:TextBox>
                                    <button class="btn btn-theme" type="submit">Search</button>

                                </div>
                                <br />
                                <asp:DataList ID="DL_FJ_BindDL" runat="server"
                                    OnItemCommand="DL_FJ_BindDL_ItemCommand" Width="100%">
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td rowspan="3" class="style2">
                                                    <asp:Image ID="Image1" runat="server" Height="100px" Width="150px" ImageUrl='<%#Eval("PhotoURL") %>' BorderStyle="Solid" BorderWidth="2px" />
                                                </td>
                                                <td colspan="3">
                                                    <h1>
                                                        <asp:Label ID="lbl_FJ_JobTitle" runat="server" Text='<%# Eval("JobTitle") %>' Font-Size="16px"></asp:Label></h1>
                                                    <asp:HiddenField ID="HF_FJ_JID" runat="server" Value='<%#Eval("JID") %>'></asp:HiddenField>
                                                    <asp:HiddenField ID="HF_FJ_HirerId" runat="server" Value='<%#Eval("HirerID") %>'></asp:HiddenField>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Expected Hours -<asp:Label ID="lbl_FJ_Hours" runat="server" Text='<%# Eval("Hours") %>' Font-Size="16px"></asp:Label>
                                                </td>
                                                <td>Budegt -
                                            <asp:Label ID="lbl_FJ_Budget" runat="server" Text='<%# Eval("Budget") %>' Font-Size="16px"></asp:Label>
                                                </td>
                                                <td>Post Date -<asp:Label ID="lbl_FJ_PostDate" runat="server" Text='<%# Eval("PostDate") %>' Font-Size="16px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Posted By:<a href="../ProfileHirer/ProfileHirer.aspx?HirerID=<%#Eval("HirerID") %>"><asp:Label ID="lbl_FJ_HirerFName" runat="server" Text='<%#Eval("HirerName") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>&nbsp;
                     <asp:Label ID="lbl_FJ_HirerLName" runat="server" Text='<%#Eval("HirerLastName")%>' Font-Size="Medium" Font-Bold="True"></asp:Label></a>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnHireMe" runat="server" Text="Apply Job" CommandName="Hire" CssClass="btn btn-theme btn-medium margintop10 pull-left" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>

                                <div id="pagination">
                                    <span class="all">Page 1 of 3</span>
                                    <span class="current">1</span>
                                    <a href="#" class="inactive">2</a>
                                    <a href="#" class="inactive">3</a>
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
