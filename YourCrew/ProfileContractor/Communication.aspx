<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Communication.aspx.cs" Inherits="ProfileContractor_Communication" %>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <div class="row-fluid nomarginmarginbot10">
                            <h4 class="title">Your Crew <strong>Communication</strong>  <strong><b>
                                <asp:Label ID="lblCityName" ForeColor="Green" runat="server"></asp:Label></b></strong></h4>
                            <div class="">
                                <div class="span2 team-box">
                                    <br />
                                    <asp:Button ID="btnNewMsg" runat="server" Text="New Message" CssClass="btn btn-success" OnClick="btnNewMsg_Click" />
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="lbtnInbox" runat="server" Text="Inbox" OnClick="lbtnInbox_Click"><i class="icon icon-envelope"></i> Inbox</asp:LinkButton><br />
                                    <br />
                                    <asp:LinkButton ID="lbtnSent" runat="server" Text="Sent" OnClick="lbtnSent_Click"><i class="icon icon-trash"></i> Sent</asp:LinkButton><br />
                                    <br />
                                    <asp:LinkButton ID="lbtnArchive" runat="server" Text="Sent" OnClick="lbtnArchive_Click"><i class="icon icon-user"></i> Archive</asp:LinkButton><br />
                                </div>
                            </div>
                            <div class="span10 team-box">
                                <asp:Repeater ID="repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                            <div class="row-fluid nomargin">
                                                <a href="Communication.aspx?id=<%# Eval("JOBID") %>">
                                                    <div class="span2">
                                                        <img src="<%# Eval("PhotoURL") %>" id="pics" alt="" class="thumbnail pull-left" />
                                                    </div>
                                                    <div class="span2 text-left">
                                                        <b><%# Eval("HirerName") %> </b>
                                                        <br />
                                                        <span><%# Eval("PostDate") %></span>
                                                    </div>
                                                    <div class="span7 text-left">
                                                        <p><%# Eval("JobTitle") %></p>
                                                        <span><%# Eval("Message") %></span> &nbsp;&nbsp;&nbsp;
                                                    </div>
                                                </a>
                                                <hr />
                                            </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                    <asp:HiddenField ID="ProfileID" runat="server" />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="select Communication.CommID, Communication.JobID,Communication.PostDate,ProfileHirer.HirerName,ProfileHirer.PhotoURL,Communication.Message,ContractInfo.JobTitle from  ContractInfo inner join Communication on ContractInfo.JobID=Communication.JobID inner join ProfileHirer  on ProfileHirer.HirerID=Communication.SendTo where CommID in(select max(CommID) as CommID from Communication where sendfrom=29 group by JobID  having count(JobID)>=1)  order by Communication.PostDate desc">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblMessage" Name="ContractorID" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div id="Message" runat="server">
                                    <asp:Repeater ID="repeater2" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate>
                                            <li>
                                                <div class="row-fluid">
                                                    <div class="span2 text-left">
                                                        <p><%# Eval("JobTitle") %></p>
                                                        <span>Posted: <%# Eval("PostDate") %> </span>
                                                    </div>
                                                    <div class="span7 text-left">
                                                        <p><%# Eval("JobTitle") %></p>
                                                        <span><%# Eval("Message") %></span> &nbsp;&nbsp;&nbsp;
                                                    </div>
                                                </div>
                                                <div class="row-fluid nomargin">
                                                    <div class="span9">
                                                        <hr />
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT    
                                            TOP (4)  JobTitle , Hours as Name, Budget as Count, PostDate, Status, CategoryID as id, Attachment,Description as Message
FROM            dbo.Jobs order by PostDate desc"></asp:SqlDataSource>
                                    <div class="row">
                                        <div class="span1 align-left">
                                            <label for="txtTo">Message</label></div>
                                        <div class="span6 text-left">
                                            <asp:TextBox ID="txtMessage" Columns="50" Width="100%" Rows="5" TextMode="MultiLine" runat="server" CssClass="input-xlarge"></asp:TextBox></div>
                                    </div>
                                    <div class="row">
                                        <div class="span1">
                                            <label for="txtTo">Attachment</label></div>
                                        <div class="span6 align-left"></div>
                                    </div>
                                    <div class="row">
                                        <div class="span1">
                                            <asp:Button ID="btnSend" runat="server" Text="Reply" OnClick="btnSend_Click" CssClass="btn btn-primary" /></div>
                                        <div class="span6">
                                            <asp:Label ID="lblMessage" runat="server"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div><br />
                        <div class="row-fluid nomargin team-box thumbnail">
                            <div class="span12">
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
