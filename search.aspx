<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
    <li class="breadcrumb-item active">
        <asp:Label ID="lbName" runat="server"></asp:Label></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="aside" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="wrap_main" runat="Server">
    <h1 class="title-ct"><%= lbName.Text %></h1>
    <div class="wrapDetail">
        <div class="wrapNews">          
            <div class="news-cate row">
                <asp:ListView ID="ListView1" runat="server"
                    DataSourceID="ObjectDataSource1"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item col-md-4 col-sm-6">
                            <div class="img">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + (Eval("ParentID").ToString() == "2"?"-pd-" : "-ctd-") + Eval("ProjectID")+ ".aspx" %>'>
                                    <img id="Img1" src='<%# "~/res/"+ (Eval("ParentID").ToString() == "2"?"product" : "project") + "/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />
                                </a>
                            </div>
                            <div class="content">
                                <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + (Eval("ParentID").ToString() == "2"?"-pd-" : "-ctd-") + Eval("ProjectID")+ ".aspx" %>'>
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
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                    SelectMethod="ProjectSelectAllSearch" TypeName="TLLib.Project">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:QueryStringParameter DefaultValue="" Name="Keyword" QueryStringField="kw" Type="String" />
                        <asp:Parameter Name="ProjectTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="ProjectCategoryID" Type="String" DefaultValue="" />
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

