<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="news.aspx">Tin tức</a></li>
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
    <h1 class="title-ct"><%= lbName.Text %></h1>
    <div class="wrapDetail">
        <div class="wrapNews">
            <asp:Repeater ID="Repeater2" runat="server"
                DataSourceID="ObjectDataSource2" EnableViewState="false">
                <ItemTemplate>
                    <div class="top-news row">
                        <div class="col-md-6 col-sm-6">
                            <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>
                                <img id="Img1" src='<%# "~/res/news/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />
                            </a>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <h1><a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>
                                <%# Eval("ProjectTitle") %></a></h1>
                            <p><%# Eval("Description") %></p>
                            <div class="readmore">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="news-cate row">
                <asp:ListView ID="ListView1" runat="server"
                    DataSourceID="ObjectDataSource1"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item col-md-4 col-sm-6">
                            <div class="img">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>
                                    <img id="Img1" src='<%# "~/res/news/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />
                                </a>
                            </div>
                            <div class="content">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-nd-" + Eval("ProjectID")+ ".aspx" %>'>
                                    <h1><%# Eval("ProjectTitle") %></h1>
                                </a>
                                <p><%# Eval("Description") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                    SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" DefaultValue="1" />
                        <asp:Parameter Name="EndRowIndex" Type="String" DefaultValue="1" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProjectTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:QueryStringParameter DefaultValue="4" Name="ProjectCategoryID" QueryStringField="nw" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                    SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" DefaultValue="2" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProjectTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:QueryStringParameter DefaultValue="4" Name="ProjectCategoryID" QueryStringField="nw" Type="String" />
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
            <div class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="6" PagedControlID="ListView1">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="" ShowFirstPageButton="false"
                            ShowNextPageButton="false" ShowPreviousPageButton="true" PreviousPageText=""
                            RenderDisabledButtonsAsLabels="true" ButtonCssClass="prev fa fa-caret-left" />
                        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="current" CurrentPageLabelCssClass="current" />
                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="" ShowLastPageButton="false"
                            ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="next fa fa-caret-right"
                            NextPageText="" RenderDisabledButtonsAsLabels="true" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="lienquan" runat="Server">
</asp:Content>

