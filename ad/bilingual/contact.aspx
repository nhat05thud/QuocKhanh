<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="contact.aspx.cs" Inherits="ad_single_project" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Spaanjaars.Toolkit" Namespace="Spaanjaars.Toolkit" TagPrefix="isp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="../assets/styles/rating.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var tableView = null;
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }

        function RowMouseOver(sender, eventArgs) {
            var selectedRows = sender.get_masterTableView().get_selectedItems();
            var elem = $get(eventArgs.get_id());
            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();

                    if (selectedID != eventArgs.get_id())
                        elem.className += (" rgSelectedRow");
                }
            else
                elem.className += (" rgSelectedRow");
        }

        function RowMouseOut(sender, eventArgs) {
            var className = "rgSelectedRow";
            var elem = $get(eventArgs.get_id());

            var selectedRows = sender.get_masterTableView().get_selectedItems();

            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();
                    if (selectedID != eventArgs.get_id())
                        removeCssClass(className, elem);
                }
            else
                removeCssClass(className, elem);
        }

        function removeCssClass(className, element) {
            element.className = element.className.replace(className, "").replace(/^\s+/, '').replace(/\s+$/, '');
        }

        function pageLoad(sender, args) {
            tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        }

        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {
            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
        }

        //On insert and update buttons click temporarily disables ajax to perform upload actions
        function conditionalPostback(sender, eventArgs) {
            var theRegexp = new RegExp("\.lnkUpdate$|\.lnkUpdateTop$|\.PerformInsertButton$", "ig");
            if (eventArgs.get_eventTarget().match(theRegexp)) {
                var upload = $find(window['UploadId']);

                //AJAX is disabled only if file is selected for upload
                if (upload.getFileInputs()[0].value != "") {
                    eventArgs.set_enableAjax(false);
                }
            }
            else if (eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToWordButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToPdfButton") >= 0)
                eventArgs.set_enableAjax(false);
        }

        function validateRadUpload(source, e) {
            e.IsValid = false;

            var upload = $find(source.parentNode.getElementsByTagName('div')[0].id);
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                //check for empty string or invalid extension
                if (upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }

        function containerMouseover(sender) {
            sender.getElementsByTagName("div")[0].style.display = "";
        }
        function containerMouseout(sender) {
            sender.getElementsByTagName("div")[0].style.display = "none";
        }
    </script>
    <style type="text/css">
        .myClass:hover {
            background-color: #a1da29 !important;
        }

        .txt {
            border: 0px !important;
            background: #eeeeee !important;
            color: Black !important;
            margin-left: 25%;
            margin-right: auto;
            width: 100%;
            filter: alpha(opacity=50); /* IE's opacity*/
            opacity: 0.50;
            text-align: center;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        <img alt="" src="../assets/images/project.png" class="vam" />
        Liên Hệ
    </h3>
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback">
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server" Visible="false">
            <h4 class="searchTitle">Tìm kiếm
            </h4>
            <table class="search">
                <tr>
                    <td class="left">Tên Liên Hệ
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchProjectTitle" runat="server" Width="130px" EmptyMessage="Tên Liên Hệ...">
                        </asp:RadTextBox>
                    </td>
                </tr>
                <tr class="invisible">
                    <td class="left">Thông Tin Footer
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchDescription" runat="server" Width="130px" EmptyMessage="Thông Tin Footer...">
                        </asp:RadTextBox>
                    </td>
                    <td class="left">Từ ngày
                    </td>
                    <td>
                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpFromDate" runat="server" Culture="vi-VN"
                            Calendar-CultureInfo="vi-VN" Width="138px">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </asp:RadDatePicker>
                    </td>
                    <td class="left">Đến ngày
                    </td>
                    <td>
                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpToDate" runat="server" Culture="vi-VN"
                            Calendar-CultureInfo="vi-VN" Width="138px">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </asp:RadDatePicker>
                    </td>
                    <td class="left">Danh mục
                    </td>
                    <td>
                        <asp:RadComboBox Filter="Contains" ID="ddlSearchCategory" runat="server" DataSourceID="ObjectDataSource2"
                            DataTextField="ProjectCategoryName" DataValueField="ProjectProjectCategoryID" OnDataBound="DropDownList_DataBound"
                            Width="134px" EmptyMessage="- Tất cả -">
                        </asp:RadComboBox>
                    </td>
                    <td class="left"> Mạng xã hội
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchTag" runat="server" Width="130px" EmptyMessage="Tag...">
                        </asp:RadTextBox>
                    </td>
                    <td class="left">Xem trên trang chủ
                    </td>
                    <td>
                        <asp:RadComboBox ID="ddlSearchIsShowOnHomePage" runat="server" Filter="Contains"
                            Width="134px" EmptyMessage="- Tất cả -">
                            <Items>
                                <asp:RadComboBoxItem Value="" />
                                <asp:RadComboBoxItem Text="Có" Value="True" />
                                <asp:RadComboBoxItem Text="Không" Value="False" />
                            </Items>
                        </asp:RadComboBox>
                    </td>
                </tr>
                <tr class="invisible">
                    <td class="left">Hiển thị
                    </td>
                    <td>
                        <asp:RadComboBox ID="ddlSearchIsAvailable" runat="server" Filter="Contains" Width="134px"
                            EmptyMessage="- Tất cả -">
                            <Items>
                                <asp:RadComboBoxItem Value="" />
                                <asp:RadComboBoxItem Text="Có" Value="True" />
                                <asp:RadComboBoxItem Text="Không" Value="False" />
                            </Items>
                        </asp:RadComboBox>
                    </td>
                    <td class="left">Thứ tự
                    </td>
                    <td>
                        <asp:RadComboBox ID="ddlSearchPriority" runat="server" Filter="Contains" Width="134px"
                            EmptyMessage="- Tất cả -">
                            <Items>
                                <asp:RadComboBoxItem Value="" />
                                <asp:RadComboBoxItem Text="Có" Value="True" />
                                <asp:RadComboBoxItem Text="Không" Value="False" />
                            </Items>
                        </asp:RadComboBox>
                    </td>
                    <td class="left">&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                    <td class="left">&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                </tr>
            </table>
            <div align="right" style="padding: 5px 0 5px 0; border-bottom: 1px solid #ccc; margin-bottom: 10px">
                <asp:RadButton ID="btnSearch" runat="server" Text="Tìm kiếm">
                    <Icon PrimaryIconUrl="~/ad/assets/images/find.png" />
                </asp:RadButton>
            </div>
        </asp:Panel>
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" Culture="vi-VN" AllowMultiRowSelection="True"
            AllowSorting="True" DataSourceID="ObjectDataSource1" GridLines="Horizontal" AutoGenerateColumns="False"
            ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" PageSize="50"
            CssClass="grid" AllowAutomaticUpdates="True"
            CellSpacing="0">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" EnableDragToSelectRows="false" />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="ProjectID">
                <%--<CommandItemSettings ShowExportToExcelButton="True" ShowExportToPdfButton="True"
                    ShowExportToWordButton="True"></CommandItemSettings>--%>
                <PagerStyle AlwaysVisible="true" Mode="NextPrevNumericAndAdvanced" PageButtonCount="10"
                    FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Trang kế"
                    NextPageToolTip="Trang kế" PagerTextFormat="Đổi trang: {4} &nbsp;Trang <strong>{0}</strong> / <strong>{1}</strong>, Kết quả <strong>{2}</strong> - <strong>{3}</strong> trong <strong>{5}</strong>."
                    PageSizeLabelText="Kết quả mỗi trang:" PrevPagesToolTip="Trang trước" PrevPageToolTip="Trang trước" />
                <CommandItemTemplate>
                    <div class="command">
                        <div style="float: right">
                            <asp:Button ID="ExportToExcelButton" runat="server" CssClass="rgExpXLS" CommandName="ExportToExcel"
                                AlternateText="Excel" ToolTip="Xuất ra Excel" />
                            <asp:Button ID="ExportToPdfButton" runat="server" CssClass="rgExpPDF" CommandName="ExportToPdf"
                                AlternateText="PDF" ToolTip="Xuất ra PDF" />
                            <asp:Button ID="ExportToWordButton" runat="server" CssClass="rgExpDOC" CommandName="ExportToWord"
                                AlternateText="Word" ToolTip="Xuất ra Word" />
                        </div>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới</asp:LinkButton>|
                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/delete-icon.png" /> Hủy</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img width="12px" class="vam" alt="" src="../assets/images/tools.png" /> Sửa</asp:LinkButton>|
                        <%--<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Cập nhật</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Xóa tất cả dòng đã chọn?')"
                            runat="server" CommandName="DeleteSelected" CssClass="item"><img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="item"><img class="vam" alt="" src="../assets/images/reload.png" /> Làm mới</asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </CommandItemTemplate>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn" />
                    <%--<asp:GridEditCommandColumn ButtonType="ImageButton" HeaderStyle-Width="1%" />
                    <asp:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmText="Xóa dòng này ?"
                        ConfirmTitle="Xóa" ConfirmDialogType="RadWindow" HeaderStyle-Width="1%" />--%>
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataSetIndex + 1 %>
                            <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn DataField="ProjectTitle" HeaderText="Tên Liên Hệ" SortExpression="ProjectTitle" />
                    <asp:GridBoundColumn DataField="ProjectTitleEn" HeaderText="Tên Liên Hệ En" SortExpression="ProjectTitleEn" />
                    <asp:GridBoundColumn DataField="ProjectTitleCn" HeaderText="Tên Liên Hệ Cn" SortExpression="ProjectTitleCn" />
                    <asp:GridBoundColumn DataField="ProjectCategoryName" HeaderText="Danh mục" SortExpression="ProjectCategoryName" />
                    <asp:GridTemplateColumn DataField="Priority" HeaderStyle-Width="1%" HeaderText="Thứ tự"
                        SortExpression="Priority">
                        <ItemTemplate>
                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="70px" Text='<%# Bind("Priority") %>'
                                ShowSpinButtons="true" MinValue="0" EmptyMessage="Thứ tự..." Type="Number">
                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                            </asp:RadNumericTextBox>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn Visible="false" DataField="IsShowOnHomePage" HeaderText="Xem trên trang chủ"
                        SortExpression="IsShowOnHomePage">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsShowOnHomePage" runat="server" Checked='<%# string.IsNullOrEmpty(Eval("IsShowOnHomePage").ToString()) ? false : Eval("IsShowOnHomePage") %>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="IsAvailable" HeaderText="Hiển thị" SortExpression="IsAvailable">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# string.IsNullOrEmpty(Eval("IsAvailable").ToString()) ? false : Eval("IsAvailable") %>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn Visible="false" HeaderText="Ngày tạo" SortExpression="CreateDate" HeaderStyle-Width="1%">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MM/yyyy hh:mm tt}", Eval("CreateDate"))%>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="ImageName" HeaderText="Ảnh" Visible="false" SortExpression="ImageName">
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                Width="95">
                                <img alt="" src='<%# "~/res/project/thumbs/" + Eval("ImageName") %>' width="80" runat="server"
                                    visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' />
                                <asp:LinkButton ID="lnkDeleteImage" runat="server" rel='<%#  Eval("ProjectID") + "#" + Eval("ImageName") %>'
                                    CommandName="DeleteImage" OnClientClick="return confirm('Xóa ảnh này ?')">
                                <img alt="Xóa ảnh" title="Xóa ảnh" src="../assets/images/delete-icon.png" />
                                </asp:LinkButton>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <table width="100%">
                                <tr>
                                    <td valign="top">
                                        <div class="sub_box">
                                            <div class="head">
                                                Thông Tin Liên Hệ
                                            </div>
                                            <div class="cont">
                                                <asp:HiddenField ID="hdnProjectID" runat="server" Value='<%# Eval("ProjectID") %>' />
                                                <asp:HiddenField ID="hdnOldImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                                <div class="edit">
                                                    <hr />
                                                    <asp:RadButton ID="lnkUpdateTop" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                                        Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                                        <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                                    </asp:RadButton>
                                                    &nbsp;&nbsp;
                                                    <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                                        <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                                    </asp:RadButton>
                                                </div>
                                                <table class="search">
                                                    <tr class="invisible">
                                                        <td class="left" valign="top">Ảnh đại diện
                                                        </td>
                                                        <td runat="server">
                                                            <asp:RadUpload ID="FileImageName" runat="server" ControlObjectsVisibility="None"
                                                                Culture="vi-VN" Language="vi-VN" InputSize="69" AllowedFileExtensions=".jpg,.jpeg,.gif,.png" />
                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                                                ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                                                            <%--<asp:RadAsyncUpload ID="FileImageName" runat="server"
                                                                TargetFolder="~/res/project/album/" TemporaryFolder="~/res/TempAsync" Width="100%"
                                                                AllowedFileExtensions="jpg,jpeg,gif,png" Localization-Select="Chọn" Localization-Cancel="Hủy"
                                                                Localization-Remove="Xóa" OnFileUploaded="FileImageAlbum_FileUploaded">
                                                            </asp:RadAsyncUpload>--%>
                                                            <asp:HiddenField ID="hdnNewImageName" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr class="invisible">
                                                        <td class="left" colspan="2">
                                                            <asp:CheckBox ID="chkIsShowOnHomePage" runat="server" CssClass="checkbox" Text=" Xem trên trang chủ"
                                                                Checked='<%# (Container is GridEditFormInsertItem) ? true : (string.IsNullOrEmpty(Eval("IsShowOnHomePage").ToString()) ? false : Eval("IsShowOnHomePage"))%>' />
                                                            &nbsp;&nbsp;
                                                            <asp:CheckBox ID="chkIsAvailable" runat="server" CssClass="checkbox" Text=" Hiển thị"
                                                                Checked='<%# (Container is GridEditFormInsertItem) ? true : (string.IsNullOrEmpty(Eval("IsAvailable").ToString()) ? false : Eval("IsAvailable")) %>' />
                                                        </td>
                                                    </tr>
                                                    <tr class="invisible">
                                                        <td class="left">Danh mục
                                                        </td>
                                                        <td>
                                                            <asp:RadComboBox Filter="Contains" ID="ddlCategory" runat="server" DataSourceID="ObjectDataSource2"
                                                                DataTextField="ProjectCategoryName" DataValueField="ProjectProjectCategoryID" Width="504px"
                                                                OnDataBound="DropDownList_DataBound" EmptyMessage="- Chọn -">
                                                            </asp:RadComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Thứ tự
                                                        </td>
                                                        <td>
                                                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                                                EmptyMessage="Thứ tự..." Type="Number">
                                                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                                            </asp:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Meta Title
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtMetaTittle" runat="server" Width="500px" Text='<%# Bind("MetaTittle") %>'
                                                                EmptyMessage="Title...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Meta Description
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtMetaDescription" runat="server" Width="500px" Text='<%# Bind("MetaDescription") %>'
                                                                EmptyMessage="Meta Description...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Tên Liên Hệ
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtProjectTitle" runat="server" Text='<%# Bind("ProjectTitle") %>'
                                                                Width="500px" EmptyMessage="Tên Liên Hệ...">
                                                            </asp:RadTextBox>
                                                            <%--<asp:RadTextBox runat="server" Width="500px" ID="RadTextBox1" Text='<%# Bind("ProjectTitle") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProjectTitle"
                                            Display="Dynamic" ErrorMessage="Nhập tên Liên Hệ" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left"> Mạng xã hội
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtTag" runat="server" Height="200" Language="vi-VN" Skin="Office2007"
                                                                Width="98%" Content='<%# Bind("Tag") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                                <Tools>
                                                                    <asp:EditorToolGroup>
                                                                        <asp:EditorTool Name="Copy" />
                                                                        <asp:EditorTool Name="Cut" />
                                                                        <asp:EditorTool Name="Paste" />
                                                                        <asp:EditorTool Name="Bold" />
                                                                        <asp:EditorTool Name="Italic" />
                                                                        <asp:EditorTool Name="Underline" />
                                                                        <asp:EditorTool Name="InsertLink" />
                                                                        <asp:EditorTool Name="ForeColor" />
                                                                        <asp:EditorTool Name="TemplateManager" />
                                                                        <asp:EditorTool Name="ImageManager" />
                                                                    </asp:EditorToolGroup>
                                                                </Tools>
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" valign="top">Thông Tin Footer
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtDescription" runat="server" Height="200" Language="vi-VN" Skin="Office2007"
                                                                Width="98%" Content='<%# Bind("Description") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                                <Tools>
                                                                    <asp:EditorToolGroup>
                                                                        <asp:EditorTool Name="Copy" />
                                                                        <asp:EditorTool Name="Cut" />
                                                                        <asp:EditorTool Name="Paste" />
                                                                        <asp:EditorTool Name="Bold" />
                                                                        <asp:EditorTool Name="Italic" />
                                                                        <asp:EditorTool Name="Underline" />
                                                                        <asp:EditorTool Name="InsertLink" />
                                                                        <asp:EditorTool Name="ForeColor" />
                                                                        <asp:EditorTool Name="TemplateManager" />
                                                                        <asp:EditorTool Name="ImageManager" />
                                                                    </asp:EditorToolGroup>
                                                                </Tools>
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" valign="top">Thông Tin Trang Liên Hệ
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtContent" runat="server" Language="vi-VN" Skin="Office2007"
                                                                Width="98%" Content='<%# Bind("Content") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                    <%-- Tiếng Anh--%>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h3>(Ngôn Ngữ Tiếng Anh)</h3>
                                                            <hr />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Meta Title
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtMetaTittleEn" runat="server" Width="500px" Text='<%# Bind("MetaTittleEn") %>'
                                                                EmptyMessage="Meta Title(En)...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Meta Description
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtMetaDescriptionEn" runat="server" Width="500px" Text='<%# Bind("MetaDescriptionEn") %>'
                                                                EmptyMessage="Meta Description...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Tên Liên Hệ
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtProjectTitleEn" runat="server" Text='<%# Bind("ProjectTitleEn") %>'
                                                                EmptyMessage="Tên Liên Hệ..." Width="500px">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left"> Mạng xã hội(En)
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtTagEn" runat="server" Height="200" Language="vi-VN" Skin="Office2007"
                                                                Width="98%" Content='<%# Bind("TagEn") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                                <Tools>
                                                                    <asp:EditorToolGroup>
                                                                        <asp:EditorTool Name="Copy" />
                                                                        <asp:EditorTool Name="Cut" />
                                                                        <asp:EditorTool Name="Paste" />
                                                                        <asp:EditorTool Name="Bold" />
                                                                        <asp:EditorTool Name="Italic" />
                                                                        <asp:EditorTool Name="Underline" />
                                                                        <asp:EditorTool Name="InsertLink" />
                                                                        <asp:EditorTool Name="ForeColor" />
                                                                        <asp:EditorTool Name="TemplateManager" />
                                                                        <asp:EditorTool Name="ImageManager" />
                                                                    </asp:EditorToolGroup>
                                                                </Tools>
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" valign="top">Thông Tin Footer
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtDescriptionEn" runat="server" Height="200" Language="vi-VN"
                                                                Skin="Office2007" Width="98%" Content='<%# Bind("DescriptionEn") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                                <Tools>
                                                                    <asp:EditorToolGroup>
                                                                        <asp:EditorTool Name="Copy" />
                                                                        <asp:EditorTool Name="Cut" />
                                                                        <asp:EditorTool Name="Paste" />
                                                                        <asp:EditorTool Name="Bold" />
                                                                        <asp:EditorTool Name="Italic" />
                                                                        <asp:EditorTool Name="Underline" />
                                                                        <asp:EditorTool Name="InsertLink" />
                                                                        <asp:EditorTool Name="ForeColor" />
                                                                        <asp:EditorTool Name="TemplateManager" />
                                                                        <asp:EditorTool Name="ImageManager" />
                                                                    </asp:EditorToolGroup>
                                                                </Tools>
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" valign="top">Thông Tin Trang Liên Hệ
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtContentEn" runat="server" Language="vi-VN" Skin="Office2007"
                                                                Width="98%" Content='<%# Bind("ContentEn") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>

                                                    <%-- Tiếng Trung--%>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h3>(Ngôn Ngữ Tiếng Trung)</h3>
                                                            <hr />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Meta Title
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtMetaTittleCn" runat="server" Width="500px" Text='<%# Bind("MetaTittleCn") %>'
                                                                EmptyMessage="Meta Title ...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Meta Description
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtMetaDescriptionCn" runat="server" Width="500px" Text='<%# Bind("MetaDescriptionCn") %>'
                                                                EmptyMessage="Meta Description...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">Tên Liên Hệ
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtProjectTitleCn" runat="server" Text='<%# Bind("ProjectTitleCn") %>'
                                                                EmptyMessage="Tên Liên Hệ..." Width="500px">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left"> Mạng xã hội(Cn)
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtTagCn" runat="server" Height="200" Language="vi-VN" Skin="Office2007"
                                                                Width="98%" Content='<%# Bind("TagCn") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                                <Tools>
                                                                    <asp:EditorToolGroup>
                                                                        <asp:EditorTool Name="Copy" />
                                                                        <asp:EditorTool Name="Cut" />
                                                                        <asp:EditorTool Name="Paste" />
                                                                        <asp:EditorTool Name="Bold" />
                                                                        <asp:EditorTool Name="Italic" />
                                                                        <asp:EditorTool Name="Underline" />
                                                                        <asp:EditorTool Name="InsertLink" />
                                                                        <asp:EditorTool Name="ForeColor" />
                                                                        <asp:EditorTool Name="TemplateManager" />
                                                                        <asp:EditorTool Name="ImageManager" />
                                                                    </asp:EditorToolGroup>
                                                                </Tools>
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" valign="top">Thông Tin Footer
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtDescriptionCn" runat="server" Height="200" Language="vi-VN"
                                                                Skin="Office2007" Width="98%" Content='<%# Bind("DescriptionCn") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                                <Tools>
                                                                    <asp:EditorToolGroup>
                                                                        <asp:EditorTool Name="Copy" />
                                                                        <asp:EditorTool Name="Cut" />
                                                                        <asp:EditorTool Name="Paste" />
                                                                        <asp:EditorTool Name="Bold" />
                                                                        <asp:EditorTool Name="Italic" />
                                                                        <asp:EditorTool Name="Underline" />
                                                                        <asp:EditorTool Name="InsertLink" />
                                                                        <asp:EditorTool Name="ForeColor" />
                                                                        <asp:EditorTool Name="TemplateManager" />
                                                                        <asp:EditorTool Name="ImageManager" />
                                                                    </asp:EditorToolGroup>
                                                                </Tools>
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" valign="top">Thông Tin Trang Liên Hệ
                                                        </td>
                                                        <td>
                                                            <asp:RadEditor ID="txtContentCn" runat="server" Language="vi-VN" Skin="Office2007"
                                                                Width="98%" Content='<%# Bind("ContentCn") %>'>
                                                                <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1000000" />
                                                                <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                                <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1000000" />
                                                                <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                                <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                    ViewPaths="~/Uploads/Template/" />
                                                            </asp:RadEditor>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="edit">
                                                    <hr />
                                                    <asp:RadButton ID="lnkUpdate" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                                        Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                                        <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                                    </asp:RadButton>
                                                    &nbsp;&nbsp;
                                                    <asp:RadButton ID="RadButton1" runat="server" CommandName='Cancel' Text='Hủy'>
                                                        <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                                    </asp:RadButton>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <asp:Panel ID="Panel4" runat="server" Visible="false">
                                        <td valign="top">
                                            <div class="sub_box">
                                                <div class="head">
                                                    Ảnh Liên Hệ
                                                </div>
                                                <div class="cont">
                                                    <asp:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                        <asp:RadAsyncUpload ID="FileImageAlbum" runat="server" MultipleFileSelection="Automatic"
                                                            TargetFolder="~/res/project/album/" TemporaryFolder="~/res/TempAsync" Width="100%"
                                                            AllowedFileExtensions="jpg,jpeg,gif,png" Localization-Select="Chọn" Localization-Cancel="Hủy"
                                                            Localization-Remove="Xóa" OnFileUploaded="FileImageAlbum_FileUploaded">
                                                        </asp:RadAsyncUpload>
                                                        <asp:RadButton ID="btnUpload" runat="server" Text="Tải lên" ShowPostBackMask="False">
                                                            <Icon PrimaryIconUrl="~/ad/assets/images/up.png" />
                                                        </asp:RadButton>
                                                        <asp:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                            <asp:RadListView runat="server" ID="RadListView1" DataSourceID="OdsProjectPhotoAlbum"
                                                                DataKeyNames="ProjectImageID" OverrideDataSourceControlSorting="True" OnItemCommand="RadListView1_ItemCommand"
                                                                PageSize="100" Width="100%" Visible='<%# (Container is GridEditFormInsertItem) ? false : true %>'
                                                                ShowPostBackMask="false">
                                                                <LayoutTemplate>
                                                                    <div runat="server" id="itemPlaceholder" />
                                                                    <div class="clear">
                                                                    </div>
                                                                </LayoutTemplate>
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                                                    <fieldset style="float: left; margin: 5px; padding: 2px 2px 2px 2px; position: relative; background: #eeeeee;"
                                                                        class="myClass">
                                                                        <a href='<%# "~/res/project/album/" + Eval("ImageName") %>' runat="server" class="lightbox">
                                                                            <img alt="" src='<%# "~/res/project/album/thumbs/" + Eval("ImageName") %>' runat="server"
                                                                                width="100" height="100" />
                                                                        </a>
                                                                        <div align="right">
                                                                            <asp:LinkButton Visible="false" ID="btnEditSelected" runat="server" CommandName="Edit" CssClass="item"><img width="14px" class="vam" alt="" title="Sửa" src="../assets/images/tools.png" /></asp:LinkButton>
                                                                            <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa ảnh?')" runat="server"
                                                                                CommandName="Delete" CssClass="item"><img width="14px" class="vam" alt="" title="Xóa ảnh" src="../assets/images/trash.png" /></asp:LinkButton>
                                                                        </div>
                                                                    </fieldset>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:HiddenField ID="hdnProjectImageID" runat="server" Value='<%# Eval("ProjectImageID") %>' />
                                                                    <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                                                    <asp:Panel ID="Panel2" runat="server" DefaultButton="lnkUpdate">
                                                                        <h3 class="searchTitle clear">Cập Nhật Ảnh</h3>
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td valign="top" style="padding-right: 10px">
                                                                                    <table class="search" width="100%">
                                                                                        <tr>
                                                                                            <td class="left" style="width: 70px">Tiêu đề ảnh
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:RadTextBox ID="txtTitle" Width="100%" runat="server" Text='<%# Bind("Title") %>'
                                                                                                    EmptyMessage="Tiêu đề ảnh...">
                                                                                                </asp:RadTextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="left" valign="top">Thông Tin Footer
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:RadTextBox ID="txtDescription" runat="server" Width="100%" Text='<%# Bind("Descripttion")%>'
                                                                                                    EmptyMessage="Thông Tin Footer...">
                                                                                                </asp:RadTextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="left">Thứ tự
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="100%" Text='<%# Bind("Priority") %>'
                                                                                                    EmptyMessage="Thứ tự..." Type="Number">
                                                                                                    <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                                                                                </asp:RadNumericTextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="left" colspan="2">
                                                                                                <asp:CheckBox ID="chkAddIsAvailable" runat="server" Checked='<%# (Container is RadListViewInsertItem) ? true : Eval("IsAvailable")%>'
                                                                                                    Text="Hiển thị" CssClass="checkbox" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td valign="top">
                                                                                    <img alt="" src='<%# "~/res/project/album/thumbs/" + Eval("ImageName") %>' runat="server"
                                                                                        width="100" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <div class="edit">
                                                                            <hr />
                                                                            <asp:RadButton ID="lnkUpdate" runat="server" CommandName='Update' Text='Cập nhật'>
                                                                                <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                                                            </asp:RadButton>
                                                                            &nbsp;&nbsp;
                                                                        <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                                                            <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                                                        </asp:RadButton>
                                                                        </div>
                                                                        <div class="clear">
                                                                        </div>
                                                                    </asp:Panel>
                                                                </EditItemTemplate>
                                                            </asp:RadListView>
                                                            <asp:ObjectDataSource ID="OdsProjectPhotoAlbum" runat="server" DeleteMethod="ProjectImageDelete"
                                                                SelectMethod="ProjectImageSelectAll" TypeName="TLLib.ProjectImage" UpdateMethod="ProjectImageUpdate">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="ProjectImageID" Type="String" />
                                                                </DeleteParameters>
                                                                <SelectParameters>
                                                                    <asp:ControlParameter Name="ProjectID" ControlID="hdnProjectID" PropertyName="Value"
                                                                        Type="String" />
                                                                    <asp:Parameter Name="IsAvailable" Type="String" />
                                                                    <asp:Parameter Name="Priority" Type="String" />
                                                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                                </SelectParameters>
                                                                <UpdateParameters>
                                                                    <asp:Parameter Name="ProjectImageID" Type="String" />
                                                                    <asp:Parameter Name="ImageName" Type="String" />
                                                                    <asp:Parameter Name="ConvertedProjectTitle" Type="String" />
                                                                    <asp:Parameter Name="Title" Type="String" />
                                                                    <asp:Parameter Name="Descripttion" Type="String" />
                                                                    <asp:Parameter Name="TitleEn" Type="String" />
                                                                    <asp:Parameter Name="DescripttionEn" Type="String" />
                                                                    <asp:ControlParameter Name="ProjectID" ControlID="hdnProjectID" PropertyName="Value"
                                                                        Type="String" />
                                                                    <asp:Parameter Name="IsAvailable" Type="String" />
                                                                    <asp:Parameter Name="Priority" Type="String" />
                                                                </UpdateParameters>
                                                            </asp:ObjectDataSource>
                                                            <asp:RadListView runat="server" ID="RadListView2" PageSize="100" Width="100%" Visible='<%# (Container is GridEditFormInsertItem) ? true : false %>'
                                                                OnItemCommand="RadListView2_ItemCommand">
                                                                <LayoutTemplate>
                                                                    <div runat="server" id="itemPlaceholder" />
                                                                    <div class="clear">
                                                                    </div>
                                                                </LayoutTemplate>
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                                                    <fieldset style="float: left; margin: 5px; padding: 2px 2px 2px 2px; position: relative; background: #eeeeee;"
                                                                        class="myClass">
                                                                        <a id="A1" href='<%# "~/res/product/album/" + Eval("ImageName") %>' runat="server" class="lightbox">
                                                                            <img id="Img1" alt="" src='<%# "~/res/product/album/thumbs/" + Eval("ImageName") %>'
                                                                                runat="server" width="100" height="100" />
                                                                        </a>
                                                                        <div align="right">
                                                                            <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa ảnh?')" runat="server"
                                                                                CommandName="Delete" CssClass="item"><img width="14px" class="vam" alt="" title="Xóa ảnh" src="../assets/images/trash.png" /></asp:LinkButton>
                                                                        </div>
                                                                    </fieldset>
                                                                </ItemTemplate>
                                                            </asp:RadListView>
                                                        </asp:RadAjaxPanel>
                                                    </asp:RadAjaxPanel>
                                                </div>
                                            </div>
                                        </td>
                                    </asp:Panel>
                                </tr>
                            </table>
                        </asp:Panel>
                    </FormTemplate>
                </EditFormSettings>
                <%--<EditFormSettings ColumnNumber="2" CaptionDataField="ProjectTitle" CaptionFormatString="Thông Tin Liên Hệ: {0}"
                    InsertCaption="Liên Hệ Mới">
                    <FormCaptionStyle Font-Bold="true" Font-Size="12pt" ForeColor="#555555" Height="30" />
                    <FormTableItemStyle Wrap="False" Width="100%"></FormTableItemStyle>
                    <FormMainTableStyle GridLines="Horizontal" CellSpacing="0" CellPadding="3" BackColor="White"
                        Width="100%" />
                    <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="2" CssClass="module"
                        Height="50px" BackColor="White" Width="100%" />
                    <FormTableAlternatingItemStyle Wrap="False"></FormTableAlternatingItemStyle>
                    <FormStyle Width="100%"></FormStyle>
                    <EditColumn ButtonType="ImageButton" />
                    <FormTableButtonRowStyle CssClass="EditFormButtonRow" />
                </EditFormSettings>--%>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ProjectSelectAll"
        TypeName="TLLib.Project" DeleteMethod="ProjectDelete">
        <DeleteParameters>
            <asp:Parameter Name="ProjectID" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter Name="StartRowIndex" Type="String" />
            <asp:Parameter Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ProjectTitle" Type="String" />
            <asp:ControlParameter ControlID="txtSearchDescription" Name="Description" PropertyName="Text"
                Type="String" />
            <asp:Parameter Name="ProjectCategoryID" Type="String" DefaultValue="5" />
            <asp:ControlParameter ControlID="txtSearchTag" Name="Tag" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlSearchIsShowOnHomePage" Name="IsShowOnHomePage"
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="dpFromDate" Name="FromDate" PropertyName="SelectedDate"
                Type="String" />
            <asp:ControlParameter ControlID="dpToDate" Name="ToDate" PropertyName="SelectedDate"
                Type="String" />
            <asp:ControlParameter ControlID="ddlSearchIsAvailable" Name="IsAvailable" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="ddlSearchPriority" Name="Priority" PropertyName="SelectedValue"
                Type="String" />
            <asp:Parameter Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ProjectCategorySelectAll"
        TypeName="TLLib.ProjectCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="parentID" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important; left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>
