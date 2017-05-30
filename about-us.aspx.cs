using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class about_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";
            if (Request.QueryString["ab"] != null)
            {
                var dv = (DataView)ObjectDataSource2.Select();
                if (dv.Count > 0)
                {
                    //hdnTitle.Value = dv[0]["ProjectTitle"].ToString();
                    //hdnDescription.Value = dv[0]["MetaDescription"].ToString();
                    //hdnImageName.Value = dv[0]["ImageName"].ToString();
                    lbName.Text = dv[0]["ProjectTitle"].ToString();
                    Page.Title = dv[0]["MetaTittle"].ToString();
                    meta.Content = dv[0]["MetaDescription"].ToString();
                    Header.Controls.Add(meta);
                    ListView1.DataSource = dv;
                    ListView1.DataBind();
                }
            } 
            else
            {
                var dv = (DataView)ObjectDataSource1.Select();
                if (dv.Count > 0)
                {
                    //hdnTitle.Value = dv[0]["ProjectTitle"].ToString();
                    //hdnDescription.Value = dv[0]["MetaDescription"].ToString();
                    //hdnImageName.Value = dv[0]["ImageName"].ToString();
                    lbName.Text = dv[0]["ProjectTitle"].ToString();
                    Page.Title = dv[0]["MetaTittle"].ToString();
                    meta.Content = dv[0]["MetaDescription"].ToString();
                    Header.Controls.Add(meta);
                    ListView1.DataSource = dv;
                    ListView1.DataBind();
                }
            }
        }

    }
}