<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="contact-us.aspx.cs" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapMain">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                <li class="breadcrumb-item active">Liên hệ</li>
            </ol>
            <div class="wrapContact col-md-12">
                <div class="top-contact">
                    <asp:Repeater ID="ListView2" runat="server"
                        DataSourceID="ObjectDataSource1" EnableViewState="false">
                        <ItemTemplate>
                            <%# Eval("Content") %>
                        </ItemTemplate>   
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                        SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" DefaultValue="1" />
                            <asp:Parameter Name="EndRowIndex" Type="String" DefaultValue="1" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="5" Name="ProjectCategoryID" Type="String" />
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
                <div class="bot-contact row">
                    <div class="col-md-5 mgb-25">
                        <h1>Liên hệ</h1>
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblMessage" ForeColor="Green"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Tên công ty <span>*</span></label>
                            <asp:TextBox ID="txtTencongty" runat="server" placeholder="Nhập Tên công ty..."></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                ValidationGroup="SendEmail" ControlToValidate="txtHoTen" ErrorMessage="Thông tin bắt buộc!"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Chức vụ <span>*</span></label>
                            <asp:TextBox ID="txtChucvu" runat="server" placeholder="Nhập Chức vụ..."></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                ValidationGroup="SendEmail" ControlToValidate="txtHoTen" ErrorMessage="Thông tin bắt buộc!"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Họ tên <span>*</span></label>
                            <asp:TextBox ID="txtHoTen" runat="server" placeholder="Nhập Họ tên..."></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                ValidationGroup="SendEmail" ControlToValidate="txtHoTen" ErrorMessage="Thông tin bắt buộc!"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Email <span>*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Nhập Email......"></asp:TextBox>
                            <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1" runat="server" ValidationGroup="SendEmail"
                                ControlToValidate="txtEmail" ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server" ValidationGroup="SendEmail"
                                ControlToValidate="txtEmail" ErrorMessage="Thông tin bắt buộc!" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Nội dung</label>
                            <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" placeholder="Nhập Nội dung..."></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server" ValidationGroup="SendEmail"
                                Display="Dynamic" ControlToValidate="txtNoiDung" ErrorMessage="Thông tin bắt buộc!"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="contact-w">
                        </div>
                        <asp:Button ID="btGui" runat="server" Text="Gửi" ValidationGroup="SendEmail" OnClick="btGui_Click" />
                        <i><span>*</span> Thông tin bắt buộc</i>
                    </div>
                    <div class="col-md-7">
                        <div id="mapshow"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

