<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="news-detail.aspx.cs" Inherits="news_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    <asp:HiddenField ID="hdnLinkCat" runat="server" />
    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="news.aspx">Tin tức</a></li>
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
                <li><a href='<%# Utils.progressTitle(Eval("ProjectCategoryName")) + "-nw-" + Eval("ProjectCategoryID")+ ".aspx" %>'><%# Eval("ProjectCategoryName") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server"
        SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="parentID" Type="Int32" />
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
            <h1 class="title-news"><%# Eval("ProjectTitle") %></h1>
            <div class="contentWrap">
                <%# Eval("Content") %>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" QueryStringField="nd" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="more-news">
        <h1>Các tin khác</h1>
        <ul>
            <asp:Repeater ID="Repeater3" runat="server"
                DataSourceID="ObjectDataSource4" EnableViewState="false">
                <ItemTemplate>
                    <li><a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>
                        <%# Eval("ProjectTitle") %> 
                    </a></li>
                </ItemTemplate>
            </asp:Repeater>

        </ul>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"
        SelectMethod="ProjectSameSelectAll" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:Parameter Name="RerultCount" Type="String" DefaultValue="10" />
            <asp:QueryStringParameter DefaultValue="" Name="ProjectID" QueryStringField="nd" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="lienquan" runat="Server">
</asp:Content>

