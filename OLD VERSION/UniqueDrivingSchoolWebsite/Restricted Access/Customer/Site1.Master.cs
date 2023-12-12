using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using UniqueDrivingSchoolWebsite.App_Data;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;

namespace UniqueDrivingSchoolWebsite.Restricted_Access
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string dir = "";

                if (HttpContext.Current.User.IsInRole("Customer"))
                {
                    dir = "/Restricted Access/Customer/CusAccountSettings.aspx";
                    HyperLink curr = (HyperLink)HeadLoginView.FindControl("LinkTo");

                    if (HttpContext.Current.Request.FilePath == dir)
                    {
                        curr.NavigateUrl = dir;
                    }
                    else
                    {
                        curr.NavigateUrl = "/Restricted Access/Customer/CusAccountSettings.aspx";
                    }
                }
                else if (HttpContext.Current.User.IsInRole("Instructor"))
                {
                    dir = "/Restricted Access/Instructor/InsAccountSettings.aspx";
                    HyperLink curr = (HyperLink)HeadLoginView.FindControl("LinkTo");

                    if (HttpContext.Current.Request.FilePath == dir)
                    {
                        curr.NavigateUrl = dir;
                    }
                    else
                    {
                        curr.NavigateUrl = "/Restricted Access/Customer/InsAccountSettings.aspx";
                    }
                }
                else
                {
                    dir = "/Restricted Access/Manager/ManAccountSettings.aspx";
                    HyperLink curr = (HyperLink)HeadLoginView.FindControl("LinkTo");

                    if (HttpContext.Current.Request.FilePath == dir)
                    {
                        curr.NavigateUrl = dir;
                    }
                    else
                    {
                        curr.NavigateUrl = "/Restricted Access/Customer/ManAccountSettings.aspx";
                    }
                }
            }
        }
    }
}