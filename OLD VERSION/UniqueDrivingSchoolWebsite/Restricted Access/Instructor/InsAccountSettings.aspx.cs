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

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Instructor
{
    public partial class InsAccountSettings : System.Web.UI.Page
    {
        DataSet1 DS = new DataSet1();
        InstructorTableAdapter InstTA = new InstructorTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = User.Identity.Name;
            try
            {
                InstTA.FillByInstrUser(DS.Instructor,Label1.Text);
                if (!IsPostBack)
                {
                    if (DS.Instructor.Rows[0]["Instructpic"] != DBNull.Value)
                    {
                        ImageButton1.ImageUrl = "" + DS.Instructor.Rows[0]["custpic"] + "";
                    }
                    tbFirstName.Text = DS.Instructor.Rows[0]["FirstName"].ToString();
                    tbLastName.Text = DS.Instructor.Rows[0]["LastName"].ToString();
                    tbHouseNumber.Text = DS.Instructor.Rows[0]["HouseNumber"].ToString();
                    tbStreetName.Text = DS.Instructor.Rows[0]["StreetName"].ToString();
                    tbCityOrTown.Text = DS.Instructor.Rows[0]["CityOrTown"].ToString();
                    tbZipCode.Text = DS.Instructor.Rows[0]["ZipCode"].ToString();
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