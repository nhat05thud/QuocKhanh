<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="constructions-detail.aspx.cs" Inherits="constructions_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Quốc Khanh</title>
    <meta name="description" content="Quốc Khanh" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">
    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="#">Công trình</a></li>
    <li class="breadcrumb-item"><a href="#">Đã thi công</a></li>
    <li class="breadcrumb-item active">Khu công nghiệp Hải Sơn</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="aside" Runat="Server">
    <ul>
        <li><a href="#">Đã thi công</a></li>
        <li><a href="#">Đang thi công</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="wrap_main" Runat="Server">
    <h1 class="title-ct">khu công nghiệp Hải Sơn</h1>
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
            <h1>thông tin công trình</h1>
            <ul>
                <li><b>Địa điểm xây dựng</b><span>Ấp Bình Tiền 2 – Xã Đức Hòa Hạ - Huyện Đức Hòa – Tỉnh Long An.</span></li>
                <li><b>Chủ đầu tư</b><span>Chủ đầu tư</span></li>
                <li><b>Đơn vị thiết kế</b><span>DNTN Quốc Khanh</span></li>
                <li><b>Đơn vị thi công</b><span>DNTN Quốc Khanh</span></li>
                <li><b>Ngày khởi công</b><span>03/05/2016</span></li>
                <li><b>Ngày hoàn thành</b><span>03/05/2017</span></li>
                <li><b>Diện tích nền trệt</b><span>150m x 400m</span></li>
            </ul>
            <p>
                <b>Vị trí Khu công nghiệp</b> <br />
                Đức Hòa là vùng kinh tế trọng điểm phía nam, nơi "đất lành chim đậu”, cách quốc lộ 1A 12km, cách xã Bình Lợi, huyện Bình Chánh, Tp. HCM 3km, giao thông thuận lợi tạo điều kiện cho nhiều nhà đầu tư, doanh nghiệp chọn địa điểm đầu tư phát triển kinh tế, đặc biệt là công nghiệp.
            </p>
            <p>
                <b>Hạ tầng kỹ thuật</b> <br />
                Địa chất rất tốt bao gồm đất, sét, sỏi, dưới tầng móng do đó chi phí đầu tư để xây dựng nhà xưởng giảm, thấp so với các khu vực khác là 30%. Đường chính dẫn vào khu công nghiệp rộng 26m, bao gồm lề, hai bên vỉa hè có cây xanh nhiều bóng mát, các đường phụ rộng 22m.
            </p>
            <p>
                <b>Đầu tư kinh doanh khu công nghiệp</b> <br />
                Công ty TNHH Hải Sơn là chủ đầu tư cơ sở hạ tầng với hình thức giao đất có đóng tiền sử dụng đất, chuyển mục đích sử dụng toàn bộ cho các doanh nghiệp đến đầu tư. Tất cả các chi phí đóng tiền sử dụng đất do công ty Hải Sơn chi trả và chịu trách nhiệm lập thủ tục đăng ký GPKD và thủ tục chuyển quyền sử dụng đất trong thời gian sớm nhất nhằm tạo điều kiện thuận lợi cho các doanh nghiệp có nhiều cơ hội để chọn điểm dừng là khu công nghiệp Hải Sơn. Bên cạnh đó giá chuyển nhượng hợp lý so với các khu vực khác.
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="lienquan" Runat="Server">
    <div class="wrap-lienquan">
        <h1>công trình khác</h1>
        <div class="construction-cate row">
            <div class="item col-md-4 col-sm-6">
                <div class="img">
                    <a href="#">
                        <img src="assets/images/ct1.jpg" alt="" />
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
            <div class="item col-md-4 col-sm-6">
                <div class="img">
                    <a href="#">
                        <img src="assets/images/ct2.jpg" alt="" />
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
            <div class="item col-md-4 col-sm-6">
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
        </div>
    </div>
</asp:Content>
