using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            HtmlMeta meta = new HtmlMeta();
            meta.Name = "description";

            lbName.Text = "Tìm Kiếm";
            Page.Title = "Tìm Kiếm";
            meta.Content = "Tìm Kiếm";
            Header.Controls.Add(meta);

        }
    }
}