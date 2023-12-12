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


namespace UniqueDrivingSchoolWebsite.Restricted_Access.Manager
{
    public partial class Booking : System.Web.UI.Page
    {
        List<DateTime> holidayList = null;
        int insID;
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

                    holidayList = GetPublicHolidays();
                    DataSet1 DS1 = new DataSet1();
                    BookingTableAdapter bookingTa = new BookingTableAdapter();
                    SqlDBConnection sqld = new SqlDBConnection();
                    DataTable dsad = sqld.QueryInsTable();
                    int asxz = int.Parse(dsad.Rows[0]["InstructorID"].ToString());
                    DataTable safg = sqld.QueryInsTable(asxz);
                    int ddf = asxz;
                    bookingTa.FillByInsBook(DS1.Booking, ddf);
                    Label1.Text = safg.Rows[0]["UserName"].ToString();
                    insID = int.Parse(DS1.Booking.Rows[0]["InstructorID"].ToString());
                    
                    Label4.Text = insID.ToString();
                    if (DS1.Booking.Rows[0]["InstructorID"] != null)
                    {
                        Label3.Text = DS1.Booking.Rows[0]["InstructorID"].ToString();
                        ddlIns.Text = DS1.Booking.Rows[0]["InstructorID"].ToString();
                    }
                    BookingCalender.SelectedDate = DateTime.Today.Date;
                    Calender1.SelectedDate = DateTime.Today.AddDays(1);
                }
           
                catch (Exception x)
                {
                    Label2.Text = x.ToString();
                    Label2.Visible = true;
                    Label2.BackColor = Color.Red;
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
                BookingCalender.SelectedDate = DateTime.Today;
                List<DateTime> holidayList1 = GetPublicHolidays();
                if (holidayList1.Count > 0)
                {
                    if (holidayList1.Contains(e.Day.Date) || e.Day.IsWeekend)
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
                DataSet1 DS3 = new DataSet1();
                BookingTableAdapter bookingTA = new BookingTableAdapter();
                CarTableAdapter carTA = new CarTableAdapter();
                SqlDBConnection sqlcon = new SqlDBConnection();
                int scz = int.Parse(ddlIns.Text);
                DataTable dataT = sqlcon.QueryInsTable(scz);
                int insas = int.Parse(dataT.Rows[0]["InstructorID"].ToString());
                DataTable dt = sqlcon.QueryInsTable(insas);
                bookingTA.FillBy2(DS2.Booking,insas);
                bookingTA.FillBy2Ins(DS3.Booking,insas,e.Day.Date.ToString());
               
                bookingTA.FillBy2Ins(DS2.Booking, insas, e.Day.Date.ToString());
                for (int j = 0; j < DS2.Booking.Rows.Count; j++)
                {
                    if (DS2.Booking.Rows[j]["LicenseCode"].ToString() == "08")
                    {
                        e.Cell.Controls.Add(new LiteralControl("<br/> \r\n*********\r\n <br /> Time " + DS2.Booking.Rows[j]["LessonTime"] + "<br /> \n\n Driving a " + "Car" + " "));
                    }
                    else
                    {
                        e.Cell.Controls.Add(new LiteralControl("<br /> \r\n*********\r\n <br /> Time " + DS2.Booking.Rows[j]["LessonTime"] + "<br /> \n\n Driving a " + "Truck" + " "));
                    }
                    if (e.Day.Date < DateTime.Now || e.Day.IsWeekend)
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
                if (e.Day.Date < DateTime.Now)
                {
                    e.Cell.BackColor = Color.Gray;
                    e.Cell.ForeColor = Color.Black;
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
                int ght = int.Parse(ddlIns.Text);
                bookTa.FillByInsBook(DS.Booking,ght);
                insID = int.Parse(DS.Booking.Rows[0]["InstructorID"].ToString());
                SqlDBConnection sqlcon = new SqlDBConnection();
                DataTable dataT = sqlcon.QueryInsTable(insID);
                int num = int.Parse(ddllessonTime3.SelectedValue);
                DataTable dt = sqlcon.QueryInsTable(insID,num);
                int ins =Int32.Parse(ddlIns.Text);
                DataSet1 DS5 = new DataSet1();
                bookTa.FillBy2(DS5.Booking, ins);
                int lesson=  DS5.Booking.Rows.Count - 1;
                if (DS.Booking.Rows[0]["LessonDate"] != DBNull.Value)
                {
                    
                        dt.Rows[0]["LessonDate"] = tbLessonDate.Text;
                        dt.Rows[0]["LessonTime"] = ddllessonTime1.Text;
                        dt.Rows[0]["InstructorID"] = ins;
                        sqlcon.UpdateCust(dt);
                        GridView1.DataBind();
                        Label2.Text = "Successful!!!";
                        Label2.BackColor = Color.Red;
                        Label2.Visible = true;
                        
                    
                   
                }
                else
                {
                   
                    dt.Rows[0]["LessonTime"] = ddllessonTime1.Text;
                    dt.Rows[0]["InstructorID"] = ins;
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
            SqlDataSource1.DataBind();
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
                int sc = int.Parse(ddlIns.Text);
                bookingTa.FillByInsBook(DS1.Booking, sc);
                
                DataSet1 DS2 = new DataSet1();
                BookingTableAdapter bookTA = new BookingTableAdapter();
                int inst = int.Parse(ddlIns.Text);
                bookingTa.FillBy2Ins(DS2.Booking, inst, Calender1.SelectedDate.ToShortDateString());
                int lesson = DS2.Booking.Rows.Count;
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
                            if (s1 != ddllessonTime.Items[j].Text)
                            {
                                ddllessonTime.Items[j].Enabled = false;
                            }
                        }
                    }
                }
                
            }
            catch (Exception x)
            {
                Label2.Text = x.ToString();
                Label2.Visible = true;
                Label2.BackColor = Color.Red;
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
                int scx = int.Parse(ddlIns.Text);
                bookingTa.FillByInsBook(DS1.Booking, scx);
                
                DataSet1 DS2 = new DataSet1();
                BookingTableAdapter bookTA = new BookingTableAdapter();
                int inst = int.Parse(ddlIns.Text);
                bookingTa.FillBy2Ins(DS2.Booking, inst, Calender1.SelectedDate.ToShortDateString());
                int lesson = DS2.Booking.Rows.Count;
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
                            if (s1 != ddllessonTime.Items[j].Text)
                            {
                                ddllessonTime.Items[j].Enabled = false;
                            }
                        }
                    }
                }
            }
            catch (Exception x)
            {
                Label2.Text = x.ToString();
                Label2.Visible = true;
                Label2.BackColor = Color.Red;
            }
        }

        protected void ddlIns_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataSet1 DS1 = new DataSet1();
                BookingTableAdapter bookingTa = new BookingTableAdapter();
                int scx = int.Parse(ddlIns.Text);
                bookingTa.FillByInsBook(DS1.Booking, scx);
                GridView1.DataBind();
            }
            catch (Exception x)
            {
                Label2.Text = x.ToString();
                Label2.Visible = true;
                Label2.BackColor = Color.Red;
            }
            
        }

        protected void ddllessonTime_SelectedIndexChanged(object sender, EventArgs e)
        {
       
            SqlDataSource1.DataBind();
            
            SqlDataSource2.DataBind();
        }

      
        
    }
}