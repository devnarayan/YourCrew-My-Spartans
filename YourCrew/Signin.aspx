<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Signin.aspx.cs" Inherits="Signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Register Hirer
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
    <script type="text/javascript">
        function btnback_click() {
            document.getElementById("divprofile").style.display = "none";
            document.getElementById("lbtnHirer").style.display = "block";
            document.getElementById("lbtnContractor").style.display = "block";
            document.getElementById("divhirer").style.display = "block";
            document.getElementById("divcontractor").style.display = "block";
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
                        <div class="row-fluid nomargin" id="div1" runat="server">
                            <div class="span3"></div>
                            <div class="span6">
                                <div class="team-box thumbnail">

                                    <div id="sendmessage">
                                        Your message has been sent. Thank you!
                                    </div>
                                    <div class="row-fluid nomargin" id="divhirer" runat="server">
                                        <div class="span12">
                                            <img src="images/Hirer.png" title="Hirer" class="pull-left" />
                                            <h2>I need a crew</h2>
                                            <p>Find Contractor, Post Job, Get Hire</p>
                                        </div>
                                    </div>
                                    <%--  <div class="row"><div class="span12">
                                <div class="pull-left"><button id="btnback" onclick="btnback_click()" class="btn btn-theme btn-medium" title="Back" type="button">Back</button></div>
                                             </div></div>--%>

                                    <h4>Your Crews Registration</h4>


                                    <div class="row-fluid nomargin">
                                        <div class="span6">
                                         <label>First Name:</label>   
                                            <asp:TextBox ID="txtName" Width="100%" runat="server" placeholder="* Enter Hirer First Name" MaxLength="50" required></asp:TextBox>
                                        </div>
                                        <div class="span6 field">
                                          <label> Last Name:</label> 
                                            <asp:TextBox ID="txtLastName" Width="100%" runat="server" placeholder="* Enter your Last name" MaxLength="50" required ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                          <label> User Name</label> 
                                            <asp:TextBox ID="txtUserName" Width="100%" runat="server" placeholder="* User Name" MaxLength="30" required ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span6 field">
                                         <label>   Password:</label>
                                            <asp:TextBox ID="txtPassword" Width="100%" runat="server" TextMode="Password" MaxLength="50"  placeholder="* Enter Password" required></asp:TextBox>
                                        </div>
                                        <div class="span6 field">
                                            <label>Confirm Password:</label>
                                            <asp:TextBox ID="txtConfirmPassword" Width="100%" runat="server" MaxLength="50" TextMode="Password" placeholder="*  Confirm Password"  required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                           <label>Email ID:</label> 
                                            <asp:TextBox ID="txtEmail" runat="server" Width="100%" Type="email" MaxLength="100" placeholder="* Enter your email address" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span6 field">
                                            <label>Country:</label>
                                            <asp:DropDownList ID="ddlCountry" Width="100%" runat="server" DataSourceID="SqlDataSource1" DataTextField="CountryName" DataValueField="CountryID"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString2 %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [CountryMaster]"></asp:SqlDataSource>
                                        </div>
                                        <div class="span6 field">
                                            <label>City/Town:</label>
                                            <asp:DropDownList ID="ddlCity" runat="server" Width="100%"></asp:DropDownList>
                                        </div>
                                    </div>
                                     <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                            <label>Location/Land Mark:</label>
                                            <asp:TextBox ID="txtLocation" runat="server" Width="100%" placeholder="* Enter your area location name" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                            <label>Address:</label>
                                            <asp:TextBox ID="txtAddress" runat="server" Width="100%" MaxLength="100" placeholder="* Please enter address"></asp:TextBox>
                                        </div>
                                    </div>
                                   <div class="row-fluid nomargin">
                                        <div class="span12 margintop10 field">
                                            <label>Contact No: </label>
                                            <asp:TextBox ID="txtContactno" min="0" runat="server" Width="100%" MaxLength="15" Type="number" placeholder="Enter your contact no"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 margintop10 field">
                                            <p>
                                                <asp:Label ID="lblSinginError" runat="server" ForeColor="Red"></asp:Label><br />
                                                <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-theme btn-medium margintop10 pull-left" OnClick="btnRegister_Click" Text="Register" />
                                                <span class="pull-right margintop20">* Please fill all required form field, thanks!</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="span3"></div>
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
