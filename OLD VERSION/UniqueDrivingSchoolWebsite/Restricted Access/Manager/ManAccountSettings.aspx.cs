using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using UniqueDrivingSchoolWebsite.App_Data;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Manager
{
    public partial class ManAccountSettings : System.Web.UI.Page
    {
        DataSet1 DS = new DataSet1();
        ManagerTableAdapter ManTA = new ManagerTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = User.Identity.Name;
            try
            {
                ManTA.FillByManUser(DS.Manager,Label1.Text);
                if (!IsPostBack)
                {
                    if (DS.Manager.Rows[0]["Managerpic"] != DBNull.Value)
                    {
                        ImageButton1.ImageUrl = "" + DS.Manager.Rows[0]["custpic"] + "";
                    }
                    tbFirstName.Text = DS.Manager.Rows[0]["FirstName"].ToString();
                    tbLastName.Text = DS.Manager.Rows[0]["LastName"].ToString();
                    tbHouseNumber.Text = DS.Manager.Rows[0]["HouseNumber"].ToString();
                    tbStreetName.Text = DS.Manager.Rows[0]["StreetName"].ToString();
                    tbCityOrTown.Text = DS.Manager.Rows[0]["CityOrTown"].ToString();
                    tbZipCode.Text = DS.Manager.Rows[0]["ZipCode"].ToString();
                }
            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
                Label2.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
               /* DataSet1 DS1 = new DataSet1();
                ManagerTableAdapter ManTA1 = new ManagerTableAdapter();
                ManTA1.Fill(DS1.Manager);
                ManTA1.UpdateManAccount(tbFirstName.Text, tbLastName.Text, tbHouseNumber.Text, tbStreetName.Text, tbCityOrTown.Text, tbZipCode.Text, Label1.Text);
                 */
                SqlDataSource1.Update();
                Label2.Text = "Update is Successful!!!";
                Label2.Visible = true;
            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
                Label2.Visible = true;
            }
        }

        
    }
}