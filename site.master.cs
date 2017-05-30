using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            lblsoLuotOnline.Text += Application["visitors_online"].ToString();
            lblsumLuotTruyCap.Text += Application["TatCa"].ToString();
            Page.Header.DataBind();
            string page = Request.Url.AbsolutePath.ToLower();                           

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("-p-") || page.Contains("-pd-") || page.Contains("products.aspx"))
                activePage = "products.aspx";
            else if (page.Contains("-ct-") || page.Contains("-ctd-") || page.Contains("constructions.aspx"))
                activePage = "constructions.aspx";
            else if (page.Contains("-nw-") || page.Contains("-nd-") || page.Contains("news.aspx"))
                activePage = "news.aspx";
            else if (page.Contains("-ab-") ||  page.Contains("about-us.aspx"))
                activePage = "about-us.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }
    }
    protected void btnTimKiem_Click(object sender, EventArgs e)
    {
        if (txtTimKiem.Text != "")
        {
            Response.Redirect("tim-kiem.aspx?keyword=" + txtTimKiem.Text);
        }
        else
        {
            TLLib.Common.ShowAlert("Nhập từ khóa!");
        }
    }
}
