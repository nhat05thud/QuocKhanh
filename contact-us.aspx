<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="contact-us.aspx.cs" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrapMain">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                <li class="breadcrumb-item active">Liên hệ</li>
            </ol>
            <div class="wrapContact col-md-12">
                <div class="top-contact">
                    <h1>DNTN Thương Mại - Xây dựng Quốc Khanh</h1>
                    <ul>
                        <li><i class="fa fa-map-marker"></i>3A54 Trần Văn Giàu, Ấp 3, Xã Phạm Văn Hai, Huyện Bình Chánh, Tp. HCM</li>
                        <li><i class="fa fa-phone"></i>08 8772214 - 877 3939 - Fax: 08 877 3838</li>
                        <li><i class="fa fa-envelope"></i>quockhanh@quockhanh.com.vn</li>
                    </ul>
                </div>
                <div class="bot-contact row">
                    <div class="col-md-5 mgb-25">
                        <h1>Liên hệ</h1>
                        <div class="form-group">
                            <label>Tên công ty <span>*</span></label>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Chức vụ <span>*</span></label>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Họ tên <span>*</span></label>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Email <span>*</span></label>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Nội dung</label>
                            <asp:TextBox ID="TextBox5" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Gửi" /> <i><span>*</span> Thông tin bắt buộc</i>
                    </div>
                    <div class="col-md-7">
                        <div id="mapshow"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

