using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UniqueDrivingSchoolWebsite.App_Data;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using UniqueDrivingSchoolWebsite;


namespace UniqueDrivingSchoolWebsite.Restricted_Access.Customer
{
    public partial class Booking : System.Web.UI.Page
    {
        List<DateTime> holidayList = null;
        int cusID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddllessonTime.Items.Clear();
                ddllessonTime.Items.Add("08:00");
                ddllessonTime.Items.Add("09:00");
                ddllessonTime.Items.Add("10:00");
                ddllessonTime.Items.Add("11:00");
                ddllessonTime.Items.Add("12:00");
                ddllessonTime.Items.Add("13:00");
                ddllessonTime.Items.Add("14:00");
                ddllessonTime.Items.Add("15:00");
                ddllessonTime.Items.Add("16:00");
                ddllessonTime.Items.Add("17:00");

                try
                {
                   
                    ddlIns.SelectedValue = "1";
                    holidayList = GetPublicHolidays();
                    DataSet1 DS1 = new DataSet1();
                    BookingTableAdapter bookingTa = new BookingTableAdapter();
                    bookingTa.FillBy(DS1.Booking, User.Identity.Name);
                    Label1.Text = User.Identity.Name;
                    cusID = (int)DS1.Booking.Rows[0]["CustomerID"];
                    
                    Label4.Text = cusID.ToString();
                    if (DS1.Booking.Rows[0]["InstructorID"] != null)
                    {
                        Label3.Text = DS1.Booking.Rows[0]["InstructorID"].ToString();
                       // ddlIns.Text = DS1.Booking.Rows[0]["InstructorID"].ToString();
                    }
                  

                    Calender1.SelectedDate = DateTime.Today.AddDays(1);
                    BookingCalender.SelectedDate = DateTime.Today.Date;
                }
           
