<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner">
        <div id="wowslider-container1">
            <div class="ws_images">

                <asp:ListView ID="ListView2" runat="server"
                    DataSourceID="ObjectDataSource2"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# Eval("Website") %>'>
                            <img src='<%# "/res/banner/" + Eval("FileName") %>' alt='<%# Eval("FileName") %>' title='<%# Eval("CompanyName") %>' id="<%# "wows1_" + ((Container.DataItemIndex) == 0 ? 0 : Container.DataItemIndex + 1) %>" /></a><%# Eval("Description") %></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <span runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
        SelectMethod="AdsBannerSelectAll" TypeName="TLLib.AdsBanner">
        <SelectParameters>
            <asp:Parameter Name="StartRowIndex" Type="String" />
            <asp:Parameter Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="AdsCategoryID" Type="String" DefaultValue="1" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="Website" Type="String" />
            <asp:Parameter Name="FromDate" Type="String" />
            <asp:Parameter Name="ToDate" Type="String" />
            <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <section class="aboutUs">
        <div class="container">
            <asp:Repeater ID="Repeater1" runat="server"
                DataSourceID="ObjectDataSource4" EnableViewState="false">
                <ItemTemplate>
                    <%# Eval("Description") %>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"
        SelectMethod="ProjectCategorySelectOne" TypeName="TLLib.ProjectCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="ProjectCategoryID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <section class="proService">
        <div class="container">
            <h1 class="title">sản phẩm & dịch vụ</h1>
            <div class="grid">
                <asp:Repeater ID="Repeater2" runat="server"
                    DataSourceID="ObjectDataSource5" EnableViewState="false">
                    <ItemTemplate>
                        <div class="grid-item grid-item-width2 grid-item-height2">
                            <a href='<%# Utils.progressTitle(Eval("ProjectCategoryName")) + "-p-" + Eval("ProjectCategoryID")+ ".aspx" %>'>
                                <img id="Img1" src='<%# "~/res/productcategory/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />

                                <p><%# Eval("ProjectCategoryName") %></p>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server"
                    SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                        <asp:Parameter Name="IsShowOnMenu" Type="String" />
                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </section>
    <section class="constructions">
        <div class="container">
            <div class="head">
                <div class="left">
                    <h1>CÔNG TRÌNH <span>TIÊU BIỂU <i class="fa fa-circle"></i></span></h1>
                </div>
                <div class="right">
                    <%--<p>Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit nec tellus a odio tincidunt auctor</p>--%>
                </div>
            </div>
            <div class="cateContruc owl-carousel">
                <asp:ListView ID="ListView1" runat="server"
                    DataSourceID="ObjectDataSource1"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <div class="img">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-ctd-" + Eval("ProjectID")+ ".aspx" %>'>
                                    <img id="Img1" src='<%# "~/res/project/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />
                                </a>
                            </div>
                            <div class="content">
                                <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                                <div class="content-hidden">
                                    <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-ctd-" + Eval("ProjectID")+ ".aspx" %>'>
                                        <h1><%# Eval("ProjectTitle") %></h1>
                                    </a>
                                    <p><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                    SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProjectTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:QueryStringParameter DefaultValue="3" Name="ProjectCategoryID" QueryStringField="ct" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="IsShowOnHomePage" Type="String" DefaultValue="true" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </section>
    <section class="secNews">
        <div class="container">
            <div class="head">
                <h1 class="title">TIN TỨC - SỰ KIỆN <i class="fa fa-circle"></i>
                </h1>
                <div class="showAll">
                    <a href="news.aspx">Xem tất cả <i class="fa fa-caret-right" aria-hidden="true"></i></a>
                </div>
            </div>
            <div class="cate-news">
                <asp:ListView ID="ListView3" runat="server"
                    DataSourceID="ObjectDataSource3"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <div class="img">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>
                                    <img id="Img1" src='<%# "~/res/news/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />
                                </a>
                            </div>
                            <div class="content">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>
                                    <%# Eval("ProjectTitle") %> 
                                </a>
                                <p><%# Eval("Description") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>

                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server"
                    SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" DefaultValue="1" />
                        <asp:Parameter Name="EndRowIndex" Type="String" DefaultValue="4" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProjectTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="ProjectCategoryID" DefaultValue="4" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </section>
    <script src="assets/js/wowslider.js"></script>
    <script src="assets/js/script-wow.js"></script>
</asp:Content>
