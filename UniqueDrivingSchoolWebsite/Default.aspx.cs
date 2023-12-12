using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using UniqueDrivingSchoolWebsite;

public partial class _Default : System.Web.UI.Page
{
    DataTable myCart = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        myCart = (DataTable)Session["cart"];
    }

}