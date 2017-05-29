<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="products-detail.aspx.cs" Inherits="products_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">
    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="#">Sản phẩm - Dịch vụ</a></li>
    <li class="breadcrumb-item"><a href="#">Cho thuê xe cơ giới</a></li>
    <li class="breadcrumb-item active">Cho thuê xe cuốc</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="aside" Runat="Server">
    <ul>
        <li><a href="#">San lấp mặt bằng</a></li>
        <li><a href="#">Thi công hạ tầng</a></li>
        <li><a href="#">Vận tải hàng hóa</a></li>
        <li><a href="#">Cho thuê xe cơ giới</a></li>
        <li><a href="#">Bất động sản</a></li>
        <li><a href="#">Kinh doanh vật liệu xây dựng</a></li>
        <li><a href="#">Thiết kế - thi công công trình dân dụng - công nghiệp</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="wrap_main" Runat="Server">
    <h1 class="title-ct">Cho thuê xe cuốc</h1>
    <div class="wrapDetail">
        <div class="slideImg">
            <div class="slider-for">
                <div class="item">
                    <img src="assets/images/de.jpg" alt="" />
                </div>
                <div class="item">
                    <img src="assets/images/de.jpg" alt="" />
                </div>
                <div class="item">
                    <img src="assets/images/de.jpg" alt="" />
                </div>
                <div class="item">
                    <img src="assets/images/de.jpg" alt="" />
                </div>
                <div class="item">
                    <img src="assets/images/de.jpg" alt="" />
                </div>
                <div class="item">
                    <img src="assets/images/de.jpg" alt="" />
                </div>
                <div class="item">
                    <img src="assets/images/de.jpg" alt="" />
                </div>
            </div>
            <div class="slider-nav">
                <div class="item">
                    <img src="assets/images/thumb1.jpg" alt="" /></div>
                <div class="item">
                    <img src="assets/images/thumb1.jpg" alt="" /></div>
                <div class="item">
                    <img src="assets/images/thumb1.jpg" alt="" /></div>
                <div class="item">
                    <img src="assets/images/thumb1.jpg" alt="" /></div>
                <div class="item">
                    <img src="assets/images/thumb1.jpg" alt="" /></div>
                <div class="item">
                    <img src="assets/images/thumb1.jpg" alt="" /></div>
                <div class="item">
                    <img src="assets/images/thumb1.jpg" alt="" /></div>
            </div>
        </div>
        <div class="ctDetails">
            <p>
                Đức Hòa là vùng kinh tế trọng điểm phía nam, nơi "đất lành chim đậu”, cách quốc lộ 1A 12km, cách xã Bình Lợi, huyện Bình Chánh, Tp. HCM 3km, giao thông thuận lợi tạo điều kiện cho nhiều nhà đầu tư, doanh nghiệp chọn địa điểm đầu tư phát triển kinh tế, đặc biệt là công nghiệp.
            </p>
            <p>
                Địa chất rất tốt bao gồm đất, sét, sỏi, dưới tầng móng do đó chi phí đầu tư để xây dựng nhà xưởng giảm, thấp so với các khu vực khác là 30%. Đường chính dẫn vào khu công nghiệp rộng 26m, bao gồm lề, hai bên vỉa hè có cây xanh nhiều bóng mát, các đường phụ rộng 22m.
            </p>
            <p>
                Công ty TNHH Hải Sơn là chủ đầu tư cơ sở hạ tầng với hình thức giao đất có đóng tiền sử dụng đất, chuyển mục đích sử dụng toàn bộ cho các doanh nghiệp đến đầu tư. Tất cả các chi phí đóng tiền sử dụng đất do công ty Hải Sơn chi trả và chịu trách nhiệm lập thủ tục đăng ký GPKD và thủ tục chuyển quyền sử dụng đất trong thời gian sớm nhất nhằm tạo điều kiện thuận lợi cho các doanh nghiệp có nhiều cơ hội để chọn điểm dừng là khu công nghiệp Hải Sơn. Bên cạnh đó giá chuyển nhượng hợp lý so với các khu vực khác.
            </p>
        </div>
        <div class="news-cate row proLienquan">
            <h1>Sản phẩm liên quan</h1>
            <div class="clr"></div>
            <div class="item col-md-4 col-sm-6">
                <div class="img">
                    <a href="products-detail.aspx">
                        <img src="assets/images/news1.jpg" alt="" />
                    </a>
                </div>
                <div class="content">
                    <a href="products-detail.aspx">
                        <h1>Cho thuê xe cuốc</h1>
                    </a>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultrices consequat nibh. In hac habitasse</p>
                    <div class="readmore">
                        <a href="products-detail.aspx">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            <div class="item col-md-4 col-sm-6">
                <div class="img">
                    <a href="#">
                        <img src="assets/images/news1.jpg" alt="" />
                    </a>
                </div>
                <div class="content">
                    <a href="#">
                        <h1>Cho thuê xe cuốc</h1>
                    </a>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultrices consequat nibh. In hac habitasse</p>
                    <div class="readmore">
                        <a href="#">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            <div class="item col-md-4 col-sm-6">
                <div class="img">
                    <a href="#">
                        <img src="assets/images/news1.jpg" alt="" />
                    </a>
                </div>
                <div class="content">
                    <a href="#">
                        <h1>Cho thuê xe cuốc</h1>
                    </a>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultrices consequat nibh. In hac habitasse</p>
                    <div class="readmore">
                        <a href="#">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="lienquan" Runat="Server">
</asp:Content>

