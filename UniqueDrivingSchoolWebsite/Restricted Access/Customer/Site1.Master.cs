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
        DataTable myCart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myCart = (DataTable)Session["cart"];
                Session["count"] = myCart.Rows.Count;
                rptr.DataSource = myCart;
                rptr.DataBind();
                string dir = "";

                SqlDBConnection sqlcon = new SqlDBConnection();
                DataTable dt = sqlcon.QueryCusTable(HttpContext.Current.User.Identity.Name.ToString());
                username.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();

                DataTable dataT1 = sqlcon.QueryCusTable(HttpContext.Current.User.Identity.Name.ToString());
                DataTable dataTable = sqlcon.QueryCustTableS((int)dataT1.Rows[0]["CustomerID"]);
                DataTable dw = sqlcon.QueryPaymentTableID((int)dataT1.Rows[0]["CustomerID"]);
                if (dw.Rows.Count != 0)
                {
                    int g = int.Parse(dw.Rows[0]["AmountOwing"].ToString());
                    if (dataTable.Rows.Count == 0 || dw.Rows.Count == 0)
                    {
                        time.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                        cusDash.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                        book.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                    }
                    else
                    {
                        if (g > 0)
                        {
                            time.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                            cusDash.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                            book.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                        }
                    }
                  
                }
                else
                {
                    time.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                    cusDash.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                    book.HRef = "/Restricted Access/Customer/NonPayment.aspx";
                }
                if (HttpContext.Current.User.IsInRole("Customer"))
                {
                    dir = "/Restricted Access/Customer/CusAccountSettings.aspx";
                    HyperLink curr = (HyperLink)HeadLoginView.FindControl("LinkTo");

                    if (HttpContext.Current.Request.FilePath == dir)
                    {
                        curr.NavigateUrl = dir;
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
                    
                }
                else
                {
                    dir = "/Restricted Access/Manager/ManAccountSettings.aspx";
                    HyperLink curr = (HyperLink)HeadLoginView.FindControl("LinkTo");

                    if (HttpContext.Current.Request.FilePath == dir)
                    {
                        curr.NavigateUrl = dir;
                    }
                    
                }
                DataSet1 DS2 = new DataSet1();
                CustomerTableAdapter bookingTA = new CustomerTableAdapter();
                DataTable dataT = sqlcon.QueryCusTable(HttpContext.Current.User.Identity.Name.ToString());
                if (dataT.Rows[0]["custpic"] != DBNull.Value)
                {
                    byte[] imageData = (byte[])dataT.Rows[0]["custpic"];
                    string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                    imageTwo.ImageUrl = "data:image/png;base64," + img;
                    Image imagesomet = (Image)HeadLoginView.FindControl("Image7");
                    imagesomet.ImageUrl = "data:image/png;base64," + img;
                }


               
            }
           
            
            
        }
    }
}