using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using UniqueDrivingSchoolWebsite.App_Data;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;
using UniqueDrivingSchoolWebsite.Restricted_Access;
using System.Net.Mail;


namespace UniqueDrivingSchoolWebsite.Account
{
    public partial class Login : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet1 DS = new DataSet1();
                UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.ManagerTableAdapter ManTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.ManagerTableAdapter();
                UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter InstrTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter();
                UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter CustTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter();
                TextBox username = (TextBox)LoginUser.FindControl("UserName");
                TextBox Password = (TextBox)LoginUser.FindControl("Password");

                
                
                ManTA.FillByMan(DS.Manager, username.Text, Password.Text);
                InstrTA.FillByInstr(DS.Instructor, username.Text, Password.Text);
                CustTA.FillByCust(DS.Customer, username.Text, Password.Text);
                if(DS.Manager.Rows.Count == 1)
                {
                    Session["Username"] = DS.Manager.Rows[0]["UserName"];
                    LoginUser.DestinationPageUrl ="~/Restricted Access/Manager/ManDashBoard.aspx";
                }
                else if(DS.Instructor.Rows.Count == 1)
                {
                    Session["Username"] = DS.Instructor.Rows[0]["UserName"];
                    LoginUser.DestinationPageUrl = "~/Restricted Access/Instructor/InsDashBoard.aspx";
                }
                else if(DS.Customer.Rows.Count == 1)
                {
                    Session["Username"] = DS.Customer.Rows[0]["UserName"];
                    LoginUser.DestinationPageUrl = "~/Restricted Access/Customer/CusDashBoard.aspx";                                       
                }
            
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex + "')</script>");
            }
        }

        

        protected void PasswordRecovery2_SendingMail1(object sender, MailMessageEventArgs e)
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

        protected void btnLink_Click(object sender, EventArgs e)
        {
            PanelForgot.Visible = true;
            PanelLogin.Visible = false;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account/Login.aspx");
        }

        

        
    }
}
