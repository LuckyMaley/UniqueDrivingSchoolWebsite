using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Restricted_Access
{
    public partial class Receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection(); 
            DataTable dt = sqlcon.QueryCusTable(User.Identity.Name);
            string d = DateTime.Today.Date.ToShortDateString();
            datelbl.Text = String.Format("{0:d/M/yyyy}", d);
            Label1.Text = dt.Rows[0]["CustomerID"].ToString();
            Label3.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
            
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}