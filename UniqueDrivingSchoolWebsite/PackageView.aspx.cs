using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UniqueDrivingSchoolWebsite
{
    public partial class PackageView : System.Web.UI.Page
    {
        DataTable myCart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            myCart = (DataTable)Session["cart"];
            
            if (!IsPostBack)
            {
                try
                {
                    int id = int.Parse(Request.QueryString["PackageID"]);
                     
                    SqlDBConnection sqlcon = new SqlDBConnection();
                    DataTable dt = sqlcon.QueryPackagesTableID(id);
                  
                    rptrImages2.DataSource = dt;
                    rptrImages2.DataBind();
                    System.Data.DataTable dataT = sqlcon.QueryPackagesTableID(id);
                    if (dataT.Rows[0]["PackagePicture"] != DBNull.Value)
                    {
                        byte[] imageData = (byte[])dataT.Rows[0]["PackagePicture"];
                        string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                        im.ImageUrl = "data:image/png;base64," + img;

                    }
                    else
                    {
                        im.ImageUrl = "Resources/noImage.png";
                    }
                    

                }
                catch (Exception ex)
                {
                    Label1.Text = ex.ToString();
                    Response.Redirect("Packages.aspx", false);
                }
            }
            
        }



        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                if (myCart.Rows.Count < 1)
                {
                    int id = int.Parse(Request.QueryString["PackageID"]);
                    SqlDBConnection sqlcon = new SqlDBConnection();
                    DataTable dt = sqlcon.QueryPackagesTableID(id);

                    myCart = Cart.NewRowCart((DataTable)Session["cart"], (int)dt.Rows[0]["PackageID"], dt.Rows[0]["PackageName"].ToString(), dt.Rows[0]["PackageType"].ToString(), (int)dt.Rows[0]["PackageCount"], (int)dt.Rows[0]["PackageCost"]);

                    Session["cart"] = myCart;
                    Session["count"] = myCart.Rows.Count;
                    Repeater rp = (Repeater)Page.Master.FindControl("rptr");
                    rp.DataSource = (DataTable)Session["cart"];
                    rp.DataBind();
                }
                else
                {
                    Label1.Text = "Only one item allowed on the cart";
                }
                
            }
            catch (Exception ex)
            {
                Label1.Text = ex.ToString();
            }
        }


        
    }
}