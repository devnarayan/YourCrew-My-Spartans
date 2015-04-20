<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContractorSearch.aspx.cs" Inherits="ContractorSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Search Professionals
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="css/CategorySearch.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
    <div id="page-container">
        <section id="wraper">
            <div class="mybg">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <div class="row-fluid nomargin">
                    <div class="span3"></div>
                    <div class="span6">
                        <h1 class="text-center">
                            <asp:Label ID="lblCategoryLabel" ForeColor="White" runat="server"></asp:Label></h1>
                        <asp:LinkButton ID="zip" runat="server" CssClass="btn btn-success" OnClick="btnfind1_Click">Zip Code</asp:LinkButton>
                        <asp:LinkButton ID="name" runat="server" CssClass="btn btn-primary" OnClick="btnfind3_Click"> Name </asp:LinkButton>
                        <asp:LinkButton ID="licence" runat="server" CssClass="btn btn-primary" OnClick="btnfind2_Click">Contractor Licence</asp:LinkButton>
                        <div class="form-group input-group">
                            <asp:TextBox ID="txtSearch" placeholder="Enter Area ZipCode" CssClass="form-control" runat="server"></asp:TextBox>
                            <span class="input-group-addon">
                                <asp:LinkButton CssClass="" Text="Messages" OnClick="btnSearch_Click" runat="server" ID="LinkButton6"><i class="icon icon-search" ></i> </asp:LinkButton></span>
                        </div>
                    </div>
                    <div class="span3"></div>
                </div>
            </div>
            <!-- End category search--->

            <div class="container">

                <section id="team">
                    <div id="thumbs">
                        <div class="row-fluid nomargin">

                            <section class="mp-total-gigs">
                                <h2 class="total-gig-counter"></h2>
                                <p>Amazing services offered, start here</p>
                            </section>
                            <div class="row-fluid">
                                <!-- Category list--->
                                <div class="span12">
                                    <h5><a href="Result?cid=1">United States</a></h5>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span3">
                                    <ul>
                                        <li>Alabama</li>
                                        <li>Alaska</li>
                                        <li>Arizona</li>
                                        <li>Arkansas</li>
                                        <li>California</li>
                                        <li>Colorado</li>
                                        <li>Connecticut</li>
                                        <li>Delaware</li>
                                        <li>District of Columbia</li>
                                        <li>Florida</li>
                                        <li>Georgia</li>
                                        <li>Hawaii</li>
                                        <li>Idaho</li>
                                        <li>Illinois</li>
                                    </ul>
                                </div>
                                <div class="span3">
                                    <h5><a href="Result?cid=2"></a></h5>
                                    <ul>
                                        <li><a href="#" title="">Indiana of columbia</a></li>
                                        <li>Iowa</li>
                                        <li>Kansas</li>
                                        <li>Kentucky</li>
                                        <li>Louisiana</li>
                                        <li>Maine</li>
                                        <li>Maryland</li>
                                        <li>Massachusetts</li>
                                        <li>Michigan</li>
                                        <li>Minnesota</li>
                                        <li>Mississippi</li>
                                        <li>Missouri</li>
                                        <li>Montana</li>
                                        <li>Nebraska</li>
                                    </ul>
                                </div>
                                <div class="span3">
                                    <h5><a href="Result?cid=3"></a></h5>
                                    <ul>
                                        <li>Nevada</li>
                                        <li>New Hampshire</li>
                                        <li>New Jersey</li>
                                        <li>New Mexico</li>
                                        <li>New York</li>
                                        <li>North Carolina</li>
                                        <li>North Dakota</li>
                                        <li>Ohio</li>
                                        <li>Oklahoma</li>
                                        <li>Oregon</li>
                                        <li>Pennsylvania</li>
                                        <li>Puerto Rico</li>
                                        <li>Rhode Island</li>
                                        <li>South Carolina</li>
                                    </ul>
                                </div>
                                <div class="span3">
                                    <h5><a href="Result?cid=4"></a></h5>
                                    <ul>
                                        <li>South Dakota</li>
                                        <li>Tennessee</li>
                                        <li>Texas</li>
                                        <li>Utah</li>
                                        <li>Vermont</li>
                                        <li>Virginia</li>
                                        <li>Washington</li>
                                        <li>West Virginia</li>
                                        <li>Wisconsin</li>
                                        <li>Wyoming</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span9">
                                </div>

                            </div>
                            <div class="row-fluid">
                                <div class="span3">
                                    <h5>US Cities</h5>
                                    <ul>
                                        <li><a href="#" title="">Atlanta, GA  </a></li>
                                        <li><a href="#" title="">Austin, TX</a></li>
                                        <li><a href="#" title="">Baltimore, MD</a></li>
                                        <li><a href="#" title="">Boston, MA</a></li>
                                        <li><a href="#" title="">Brooklyn, NY</a></li>
                                        <li><a href="#" title="">Charlotte, NC</a></li>
                                        <li><a href="#" title="">Chicago, IL</a></li>
                                        <li><a href="#" title="">Columbus, OH</a></li>
                                        <li><a href="#" title="">Dallas, TX</a></li>
                                        <li><a href="#" title="">Denver, CO</a></li>
                                        <li><a href="#" title="">Detroit, MI</a></li>

                                    </ul>
                                </div>
                                <div class="span3">
                                    <ul>

                                        <li><a href="#" title="">Houston, TX</a></li>
                                        <li><a href="#" title="">Indianapolis, IN</a></li>
                                        <li><a href="#" title="">Jacksonville, FL</a></li>
                                        <li><a href="#" title="">Las Vegas, NV</a></li>
                                        <li><a href="#" title="">Los Angeles, CA</a></li>
                                        <li><a href="#" title="">Louisville, KY</a></li>
                                        <li><a href="#" title="">Memphis, TN</a></li>
                                        <li><a href="#" title="">Miami, FL</a></li>
                                        <li><a href="#" title="">Milwaukee, WI</a></li>
                                        <li><a href="#" title="">Minneapolis, MN</a></li>
                                        <li><a href="#" title="">Nashville, TN</a></li>
                                        <li><a href="#" title="">New York, NY</a></li>
                                        <li><a href="#" title="">Oakland, CA</a></li>
                                        <li><a href="#" title="">Omaha, NE</a></li>

                                    </ul>
                                </div>
                                <div class="span3">
                                    <ul>

                                        <li><a href="#" title="">Philadelphia, PA</a></li>
                                        <li><a href="#" title="">Phoenix, AZ</a></li>
                                        <li><a href="#" title="">Pittsburgh, PA</a></li>
                                        <li><a href="#" title="">Portland, OR</a></li>
                                        <li><a href="#" title="">Raleigh, NC</a></li>
                                        <li><a href="#" title="">Sacramento, CA</a></li>
                                        <li><a href="#" title="">Saint Louis, MO</a></li>
                                        <li><a href="#" title="">San Antonio, TX</a></li>
                                        <li><a href="#" title="">San Diego, CA</a></li>
                                        <li><a href="#" title="">San Francisco, CA</a></li>
                                        <li><a href="#" title="">San Jose, CA</a></li>
                                        <li><a href="#" title="">Seattle, WA</a></li>
                                        <li><a href="#" title="">Tucson, AZ</a></li>
                                        <li><a href="#" title="">Washington, DC</a></li>
                                        <li><a href="#" title=""></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="span3">
                                    <h5>Canada</h5>
                                    <ul>
                                        <li><a href="#" title="">Alberta</a></li>
                                        <li><a href="#" title="">British Columbia</a></li>
                                        <li><a href="#" title="">Manitoba</a></li>
                                        <li><a href="#" title="">New Brunswick</a></li>
                                        <li><a href="#" title="">Nova Scotia</a></li>
                                        <li><a href="#" title="">Ontario</a></li>
                                        <li><a href="#" title="">Prince Edward Island</a></li>
                                        <li><a href="#" title="">Quebec</a></li>
                                        <li><a href="#" title="">Saskatchewan</a></li>
                                        <li><a href="#" title="">Yukon</a></li>
                                        <li><a href="#" title=""><b>Canadian Cities</b></a></li>
                                        <li><a href="#" title="">Calgary, AB</a></li>
                                        <li><a href="#" title="">Montreal, QC</a></li>
                                        <li><a href="#" title="">Ottawa, ON</a></li>
                                        <li><a href="#" title="">Toronto, ON</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
</asp:Content>
