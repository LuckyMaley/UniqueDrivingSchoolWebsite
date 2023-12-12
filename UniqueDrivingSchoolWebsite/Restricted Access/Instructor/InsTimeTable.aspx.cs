using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Instructor
{
    public partial class InsTimeTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = sqlcon.QueryInsTable(User.Identity.Name);
            string d = DateTime.Today.Date.ToShortDateString();
            datelbld.Text = String.Format("{0:d/M/yyyy}", d);
            lbl.Text = dt.Rows[0]["InstructorID"].ToString();
            Label3.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
           

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            DateTime dp1 = DateTime.Parse(DropDownList2.Text);
            DateTime dp2 = dp1.AddDays(31);
            int dfdf = int.Parse(lbl.Text);
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = sqlcon.QuerybookingInsTable2(dfdf, DropDownList2.Text, dp2.ToString());
            ViewState["Paging"] = dt;
            gvd.DataSource = dt;
            gvd.DataBind();
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            DateTime dp1 = DateTime.Parse(DropDownList1.Text);
            DateTime dp2 = dp1.AddDays(7);
            int dfdf = int.Parse(lbl.Text);
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = sqlcon.QuerybookingInsTable2(dfdf, DropDownList1.Text, dp2.ToString());
            
            gvd.DataSource = dt;
            gvd.DataBind();
        }

        protected void gvd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvd.PageIndex = e.NewPageIndex;
            gvd.DataSource = ViewState["Paging"];
            gvd.DataBind();
        }

      


    }
}