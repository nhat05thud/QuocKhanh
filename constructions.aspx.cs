﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class constructions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            if (Request.QueryString["ct"] != null)
            {

                var dv = new TLLib.ProjectCategory().ProjectCategorySelectOne(Request.QueryString["ct"]).DefaultView;
                if (dv.Count > 0)
                {
                    lbName.Text = dv[0]["ProjectCategoryName"].ToString();
                    //hdnTitle.Value = dv[0]["ProjectTitle"].ToString();
                    //hdnDescription.Value = dv[0]["MetaDescription"].ToString();
                    //hdnImageName.Value = dv[0]["ImageName"].ToString();
                    Page.Title = dv[0]["MetaTitle"].ToString();
                    meta.Content = dv[0]["MetaDescription"].ToString();
                    Header.Controls.Add(meta);
                }
            }
            else
            {                                                            
                Page.Title = "Công Trình";
                meta.Content = "Công Trình";
                Header.Controls.Add(meta);
            }
        }
    }
}