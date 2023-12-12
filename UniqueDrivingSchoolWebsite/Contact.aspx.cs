using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace UniqueDrivingSchoolWebsite
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                try
                {
                    MailMessage mm = new MailMessage();
                    mm.From = new MailAddress("Earlshawboss@gmail.com");
                    mm.Subject = Text1.Value.ToString();
                    mm.To.Add(new MailAddress("Earlshawboss@gmail.com"));
                    mm.Body = subject.Value.ToString();
                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                    smtp.Send(mm);
                    Label1.Text = "Message Sent!!!";
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.ToString();
                }
        }
    }
}