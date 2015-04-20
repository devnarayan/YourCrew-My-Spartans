<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContractorFilter.aspx.cs" Inherits="ContractorFilter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Your Crews || Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/CategorySearch.css" rel="stylesheet" />

    <style>
        .boxgrid {
            background-image: none;
            background-repeat: repeat;
            background-attachment: scroll;
            background-position: 0 0;
            width: 100%;
            height: 130px;
            float: left;
            border: none;
            border: solid 1px rgb(80, 147, 57);
            border-radius: 8px;
            overflow: hidden;
            position: relative;
        }

            .boxgrid img {
                position: absolute;
                top: 0;
                left: 0;
                border: 0;
            }

        .boxcaption {
            color: #fff;
            float: left;
            position: relative;
            background: rgb(80, 147, 57);
            background: rgba(80, 147, 57,.9);
            height: 70px;
            width: 100%;
            padding-top: 12px;
            padding-left: 18px;
        }

        .boxgrid:active {
            border-top-width: 7px;
            border-bottom-width: 5px;
        }

        .captionfull .boxcaption {
            top: 260px;
            left: 0;
            text-shadow: none !important;
        }

        .boxcaption .caption {
            font-size: 14px;
            text-align: left;
            display: block;
            bottom: 10px;
            position: relative;
        }

        .boxcaption .descr {
            display: none;
        }

        .boxcaption .title {
            color: #fff;
            font-size: 15px;
            text-align: justify;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
            padding-right: 10px;
            margin-right: 10px;
            display: block;
            text-shadow: none;
        }

        .boxbottm {
        }

        .boxbottm {
            width: 50px;
            height: 50px;
            float: left;
            border-radius: 25px;
            -webkit-border-radius: 25px;
            -moz-border-radius: 25px;
            background: url(http://link-to-your/image.jpg) no-repeat;
            box-shadow: 0 0 5px rgba(0, 0, 0, .8);
            -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, .8);
            -moz-box-shadow: 0 0 5px rgba(0, 0, 0, .8);
        }

            .boxbottm .name {
                left: 5px;
                top: 5px;
                text-align: left;
                text-shadow: 1px;
                font-size: 15px;
            }
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
    </script>
    <script>
        $(document).ready(function () {

            $("#moveright").click(function () {
                if ($("#panel1").is(":visible")) {
                    $("#panel1").hide(100, function () {
                        $("#panel2").show(500);
                        $("#panel3").hide();
                        $("#moveleft").show();
                    });
                }
                else if ($("#panel2").is(":visible")) {
                    $("#panel2").hide(100, function () {
                        $("#panel3").show(500);
                        $("#panel1").hide();
                        $("#moveright").hide();
                    })
                }

            })
        });

        $(document).ready(function () {
            $("#moveleft").click(function () {
                if ($("#panel2").is(":visible")) {
                    $("#panel2").hide(100, function () {
                        $("#panel1").show(500);
                        $("#panel3").hide();
                        $("#moveright").show();
                        $("#moveleft").hide();
                    });
                }
                else if ($("#panel3").is(":visible")) {
                    $("#panel3").hide(100, function () {
                        $("#panel2").show(500);
                        $("#panel1").hide();
                        $("#moveright").show();
                        $("#moveleft").show();
                    })
                }

            })
        });


        $(document).ready(function () {
            $("#country").click(function () {
                $("#countries").toggle(500, function () {
                    $("#country").css({ 'color': 'green', 'font-weight': 'bold' });
                    $("#city").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#state").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#canada").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#cities").hide();
                    $("#states").hide();
                    $("#canadas").hide();
                })

            })
        });

        $(document).ready(function () {
            $("#city").click(function () {
                $("#cities").toggle(500, function () {
                    $("#country").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#city").css({ 'color': 'green', 'font-weight': 'bold' });
                    $("#state").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#canada").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#countries").hide();
                    $("#states").hide();
                    $("#canadas").hide();
                })

            })
        });

        $(document).ready(function () {
            $("#state").click(function () {
                $("#states").toggle(500, function () {
                    $("#country").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#city").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#state").css({ 'color': 'green', 'font-weight': 'bold' });
                    $("#canada").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#countries").hide();
                    $("#cities").hide();
                    $("#canadas").hide();
                })
            })
        });

        $(document).ready(function () {
            $("#canada").click(function () {
                $("#canadas").toggle(500, function () {
                    $("#country").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#city").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#state").css({ 'color': 'black', 'font-weight': 'normal' });
                    $("#canada").css({ 'color': 'green', 'font-weight': 'bold' });
                    $("#countries").hide();
                    $("#states").hide();
                    $("#cities").hide();
                })
            })
        });
        $(document).ready(function () {
            $("#panel2").hide();
            $("#moveleft").hide();
            $("#country").css({ 'color': 'green', 'font-weight': 'bold' });
            $("#panel3").hide();
            $("#cities").toggle();
            $("#states").toggle();
            $("#canadas").toggle();
        });

        //function showvalue(val) {
        //    document.getElementById("star").innerText = val;
        //}
    </script>
    <link href="css/notify.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
    <div class="mybg2">
        <br />
        <br />
        <br />
        <div class="row-fluid nomargin">
            <div class="span3"></div>
            <div class="span6">
                <h1 class="text-center">
                    <asp:Label ID="lblCategoryLabel" Text="Find Your Crew" ForeColor="White" runat="server"></asp:Label></h1>
                <div class="form-group input-group">
                    <asp:TextBox ID="txtSearch" placeholder="Enter Area ZipCode" CssClass="form-control" runat="server"></asp:TextBox>
                    <span class="input-group-addon">
                        <asp:LinkButton CssClass="" Text="Messages" OnClick="btnSearch_Click" runat="server" ID="LinkButton6"><i class="icon icon-search" ></i> </asp:LinkButton></span>
                </div>
            </div>
            <div class="span3"></div>
        </div>
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <%--<asp:UpdatePanel ID="updatepanel1" runat="server" ><ContentTemplate>--%>
    <div class="row-fluid">
        <div class="span2">
            <div class="row-fluid nomargin">
                <div class="span3"></div>
                <div class="span9">
                    <br />
                    <div class='team-box thumbnail'>
                        <div class='bigbox'>
                            <b>Category</b><br />
                            <nav class="main-category-search">
                                <div class=" cf">
                                    <div class="wrap-search">
                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown input-medium" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CrewsdbConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] ORDER BY [CategoryID]"></asp:SqlDataSource>
                                        <asp:ImageButton ID="ibtnSearch" runat="server" OnClick="btnSearchbelow_Click"  ImageUrl="images/btn-search-icon-lrg-64c37a7ce6c17e45188981e1c6565f10.png" AlternateText="Go" noformvalidate />
                                    </div>
                                </div>
                            </nav>
                            <b>Ratings</b>

                            <asp:RadioButtonList ID="chkratelist" runat="server" Width="100%" RepeatDirection="Vertical">
                                <asp:ListItem Value="6" Text="Any Score" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="0" Text="No Feedback Yet"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Score"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CheckBoxList ID="chkScore" Width="100%" runat="server" RepeatDirection="Vertical">
                                <asp:ListItem Value="5" Text="4.5-5.0 Stars"></asp:ListItem>
                                <asp:ListItem Value="4" Text="4.0-4.5 Stars"></asp:ListItem>
                                <asp:ListItem Value="3" Text="3.0-3.9 Stars"></asp:ListItem>
                                <asp:ListItem Value="2" Text="2.0-2.9 Stars"></asp:ListItem>
                                <asp:ListItem Value="1" Text="1.0-1.9 Stars"></asp:ListItem>
                            </asp:CheckBoxList>
                            <%--  Socre:   <label for="slider" id="star"  class="ui-hidden-accessible">
                                        0
                                    </label><br />
                                    <input type="range" class="input-large"  name="slider" aria-valuenow="3" id="slidstep" step=".5" value="0" min="0" max="5" /><br />
                            --%>
                            <b>Location Area</b>
                            <nav class="main-category-search">
                                <div class=" cf">
                                    <div class="wrap-search">
                                        <asp:TextBox ID="txtLocation" placeholder="Location Area" runat="server" Width="100%"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="btnSearchbelow_Click" ImageUrl="images/btn-search-icon-lrg-64c37a7ce6c17e45188981e1c6565f10.png" AlternateText="Go" noformvalidate />
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
                <!--end span9-->
            </div>
        </div>
        <div class="span8">
            <hr />
            <div class="row-fluid">
                <h4 class="title">Popular <strong>Contractor</strong> In <strong><b>
                    <asp:Label ID="lblCityName" ForeColor="Green" runat="server"></asp:Label></b></strong></h4>
                <div class="span12">
                    <div class="clearfix"></div>
                    <div id="divProfile" runat="server">
                    </div>
                </div>
            </div>
        </div>
        <div class="span2">
            <%--http://monterey--%>
            <div class="pull-left">
                <ul class="menu collapsible">
                    <h6 id="country" class="ban">Nearby Cl</h6>
                    <h6 id="city" class="ban">US Cities</h6>
                    <h6 id="state" class="ban">US States</h6>
                    <h6 id="canada" class="ban">Canada</h6>
                    <li class=" expand s">
                        <ul id="countries" class="acitem">
                            <li class="s"><a href="ContractorFilter.aspx?ct=bakersfield">Bakersfield</a></li>
                            <li class="s"><a href="ContractorFilter.aspx?ct=chico">Bhico</a></li>
                            <li class="s"><a href="ContractorFilter.aspx?ct=fresno">Fresno</a></li>
                            <li class="s"><a href="ContractorFilter.aspx?ct=goldcountry">Gold Country</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=hanford">Hanford</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=humboldt">Humboldt</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=inlandempire">Inland Empire</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=klamath">Klamath Falls</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=lasvegas">las vegas</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=losangeles">los angeles</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=mendocino">mendocino co</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=merced">merced</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=modesto">modesto</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=monterey">monterey</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=orangecounty">orange co</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=palmsprings">palm springs</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=redding">redding</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=reno">reno</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=sacramento">sacramento</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=sandiego">san diego</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=slo">san luis obispo</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=santabarbara">santa barbara</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=santamaria">santa maria</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=sfbay">sf bay area</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=siskiyou">siskiyou co</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=stockton">stockton</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=susanville">susanville</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=ventura">ventura</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=visalia">visalia-tulare</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=yubasutter">yuba-sutter</a>
                        </ul>
                    </li>
                    <li class=" s">
                        <ul id="cities" class="acitem">
                            <li class="s"><a href="ContractorFilter.aspx?ct=atlanta">atlanta</a>
                            <li><a href="ContractorFilter.aspx?ct=austin">austin</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=boston">boston</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=chicago">chicago</a>
                            <li><a href="ContractorFilter.aspx?ct=dallas">dallas</a>
                            <li><a href="ContractorFilter.aspx?ct=denver">denver</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=detroit">detroit</a>
                            <li><a href="ContractorFilter.aspx?ct=houston">houston</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=lasvegas">las&nbsp;vegas</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=losangeles">los&nbsp;angeles</a>
                            <li><a href="ContractorFilter.aspx?ct=miami">miami</a>
                            <li><a href="ContractorFilter.aspx?ct=minneapolis">minneapolis</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=newyork">new&nbsp;york</a>
                            <li><a href="ContractorFilter.aspx?ct=orangecounty">orange&nbsp;co</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=philadelphia">philadelphia</a>
                            <li><a href="ContractorFilter.aspx?ct=phoenix">phoenix</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=portland">portland</a>
                            <li><a href="ContractorFilter.aspx?ct=raleigh">raleigh</a>
                            <li><a href="ContractorFilter.aspx?ct=sacramento">sacramento</a>
                            <li><a href="ContractorFilter.aspx?ct=sandiego">san&nbsp;diego</a>
                            <li><a href="ContractorFilter.aspx?ct=seattle">seattle</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=sfbay">sf&nbsp;bayarea</a>
                            <li><a href="ContractorFilter.aspx?ct=washingtondc">wash dc</a>
                            <li class="s more"><a href="ContractorFilter.aspx?ct=geoiso/us">more ...</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <ul id="states" class="acitem">
                            <li><a href="ContractorFilter.aspx?st=al">alabama</a>
                            <li><a href="ContractorFilter.aspx?st=ak">alaska</a>
                            <li><a href="ContractorFilter.aspx?st=az">arizona</a>
                            <li><a href="ContractorFilter.aspx?st=ar">arkansas</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=ca">california</a>
                            <li><a href="ContractorFilter.aspx?st=co">colorado</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=ct">connecticut</a>
                            <li><a href="ContractorFilter.aspx?st=dc">dc</a>
                            <li><a href="ContractorFilter.aspx?st=de">delaware</a>
                            <li><a href="ContractorFilter.aspx?st=fl">florida</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=ga">georgia</a>
                            <li><a href="ContractorFilter.aspx?st=gu">guam</a>
                            <li><a href="ContractorFilter.aspx?st=hi">hawaii</a>
                            <li><a href="ContractorFilter.aspx?st=id">idaho</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=il">illinois</a>
                            <li><a href="ContractorFilter.aspx?st=in">indiana</a>
                            <li><a href="ContractorFilter.aspx?st=ia">iowa</a>
                            <li><a href="ContractorFilter.aspx?st=ks">kansas</a>
                            <li><a href="ContractorFilter.aspx?st=ky">kentucky</a>
                            <li><a href="ContractorFilter.aspx?st=la">louisiana</a>
                            <li><a href="ContractorFilter.aspx?st=me">maine</a>
                            <li><a href="ContractorFilter.aspx?st=md">maryland</a>
                            <li><a href="ContractorFilter.aspx?st=ma">mass</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=mi">michigan</a>
                            <li><a href="ContractorFilter.aspx?st=mn">minnesota</a>
                            <li><a href="ContractorFilter.aspx?st=ms">mississippi</a>
                            <li><a href="ContractorFilter.aspx?st=mo">missouri</a>
                            <li><a href="ContractorFilter.aspx?st=mt">montana</a>
                            <li><a href="ContractorFilter.aspx?st=nc">n carolina</a>
                            <li><a href="ContractorFilter.aspx?st=ne">nebraska</a>
                            <li><a href="ContractorFilter.aspx?st=nv">nevada</a>
                            <li><a href="ContractorFilter.aspx?st=nj">new jersey</a>
                            <li><a href="ContractorFilter.aspx?st=nm">new mexico</a>
                            <li><a href="ContractorFilter.aspx?st=ny">new york</a>
                            <li><a href="ContractorFilter.aspx?st=nh">n hampshire</a>
                            <li><a href="ContractorFilter.aspx?st=nd">north dakota</a>
                            <li><a href="ContractorFilter.aspx?st=oh">ohio</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=ok">oklahoma</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=or">oregon</a>
                            <li><a href="ContractorFilter.aspx?st=pa">pennsylvania</a>
                            <li><a href="ContractorFilter.aspx?st=pr">puerto rico</a>
                            <li><a href="ContractorFilter.aspx?st=ri">rhode island</a>
                            <li><a href="ContractorFilter.aspx?st=sc">s carolina</a>
                            <li><a href="ContractorFilter.aspx?st=sd">south dakota</a>
                            <li><a href="ContractorFilter.aspx?st=tn">tennessee</a>
                            <li><a href="ContractorFilter.aspx?st=tx">texas</a>
                            <li><a href="ContractorFilter.aspx?st=ut">utah</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=vt">vermont</a>
                            <li><a href="ContractorFilter.aspx?st=va">virginia</a>
                            <li><a href="ContractorFilter.aspx?st=wa">washington</a>
                            <li><a href="ContractorFilter.aspx?st=wv">west virginia</a>
                            <li><a href="ContractorFilter.aspx?st=wi">wisconsin</a>
                            <li class="s"><a href="ContractorFilter.aspx?st=wy">wyoming</a>
                            <li class="s more"><a href="ContractorFilter.aspx?st=us">more ...</a></li>
                        </ul>
                    </li>
                    <li class=" s">
                        <ul id="canadas" class="acitem">
                            <li><a href="ContractorFilter.aspx?ct=calgary">calgary</a>
                            <li><a href="ContractorFilter.aspx?ct=edmonton">edmonton</a>
                            <li><a href="ContractorFilter.aspx?ct=halifax">halifax</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=montreal">montreal</a>
                            <li><a href="ContractorFilter.aspx?ct=ottawa">ottawa</a>
                            <li><a href="ContractorFilter.aspx?ct=saskatoon">saskatoon</a>
                            <li class="s"><a href="ContractorFilter.aspx?ct=toronto">toronto</a>
                            <li><a href="ContractorFilter.aspx?ct=vancouver">vancouver</a>
                            <li><a href="ContractorFilter.aspx?ct=victoria">victoria</a>
                            <li><a href="ContractorFilter.aspx?ct=winnipeg">winnipeg</a>
                            <li class="s more"><a href="ContractorFilter.aspx?ct=canada">more ...</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </div>
    <%--</ContentTemplate></asp:UpdatePanel>--%>
    <script src="js/a.js"></script>
    <script src="Scripts/jquery.js"></script>
    <script>
        (function ($) {
            $(function () {
                // resent templates description animation
                $('.boxgrid').each(function () {
                    var $caption = $(this).find('span.boxcaption');
                    var pheight = $(this).height();
                    $caption.css('top', pheight);

                    $(this).hover(
                        function () {
                            $caption.stop(1);
                            $caption.animate({ top: pheight - $caption.height() });
                        },
                        function () {
                            $caption.stop(1);
                            $caption.animate({ top: pheight })
                        }
                    )
                });
            });
        })(jQuery);
    </script>
    <div class="mp-container container-fluid" data-stellar-ratio="1" data-stellar-vertical-offset="0">

        <div class="white">
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
    <%--    
<script src="js/iCheck/jquery.icheck.js"></script>

<!--common script init for all pages-->
<script src="js/scripts.js"></script>

<!--icheck init -->
<script src="js/icheck-init.js"></script>--%>
</asp:Content>

