<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="constructions-detail.aspx.cs" Inherits="constructions_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="Server">
    <asp:HiddenField ID="hdnLinkCat" runat="server" />
    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="constructions.aspx">Công trình</a></li>
    <li class="breadcrumb-item"><a href='<%= hdnLinkCat.Value %>'><asp:Label ID="lbNameCat" runat="server"></asp:Label></a></li>
    <li class="breadcrumb-item active">
        <asp:Label ID="lbName" runat="server"></asp:Label></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="aside" runat="Server">
    <ul>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="ObjectDataSource3" EnableViewState="false">
            <ItemTemplate>
                <li><a href='<%# Utils.progressTitle(Eval("ProjectCategoryName")) + "-ct-" + Eval("ProjectCategoryID")+ ".aspx" %>'><%# Eval("ProjectCategoryName") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server"
        SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="parentID" Type="Int32" />
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
                                    <img id="Img1" src='<%# "~/res/project/album/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="slider-nav">
                        <asp:Repeater ID="Repeater3" runat="server"
                            DataSourceID="ObjectDataSource2" EnableViewState="false">
                            <ItemTemplate>
                                <div class="item">
                                    <img id="Img1" src='<%# "~/res/project/album/thumbs/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                    SelectMethod="ProjectImageSelectAll" TypeName="TLLib.ProjectImage">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ProjectID" QueryStringField="ctd" Type="String" />
                        <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="ctDetails">
                    <h1>thông tin công trình</h1>
                    <%# Eval("Content") %>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" QueryStringField="ctd" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="lienquan" runat="Server">
    <div class="wrap-lienquan">
        <h1>công trình khác</h1>
        <div class="construction-cate row">
            <asp:ListView ID="ListView1" runat="server"
                DataSourceID="ObjectDataSource4"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="item col-sm-6">
                        <div class="img">
                            <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-ctd-" + Eval("ProjectID")+ ".aspx" %>'>
                                <img id="Img1" src='<%# "~/res/project/" + Eval("ImageName") %>' runat="server" alt='<%# Eval("ImageName") %> ' />
                            </a>
                        </div>
                        <div class="content">
                            <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                            <a href='<%# Utils.progressTitle(Eval("ProjectTitle")) + "-ctd-" + Eval("ProjectID")+ ".aspx" %>'>
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
            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"
                SelectMethod="ProjectSameSelectAll" TypeName="TLLib.Project">
                <SelectParameters>
                    <asp:Parameter Name="RerultCount" Type="String" DefaultValue="12" />
                    <asp:QueryStringParameter DefaultValue="" Name="ProjectID" QueryStringField="ctd" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="pager">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="3" PagedControlID="ListView1">
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
</asp:Content>
