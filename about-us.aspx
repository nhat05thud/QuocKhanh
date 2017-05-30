<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="about-us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="about-us.aspx">Giới thiệu</a></li>
    <li class="breadcrumb-item active">
        <asp:Label ID="lbName" runat="server"></asp:Label></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="aside" runat="Server">
    <ul>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="ObjectDataSource3" EnableViewState="false">
            <ItemTemplate>
                <li><a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-ab-" + Eval("ProjectID")+ ".aspx" %>'><%# Eval("ProjectTitle") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server"
        SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="StartRowIndex" Type="String" />
            <asp:Parameter DefaultValue="" Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ProjectTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DefaultValue="1" Name="ProjectCategoryID" Type="String" />
            <asp:Parameter Name="Tag" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="FromDate" Type="String" />
            <asp:Parameter Name="ToDate" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
            <asp:Parameter DefaultValue="" Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="1" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="wrap_main" runat="Server">
    <asp:Repeater ID="ListView1" runat="server"    EnableViewState="false">
        <ItemTemplate>
            <h1><%# Eval("ProjectTitle") %></h1>
            <div class="contentWrap">
                <%# Eval("Content") %>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
            <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ProjectTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DefaultValue="1" Name="ProjectCategoryID" Type="String" />
            <asp:Parameter Name="Tag" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="FromDate" Type="String" />
            <asp:Parameter Name="ToDate" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
            <asp:Parameter DefaultValue="" Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="1" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
        SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" QueryStringField="ab" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

