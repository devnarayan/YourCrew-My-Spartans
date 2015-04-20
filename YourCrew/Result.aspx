<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Your Crews || Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="css/main.css" rel="stylesheet" />

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
            width: 100px;
            padding: 0px;
            margin: 0px;
        }

            .boxbottm img {
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="Server">
    <section id="works">
            <div class="container">
                <div class="row-fluid nomargin">
                    <div class="span6">
                        <h4 class="title">Popular <strong>Contractor</strong></h4>
                    </div>
                    <div class="span6">
                        <div class="input-append">
                            Search Category:
                            <asp:TextBox ID="txtSearch" placeholder="Enter Area Zip Code" runat="server" Width="50%"></asp:TextBox>
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary add-on" OnClick="btnSearch_Click"> <i class="icon icon-search"> </i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <div class="row-fluid">
        <div class="" id="searchtitle" runat="server"></div>
        <div class="span2"></div>
        <div class="span8">
            <div class="clearfix"></div>
            <div id="divProfile" runat="server">
            </div>
            <div class="span2">
            </div>

        </div>
    </div>
    <div class="mp-container container-fluid" data-stellar-ratio="1" data-stellar-vertical-offset="0">
        

        <section id="works">
            <div class="container">
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
        </section>
    </div>
</asp:Content>
