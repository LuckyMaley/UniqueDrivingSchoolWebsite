using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace UniqueDrivingSchoolWebsite
{
    public class Cart
    {
        public static DataTable cart{ get;set;}
        
        public static DataTable makeCart(DataTable myCart)
        {
            myCart.Columns.Add("PackageID");
            myCart.Columns.Add("PackageName");
            myCart.Columns.Add("PackageType");
            myCart.Columns.Add("PackageCode");
            myCart.Columns.Add("PackageCount");
            myCart.Columns.Add("PackageCost");
            cart = myCart;
            return myCart;
        }

        public static int CheckCart(DataTable myCart, int CheckID)
        {
            for (int i = 0; i < myCart.Rows.Count; i++)
            {
                int s = (int)myCart.Rows[i]["PackageID"];
                if (s == CheckID)
                {
                    return i;
                }
            }
            return 0;
        }

        public static DataTable NewRowCart(DataTable myCart, int ID,string name,string type,int count, int cost)
        {
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable datat = sqlcon.QueryPackagesTableID(ID);
            cart = myCart;
            DataRow Cartrow = cart.NewRow();
            Cartrow["PackageID"] = ID ;
            Cartrow["PackageName"] = name;
            Cartrow["PackageType"] = type;
            Cartrow["PackageCode"] = datat.Rows[0]["PackageCode"];
            Cartrow["PackageCount"] = count;
            Cartrow["PackageCost"] = cost;
            cart.Rows.Add(Cartrow);
            return cart;
        }
    }
}