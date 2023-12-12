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
                        byte[] imageData = (byte[])DS.Instructor.Rows[0]["Instructpic"];
                        string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                        imagehere.ImageUrl = "data:image/png;base64," + img;
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

        protected void Buttonbtn_Click(object sender, EventArgs e)
        {
            fileup.Visible = true;
            btnUpload.Visible = true;
            Buttonbtn.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            DataSet1 DS2 = new DataSet1();
            InstructorTableAdapter bookingTA = new InstructorTableAdapter();
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dataT = sqlcon.QueryInsTable(User.Identity.Name);
            if (!fileup.HasFile)
            {
                Label3.Text = "Please Insert an Image";
            }
            else
            {
                int length = fileup.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                fileup.PostedFile.InputStream.Read(pic, 0, length);
                dataT.Rows[0]["Instructpic"] = pic;
                sqlcon.UpdateCust(dataT);
                if (dataT.Rows[0]["Instructpic"] != DBNull.Value)
                {
                    byte[] imageData = (byte[])dataT.Rows[0]["Instructpic"];
                    string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                    imagehere.ImageUrl = "data:image/png;base64," + img;
                }
                Label3.Text = "Uploaded";
                fileup.Visible = false;
                btnUpload.Visible = false;
                Buttonbtn.Visible = true;
                Response.Redirect("/Restricted Access/Instructor/InsAccountSettings.aspx");
            }
        }
    }
}