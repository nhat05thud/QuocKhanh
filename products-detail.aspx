<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="products-detail.aspx.cs" Inherits="products_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    <asp:HiddenField ID="hdnLinkCat" runat="server" />
    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="products.aspx">Sản phẩm - Dịch vụ</a></li>
    <li class="breadcrumb-item"><a href='<%= hdnLinkCat.Value %>'>
        <asp:Label ID="lbNameCat" runat="server"></asp:Label></a></li>
    <li class="breadcrumb-item active">
        <asp:Label ID="lbName" runat="server"></asp:Label></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="aside" runat="Server">
    <ul>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="ObjectDataSource3" EnableViewState="false">
            <ItemTemplate>
                <li><a href='<%# Utils.progressTitle(Eval("ProjectCategoryName")) + "-p-" + Eval("ProjectCategoryID")+ ".aspx" %>'><%# Eval("ProjectCategoryName") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server"
        SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="wrap_main" runat="Server">
    <asp:Repeater ID="Repeater2" runat="server"
        DataSourceID="ObjectDataSource1" EnableViewState="false">
        <ItemTemplate>
            <h1 class="title-ct"><%# Eval("ProjectTitle") %></h1>
            <div class="wrapDetail">
                <div class="slideImg">
                    <div class="slider-for">
                        <asp:Repeater ID="Repeater1" runat="server"
                            DataSourceID="ObjectDataSource2" EnableViewState="false">
                            <ItemTemplate>
                                <div class="item">
                                    <img id="Img1" src='<%# "~/res/product/album/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="slider-nav">
                        <asp:Repeater ID="Repeater3" runat="server"
                            DataSourceID="ObjectDataSource2" EnableViewState="false">
                            <ItemTemplate>
                                <div class="item">
                                    <img id="Img1" src='<%# "~/res/product/album/thumbs/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                    SelectMethod="ProjectImageSelectAll" TypeName="TLLib.ProjectImage">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ProjectID" QueryStringField="pd" Type="String" />
                        <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="ctDetails">
                    <%# Eval("Content") %>
                </div>
                <div class="news-cate row proLienquan">
                    <h1>Sản phẩm liên quan</h1>
                    <div class="clr"></div>
                    <asp:ListView ID="ListView1" runat="server"
                        DataSourceID="ObjectDataSource4"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="item col-md-4 col-sm-6">
                                <div class="img">
                                    <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-pd-" + Eval("ProjectID")+ ".aspx" %>'>
                                        <img id="Img1" src='<%# "~/res/product/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />
                                    </a>
                                </div>
                                <div class="content">
                                    <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-pd-" + Eval("ProjectID")+ ".aspx" %>'>
                                        <h1><%# Eval("ProjectTitle") %></h1>
                                    </a>
                                    <p><%# Eval("Description") %></p>
                                    <div class="readmore">
                                        <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-pd-" + Eval("ProjectID")+ ".aspx" %>'>Xem chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"
                        SelectMethod="ProjectSameSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="RerultCount" Type="String" DefaultValue="3" />
                            <asp:QueryStringParameter DefaultValue="" Name="ProjectID" QueryStringField="pd" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>   
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" QueryStringField="pd" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="lienquan" runat="Server">
</asp:Content>

