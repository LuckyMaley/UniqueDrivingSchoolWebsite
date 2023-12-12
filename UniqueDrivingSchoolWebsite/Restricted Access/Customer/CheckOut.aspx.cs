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
    public partial class CheckOut : System.Web.UI.Page
    {
        DataTable myCart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            myCart = (DataTable)Session["cart"];
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = myCart;
            rprtCart1.DataSource = dt;
            rprtCart1.DataBind();
            if (myCart.Rows.Count != 0)
            {
                int f = int.Parse(myCart.Rows[0]["PackageID"].ToString());
                System.Data.DataTable dataT = sqlcon.QueryPackagesTableID(f);
                if (dataT.Rows[0]["PackagePicture"] != DBNull.Value)
                {
                    byte[] imageData = (byte[])dataT.Rows[0]["PackagePicture"];
                    string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                    imsdf1.ImageUrl = "data:image/png;base64," + img;

                }
                else
                {
                    imsdf1.ImageUrl = "Resources/noImage.png";
                }
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            try
            {
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt = sqlcon.QueryPaymentTable();
            DataTable dt1 = sqlcon.QueryCusTable(User.Identity.Name);
            int v = ((int)dt.Rows[dt.Rows.Count - 1]["PaymentID"]) + 1;
            int cus = (int)dt1.Rows[0]["CustomerID"];
            decimal dec = decimal.Parse(myCart.Rows[0]["PackageCost"].ToString());
            DataSet1 DS = new DataSet1();
            PaymentTableAdapter payTA = new PaymentTableAdapter();
            BookingTableAdapter bookTA = new BookingTableAdapter();
            bookTA.Fill(DS.Booking);
            payTA.Fill(DS.Payment);
            payTA.InsertQuery(v, cus, DateTime.Today.Date.ToShortDateString(), 0, dec);
            DataTable dt2 = sqlcon.QueryPaymentTable();
            int c= (int)dt2.Rows[dt2.Rows.Count - 1]["PaymentID"];
            short cou = short.Parse(myCart.Rows[0]["PackageCount"].ToString());
            bookTA.InsertQuery(cus, 1, c, DateTime.Today.Date.ToShortDateString(), myCart.Rows[0]["PackageCode"].ToString(), "Incomplete", "None", cou);
            DataTable dt7 = new DataTable();
            Cart.makeCart(dt7);
            Session["cart"] = dt7;
            Session["count"] = 0;
            Response.Redirect("~/", false);
            Response.Redirect("/Restricted Access/Customer/Receipt.aspx",false);
            }
            catch (Exception ex)
            {
                sa.Text = ex.ToString();
            }
            
        }
    }
}