using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;
using UniqueDrivingSchoolWebsite.App_Data;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Account
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PasswordRecovery1_SendingMail1(object sender, MailMessageEventArgs e)
        {
            try
            {
                DataSet1 DS = new DataSet1();
                if (User.IsInRole("Customer"))
                {
                    CustomerTableAdapter cusTA = new CustomerTableAdapter();
                    cusTA.FillByUsername(DS.Customer, User.Identity.Name);
                    MailMessage mm = new MailMessage();
                    mm.From = e.Message.From;
                    mm.Subject = e.Message.Subject.ToString();
                    mm.To.Add(new MailAddress("Earlshawboss@gmail.com"));
                    //mm.To.Add(new MailAddress((string)DS.Customer.Rows[0]["EmailAddress"]));
                    mm.Body = e.Message.Body;
                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                    smtp.Send(mm);
                }
                else if (User.IsInRole("Manager"))
                {
                    MailMessage mm = new MailMessage();
                    mm.From = e.Message.From;
                    mm.Subject = e.Message.Subject.ToString();
                    mm.To.Add(new MailAddress("Earlshawboss@gmail.com"));
                    mm.Body = e.Message.Body;
                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                    smtp.Send(mm);
                }
                else
                {
                    InstructorTableAdapter insTA = new InstructorTableAdapter();
                    insTA.FillByInstrUser(DS.Instructor, User.Identity.Name);
                    MailMessage mm = new MailMessage();
                    mm.From = e.Message.From;
                    mm.Subject = e.Message.Subject.ToString();
                    mm.To.Add(new MailAddress("Earlshawboss@gmail.com"));
                    //mm.To.Add(new MailAddress((string)DS.Instructor.Rows[0]["EmailAddress"]));
                    mm.Body = e.Message.Body;
                    SmtpClient smtp = new SmtpClient();
                    smtp.EnableSsl = true;
                    smtp.Send(mm);
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.ToString();
            }
        }
    }
}