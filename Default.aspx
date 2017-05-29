<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner">
        <div id="wowslider-container1">
            <div class="ws_images">
                <ul>
                    <li><a href="#">
                        <img src="assets/images/banner1.jpg" alt="" title="Ecovet" id="wows1_0" /></a>Xin chào</li>
                    <li>
                        <img src="assets/images/banner2.jpg" alt="" title="Ecovet" id="wows1_1" />Dinh dưỡng cho thú nuôi
                    </li>
                    <li>
                        <img src="assets/images/banner3.jpg" alt="" title="Ecovet" id="wows1_2" />Dinh dưỡng cho thú nuôi
                    </li>
                    <li>
                        <img src="assets/images/banner4.jpg" alt="" title="Ecovet" id="wows1_3" />Dinh dưỡng cho thú nuôi
                    </li>
                </ul>
            </div>
            <%--<div class="ws_bullets">
                <div>
                    <a href="#" title=""><span>1</span></a>
                    <a href="#" title=""><span>2</span></a>
                    <a href="#" title=""><span>3</span></a>
                    <a href="#" title=""><span>4</span></a>
                </div>
            </div>--%>
        </div>
    </div>
    <section class="aboutUs">
        <div class="container">
            <div class="left">
                <div class="head">
                    <h1>GIỚI THIỆU <span>DOANH NGHIỆP QUỐC KHANH</span></h1>
                </div>
                <p>Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris in erat justo. Nullam ac urna eu felis dapibus condimentum sit amet a augue.</p>
            </div>
            <div class="right">
                <div class="item-cate">
                    <div class="item">
                        <div class="img">
                            <img src="assets/images/gt1.png" alt="" />
                        </div>
                        <p>Uy tín, <br />
                            Chất lượng</p>
                    </div>
                    <div class="item">
                        <div class="img">
                            <img src="assets/images/gt2.png" alt="" />
                        </div>
                        <p>Trang thiết bị tiên tiến</p>
                    </div>
                    <div class="item">
                        <div class="img">
                            <img src="assets/images/gt3.png" alt="" />
                        </div>
                        <p>Đội ngũ kỹ thuật chuyên môn cao</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="proService">
        <div class="container">
            <h1 class="title">sản phẩm & dịch vụ</h1>
            <div class="grid">
                <div class="grid-item grid-item-width2 grid-item-height2">
                    <a href="#">
                        <img src="assets/images/sv1.png" alt="" />
                        <p>SAN LẤP MẶT BẰNG</p>
                    </a>
                </div>
                <div class="grid-item">
                    <a href="#">
                        <img src="assets/images/sv2.png" alt="" />
                        <p>THI CÔNG HẠ TẦNG</p>
                    </a>
                </div>
                <div class="grid-item">
                    <a href="#">
                        <img src="assets/images/sv3.png" alt="" />
                        <p>VẬN TẢI HÀNG HÓA</p>
                    </a>
                </div>
                <div class="grid-item">
                    <a href="#">
                        <img src="assets/images/sv4.png" alt="" />
                        <p>CHO THUÊ XE CƠ GIỚI</p>
                    </a>
                </div>
                <div class="grid-item">
                    <a href="#">
                        <img src="assets/images/sv5.png" alt="" />
                        <p>BẤT ĐỘNG SẢN</p>
                    </a>
                </div>
                <div class="grid-item grid-item-width2">
                    <a href="#">
                        <img src="assets/images/sv6.png" alt="" />
                        <p>KINH DOANH VẬT LIỆU XÂY DỰNG</p>
                    </a>
                </div>
                <div class="grid-item grid-item-width2">
                    <a href="#">
                        <img src="assets/images/sv7.png" alt="" />
                        <p>THIẾT KẾ - THI CÔNG CÔNG TRÌNH DÂN DỤNG - CÔNG NGHIỆP</p>
                    </a>
                </div>
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
                    <p>Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit nec tellus a odio tincidunt auctor</p>
                </div>
            </div>
            <div class="cateContruc owl-carousel">
                <div class="item">
                    <div class="img">
                        <a href="#">
                        <img src="assets/images/ct1.png" alt="" /></a>
                    </div>
                    <div class="content">
                        <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <div class="content-hidden">
                            <a href="#">khu công nghiệp hải sơn</a>
                            <p>Cung cấp vật liệu xây dựng</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <a href="#">
                        <img src="assets/images/ct2.png" alt="" /></a>
                    </div>
                    <div class="content">
                        <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <div class="content-hidden">
                            <a href="#">khu công nghiệp hải sơn</a>
                            <p>Cung cấp vật liệu xây dựng</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <a href="#">
                        <img src="assets/images/ct3.png" alt="" /></a>
                    </div>
                    <div class="content">
                        <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <div class="content-hidden">
                            <a href="#">khu công nghiệp hải sơn</a>
                            <p>Cung cấp vật liệu xây dựng</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <a href="#">
                        <img src="assets/images/ct1.png" alt="" /></a>
                    </div>
                    <div class="content">
                        <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <div class="content-hidden">
                            <a href="#">khu công nghiệp hải sơn</a>
                            <p>Cung cấp vật liệu xây dựng</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <a href="#">
                        <img src="assets/images/ct2.png" alt="" /></a>
                    </div>
                    <div class="content">
                        <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <div class="content-hidden">
                            <a href="#">khu công nghiệp hải sơn</a>
                            <p>Cung cấp vật liệu xây dựng</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <a href="#">
                        <img src="assets/images/ct3.png" alt="" /></a>
                    </div>
                    <div class="content">
                        <div class="button"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <div class="content-hidden">
                            <a href="#">khu công nghiệp hải sơn</a>
                            <p>Cung cấp vật liệu xây dựng</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="secNews">
        <div class="container">
            <div class="head">
                <h1 class="title">
                    TIN TỨC - SỰ KIỆN <i class="fa fa-circle"></i>
                </h1>
                <div class="showAll">
                    <a href="#">Xem tất cả <i class="fa fa-caret-right" aria-hidden="true"></i></a>
                </div>
            </div>
            <div class="cate-news">
                <div class="item">
                    <div class="img">
                        <img src="assets/images/news1.png" alt="" />
                    </div>
                    <div class="content">
                        <a href="#">Thép tăng giá, các công trình xây dựng lao đao</a>
                        <p>Sở chỉ đạo triển khai và nhân rộng các mô hình bảo đảm an toàn thực phẩm trong kinh doanh dịch...</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="assets/images/news2.png" alt="" />
                    </div>
                    <div class="content">
                        <a href="#">Giá dầu lại tăng</a>
                        <p>Sở chỉ đạo triển khai và nhân rộng các mô hình bảo đảm an toàn thực phẩm trong kinh doanh dịch...</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="assets/images/news3.png" alt="" />
                    </div>
                    <div class="content">
                        <a href="#">Xi măng tiêu thụ chậm - giá vẫn tăng</a>
                        <p>Sở chỉ đạo triển khai và nhân rộng các mô hình bảo đảm an toàn thực phẩm trong kinh doanh dịch...</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="assets/images/news4.png" alt="" />
                    </div>
                    <div class="content">
                        <a href="#">Hiệp hội Thép giải thích lý do tăng giá</a>
                        <p>Sở chỉ đạo triển khai và nhân rộng các mô hình bảo đảm an toàn thực phẩm trong kinh doanh dịch...</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="assets/js/wowslider.js"></script>
    <script src="assets/js/script-wow.js"></script>
</asp:Content>