                catch (Exception x)
                {
                    Response.Write("<script>alert('" + x.ToString() + "');</script>");
                }
            }
        }

        private List<DateTime> GetPublicHolidays()
        {
            List<DateTime> list = new List<DateTime>();
            int year = 2015;
            for(int i=year; i <= DateTime.Now.Year; i++){
            list.Add(new DateTime(i, 01, 01));
            list.Add(new DateTime(i, 03, 21));
            list.Add(new DateTime(i, 04, 19));
            list.Add(new DateTime(i, 04, 20));
            list.Add(new DateTime(i, 04, 21));
            list.Add(new DateTime(i, 04, 22));
            list.Add(new DateTime(i, 05, 01));
            list.Add(new DateTime(i, 05, 08));
            list.Add(new DateTime(i, 05, 12));
            list.Add(new DateTime(i, 05, 30));
            list.Add(new DateTime(i, 06, 09));
            list.Add(new DateTime(i, 06, 16));
            list.Add(new DateTime(i, 06, 17));
            list.Add(new DateTime(i, 06, 18));
            list.Add(new DateTime(i, 08, 09));
            list.Add(new DateTime(i, 09, 24));
            list.Add(new DateTime(i, 11, 01));
            list.Add(new DateTime(i, 12, 16));
            list.Add(new DateTime(i, 12, 24));
            list.Add(new DateTime(i, 12, 25));
            list.Add(new DateTime(i, 12, 26));
            list.Add(new DateTime(i, 12, 31));
        }
            return list;
        }

        protected void BookingCalender_DayRender(object sender, DayRenderEventArgs e)
        {
            try
            {
                List<DateTime> holidayList = GetPublicHolidays();
                BookingCalender.SelectedDate = DateTime.Today.Date;
                if (holidayList.Count > 0)
                {
                    if (holidayList.Contains(e.Day.Date) || e.Day.IsWeekend)
                    {
                        e.Cell.BackColor = System.Drawing.Color.Red;
                        e.Cell.ForeColor = System.Drawing.Color.White;
                        e.Day.IsSelectable = false;
                    }
                }
                if (e.Day.Date < DateTime.Now.Date || e.Day.IsWeekend)
                {
                    e.Day.IsSelectable = false;
                }
            }
            catch (Exception x)
            {
                Response.Write("<script>alert('" + x.ToString() + "');</script>");
            }
            try
            {
                DataSet1 DS2 = new DataSet1();
                BookingTableAdapter bookingTA = new BookingTableAdapter();
                CarTableAdapter carTA = new CarTableAdapter();
                SqlDBConnection sqlcon = new SqlDBConnection();
                DataTable dataT = sqlcon.QueryCusTable(User.Identity.Name);
                int sd = int.Parse(dataT.Rows[0]["CustomerID"].ToString());
                DataTable dt = sqlcon.QueryCustTable(sd);
                bookingTA.FillBy1(DS2.Booking, sd);
            
                DateTime date;
                bookingTA.FillBy3(DS2.Booking, sd);
                for (int i = 0; i < DS2.Booking.Rows.Count; i++)
                {
                    date = (DateTime)DS2.Booking.Rows[i]["LessonDate"];
                    if (date == e.Day.Date)
                    {
                        if ((string)DS2.Booking.Rows[i]["LicenseCode"] == "08")
                        {
                            e.Cell.Controls.Add(new LiteralControl("<br /><br /> Lesson " + DS2.Booking.Rows[i]["LessonNumber"] + "<br /> \r\n*********\r\n <br /> Time " + DS2.Booking.Rows[i]["LessonTime"] + "<br /> \n\n Driving a " + "Car" + " "));
                        }
                        else
                        {
                            e.Cell.Controls.Add(new LiteralControl("<br /><br /> Lesson " + DS2.Booking.Rows[i]["LessonNumber"] + "<br /> \r\n*********\r\n <br /> Time " + DS2.Booking.Rows[i]["LessonTime"] + "<br /> \n\n Driving a " + "Truck" + " "));                       
                        }
                        if (e.Day.Date < DateTime.Now)
                        {
                            e.Cell.BackColor = Color.Gray;
                            e.Cell.ForeColor = Color.Black;
                        }
                        else
                        {
                            e.Cell.BackColor = Color.Gold;
                            e.Cell.ForeColor = Color.Black;
                        }
                    }
                }

            }            
            catch (Exception x)
            {
                Response.Write("<script>alert('" + x.ToString() + "');</script>");
            }

        }
        
        protected void btnSubmitBooking_Click(object sender, EventArgs e)
        {
            try
            {
                
                
                DataSet1 DS = new DataSet1();
                BookingTableAdapter bookTa = new BookingTableAdapter();
                bookTa.FillBy(DS.Booking,Label1.Text);
                cusID = (int)DS.Booking.Rows[0]["CustomerID"];
                SqlDBConnection sqlcon = new SqlDBConnection();
                DataTable dataT = sqlcon.QueryCusTable(User.Identity.Name);
                DataTable dt = sqlcon.QueryCustTable((int)dataT.Rows[0]["CustomerID"]);
                int ins =Int32.Parse(ddlIns.Text);
                int lesson=  Int32.Parse(ddllessonN.Text) - 1;
                if (DS.Booking.Rows[lesson]["LessonDate"] != DBNull.Value)
                {
                    DateTime dsff = DateTime.Parse(DS.Booking.Rows[lesson]["LessonDate"].ToString());
                    if ( DateTime.Now.Date < dsff)
                    {
                        dt.Rows[lesson]["LessonDate"] = tbLessonDate.Text;
                        dt.Rows[lesson]["LessonTime"] = ddllessonTime.Text;
                        dt.Rows[lesson]["InstructorID"] = ins;
                        sqlcon.UpdateCust(dt);
                        GridView1.DataBind();
                        Label2.Text = "Successful!!!";
                        Label2.BackColor = Color.Red;
                        Label2.Visible = true;
                    }
                    else
                    {
                        LblTrack.Text = "That Lesson has expired and cannot be changed";
                        LblTrack.Visible = true;
                    }
                }
                else
                {
                    dt.Rows[lesson]["LessonDate"] = tbLessonDate.Text;
                    dt.Rows[lesson]["LessonTime"] = ddllessonTime.Text;
                    dt.Rows[lesson]["InstructorID"] = ins;
                    sqlcon.UpdateCust(dt);
                    GridView1.DataBind();
                    Label2.Text = "Successful!!!";
                    Label2.BackColor = Color.Red;
                    Label2.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
                Label2.Visible = true;
                Label2.BackColor = Color.Red;
                Response.Write("<script>alert('" + ex.ToString() + "'); window.location.href='/Restricted Access/Customer/Booking.aspx'</script>");
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        { 
            if (Calender1.Visible == false)
            {
                Calender1.Visible = true;
            }
            else
            {
                Calender1.Visible = false;
            }

        }

       
        protected void Calender1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now || e.Day.IsWeekend)
            {
                e.Cell.BackColor = Color.Gray;
                e.Day.IsSelectable = false;
            }
        }

        protected void Calender1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                ddllessonTime.Items.Clear();
                ddllessonTime.Items.Add("08:00");
                ddllessonTime.Items.Add("09:00");
                ddllessonTime.Items.Add("10:00");
                ddllessonTime.Items.Add("11:00");
                ddllessonTime.Items.Add("12:00");
                ddllessonTime.Items.Add("13:00");
                ddllessonTime.Items.Add("14:00");
                ddllessonTime.Items.Add("15:00");
                ddllessonTime.Items.Add("16:00");
                ddllessonTime.Items.Add("17:00");

                for (int j = 0; j < ddllessonTime.Items.Count; j++)
                {

                    ddllessonTime.Items[j].Enabled = true;

                }
                tbLessonDate.Text = Calender1.SelectedDate.ToShortDateString();
                Calender1.Visible = false;
                if (tbLessonDate.Text != "")
                {
                    btnSubmitBooking.Enabled = true;
                    btnSubmitBooking.BackColor = Color.Green;
                }

                DataSet1 DS1 = new DataSet1();
                BookingTableAdapter bookingTa = new BookingTableAdapter();
                bookingTa.FillBy(DS1.Booking, User.Identity.Name);
                int lesson = int.Parse(ddllessonN.Text) - 1;
                DataSet1 DS2 = new DataSet1();
                BookingTableAdapter bookTA = new BookingTableAdapter();
                int inst = int.Parse(ddlIns.Text);
                bookingTa.FillBy2Ins(DS2.Booking, inst, Calender1.SelectedDate.ToShortDateString());
                GridView2.DataSource = DS2.Booking;
                GridView2.DataBind();
                if (GridView2.Rows.Count > 0)
                {
                    for (int i = 0; i < GridView2.Rows.Count; i++)
                    {
                        string s = DS2.Booking.Rows[i]["LessonTime"].ToString();
                        string s1 = s.Substring(0, 5);
                        for (int j = 0; j < ddllessonTime.Items.Count; j++)
                        {
                            if (s1 == ddllessonTime.Items[j].Text)
                            {
                                ddllessonTime.Items[j].Enabled = false;
                            }
                        }
                    }
                }
            }
            catch (Exception x)
            {
                Response.Write("<script>alert('" + x.ToString() + "');</script>");
            }
        }

        protected void ddllessonN_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet1 DS1 = new DataSet1();
            BookingTableAdapter bookingTa = new BookingTableAdapter();
            bookingTa.FillBy(DS1.Booking, User.Identity.Name);
            int lesson = int.Parse(ddllessonN.Text) - 1;
            if (DS1.Booking.Rows[lesson]["InstructorID"] != null)
            {
                //ddlIns.Text = DS1.Booking.Rows[lesson]["InstructorID"].ToString();
            }
        }

        protected void BookingCalender_SelectionChanged(object sender, EventArgs e)
        {
            tbLessonDate.Text = BookingCalender.SelectedDate.ToShortDateString();
            try
            {
                
                ddllessonTime.Items.Clear();
                ddllessonTime.Items.Add("08:00");
                ddllessonTime.Items.Add("09:00");
                ddllessonTime.Items.Add("10:00");
                ddllessonTime.Items.Add("11:00");
                ddllessonTime.Items.Add("12:00");
                ddllessonTime.Items.Add("13:00");
                ddllessonTime.Items.Add("14:00");
                ddllessonTime.Items.Add("15:00");
                ddllessonTime.Items.Add("16:00");
                ddllessonTime.Items.Add("17:00");

                for (int j = 0; j < ddllessonTime.Items.Count; j++)
                {

                    ddllessonTime.Items[j].Enabled = true;

                }
                
                if (tbLessonDate.Text != "")
                {
                    btnSubmitBooking.Enabled = true;
                    btnSubmitBooking.BackColor = Color.Green;
                }

                DataSet1 DS1 = new DataSet1();
                BookingTableAdapter bookingTa = new BookingTableAdapter();
                bookingTa.FillBy(DS1.Booking, User.Identity.Name);
                int lesson = int.Parse(ddllessonN.Text) - 1;
                DataSet1 DS2 = new DataSet1();
                BookingTableAdapter bookTA = new BookingTableAdapter();
                int inst = int.Parse(ddlIns.Text);
                bookingTa.FillBy2Ins(DS2.Booking, inst, Calender1.SelectedDate.ToShortDateString());
                GridView2.DataSource = DS2.Booking;
                GridView2.DataBind();
                if (GridView2.Rows.Count > 0)
                {
                    for (int i = 0; i < GridView2.Rows.Count; i++)
                    {
                        string s = DS2.Booking.Rows[i]["LessonTime"].ToString();
                        string s1 = s.Substring(0, 5);
                        for (int j = 0; j < ddllessonTime.Items.Count; j++)
                        {
                            if (s1 == ddllessonTime.Items[j].Text)
                            {
                                ddllessonTime.Items[j].Enabled = false;
                            }
                        }
                    }
                }
            }
            catch (Exception x)
            {
                Response.Write("<script>alert('" + x.ToString() + "');</script>");
            }
        }

        protected void ddlIns_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.DataBind();
        }

      
        
    }
}