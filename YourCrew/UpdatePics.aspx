<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdatePics.aspx.cs" Inherits="UpdatePics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">Update Profile Pics
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <div class="team-box thumbnail">
                            <asp:HiddenField ID="HiddenContractorID" runat="server" />
                                     <div class="row-fluid nomargin" id="divhirer" runat="server">
                                            <div class="span12">
                                                <img src="images/Hirer.png" title="Hirer" class="pull-left" />
                                                <h2>Update Profile Logo</h2>
                                                <p></p><br /><br /><br />
                                           </div>
                                         <div class="span3"> <asp:FileUpload ID="fuPhoto" runat="server" ToolTip="Upload your pics/company logo" />
                                            </div>
                                         <div class="span2">
<asp:Button ID="btnSaveLogo" runat="server" Text="Save" CssClass="btn btn-primary"  OnClick="btnSaveLogo_Click"/>
                                         </div>
                                         <div class="span3">
                                              <div class="profilephoto">
                                        <img id="imgLogo" runat="server" height="150" class="pull-left" />
                                    </div>
                                         </div>
                                        </div>
                             <div class="row-fluid nomargin"  runat="server">
                                            <div class="span12">
                                               <hr />
                                                <h2>Update Profile Header Slide</h2>
                                                <p>Single Slide for Silver Membership Plan</p>
                                               <br />      </div>
                                  <div class="span3"> <asp:FileUpload ID="FileUpload2" runat="server" ToolTip="Upload your pics/company logo" />
                                            </div>
                                         <div class="span2">
<asp:Button ID="Button2" runat="server" Text="Save Slide-1" CssClass="btn btn-primary"  OnClick="btnSaveLogo_Click"/>
                                         </div>
                                        </div>
                           <div class="row-fluid nomargin">
                               <div class="span7"></div>
                               <div class="span2">
                                  <asp:Button ID="btnSkip" runat="server" OnClick="btnSkip_Click" Text="Skip" CssClass="btn btn-default pull-right" />
                              </div>
                               <div class="span2">
                                <asp:Button ID="btnNext" runat="server" OnClick="btnSkip_Click" Text="Next" CssClass="btn btn-default" />
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

