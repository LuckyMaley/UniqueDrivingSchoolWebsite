using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Customer
{
    public partial class CusTimeTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection(); 
            DataTable dt = sqlcon.QueryCusTable(User.Identity.Name);
            string d = DateTime.Today.Date.ToShortDateString();
            datelbld.Text = String.Format("{0:d/M/yyyy}", d);
            lbl.Text = dt.Rows[0]["CustomerID"].ToString();
            Label3.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
            
        }
    }
}