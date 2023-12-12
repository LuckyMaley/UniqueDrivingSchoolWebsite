using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using UniqueDrivingSchoolWebsite.App_Data;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;

namespace UniqueDrivingSchoolWebsite.Restricted_Access.Manager
{
    public partial class PackagePrices : System.Web.UI.Page
    {
        DataTable dt1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                SqlDBConnection sqlcon = new SqlDBConnection();
                DataTable dt2 = sqlcon.QueryPackagesTable();
           
                string s = "";
                for (int i = 0; i < dt2.Rows.Count;i++ )
                {
                    s = dt2.Rows[i]["PackageID"].ToString();
                    ddlID.Items.Add(s);
                }
                ddlID.Text = dt2.Rows[0]["PackageID"].ToString();
                int idVal = int.Parse(ddlID.SelectedValue);
                DataTable dt = sqlcon.QueryPackagesTableID(idVal);
                packageName.Text = dt.Rows[0]["PackageName"].ToString();
                ddlType.Text = dt.Rows[0]["PackageType"].ToString();
                ddlCount.Text = dt.Rows[0]["PackageCount"].ToString();
                ddlcode.Text = dt.Rows[0]["PackageCode"].ToString();
                tbDescription.Text = dt.Rows[0]["PackageDescription"].ToString();
                tbCost.Text = dt.Rows[0]["PackageCost"].ToString();
                if (dt.Rows[0]["PackagePicture"] != DBNull.Value)
                {
                    byte[] imageData = (byte[])dt.Rows[0]["PackagePicture"];
                    string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                    Image1.ImageUrl = "data:image/png;base64," + img;
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
           // SqlDataSource1.Insert();
            SqlDBConnection sqlcon = new SqlDBConnection();
            dt1 = sqlcon.QueryPackagesTable();
            dt1.Columns[0].AutoIncrement = true;
            dt1.Columns[0].AutoIncrementSeed = 1;
            dt1.Columns[0].AutoIncrementStep = 1;
            DataRow dr= dt1.NewRow();
            dr["ManagerID"] = 1;
            dt1.Rows.Add(dr);
            int s = ((int)dt1.Rows[dt1.Rows.Count - 2]["PackageID"]) + 1;
            DataTable dt = sqlcon.QueryPackagesTableID(s);
            if (!FileUpload1.HasFile)
            {
                Label1.Text = "Please Insert an Image";
            }
            else
            {
                int length = FileUpload1.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                dt.Rows[0]["PackagePicture"] = pic;
                if (dt.Rows[0]["PackagePicture"] != DBNull.Value)
                {
                    byte[] imageData = (byte[])dt.Rows[0]["PackagePicture"];
                    string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                    Image1.ImageUrl = "data:image/png;base64," + img;
                }
                Label1.Text = "Uploaded";
                
            }
            ddlID.Items.Add(s.ToString());
            ddlID.Text = s.ToString();
            packageName.Text = "";
            ddlType.Text = "";
            ddlCount.Text = "";
            ddlcode.Text = "";
            tbDescription.Text = "";
            tbCost.Text = "";
            btnAdd.Visible = false;
            Save.Visible = true;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                Label1.Text = "Please Insert an Image";
            }
            else
            {
                SqlDBConnection sqlcon = new SqlDBConnection();
                int s = (int.Parse(ddlID.Text));
                
                SqlDataSource1.Insert();
                int length = FileUpload1.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                DataTable dt = sqlcon.QueryPackagesTableID(s);
                dt.Rows[0]["PackagePicture"] = pic;
                sqlcon.UpdateCust(dt);
                btnAdd.Visible = true;
                Save.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection();
            int s = (int.Parse(ddlID.Text));
            SqlDataSource1.Update();
            int length = FileUpload1.PostedFile.ContentLength;
            byte[] pic = new byte[length];
            FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
            DataTable dt = sqlcon.QueryPackagesTableID(s);
            dt.Rows[0]["PackagePicture"] = pic;
            sqlcon.UpdateCust(dt);

            
            int idVal = int.Parse(ddlID.SelectedValue);
            dt = sqlcon.QueryPackagesTableID(idVal);
            packageName.Text = dt.Rows[0]["PackageName"].ToString();
            ddlType.Text = dt.Rows[0]["PackageType"].ToString();
            ddlCount.Text = dt.Rows[0]["PackageCount"].ToString();
            ddlcode.Text = dt.Rows[0]["PackageCode"].ToString();
            tbDescription.Text = dt.Rows[0]["PackageDescription"].ToString();
            tbCost.Text = dt.Rows[0]["PackageCost"].ToString();
            if (dt.Rows[0]["PackagePicture"] != DBNull.Value)
            {
                byte[] imageData = (byte[])dt.Rows[0]["PackagePicture"];
                string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                Image1.ImageUrl = "data:image/png;base64," + img;
            }
            else
            {
                Image1.ImageUrl = Imagedup.ImageUrl;
            }
        

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            SqlDataSource1.Delete();
            SqlDBConnection sqlcon = new SqlDBConnection();
            DataTable dt2 = sqlcon.QueryPackagesTable();
            ddlID.Items.Clear();
            string s = "";
            for (int i = 0; i < dt2.Rows.Count; i++)
            {
                s = dt2.Rows[i]["PackageID"].ToString();
                ddlID.Items.Add(s);
            }
        }

        protected void ddlID_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDBConnection sqlcon = new SqlDBConnection();
            int idVal = int.Parse(ddlID.SelectedValue);
            DataTable dt = sqlcon.QueryPackagesTableID(idVal);
            packageName.Text = dt.Rows[0]["PackageName"].ToString();
            ddlType.Text = dt.Rows[0]["PackageType"].ToString();
            ddlCount.Text = dt.Rows[0]["PackageCount"].ToString();
            ddlcode.Text = dt.Rows[0]["PackageCode"].ToString();
            tbDescription.Text = dt.Rows[0]["PackageDescription"].ToString();
            tbCost.Text = dt.Rows[0]["PackageCost"].ToString();
            if (dt.Rows[0]["PackagePicture"] != DBNull.Value)
            {
                byte[] imageData = (byte[])dt.Rows[0]["PackagePicture"];
                string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                Image1.ImageUrl = "data:image/png;base64," + img;
            }
            else
            {
                Image1.ImageUrl = Imagedup.ImageUrl;
            }
        }
    }
}