﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="productcategory.aspx.cs" Inherits="ad_single_projectcategory" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        <img alt="" src="../assets/images/category.png" class="vam" />
        Danh Mục Sản Phẩm</h3>
    <br />
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback"
        Width="100%">
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" runat="server" Culture="vi-VN" AllowMultiRowSelection="True"
            DataSourceID="ObjectDataSource1" GridLines="Horizontal" AutoGenerateColumns="False"
            AllowAutomaticDeletes="True" ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand"
            OnItemDataBound="RadGrid1_ItemDataBound" PageSize="50" CssClass="grid" AllowAutomaticUpdates="True"
            CellSpacing="0">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" EnableDragToSelectRows="false" />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
                <Pdf AllowCopy="True" />
                <Excel Format="ExcelML" />
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="ProjectCategoryID">
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
                <CommandItemSettings ExportToPdfText="Export to PDF" />
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                </ExpandCollapseColumn>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn">
                        <HeaderStyle Width="1%" />
                    </asp:GridClientSelectColumn>
                    <asp:GridTemplateColumn DataField="ProjectCategoryName" HeaderText="Tên danh mục">
                        <ItemTemplate>
                            <div class='<%#"catlevel level" +  Eval("Level") %>' style='padding-left: <%# string.IsNullOrEmpty(Eval("Level").ToString()) ? 0 : Convert.ToInt32(Eval("Level")) * 10 %>px'>
                                <asp:Label ID="lblProjectCategoryName" runat="server" Font-Bold='<%# Eval("ParentID").ToString() == "0" ? true : false %>'
                                    Text='<%# Eval("ProjectCategoryName")%>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="ProjectCategoryNameEn" HeaderText="Tên danh mục(Tiếng Anh)">
                        <ItemTemplate>
                            <div class='<%#"catlevel level" +  Eval("Level") %>' style='padding-left: <%# string.IsNullOrEmpty(Eval("Level").ToString()) ? 0 : Convert.ToInt32(Eval("Level")) * 10 %>px'>
                                <asp:Label ID="lblProjectCategoryNameEn" runat="server" Font-Bold='<%# Eval("ParentID").ToString() == "0" ? true : false %>'
                                    Text='<%# Eval("ProjectCategoryNameEn")%>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="ProjectCategoryNameCn" HeaderText="Tên danh mục(Tiếng Trung)">
                        <ItemTemplate>
                            <div class='<%#"catlevel level" +  Eval("Level") %>' style='padding-left: <%# string.IsNullOrEmpty(Eval("Level").ToString()) ? 0 : Convert.ToInt32(Eval("Level")) * 10 %>px'>

                                <asp:Label ID="lblProjectCategoryNameCn" runat="server" Font-Bold='<%# Eval("ParentID").ToString() == "0" ? true : false %>'
                                    Text='<%# Eval("ProjectCategoryNameCn")%>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn Visible="false" DataField="ProjectCategoryID" HeaderText="ID" SortExpression="ProjectCategoryID">
                    </asp:GridBoundColumn>
                    <asp:GridTemplateColumn>
                        <ItemTemplate>
                            <div style="line-height: 10px; padding: 0 10px 0 10px;">
                                <asp:LinkButton ID="lnkUpOrder" runat="server" OnClick="lnkUpOrder_Click" rel='<%# Eval("ProjectCategoryID") %>'>
                                    <img alt="" style="margin-bottom:10px;" title="Lên 1 cấp" src="../assets/images/up-arrow.gif" />
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkDownOrder" runat="server" OnClick="lnkDownOrder_Click" rel='<%# Eval("ProjectCategoryID") %>'>
                                    <img alt="" title="Xuống 1 cấp" src="../assets/images/down-arrow.gif" />
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10px" />
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="Level" HeaderText="Cấp độ">
                        <ItemTemplate>
                            <asp:Label ID="lblLevel" runat="server" Font-Bold='<%# Eval("ParentID").ToString() == "0" ? true : false %>'
                                Text='<%# Eval("Level") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="ParentCategoryName" HeaderText="Danh mục cấp trên">
                        <ItemTemplate>
                            <asp:Label ID="lblParentCategoryName" runat="server" Font-Bold='<%# Eval("ParentID").ToString() == "0" ? true : false %>'
                                Text='<%# Eval("ParentCategoryName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="IsShowOnMenu" HeaderText="Xem trên menu" Visible="false">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsShowOnMenu" runat="server" Checked='<%# Eval("IsShowOnMenu") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnMenu"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="IsShowOnHomePage" HeaderText="Xem trên trang chủ" Visible="false">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsShowOnHomePage" runat="server" Checked='<%# Eval("IsShowOnHomePage") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnHomePage"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="IsAvailable" HeaderText="Hiển thị">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Ảnh">
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'>
                                <a class="screenshot" rel='../../res/productcategory/<%# Eval("ImageName") %>'>
                                    <img alt="" src="../assets/images/photo.png" />
                                </a>
                                <asp:LinkButton ID="lnkDeleteImage" runat="server" CommandName="DeleteImage" OnClientClick="return confirm('Xóa ảnh này ?')"
                                    rel='<%#  Eval("ProjectCategoryID") + "#" + Eval("ImageName") %>'>
                            <img alt="Xóa ảnh" title="Xóa ảnh" src="../assets/images/delete-icon.png" />
                                </asp:LinkButton>
                                <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <h3 class="searchTitle">Thông Tin Danh Mục Sản Phẩm</h3>
                            <table class="search">
                                <tr>
                                    <td class="left" valign="top">Ảnh đại diện
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hdnProjectCategoryID" runat="server" Value='<%# Eval("ProjectCategoryID") %>' />
                                        <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                        <asp:RadUpload ID="FileImageName" runat="server" AllowedFileExtensions=".jpg,.jpeg,.gif,.png"
                                            ControlObjectsVisibility="None" Culture="vi-VN" InputSize="69" Language="vi-VN" />
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validateRadUpload"
                                            Display="Dynamic" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Meta Title
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaTitle" runat="server" Text='<%# Bind("MetaTitle") %>'
                                            Width="500px" EmptyMessage="Meta Title...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Meta Description
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaDescription" runat="server" Text='<%# Bind("MetaDescription") %>'
                                            Width="500px" EmptyMessage="Meta Description...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Tên danh mục
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtProjectCategoryName" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "" : (string.IsNullOrEmpty(Eval("ProjectCategoryName").ToString()) ? "" : Eval("ProjectCategoryName").ToString().Remove(0, Convert.ToInt32(Eval("Level")))) %>'
                                            Width="500px" EmptyMessage="Tên danh mục...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Mô tả
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
                                                </asp:EditorToolGroup>
                                            </Tools>
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <h3>(Ngôn Ngữ Tiếng Anh)</h3>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Meta Title(En)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaTitleEn" runat="server" Text='<%# Bind("MetaTitleEn") %>'
                                            Width="500px" EmptyMessage="Meta Title(En)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Meta Description(En)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaDescriptionEn" runat="server" Text='<%# Bind("MetaDescriptionEn") %>'
                                            Width="500px" EmptyMessage="Meta Description(En)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Tên danh mục(En)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtProjectCategoryNameEn" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "" : Eval("ProjectCategoryNameEn") %>'
                                            Width="500px" EmptyMessage="Tên danh mục(En)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Mô tả(En)
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
                                                </asp:EditorToolGroup>
                                            </Tools>
                                        </asp:RadEditor>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <h3>(Ngôn Ngữ Tiếng Trung)</h3>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Meta Title(Cn)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaTitleCn" runat="server" Text='<%# Bind("MetaTitleCn") %>'
                                            Width="500px" EmptyMessage="Meta Title(Cn)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Meta Description(Cn)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaDescriptionCn" runat="server" Text='<%# Bind("MetaDescriptionCn") %>'
                                            Width="500px" EmptyMessage="Meta Description(Cn)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Tên danh mục(Cn)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtProjectCategoryNameCn" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "" : Eval("ProjectCategoryNameCn") %>'
                                            Width="500px" EmptyMessage="Tên danh mục(Cn)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Mô tả(Cn)
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
                                                </asp:EditorToolGroup>
                                            </Tools>
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <asp:Panel ID="Panel2" runat="server" Visible="false">
                                    <tr>
                                        <td class="left" valign="top">Danh mục cấp trên
                                        </td>
                                        <td>
                                            <asp:RadComboBox ID="ddlParent" runat="server" DataSourceID='<%# (Container is GridEditFormInsertItem) ? "ObjectDataSource1" : "ObjectDataSource2" %>'
                                                DataTextField="ProjectCategoryName" DataValueField="ProjectCategoryID" Filter="Contains"
                                                OnDataBound="DropDownList_DataBound" Width="504px">
                                            </asp:RadComboBox>
                                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ProjectCategoryForEditSelectAll"
                                                TypeName="TLLib.ProjectCategory">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hdnProjectCategoryID" Name="ProjectCategoryID" PropertyName="Value"
                                                        Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left" valign="top">Nội dung
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
                                    <tr>
                                        <td class="left" valign="top">Nội dung
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

                                    <tr>
                                        <td class="left" valign="top">Nội dung
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
                                    <tr>
                                        <td class="left" colspan="2">
                                            <asp:CheckBox ID="chkIsShowOnMenu" runat="server" Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsShowOnMenu") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnMenu"))) %>'
                                                CssClass="checkbox" Text=" Xem trên menu" />
                                            &nbsp;&nbsp;
                                        <asp:CheckBox ID="chkIsShowOnHomePage" runat="server" Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsShowOnHomePage") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnHomePage"))) %>'
                                            CssClass="checkbox" Text=" Xem trên trang chủ" />
                                            &nbsp;&nbsp;
                                        <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))) %>'
                                            CssClass="checkbox" Text=" Hiển thị" />
                                        </td>
                                    </tr>
                                </asp:Panel>
                            </table>
                            <div class="edit">
                                <hr />
                                <asp:RadButton ID="lnkUpdate" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                </asp:RadButton>
                                &nbsp;&nbsp;
                                <asp:RadButton ID="btnCancel" runat="server" CommandName="Cancel" Text="Hủy">
                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                </asp:RadButton>
                            </div>
                        </asp:Panel>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="ProjectCategoryDelete"
        SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
        <DeleteParameters>
            <asp:Parameter Name="ProjectCategoryID" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
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
