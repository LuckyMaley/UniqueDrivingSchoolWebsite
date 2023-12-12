using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using UniqueDrivingSchoolWebsite.App_Data;
using UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters;

namespace UniqueDrivingSchoolWebsite.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            try
            {
                FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

                DataSet1 DS1 = new DataSet1();
                UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter CustTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter();
                UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter InsTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter();                
                if (radioList.SelectedValue == "Customer")
                {
                    CustTA.UpdateUser(RegisterUser.Email, RegisterUser.UserName, RegisterUser.Password, int.Parse(txtCustID.Text));
                    Roles.AddUserToRole(RegisterUser.UserName, "Customer");
                }
                else
                {
                    InsTA.UpdateIns(RegisterUser.UserName, RegisterUser.Password, int.Parse(txtInsID.Text));
                    Roles.AddUserToRole(RegisterUser.UserName, "Instructor");
                }
                string continueUrl = "~/";
                if (String.IsNullOrEmpty(continueUrl))
                {
                    continueUrl = "~/";
                }
                Response.Redirect(continueUrl);
                
            }
            catch (Exception ex)
            {
                Mess.Text = ex.ToString();
            }
        }

        protected void btnSubmitID_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet1 DS = new DataSet1();
                UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter CustTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter();
                CustTA.FillByID(DS.Customer, int.Parse(txtCustID.Text));
                string username = (string)DS.Customer.Rows[0]["Username"];
                string password = (string)DS.Customer.Rows[0]["PassWord"];
                string row = (string)DS.Customer.Rows[0][10];
                
                if (txtCustID.Text != " " || txtCustID.Text != "")
                {

                    if (DS.Customer.Rows.Count == 1)
                    {

                        if (username == " " || username == "")
                        {
                            Mess.Text = "";
                            Panel1.Visible = true;
                            Panel2.Visible = false;
                        }
                        else
                        {
                            Mess.Text = "Customer ID already registered";
                        }
                        if (row != "")
                        {
                            RegisterUser.Email = row;
                        }

                    }
                    else
                    {

                        Mess.Text = "Customer ID not valid, Please enter a correct Customer ID";
                    }
                }
                else
                {
                    Mess.Text = "No ID entered, Please enter a valid ID";

                }
            }


            catch (Exception ex)
            {
                 Mess.Text = ex.ToString() ;
            } 
        }

        protected void radioList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel3.Visible = false;
            Panel2.Visible = false;
            Panel1.Visible = false;
            if (radioList.SelectedValue == "Customer")
            {
                Panel2.Visible = true;
            }
            else if (radioList.SelectedValue == "Instructor")
            {
                Panel3.Visible = true;
            }
            else
            {
                Panel3.Visible = false;
                Panel2.Visible = false;
            }
        }

        protected void btnSubmitInsID_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet1 DS = new DataSet1();
                UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter InsTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter();
                InsTA.FillByID(DS.Instructor, int.Parse(txtInsID.Text));
                string username = (string)DS.Instructor.Rows[0]["Username"];
                string password = (string)DS.Instructor.Rows[0]["PassWord"];
                

                if (txtCustID.Text != " " || txtCustID.Text != "")
                {

                    if (DS.Instructor.Rows.Count == 1)
                    {

                        if (username == " " || username == "")
                        {
                            Mess.Text = "";
                            Panel1.Visible = true;
                            Panel3.Visible = false;
                        }
                        else
                        {
                            Mess.Text = "Instructor ID already registered";
                        }

                    }
                    else
                    {

                        Mess.Text = "Instructor ID not valid, Please enter a correct Instructor ID";
                    }
                }
                else
                {
                    Mess.Text = "No ID entered, Please enter a valid ID";

                }
            }


            catch (Exception ex)
            {
                Mess.Text = ex.ToString();
            } 
        }
    }      
}
