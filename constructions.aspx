<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="constructions.aspx.cs" Inherits="constructions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">
    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="#">Công trình</a></li>
    <li class="breadcrumb-item active">Đã thi công</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="aside" Runat="Server">
    <ul>
        <li><a href="#">Đã thi công</a></li>
        <li><a href="#">Đang thi công</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="wrap_main" Runat="Server">
    <h1 class="title-ct">công trình đã thi công</h1>
    <div class="construction-cate row">
        <div class="item col-sm-6">
            <div class="img">
                <a href="constructions-detail.aspx">
                    <img src="assets/images/ct1.jpg" alt="" />
                </a>
            </div>
            <div class="content">
                <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                <a href="constructions-detail.aspx">
                    <h1>khu công nghiệp hải sơn</h1>
                </a>
                <p>Cung cấp vật liệu xây dựng</p>
            </div>
        </div>
        <div class="item col-sm-6">
            <div class="img">
                <a href="constructions-detail.aspx">
                    <img src="assets/images/ct2.jpg" alt="" />
                </a>
            </div>
            <div class="content">
                <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                <a href="constructions-detail.aspx">
                    <h1>khu công nghiệp hải sơn</h1>
                </a>
                <p>Cung cấp vật liệu xây dựng</p>
            </div>
        </div>
        <div class="item col-sm-6">
            <div class="img">
                <a href="#">
                    <img src="assets/images/ct3.jpg" alt="" />
                </a>
            </div>
            <div class="content">
                <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                <a href="#">
                    <h1>khu công nghiệp hải sơn</h1>
                </a>
                <p>Cung cấp vật liệu xây dựng</p>
            </div>
        </div>
        <div class="item col-sm-6">
            <div class="img">
                <a href="#">
                    <img src="assets/images/ct4.jpg" alt="" />
                </a>
            </div>
            <div class="content">
                <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                <a href="#">
                    <h1>khu công nghiệp hải sơn</h1>
                </a>
                <p>Cung cấp vật liệu xây dựng</p>
            </div>
        </div>
        <div class="item col-sm-6">
            <div class="img">
                <a href="#">
                    <img src="assets/images/ct5.jpg" alt="" />
                </a>
            </div>
            <div class="content">
                <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                <a href="#">
                    <h1>khu công nghiệp hải sơn</h1>
                </a>
                <p>Cung cấp vật liệu xây dựng</p>
            </div>
        </div>
        <div class="item col-sm-6">
            <div class="img">
                <a href="#">
                    <img src="assets/images/ct6.jpg" alt="" />
                </a>
            </div>
            <div class="content">
                <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                <a href="#">
                    <h1>khu công nghiệp hải sơn</h1>
                </a>
                <p>Cung cấp vật liệu xây dựng</p>
            </div>
        </div>
    </div>
    <div class="pager">
        <a href="#" class="prev fa fa-caret-left"></a>
        <a href="#" class="current">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#" class="next fa fa-caret-right"></a>
        <a href="#" class="last fa fa-forward"></a>
    </div>
</asp:Content>

