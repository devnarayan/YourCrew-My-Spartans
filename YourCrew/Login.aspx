<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
   <div id="wrapper">
        <section id="content">
            <div class="container">
            <section class="popup-user-forms popup-user-login " style="width:500px; margin-left:20%">
                    <div class="popup-content">
                        <!-- login form begin -->
                        <div class="popup-content-login" style="display: block;">
                            <div class="main-message">
                                <h2>Login</h2>
                            </div>
                            <div class="popup-form">
                                <div style="margin: 0; padding: 0; display: inline">
                                    <input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="b/DGHZZFlzmdL6sLA9U3Rrm7x6i7QOa4ZsrtkauNRCs=" />
                                </div>
                                <div class="form-errors">
                                </div>

                                <div class="form-row cf multi-rows-label">
                                    <div class="label-wrap">
                                        <label for="txtUserName">Email / Username</label>
                                    </div>
                                    <div class="input-wrap">
                                        <input id="txtUserName" class="input-large" runat="server" maxlength="30" name="user_session[login]" autofocus="autofocus" size="30" tabindex="1" type="text" required />
                                    </div>
                                </div>

                                <div class="form-row cf">
                                    <div class="label-wrap">
                                        <label for="txtPassword">Password</label>
                                    </div>
                                    <div class="input-wrap">
                                        <input id="txtPassword" runat="server" name="user_session[password]" tabindex="2" type="password" required />
                                    </div>
                                </div>

                                <div class="form-row cf">

                                    <div class="label-wrap">&nbsp;</div>
                                    <div class="input-wrap">
                                        <label class="fake-check-grey check-text" for="user_session_remember_me">
                                            <input id="user_session_remember_me" name="user_session[remember_me]" type="checkbox" tabindex="4" value="1" />
                                            <span class="chk-img"></span>
                                            Remember me
                                        </label>
                                        <br />
                                        <asp:Label ID="lblSignInError" runat="server"></asp:Label>
                                    </div>

                                </div>

                                <div class="form-row-buttons">

                                    <span class="lf">
                                        <a href="#" class="js-btn-forgotpw" rel="nofollow">Forgot Password?</a>
                                    </span>
                                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="btn-standard btn-green pull-right" TabIndex="4" Text="Login" />
                                </div>

                            </div>

                        </div>
                        <%--  </ContentTemplate></asp:UpdatePanel>--%>
                        <!-- login form end -->

                        <!-- forgot pw form begin -->
                        <div class="popup-content-forgotpw" style="">

                            <div class="main-message">

                                <h2>Reset Password</h2>
                                <h3 style="padding-bottom: 0px">Enter the email you used in your Crew's profile. A password reset link will be sent to you by email.</h3>

                            </div>

                            <div class="popup-form">

                                <div style="margin: 0; padding: 0; display: inline">

                                    <div class="form-errors">
                                    </div>

                                    <div class="form-row cf multi-rows-label">
                                        <div class="label-wrap">
                                            <label for="email">Enter email address</label>
                                        </div>
                                        <div class="input-wrap">
                                            <input id="txtForgetEmail" runat="server" name="email" type="text" />
                                        </div>
                                    </div>

                                    <div class="form-row-buttons">
                                        <a href="#" class="js-btn-signin lf">Back to Sign In</a>
                                        <asp:Button ID="btnForgetPassword" CssClass="btn-standard-lrg" OnClick="btnForgetPassword_Click" runat="server" Text="SUBMIT" />
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- forgot pw form end -->

                    </div>

                </section>
                </div>
            </section>
       </div>
</asp:Content>

