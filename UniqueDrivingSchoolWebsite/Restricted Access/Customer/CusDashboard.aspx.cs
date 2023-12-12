using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Customer
{
    public partial class CusDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = sqlcon.QueryCusTable(User.Identity.Name);
            Label6.Text = dt.Rows[0]["CustomerID"].ToString();
            DataTable dt1 = sqlcon.QueryCustTable(int.Parse(dt.Rows[0]["CustomerID"].ToString()));
            int u = int.Parse(dt1.Rows[0]["NumOfLessons"].ToString());
            if (u == 20)
            {
                Label4.Text = "Full Course";
            }
            else
            {
                Label4.Text = "Per Lesson";
            }
            Label2.Text = dt.Rows[0]["FirstName"].ToString() + " " +dt.Rows[0]["LastName"].ToString();
            Label5.Text = dt1.Rows[0]["NumOfLessons"].ToString();
            Calendar1.SelectedDate = DateTime.Today.Date;
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
    }
}