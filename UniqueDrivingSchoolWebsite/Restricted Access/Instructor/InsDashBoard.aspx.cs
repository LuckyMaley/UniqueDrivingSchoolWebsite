using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Instructor
{
    public partial class InsDashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = sqlcon.QueryInsTable(User.Identity.Name);
            Label6.Text = dt.Rows[0]["InstructorID"].ToString();
            Label2.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
            DataTable issd = sqlcon.QuerybookingInsTable(int.Parse(Label6.Text),DateTime.Today.Date); 
            Label5.Text = issd.Rows.Count.ToString();
            Calendar1.SelectedDate = DateTime.Today.Date;
            GridView1.DataBind();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
    }
}