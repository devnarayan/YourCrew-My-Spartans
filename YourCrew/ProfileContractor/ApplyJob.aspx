<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="ApplyJob.aspx.cs" Inherits="ProfileContractor_ApplyJob" %>

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
                       <div class="row-fluid nomargin">
                           <div class="span9">

                          
                <div class="row nomargin">
                    <div class="span12">
                        <h3>Apply for Contract</h3>
                        <h5 class="text-info">
                            <asp:Label ID="lblJobTitle" runat="server" Text="Label"></asp:Label>
                        </h5>
                        <asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row nomargin">
                    <div class="span2">
                        Budget
                                   <asp:Label ID="lblBudget" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="span2">
                        Hours
                                   <asp:Label ID="lblHours" runat="server" Text="Label"></asp:Label>
                    </div>

                    <div class="span6 pull-right">
                        Date
                             <asp:Label ID="lblPostedDate" CssClass="pull-right" runat="server" Text="Label"></asp:Label>
                        &nbsp; To &nbsp;
                                     <asp:Label ID="lblExpDate" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

                <div class="row nomargin">
                    <div class="span4">
                        Posted By
                             <asp:Label ID="lblFName" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblLName" runat="server" Text="Label"></asp:Label>
                        <br />
                        City: 
                             <asp:Label ID="lblCity" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="span6 pull-right">
                        <asp:LinkButton ID="lbDownload" runat="server" OnClick="lbDownload_Click"> 
                                      <i class="icon-paper-clip icon-2x"></i>
                                       Download</asp:LinkButton>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        Proposal Message:
                        <br />
                        <textarea name="text" spellcheck="true" maxlength="500" id="txtRepaly" cols="12" runat="server" rows="6" class="validate[required] input-block-level" data-rule="maxlen:50"></textarea>
                        <br />
                        Attach File:&nbsp;
                        <asp:FileUpload ID="FU_ApplyJob_AttachFile" runat="server" class="validate[required]"></asp:FileUpload>
                    </div>
                </div>
                <div class="row nomargin">
                    <div class="span5 field">
                        <asp:Button ID="Button1" runat="server" OnClick="btnApply_Click" CssClass="btn btn-theme btn-medium margintop10 pull-left" Text="Apply Job" />
                    </div>
                    <div class="span4">
                        <a id="attachment" runat="server" target="_blank"></a>
                    </div>
                </div>
                                </div>
                          <div class="span3" data-id="id-0" data-type="design">
                                <div class="team-box thumbnail">
                                    <div class="profilephoto">
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
                                    <b>Location</b><br />
                                    <!--1. Location 2. Address 3.City and Country -->
                                    <asp:Label ID="Label3" Text="My Location" runat="server"></asp:Label><br />
                                    <asp:Label ID="Label4" Text="My Address" runat="server"></asp:Label><br />
                                    <asp:Label ID="Label5" Text="My City Indore-452001" runat="server"></asp:Label><br />
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

