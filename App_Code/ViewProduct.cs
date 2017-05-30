using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ViewProduct
/// </summary>
public class ViewProduct
{
    public void CreateView(string ProductID, string ImageName, string ProductName)
    {
        var sessionView = HttpContext.Current.Session["View"];
        DataTable dtView;
        if (sessionView == null)
        {
            dtView = new DataTable();
            dtView.Columns.Add("ProductID");
            dtView.Columns.Add("ProductName");
            dtView.Columns.Add("ImageName");

            dtView.Rows.Add(new object[] { ProductID, ProductName, ImageName });
        }
        else
        {
            dtView = sessionView as DataTable;

            var existRow = (from DataRow dr in dtView.Rows
                            where dr["ProductID"].ToString() == ProductID
                            select dr).FirstOrDefault();

            if (existRow == null)
                dtView.Rows.Add(new object[] { ProductID, ProductName, ImageName });

        }

        HttpContext.Current.Session["View"] = dtView;
    }

    public void DeleteItemView(string ProductID)
    {
        if (HttpContext.Current.Session["View"] != null)
        {
            var dtView = (HttpContext.Current.Session["View"] as DataTable).DefaultView;

            (from DataRowView dr in dtView
             where dr["ProductID"].ToString() == ProductID
             select dr).FirstOrDefault().Delete();

            HttpContext.Current.Session["View"] = dtView.ToTable();
        }
    }
    public void DeleteAllItemView()
    {
        if (HttpContext.Current.Session["View"] != null)
        {
            var dtView = (HttpContext.Current.Session["View"] as DataTable).DefaultView;
            foreach (DataRowView dr in dtView)
            {
                string ProductID = dr.Row.ItemArray[0].ToString();
                DeleteItemView(ProductID);
            }
        }
    }

    public void UpdateQuantityView(string ProductID, string Quantity)
    {
        if (HttpContext.Current.Session["View"] != null)
        {
            var dtView = HttpContext.Current.Session["View"] as DataTable;

            (from DataRow dr in dtView.Rows
             where dr["ProductID"].ToString() == ProductID
             select dr).FirstOrDefault()["Quantity"] = Quantity;

            HttpContext.Current.Session["View"] = dtView;
        }
    }

    public DataTable View()
    {
        if (HttpContext.Current.Session["View"] != null)
        {
            return HttpContext.Current.Session["View"] as DataTable;
        }

        return null;
    }
}