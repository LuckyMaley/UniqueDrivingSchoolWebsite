using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite.Restricted_Access
{
    public partial class Site3 : System.Web.UI.MasterPage
    {

        DataTable myCart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                myCart = (DataTable)Session["cart"];
                Session["count"] = myCart.Rows.Count;
            
        }
    }
}