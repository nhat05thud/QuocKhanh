using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;

public partial class ad_single_project : System.Web.UI.Page
{

    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteImage(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/project/" + strImageName);
            var strThumbImagePath = Server.MapPath("~/res/project/thumbs/" + strImageName);

            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
            if (File.Exists(strThumbImagePath))
                File.Delete(strThumbImagePath);
        }
    }

    void DeletePhotoAlbum(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/project/album/" + strImageName);
            var strThumbImagePath = Server.MapPath("~/res/project/album/thumbs/" + strImageName);

            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
            if (File.Exists(strThumbImagePath))
                File.Delete(strThumbImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TempImage = new DataTable();
            TempImage.Columns.Add("ImageName");
        }
    }
    public void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridCommandItem)
        {
            GridCommandItem commandItem = (e.Item as GridCommandItem);
            PlaceHolder container = (PlaceHolder)commandItem.FindControl("PlaceHolder1");
            Label label = new Label();
            label.Text = "&nbsp;&nbsp;";

            container.Controls.Add(label);

            for (int i = 65; i <= 65 + 25; i++)
            {
                LinkButton linkButton1 = new LinkButton();

                LiteralControl lc = new LiteralControl("&nbsp;&nbsp;");

                linkButton1.Text = "" + (char)i;

                linkButton1.CommandName = "alpha";
                linkButton1.CommandArgument = "" + (char)i;

                container.Controls.Add(linkButton1);
                container.Controls.Add(lc);
            }

            LiteralControl lcLast = new LiteralControl("&nbsp;");
            container.Controls.Add(lcLast);

            LinkButton linkButtonAll = new LinkButton();
            linkButtonAll.Text = "Tất cả";
            linkButtonAll.CommandName = "NoFilter";
            container.Controls.Add(linkButtonAll);
        }
    }
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "alpha" || e.CommandName == "NoFilter")
        {
            String value = null;
            switch (e.CommandName)
            {
                case ("alpha"):
                    {
                        value = string.Format("{0}%", e.CommandArgument);
                        break;
                    }
                case ("NoFilter"):
                    {
                        value = "%";
                        break;
                    }
            }
            ObjectDataSource1.SelectParameters["ProjectTitle"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string ProjectID, Priority, IsShowOnHomePage, IsAvailable;
            var oProject = new Project();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProjectID = item.GetDataKeyValue("ProjectID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsShowOnHomePage = ((CheckBox)item.FindControl("chkIsShowOnHomePage")).Checked.ToString();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProject.ProjectQuickUpdate(
                    ProjectID,
                    IsShowOnHomePage,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            string OldImageName;
            var oProject = new Project();

            string errorList = "", ProjectTitle = "";

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                try
                {
                    var ProjectID = item.GetDataKeyValue("ProjectID").ToString();
                    ProjectTitle = item["ProjectTitle"].Text;
                    oProject.ProjectDelete(ProjectID);

                    OldImageName = ((HiddenField)item.FindControl("hdnImageName")).Value;
                    DeleteImage(OldImageName);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                    if (ex.Message == ((int)ErrorNumber.ConstraintConflicted).ToString())
                        errorList += ", " + ProjectTitle;
                }
            }
            if (!string.IsNullOrEmpty(errorList))
            {
                e.Canceled = true;
                string strAlertMessage = "Sản phẩm <b>\"" + errorList.Remove(0, 1).Trim() + " \"</b> đang chứa thư viện ảnh hoặc file download .<br /> Xin xóa ảnh hoặc file trong Dự Án này hoặc thiết lập hiển thị = \"không\".";
                lblError.Text = strAlertMessage;
            }
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "InitInsert" || e.CommandName == "EditSelected" || e.CommandName == "Edit")
        {
            TempImage.Rows.Clear();
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");

            string ProjectID = ((HiddenField)row.FindControl("hdnProjectID")).Value;
            string OldImageName = ((HiddenField)row.FindControl("hdnOldImageName")).Value;
            string ImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
            string Priority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();
            string MetaTittle = ((RadTextBox)row.FindControl("txtMetaTittle")).Text.Trim();
            string MetaDescription = ((RadTextBox)row.FindControl("txtMetaDescription")).Text.Trim();
            string ProjectTitle = ((RadTextBox)row.FindControl("txtProjectTitle")).Text.Trim();
            string ConvertedProjectTitle = Common.ConvertTitle(ProjectTitle);
            string Description = ((RadTextBox)row.FindControl("txtDescription")).Text.Trim();
            string Content = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContent")).Content.Trim());
            string Tag = ((RadTextBox)row.FindControl("txtTag")).Text.Trim();
            string ProjectCategoryID = ((RadComboBox)row.FindControl("ddlCategory")).SelectedValue;
            if (ProjectCategoryID == "")
            {
                ProjectCategoryID = "3";
            }
            string IsShowOnHomePage = ((CheckBox)row.FindControl("chkIsShowOnHomePage")).Checked.ToString();
            string IsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string MetaTittleEn = ((RadTextBox)row.FindControl("txtMetaTittleEn")).Text.Trim();
            string MetaDescriptionEn = ((RadTextBox)row.FindControl("txtMetaDescriptionEn")).Text.Trim();
            string ProjectTitleEn = ((RadTextBox)row.FindControl("txtProjectTitleEn")).Text.Trim();
            string DescriptionEn = ((RadTextBox)row.FindControl("txtDescriptionEn")).Text.Trim();
            string ContentEn = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContentEn")).Content.Trim());
            string TagEn = ((RadTextBox)row.FindControl("txtTagEn")).Text.Trim();
            string MetaTittleCn = ((RadTextBox)row.FindControl("txtMetaTittleCn")).Text.Trim();
            string MetaDescriptionCn = ((RadTextBox)row.FindControl("txtMetaDescriptionCn")).Text.Trim();
            string ProjectTitleCn = ((RadTextBox)row.FindControl("txtProjectTitleCn")).Text.Trim();
            string DescriptionCn = ((RadTextBox)row.FindControl("txtDescriptioncn")).Text.Trim();
            string ContentCn = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContentCn")).Content.Trim());
            string TagCn = ((RadTextBox)row.FindControl("txtTagCn")).Text.Trim();

            if (e.CommandName == "PerformInsert")
            {

                var oProject = new Project();
                ImageName = oProject.ProjectInsert(
                    ImageName,
                    MetaTittle,
                    MetaDescription,
                    ProjectTitle,
                    ConvertedProjectTitle,
                    Description,
                    Content,
                    Tag,
                    MetaTittleEn,
                    MetaDescriptionEn,
                    ProjectTitleEn,
                    DescriptionEn,
                    ContentEn,
                    TagEn,
                    MetaTittleCn,
                    MetaDescriptionCn,
                    ProjectTitleCn,
                    DescriptionCn,
                    ContentCn,
                    TagCn,
                    ProjectCategoryID,
                    IsShowOnHomePage,
                    IsAvailable,
                    Priority
                );

                ProjectID = oProject.ProjectID;

                string strFullPath = "~/res/project/" + ImageName;
                if (!string.IsNullOrEmpty(ImageName))
                {
                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    // ResizeCropImage.ResizeByCondition(strFullPath, 800, 800);
                    // ResizeCropImage.CreateThumbNailByCondition("~/res/project/", "~/res/project/thumbs/", ImageName, 120, 120);
                }

                if (TempImage.Rows.Count > 0)
                {
                    var oProjectImage = new ProjectImage();

                    foreach (DataRow dr in TempImage.Rows)
                    {
                        oProjectImage.ProjectImageInsert(dr["ImageName"].ToString(), "", "", "", "", "", ProjectID, "True", "");
                    }
                }

                RadGrid1.Rebind();
            }
            else
            {
                var oProject = new Project();
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strOldImagePath = Server.MapPath("~/res/project/" + OldImageName);
                var strOldThumbImagePath = Server.MapPath("~/res/project/thumbs/" + OldImageName);

                oProject.ProjectUpdate(
                         ImageName,
                         ProjectID,
                         MetaTittle,
                         MetaDescription,
                         ProjectTitle,
                         ConvertedProjectTitle,
                         Description,
                         Content,
                         Tag,
                         MetaTittleEn,
                         MetaDescriptionEn,
                         ProjectTitleEn,
                         DescriptionEn,
                         ContentEn,
                         TagEn,
                         MetaTittleCn,
                         MetaDescriptionCn,
                         ProjectTitleCn,
                         DescriptionCn,
                         ContentCn,
                         TagCn,
                         ProjectCategoryID,
                         IsShowOnHomePage,
                         IsAvailable,
                         Priority
                     );

                if (!string.IsNullOrEmpty(ImageName))
                {
                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);
                    if (File.Exists(strOldThumbImagePath))
                        File.Delete(strOldThumbImagePath);

                    ImageName = (string.IsNullOrEmpty(ConvertedProjectTitle) ? "" : ConvertedProjectTitle + "-") + ProjectID + ImageName.Substring(ImageName.LastIndexOf('.'));

                    string strFullPath = "~/res/project/" + ImageName;

                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 800, 800);
                    //ResizeCropImage.CreateThumbNailByCondition("~/res/project/", "~/res/project/thumbs/", ImageName, 120, 120);
                } 
                Response.Redirect(Page.Request.Url.AbsolutePath);
            }
        }
        else if (e.CommandName == "Cancel")
        {
            if (TempImage.Rows.Count > 0)
            {
                foreach (DataRow row in TempImage.Rows)
                {
                    DeletePhotoAlbum(row["ImageName"].ToString());
                }
                TempImage.Rows.Clear();
            }
        }
        else if (e.CommandName == "DeleteImage")
        {
            var oProject = new Project();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strProjectID = s[0];
            var ImageName = s[1];

            oProject.ProjectImageDelete(strProjectID);
            DeleteImage(ImageName);
            RadGrid1.Rebind();
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");

            var dv = (DataView)ObjectDataSource1.Select();
            var ProjectID = ((HiddenField)row.FindControl("hdnProjectID")).Value;
            var ddlCategory = (RadComboBox)row.FindControl("ddlCategory");

            if (!string.IsNullOrEmpty(ProjectID))
            {
                dv.RowFilter = "ProjectID = " + ProjectID;

                if (!string.IsNullOrEmpty(dv[0]["ProjectCategoryID"].ToString()))
                    ddlCategory.SelectedValue = dv[0]["ProjectCategoryID"].ToString();
            }
            else
            {
                ddlCategory.SelectedValue = ddlSearchCategory.SelectedValue;
            }
            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileImageName.ClientID));
        }
    }


    protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView1 = (RadListView)sender;
            var Parent = RadListView1.NamingContainer;
            var OdsProjectPhotoAlbum = (ObjectDataSource)Parent.FindControl("OdsProjectPhotoAlbum");

            if (e.CommandName == "Update")
            {
                var item = e.ListViewItem;
                var dsUpdateParam = OdsProjectPhotoAlbum.UpdateParameters;

                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                var strIsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();

                dsUpdateParam["ImageName"].DefaultValue = strOldImageName;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
            }
            else if (e.CommandName == "Delete")
            {
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeletePhotoAlbum(strOldImageName);
            }

            //var RadListView1 = (RadListView)sender;
            //var Parent = RadListView1.NamingContainer;
            //var OdsProjectPhotoAlbum = (ObjectDataSource)Parent.FindControl("OdsProjectPhotoAlbum");

            //if (e.CommandName == "Update")
            //{
            //    var item = e.ListViewItem;
            //    var FileImageName = (RadUpload)item.FindControl("FileImageName");
            //    var dsUpdateParam = OdsProjectPhotoAlbum.UpdateParameters;

            //    var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
            //    var strIsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();
            //    string strImageName = FileImageName.UploadedFiles.Count > 0 ? Guid.NewGuid().GetHashCode().ToString("X") + "." + FileImageName.UploadedFiles[0].GetExtension() : strOldImageName;

            //    dsUpdateParam["ImageName"].DefaultValue = strImageName;
            //    dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;

            //    if (!string.IsNullOrEmpty(strImageName))
            //    {
            //        var strOldImagePath = Server.MapPath("~/res/project/album/" + strOldImageName);
            //        var strOldThumbImagePath = Server.MapPath("~/res/project/album/thumbs/" + strOldImageName);

            //        if (File.Exists(strOldImagePath))
            //            File.Delete(strOldImagePath);
            //        if (File.Exists(strOldThumbImagePath))
            //            File.Delete(strOldThumbImagePath);

            //        string strFullPath = "~/res/project/album/" + strImageName;

            //        FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
            //        ResizeCropImage.ResizeByCondition(strFullPath, 800, 800);
            //        ResizeCropImage.CreateThumbNailByCondition("~/res/project/album/", "~/res/project/album/thumbs/", strImageName, 120, 120);
            //    }
            //}
            //else if (e.CommandName == "Delete")
            //{
            //    var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
            //    DeletePhotoAlbum(strOldImageName);
            //}


        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void RadListView2_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView2 = (RadListView)sender;
            if (e.CommandName == "Delete")
            {
                var Parent = RadListView2.NamingContainer;
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeletePhotoAlbum(strOldImageName);

                TempImage.Rows.Cast<DataRow>().Where(c => c["ImageName"].ToString() == strOldImageName).Single().Delete();
                RadListView2.DataSource = TempImage;
                RadListView2.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void FileImageAlbum_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        var FileImageAlbum = (RadAsyncUpload)sender;
        var Parent = FileImageAlbum.NamingContainer;
        var ProjectID = ((HiddenField)Parent.FindControl("hdnProjectID")).Value;
        var RadListView1 = (RadListView)Parent.FindControl("RadListView1");
        var RadListView2 = (RadListView)Parent.FindControl("RadListView2");

        string targetFolder = "~/res/project/album/";
        string newName = Guid.NewGuid().GetHashCode().ToString("X") + e.File.GetExtension();
        e.File.SaveAs(Server.MapPath(targetFolder + newName));

        ResizeCropImage.ResizeByCondition(targetFolder + newName, 800, 800);
        ResizeCropImage.CreateThumbNailByCondition("~/res/project/album/", "~/res/project/album/thumbs/", newName, 120, 120);

        if (string.IsNullOrEmpty(ProjectID))
        {
            TempImage.Rows.Add(new object[] { newName });

            RadListView2.DataSource = TempImage;
            RadListView2.DataBind();
        }
        else
        {
            var oProjectImage = new ProjectImage();

            oProjectImage.ProjectImageInsert(newName, "", "", "", "", "", ProjectID, "True", "");
            RadListView1.Rebind();
        }
    }

    protected void FileImageName_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        var FileImageName = (RadAsyncUpload)sender;
        var Parent = FileImageName.NamingContainer;
        var hdnNewImageName = (HiddenField)Parent.FindControl("hdnNewImageName");

        string targetFolder = "~/res/project/";
        string newName = Guid.NewGuid().GetHashCode().ToString("X") + e.File.GetExtension();
        e.File.SaveAs(Server.MapPath(targetFolder + newName));

        ResizeCropImage.ResizeByCondition(targetFolder + newName, 800, 800);
        ResizeCropImage.CreateThumbNailByCondition("~/res/project/", "~/res/project/thumbs/", newName, 120, 120);

        hdnNewImageName.Value = newName;
    }
    #endregion

    #region Properties

    private DataTable TempImage
    {
        get { return (DataTable)ViewState["TempImage"]; }
        set { ViewState["TempImage"] = value; }
    }

    #endregion
}