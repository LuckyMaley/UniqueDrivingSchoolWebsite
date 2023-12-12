using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite
{
    public partial class ViewCart : System.Web.UI.Page
    {
        DataTable myCart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                myCart = (DataTable)Session["cart"];
                
                    try
                    {
                      
                        SqlDBConnection sqlcon = new SqlDBConnection();
                        DataTable dt = myCart;
                        rprtCart.DataSource = dt;
                        rprtCart.DataBind();
                        if (myCart.Rows.Count != 0)
                        {
                            int f = int.Parse(myCart.Rows[0]["PackageID"].ToString());
                            System.Data.DataTable dataT = sqlcon.QueryPackagesTableID(f);
                            if (dataT.Rows[0]["PackagePicture"] != DBNull.Value)
                            {
                                byte[] imageData = (byte[])dataT.Rows[0]["PackagePicture"];
                                string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                                imsdf.ImageUrl = "data:image/png;base64," + img;

                            }
                            else
                            {
                                imsdf.ImageUrl = "Resources/noImage.png";
                            }
                        }
                        else
                        {
                            Response.Redirect("/ViewCartEmpty.aspx", false);
                        }
                        
                    }
                    catch (Exception ex)
                    {

                        idf.Text = ex.ToString();
                       // Response.Redirect("Default.aspx", false);
                    }
                
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Restricted Access/Customer/CheckOut.aspx", false);
        }

        protected void rem_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            Cart.makeCart(dt);
            Session["cart"] = dt;
            Session["count"] = 0;
            Response.Redirect("/ViewCartEmpty.aspx",false);
        }



    }
}