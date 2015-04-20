<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContractorRegister.aspx.cs" Inherits="ContractorRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Add New Contractor
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="container">
                <section id="team">
                    <div id="thumbs">
                        <div class="row-fluid nomargin" id="divprofile" runat="server">
                            <div class="span3"></div>
                            <div class="span6">
                                <div class="team-box thumbnail">
                                     <div class="row-fluid nomargin" id="divhirer" runat="server">
                                            <div class="span12">
                                                <img src="images/Hirer.png" title="Hirer" class="pull-left" />
                                                <h2>I need a Hirer</h2>
                                                <p>Find Hirer, Post Profile, Get Earn</p>
                                            </div>
                                        </div>
                                    <h4>Your Crews Registration</h4>
                                    <div id="sendmessage">
                                        Your message has been sent. Thank you!
                                    </div>
                                   
                                    <div class="row-fluid nomargin">
                                        <div class="span12">
                                            <label>Full Name</label>
                                            <asp:TextBox ID="txtName" MaxLength="100" runat="server" placeholder="Enter your  name" Width="100%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                            <label>User Name:</label>
                                            <asp:TextBox ID="txtUserName" MaxLength="50" runat="server" Width="100%" placeholder="* User Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span6 field">
                                            <label>Password:</label>
                                            <asp:TextBox ID="txtPassword" MaxLength="50" runat="server" Width="100%" placeholder=" * Enter Password" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="span6 field">
                                            <label>Confirm Password</label>
                                            <asp:TextBox ID="txtConfirmPassword" runat="server" MaxLength="50" Width="100%" placeholder=" * Confirm your password" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                            <label>Email ID</label>
                                            <asp:TextBox ID="txtEmailID" runat="server" placeholder="* Enter your email address" Width="100%" MaxLength="100" Type="email"></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="row-flid nomargin" id="rowcategory" runat="server">
                                        <div class="span12">
                                            <label>Area of Expertise</label>
                                            <asp:DropDownList ID="ddlCategory" Width="100%" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] ORDER BY [CategoryID]"></asp:SqlDataSource>
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
                        <div class="row-fluid nomargin" id="divWork" visible="false" runat="server">
                            <div class="span3"></div>
                            <div class="span6">
                                <div class="team-box thumbnail">

                                    <h4>Your Crews Registration</h4>
                                   <div class="pull-right"><h6>Step-2 of 3</h6></div>
                                    <div class="row-flid nomargin" id="Div1" runat="server">
                                        <div class="span12">
                                        <asp:Label ID="lblWorkError" runat="server"></asp:Label>
                                    </div>
                                    </div>
                                    <div id="divContractorWork" runat="server">
                                        <div class="row-fluid nomargin" id="Div3" runat="server">
                                            <div class="span12">
                                               <label>Category of work:</label> 

                                                <asp:Label ID="lblPortfolioCategory" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row-fluid nomargin">
                                            <div class="span12">
                                                If you have <b>#Contractor No</b>, Enter Here<br />
                                                <asp:TextBox ID="txtContractor" runat="server" Width="100%" MaxLength="50" placeholder=" Contractor Licence"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row-fluid nomargin">
                                            <div class="span12">
                                              <label> Work Title or Company Name:</label> 
                                                <asp:TextBox ID="txtJobTitle" runat="server" Width="100%" Font-Bold="true" MaxLength="100"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row-fluid nomargin">
                                            <div class="span12 field">
                                            <label>    About:</label>
                                                <asp:TextBox ID="txtPortfolioWorkDescription" TextMode="MultiLine" runat="server" MaxLength="4000" Width="100%" Height="150px" ></asp:TextBox> 
                                            </div>
                                        </div>
                                        <div class="row-fluid nomargin">
                                            <div class="span12 field">
                                               <label>Per Hour Charge:</label> 
                                                <asp:TextBox ID="txtRate" runat="server" Type="number" min="0" placeholder="* Enter work charge par hour" Width="100%"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="row-fluid nomargin">
                                        <div class="span6 field">
                                            <label>Country:</label>
                                            <asp:DropDownList ID="ddlCountry" Width="100%" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="CountryName" DataValueField="CountryID"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString2 %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [CountryMaster]"></asp:SqlDataSource>
                                        </div>
                                        <div class="span6 field">
                                            <label>City/Town:</label>
                                            <asp:DropDownList ID="ddlCity" runat="server"  CssClass="input-large" Width="100%" AutoPostBack="True" DataSourceID="CityDataSource2" DataTextField="City" DataValueField="City">
                                        <asp:ListItem Value="" Text="All"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CityDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT DISTINCT [City] FROM [ProfileContractor] WHERE ([CountryID] = @CountryID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCountry" Name="CountryID" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
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
                                        <div class="span12 field">
                                          <label> Web Portal</label> 
                                            <asp:TextBox ID="txtWebSite" Width="100%" name="website" runat="server" placeholder="ex: http://www.domain.com"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                        <label>    Photo/Logo</label>
                                            <asp:FileUpload ID="fuPhoto" runat="server" ToolTip="Upload your pics/company logo" />
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="row-fluid nomargin">
                                        <div class="span12 field">
                                            <asp:Button ID="lbtnSubmit" OnClick="lbtnSubmit_Click" runat="server" CssClass="btn btn-theme btn-medium margintop10 pull-left" Text="Submit"></asp:Button>
                                        </div>
                                    </div>
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
