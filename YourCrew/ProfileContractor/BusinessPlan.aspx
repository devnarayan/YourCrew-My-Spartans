<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="BusinessPlan.aspx.cs" Inherits="ProfileContractor_BusinessPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Choose Business Plan
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/notify.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <section id="content">
        <div class="container nomargin">
            <div class="row-fluid">
           <div class="span10">
               <h5><asp:Label ID="lblTitle" runat="server"></asp:Label></h5>
               <asp:HiddenField ID="HiddenContractorID" runat="server" />
           </div>
            </div>
            <div class="row-fluid">

                <div class="span3">
                    <div class="pricing-box-wrap free animated-fast flyIn">
                        <div class="pricing-heading">
                            <h3><strong>Free</strong></h3>
                        </div>
                        <div class="pricing-terms">
                            <h6>&#36;00.00</h6>
                        </div>
                        <div class="pricing-content">
                            <ul>
                                <li><i class="icon-ok"></i>1 Profile Picture</li>
                                <li><i class="icon-ok"></i>No Video</li>
                                <li><i class="icon-ok"></i>1 Slider Landing Image</li>
                                <li><i class="icon-ok"></i>No Maintanance</li>
                                <li><i class="icon-ok"></i>1 Logo</li>
                            </ul>
                        </div>
                        <div class="pricing-action">
                            <asp:RadioButton ID="rbtnFree" Checked="true" GroupName="dev" runat="server" Text="" ForeColor="White" CssClass="btn btn-success" />
                            <a class="btn btn-success" target="_blank" href="../UserPolicy.aspx#free">
                               <i class="icon icon-info"></i>Read More
                            </a>
                        </div>
                    </div>
                </div>

                <div class="span3">
                    <div class="pricing-box-wrap silver animated-fast flyIn">
                        <div class="pricing-heading">
                            <h3><strong>Silver</strong></h3>
                        </div>
                        <div class="pricing-terms">
                            <h6>&#36;5.00 / Year</h6>
                        </div>
                        <div class="pricing-content">
                            <ul>
                                <li><i class="icon-ok"></i>10 Profile Picture</li>
                                <li><i class="icon-ok"></i>1 Video</li>
                                <li><i class="icon-ok"></i>3 Slider Landing Image</li>
                                <li><i class="icon-ok"></i>Profile Maintanance</li>
                                <li><i class="icon-ok"></i>1 Logo</li>
                            </ul>
                        </div>
                        <div class="pricing-action">
                            <asp:RadioButton ID="rbtnSilver" GroupName="dev" runat="server" Text="" ForeColor="White" CssClass="btn btn-success" />
                            <a class="btn btn-success" target="_blank" href="../UserPolicy.aspx#silver">
                               <i class="icon icon-info"></i>Read More
                            </a>
                        </div>
                    </div>
                </div>

                <div class="span3">
                    <div class="pricing-box-wrap gold animated-slow flyIn">
                        <div class="pricing-heading">
                            <h3><strong>Gold</strong></h3>
                        </div>
                        <div class="pricing-terms">
                            <h6>&#36;10.00 / Year</h6>
                        </div>
                        <div class="pricing-content">
                            <ul>
                                <li><i class="icon-ok"></i>20 Profile Picture</li>
                                <li><i class="icon-ok"></i>2 Video</li>
                                <li><i class="icon-ok"></i>3 Slider Landing Image</li>
                                <li><i class="icon-ok"></i>Profile Maintanance</li>
                                <li><i class="icon-ok"></i>1 Logo</li>
                            </ul>
                        </div>
                        <div class="pricing-action">
                            <asp:RadioButton ID="rbtnGold" runat="server" GroupName="dev" Text="" ForeColor="White" CssClass="btn btn-success" />
                            <a class="btn btn-success" target="_blank" href="../UserPolicy.aspx#gold">
                               <i class="icon icon-info"></i>Read More
                            </a>
                        </div>
                    </div>
                </div>

                <div class="span3">
                    <div class="pricing-box-wrap platinum animated flyIn">
                        <div class="pricing-heading">
                            <h3><strong>Platinum</strong></h3>
                        </div>
                        <div class="pricing-terms">
                            <h6>&#36;15.00 / Year</h6>
                        </div>
                        <div class="pricing-content">
                            <ul>
                                <li><i class="icon-ok"></i>30 Profile Picture</li>
                                <li><i class="icon-ok"></i>3 Video</li>
                                <li><i class="icon-ok"></i>5 Slider Landing Image</li>
                                <li><i class="icon-ok"></i>Profile Maintanance</li>
                                <li><i class="icon-ok"></i>1 Logo</li>
                            </ul>
                        </div>
                        <div class="pricing-action">
                            <asp:RadioButton ID="rbtnPlatinum" runat="server" GroupName="dev" Text="" ForeColor="White" CssClass="btn btn-success" />
                            <a class="btn btn-success" target="_blank" href="../UserPolicy.aspx#paltinum">
                               <i class="icon icon-info"></i>Read More
                            </a>
                        </div>
                    </div>
                </div>

            </div>

            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-green btn-medium aligncenter" />
            <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">To Know more fill free to contact</h3>
                </div>
                <div class="modal-body">
                    <p>One fine body…</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                    <p>.</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
