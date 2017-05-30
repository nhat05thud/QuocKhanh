using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class contact_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
     private void sendEmail()
    {
        string msg = "<h3>Quốc Khanh: LIÊN HỆ</h3><br/>";
        msg += "<b>Tên công ty: </b>" + txtTencongty.Text.Trim().ToString() + "<br />";
        msg += "<b>Chức vụ: </b>" + txtChucvu.Text.Trim().ToString() + "<br />";
        msg += "<b>Họ và tên: </b>" + txtHoTen.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";        
        msg += "<b>Nội dung: </b>" + txtNoiDung.Text.Trim().ToString();
        var dv = new Article().ArticleSelectAll("1", "1",
            "", "", "", "1", "", "", "", "", "", "", "", "", "").DefaultView;
        if (dv.Count > 0)
        {
            string Subject = "";
            string Host = dv[0]["Tag"].ToString();
            int Port = Convert.ToInt32(dv[0]["Priority"]);
            string From = dv[0]["ArticleTitle"].ToString();
            string MailUsername = dv[0]["MetaTittle"].ToString();
            string mPassword = dv[0]["MetaDescription"].ToString();
            string MailTo = dv[0]["TagEn"].ToString();
            string MailCC = dv[0]["MetaTittleEn"].ToString();
            string MailBCC = dv[0]["MetaDescriptionEn"].ToString();

            bool Gmail = Convert.ToBoolean(dv[0]["IsNew"]);

            SiteCode.SendMail(Host, Port, From, MailUsername, mPassword, MailTo, MailCC, MailBCC, Subject, msg, Gmail);
        }
    }
    protected void btGui_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {


            //send email         
            sendEmail();
            lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
            lblMessage.Visible = true;
            //Clear text
            //
            txtHoTen.Text = "";
            txtTencongty.Text = "";
            txtChucvu.Text = "";
            txtEmail.Text = "";
            txtNoiDung.Text = "";

        }
    }
}