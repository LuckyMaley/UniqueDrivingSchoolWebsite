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

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Customer
{
    public partial class CusAccountSettings : System.Web.UI.Page
    {
        DataSet1 DS = new DataSet1();
        CustomerTableAdapter custTA = new CustomerTableAdapter();
        

        protected void Page_Load(object sender, EventArgs e)
        {
           Label1.Text = User.Identity.Name;
            try{
               custTA.FillByUsername(DS.Customer, Label1.Text);
            if (!IsPostBack)
            {
                if (DS.Customer.Rows[0]["custpic"] != DBNull.Value)
                {
                    byte[] imageData = (byte[])DS.Customer.Rows[0]["custpic"];
                    string img = Convert.ToBase64String(imageData,0,imageData.Length);
                    image1.ImageUrl = "data:image/png;base64," +img;
                }
                tbFirstName.Text = DS.Customer.Rows[0]["FirstName"].ToString();
                tbLastName.Text = DS.Customer.Rows[0]["LastName"].ToString();
                Calender1.SelectedDate = (DateTime)DS.Customer.Rows[0]["DateOfBirth"];
                tbDOB.Text = Calender1.SelectedDate.ToShortDateString();
                dpGender.Text = DS.Customer.Rows[0]["Gender"].ToString();
                tbCellphone.Text = DS.Customer.Rows[0]["Cellphone"].ToString();
                tbHouseNumber.Text = DS.Customer.Rows[0]["HouseNumber"].ToString();
                tbStreetName.Text = DS.Customer.Rows[0]["StreetName"].ToString();
                tbCityOrTown.Text = DS.Customer.Rows[0]["CityOrTown"].ToString();
                tbZipCode.Text = DS.Customer.Rows[0]["ZipCode"].ToString();
                tbEmail.Text = DS.Customer.Rows[0]["EmailAddress"].ToString();
                
            }
            }
            catch(Exception ex)
            {
                Label2.Text = ex.ToString();
                Label2.Visible = true;
            }
        }

        protected void Calender_SelectionChanged(object sender, EventArgs e)
        {
            tbDOB.Text = Calender1.SelectedDate.ToShortDateString();
            Calender1.Visible = false;
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calender1.Visible == false)
            {
                Calender1.Visible = true;
            }
            else
            {
                Calender1.Visible = false;
            }

        }

        protected void Update_Click(object sender, EventArgs e)
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            fileup.Visible = true;
            btnUpload.Visible = true;
            Button1.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            DataSet1 DS2 = new DataSet1();
            CustomerTableAdapter bookingTA = new CustomerTableAdapter();
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dataT = sqlcon.QueryCusTable(User.Identity.Name);
            if (!fileup.HasFile)
            {
                Label3.Text = "Please Insert an Image";
            }
            else
            {
                int length = fileup.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                fileup.PostedFile.InputStream.Read(pic, 0, length);
                dataT.Rows[0]["custpic"] = pic;
                sqlcon.UpdateCust(dataT);
                if (DS2.Customer.Rows[0]["custpic"] != DBNull.Value)
                {
                    byte[] imageData = (byte[])DS2.Customer.Rows[0]["custpic"];
                    string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                    image1.ImageUrl = "data:image/png;base64," + img;
                }
                Label3.Text = "Uploaded";
            }
        }

        
    }
}