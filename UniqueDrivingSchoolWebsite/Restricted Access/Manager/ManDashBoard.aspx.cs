using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Manager
{
    public partial class ManDashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = sqlcon.QueryManTable(User.Identity.Name);
            Label6.Text = dt.Rows[0]["ManagerID"].ToString();
            Label2.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
            DataTable dt2 = sqlcon.QueryCusAllTable();
            Label5.Text = dt2.Rows.Count.ToString();
            DataTable dt4 = sqlcon.QueryInsTable();
            int count = 0;
            for (int i = 0; i < dt4.Rows.Count;i++)
            {
                if ((string)dt4.Rows[i]["StreetName"] != "fired")
                {
                    count++;
                }
            }
            Label7.Text = count.ToString();
            DataTable dt5 = sqlcon.QueryCarTable();

            int count2 = 0;
            for (int i = 0; i < dt5.Rows.Count; i++)
            {
                if ((string)dt5.Rows[i]["Status"] != "Written off")
                {
                    count2++;
                }
            }
            Label9.Text = count2.ToString();
            Calendar1.SelectedDate = DateTime.Today.Date;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
    }
}