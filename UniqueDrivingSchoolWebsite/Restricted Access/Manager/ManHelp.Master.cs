using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using UniqueDrivingSchoolWebsite.App_Data;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;

namespace UniqueDrivingSchoolWebsite.Help
{
    public partial class ManHelp : System.Web.UI.MasterPage
    {
        DataTable myCartr = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            myCartr = (DataTable)Session["cart"];
            Session["count"] = myCartr.Rows.Count;
            
           
            
            


        }
    }
}