<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="SignInHirer.aspx.cs" Inherits="SignInHirer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">Sign In Hirer
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
      <script type="text/javascript">
          function btnback_click() {
              document.getElementById("divprofile").style.display = "none";
              document.getElementById("lbtnHirer").style.display = "block";
              document.getElementById("lbtnContractor").style.display = "block";
              document.getElementById("divhirer").style.display = "block";
              document.getElementById("divcontractor").style.display = "block";
          }
        </script>
        <div id="wrapper">
            <section id="content">
                <div class="container" style="background-color:white;">
                    <div class="row" id="divusertype" runat="server"   style="background-color:white;">
                        <div class="span6" id="divhirer" runat="server" >
                            <img src="images/Hirer.png" title="Hirer" class="pull-left" />
                            <h2>I need a crew</h2>
                            <p>Find Contractor, Post Job, Get Hire</p>
                        </div>
                    </div>
                    <%--  <div class="row"><div class="span12">
                                <div class="pull-left"><button id="btnback" onclick="btnback_click()" class="btn btn-theme btn-medium" title="Back" type="button">Back</button></div>
                                             </div></div>--%>
                    <div class="row" id="divprofile" runat="server">
                        <div class="span8">
                            <h4>Your Crews Registration</h4>

                                <div id="sendmessage">
                                    Your message has been sent. Thank you!
                                </div>
                                <div class="row nomargin">
                                    <div class="span4">
                                        First Name<br />
                                        <input type="text" name="name" id="txtName" runat="server" placeholder="* Enter your First name" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span4 field">
                                        Last Name<br />
                                        <input type="text" name="name" id="txtLastName" runat="server" placeholder="* Enter your Last name" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                </div>
                                <div class="row nomargin">
                                    <div class="span8 field">
                                        User Name<br />
                                        <input type="text" name="name" id="txtUserName" runat="server" placeholder="* User Name" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                </div>
                                <div class="row nomargin">
                                    <div class="span4 field">
                                        Password:<br />
                                        <input type="password" name="name" id="txtPassword" runat="server" placeholder="* Enter Password" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span4 field">
                                        Confirm Password<br />
                                        <input type="password" name="name" id="txtConfirmPassword" runat="server" placeholder="*  Confirm Password" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                </div>
                                <div class="row nomargin">
                                    <div class="span4 field">
                                        Email ID<br />
                                        <input type="text" name="email" id="txtEmail" runat="server" placeholder="* Enter your email address" data-rule="email" data-msg="Please enter a valid email" />
                                        <div class="validation"></div>
                                    </div>
                                </div>
                                <div class="row nomargin">
                                    <div class="span4 field">
                                        Country<br />
                                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" DataTextField="CountryName" DataValueField="Countryid" ></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="spGetCountry" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span4 field">
                                        City/Town<br />
                                        <select id="ddlCity" runat="server" data-rule="name" data-msg="Please select City">
                                            <option>City</option>
                                        </select>
                                        <div class="validation"></div>
                                    </div>
                                </div>
                                <div class="row nomargin">
                                    <div class="span4 field">
                                        Location/Land Mark<br />
                                        <input id="txtLocation" runat="server" type="text" name="name" placeholder="* Please enter addresss" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span4 field">
                                        Address<br />
                                        <input id="txtAddress" runat="server" type="text" name="name" placeholder="* Please enter addresss" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                </div>
                                <div class="row nomargin">
                                    <div class="span8 margintop10 field">
                                        Contact No.<br />
                                        <input type="text" id="txtContactno" runat="server" name="name" placeholder="Enter your contact no" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span8 margintop10 field">
                                        <p>
                                            <asp:Label ID="lblSinginError" runat="server" ForeColor="Red"></asp:Label><br />
                                            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-theme btn-medium margintop10 pull-left" OnClick="btnRegister_Click" Text="Register" />
                                            <span class="pull-right margintop20">* Please fill all required form field, thanks!</span>
                                        </p>
                                    </div>
                                </div>
                        </div>
                    </div>
                    
                </div>
            </section>
        </div>
    <!-- javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  

</asp:Content>

