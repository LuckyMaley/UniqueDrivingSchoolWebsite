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

namespace UniqueDrivingSchoolWebsite.Account
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
        {
            DataSet1 DS = new DataSet1();
            UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter CustTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.CustomerTableAdapter();
            UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.ManagerTableAdapter ManTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.ManagerTableAdapter();
            UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter InstrTA = new UniqueDrivingSchoolWebsite.App_Data.DataSet1TableAdapters.InstructorTableAdapter();
            CustTA.FillByUsername(DS.Customer,User.Identity.Name);
            ManTA.FillByManUser(DS.Manager, User.Identity.Name);
            InstrTA.FillByInstrUser(DS.Instructor, User.Identity.Name);
            if(DS.Customer.Rows.Count > 0)
            {
                CustTA.UpdatePass(ChangeUserPassword.ConfirmNewPassword.ToString(), User.Identity.Name);
            }
            else if(DS.Manager.Rows.Count > 0)
            {
                ManTA.UpdatePass(ChangeUserPassword.ConfirmNewPassword.ToString(), User.Identity.Name);
            }
            else if (DS.Instructor.Rows.Count > 0)
            {

                InstrTA.UpdatePass(ChangeUserPassword.ConfirmNewPassword.ToString(), User.Identity.Name);
            }
        }
                
    }
}
