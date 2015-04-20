<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="FindJob.aspx.cs" Inherits="ProfileContractor_FindJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">Find Job
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function showvalue(val) {
            document.getElementById("range").innerText = val;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                <div class="row-fluid">
                    <div class="span3">
                        <aside class="left-sidebar">
                            <div class="widget">
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn btn-theme pull-right" />
                                <div class="">
                                    <br />
                                    Country:<br />
                                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="input-large" Width="100%" AutoPostBack="True" DataSourceID="CountryDataSource2" DataTextField="CountryName" DataValueField="Countryid">
                                        <asp:ListItem Value="" Text="All"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CountryDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="spGetCountry" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                  <br />  City:<br />
                                    <asp:DropDownList ID="ddlState" runat="server"  CssClass="input-large" Width="100%" AutoPostBack="True" DataSourceID="CityDataSource2" DataTextField="City" DataValueField="City">
                                        <asp:ListItem Value="" Text="All"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CityDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT DISTINCT [City] FROM [ProfileContractor] WHERE ([CountryID] = @CountryID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCountry" Name="CountryID" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    Location<br />
                                    <asp:DropDownList ID="ddlLocation" runat="server"  CssClass="input-large" Width="100%" DataSourceID="LocationDataSource2" DataTextField="Location" DataValueField="Location">
                                        <asp:ListItem Value="" Text="All"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="LocationDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT DISTINCT [Location] FROM [ProfileContractor] WHERE ([City] = @City)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlState" Name="City" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    Zip code:<br />
                                    <asp:TextBox ID="txtPostcode"  CssClass="input-large" Width="100%" runat="server"></asp:TextBox><br />
                                </div>
                                <div class="accordion" id="accordion2">
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle active" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                                <i class="icon-minus"></i>Additional Search </a>
                                        </div>
                                        <div id="collapseOne" class="accordion-body">
                                            <div class="accordion-inner">
                                                <b>Budget</b><br />
                                                <asp:TextBox ID="txtBudget" Width="100%" runat="server"></asp:TextBox><br />
                                                <b>Billing</b><br />
                                                <input type="checkbox" name="hoursbilled" dir="ltr" id="chkHoursBilled" value="HoursBilled" title="Hours Billed">
                                                Hours Billed<br />
                                                <input type="checkbox" name="FixedPrice" id="chkFixedPrice" dir="ltr" value="FixedPrice" role="checkbox" title="Fixed Price" />
                                                Fixed Price
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnSearchbelow" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn btn-theme pull-right" />
                            </div>

                            <div class="widget">
                                <div class="tabs">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#one" data-toggle="tab"><i class="icon-star"></i>Recent Post</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="one">
                                            <ul class="popular">
                                                <asp:Repeater ID="repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                    <ItemTemplate>
                                                        <li>
                                                            <%--<img src="../img/dummies/blog/small/1.jpg" alt="" class="thumbnail pull-left" />--%>
                                                            <p><a href="<%# Eval("CategoryID") %>"><%# Eval("JobTitle") %></a></p>
                                                            <span>Budget: <%# Eval("Budget") %></span> &nbsp;&nbsp;&nbsp;
                                                    <span>Time:<%# Eval("Hours") %></span><br />
                                                            <span>Posted: <%# Convert.ToDateTime(Eval("PostDate")).ToString("MM/dd/yyyy") %> </span>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT        TOP (4)  JobTitle, Hours, Budget, PostDate, Status, CategoryID, Attachment,Description
FROM            dbo.Jobs order by PostDate desc"></asp:SqlDataSource>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </div>
                    <div class="span8 nomargin">

                        <div class="input-append">
                        <i class="icon-filter icon-2x"></i>
                            <asp:DropDownList ID="ddlCategory" Width="30%" CssClass="input-large" runat="server"></asp:DropDownList>
                            <asp:TextBox ID="txtSearch" runat="server" Width="30%" ></asp:TextBox>
                           <asp:LinkButton ID="lbtnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-success"><i class="icon icon-search"></i> Search</asp:LinkButton>
                        </div>
                       <br />

                        <asp:ListView ID="datalistShowJobs"
                            GroupItemCount="1" OnItemCommand="ProductsListView_ItemCommand"
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
                            <ItemTemplate>
                                <div class="span3">
                                    <img src='../<%# Eval("PhotoURL") %>' />
                                </div>
                                <div class="span9">
                                    <asp:Label ID="lbl_FJ_JobTitle" CssClass="nomargin text-info text-before-title" Font-Bold="true" Font-Size="Large" runat="server" Text='<%# Eval("JobTitle") %>'></asp:Label><br />

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
                                                <asp:Button ID="btnHireMe" runat="server" Text="Apply Job" CommandName="Apply" CssClass="btn btn-theme btn-mini  pull-right" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:HiddenField ID="HF_FJ_JID" runat="server" Value='<%#Eval("JID") %>'></asp:HiddenField>

                                </div>
                            </ItemTemplate>
                            <ItemSeparatorTemplate>
                                <div class="itemSeparator divider" runat="server"></div>
                            </ItemSeparatorTemplate>
                        </asp:ListView>
                        <div class="pull-right">
                            <asp:DataPager runat="server" ID="BeforeListDataPager"
                                PagedControlID="datalistShowJobs"
                                PageSize="20">
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
                        </div>
                    </div>
                    <!-- end span7 --->
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