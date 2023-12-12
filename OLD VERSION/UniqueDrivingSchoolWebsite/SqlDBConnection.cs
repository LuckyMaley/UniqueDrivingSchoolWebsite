using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace UniqueDrivingSchoolWebsite
{
    public class SqlDBConnection
    {
        private string Sql { get; set; }
        private SqlConnection conn;
        private SqlCommand command;
        private SqlDataAdapter da;
        private DataTable dt;
        private SqlCommandBuilder cmdBuilder;

        public SqlDBConnection() 
        {
            string ConString = "Server= 143.128.146.30\\ist3; Database=ist3bb;User ID=ist3bb;Password=d6t22g";
            conn = new SqlConnection(ConString);
                    
        }
        public DataTable QueryCusTable(string User)
        {
            Sql = "Select * from Customer Where UserName = @Username";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryCustTable(int User)
        {
            Sql = "Select * from Booking Where CustomerID = @Username";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        
        public void UpdateCust(DataTable dt)
        {
            conn.Open(); 
            cmdBuilder = new SqlCommandBuilder(da);
            da.Update(dt);
            conn.Close();            
        }

        
    }
}