using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Net.Mail;
using System.Net;
/// <summary>
/// Summary description for SiteCode
/// </summary>
public class SiteCode
{
    int level = -1;
    StringBuilder m_strMenu = new StringBuilder();

    public void BuilMenu(DataTable dtParent, string ParentID, string DisplayFieldName, string LinkFieldName, string ImageFieldName)
    {
        var page = HttpContext.Current.Handler as System.Web.UI.Page;
        string rootPath = page.ResolveClientUrl("~/");
        var newLine = Environment.NewLine;
        level++;

        var dv = new DataView(dtParent);

        dv.RowFilter = string.Format("ParentID = {0}", ParentID);
        
        if (dv.Count > 0)
        {
            //Nếu ở cấp 0 hiển thị:
            if (level == 0)
            {
                //Sửa thẻ HTML của menu ở đây
                m_strMenu.Append(newLine + "<div>");

                foreach (DataRowView drv in dv)
                {
                    string strLink = ResolveUrl(drv[LinkFieldName].ToString());

                    m_strMenu.Append(newLine + "<p>");

                    m_strMenu.Append(newLine + "<a href='" + strLink + "' class='tmenuitem level" + level + "'>" + drv[DisplayFieldName] + "</a>");
                    BuilMenu(dtParent, drv["MenuID"].ToString(), DisplayFieldName, LinkFieldName, ImageFieldName);

                    m_strMenu.Append(newLine + "</p>");
                }

                m_strMenu.Append(newLine + "</div>");

                //End
            }
            //Nếu ở cấp > 0 hiển thị:
            else if (level > 0)
            {
                //Sửa thẻ HTML của menu ở đây
                m_strMenu.Append(newLine + "<ul>");

                foreach (DataRowView drv in dv)
                {
                    string strLink = ResolveUrl(drv[LinkFieldName].ToString());
                    string strImageName = (rootPath + "/res/menu/" + drv[LinkFieldName]).Replace("//", "/");
                    strImageName = LinkFieldName == "" ? newLine + "<img src='" + strImageName + "' class='tmenuimg' />" : "";

                    m_strMenu.Append(newLine + "<li>");
                    m_strMenu.Append(strImageName);
                    m_strMenu.Append(newLine + "<a href='" + strLink + "' class='tmenuitem level" + level + "'>" + drv[DisplayFieldName] + "</a>");
                    BuilMenu(dtParent, drv["MenuID"].ToString(), DisplayFieldName, LinkFieldName, ImageFieldName);
                    m_strMenu.Append(newLine + "</li>");
                }

                m_strMenu.Append(newLine + "</ul>");
                //End
            }
        }

        level--;
    }

    string ResolveUrl(string url)
    {
        var page = HttpContext.Current.Handler as System.Web.UI.Page;
        string rootPath = page.ResolveClientUrl("~/");

        if (url.StartsWith("www"))
            url = "http://" + url;
        else if (!url.StartsWith("http"))
            url = (rootPath + "/" + url).Replace("//", "/");

        return url;
    }

    public string Menu
    {
        get { return m_strMenu.ToString(); }
    }
    public static bool SendMail(string strHost, int iPort, string strMailFrom, string strUserName, string strPassword, string strMailTo, string strCC, string strBCC, string strSubject, string strBody, bool bEnableSsl)
    {
        bool SendSuccess = false;
        try
        {
            var lstMailTo = strMailTo.Replace(';', ',').Split(',');
            var lstCC = strCC.Replace(';', ',').Split(',');
            var lstBCC = strBCC.Replace(';', ',').Split(',');

            NetworkCredential loginInfo = new NetworkCredential(strMailFrom, strPassword);
            SmtpClient client = new SmtpClient(strHost, iPort);
            client.EnableSsl = false;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.EnableSsl = bEnableSsl;
            using (MailMessage msg = new MailMessage())
            {
                msg.From = new MailAddress(strMailFrom);

                foreach (string strTo in lstMailTo)
                    if (!string.IsNullOrEmpty(strTo.Trim()))
                        msg.To.Add(new MailAddress(strTo));

                foreach (string strCC1 in lstCC)
                    if (!string.IsNullOrEmpty(strCC1.Trim()))
                        msg.CC.Add(new MailAddress(strCC1));

                foreach (string strBCC1 in lstBCC)
                    if (!string.IsNullOrEmpty(strBCC1.Trim()))
                        msg.Bcc.Add(new MailAddress(strBCC1));


                msg.Subject = strSubject;
                msg.Body = strBody;
                msg.IsBodyHtml = true;
                client.Send(msg);
            }
            SendSuccess = true;
        }
        catch
        {
            SendSuccess = false;
        }
        return SendSuccess;
    }
    public static bool SendMail(string strHost, int iPort, string strMailFrom, string strPassword, string strMailTo, string strCC, string strBCC, string strSubject, string strBody, bool bEnableSsl)
    {
        bool SendSuccess = false;
        try
        {
            var lstMailTo = strMailTo.Replace(';', ',').Split(',');
            var lstCC = strCC.Replace(';', ',').Split(',');
            var lstBCC = strBCC.Replace(';', ',').Split(',');

            NetworkCredential loginInfo = new NetworkCredential(strMailFrom, strPassword);
            SmtpClient client = new SmtpClient(strHost, iPort);
            client.EnableSsl = false;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.EnableSsl = bEnableSsl;
            using (MailMessage msg = new MailMessage())
            {
                msg.From = new MailAddress(strMailFrom);

                foreach (string strTo in lstMailTo)
                    if (!string.IsNullOrEmpty(strTo.Trim()))
                        msg.To.Add(new MailAddress(strTo));

                foreach (string strCC1 in lstCC)
                    if (!string.IsNullOrEmpty(strCC1.Trim()))
                        msg.CC.Add(new MailAddress(strCC1));

                foreach (string strBCC1 in lstBCC)
                    if (!string.IsNullOrEmpty(strBCC1.Trim()))
                        msg.Bcc.Add(new MailAddress(strBCC1));


                msg.Subject = strSubject;
                msg.Body = strBody;
                msg.IsBodyHtml = true;
                client.Send(msg);
            }
            SendSuccess = true;
        }
        catch
        {
            SendSuccess = false;
        }
        return SendSuccess;
    }
    protected string progressTitle(object input)
    {
        var convertTitle = new ConvertTitle();
        return convertTitle.convertToLowerCase(input.ToString());
    }

}