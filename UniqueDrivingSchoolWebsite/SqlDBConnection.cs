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
        public DataTable QueryCusAllTable()
        {
            Sql = "Select * from Customer";
            command = new SqlCommand(Sql, conn);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
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

        public DataTable QueryManTable(string User)
        {
            Sql = "Select * from Manager Where UserName = @Username";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryInsTable()
        {
            Sql = "Select * from Instructor";
            command = new SqlCommand(Sql, conn);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryInsTable(string User)
        {
            Sql = "Select * from Instructor Where UserName = @Username";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryInsTable(int User)
        {
            Sql = "Select * from Instructor Where InstructorID = @Username";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryInsTable(int User,int id)
        {
            Sql = "Select * from Booking Where InstructorID = @Username and BookingID = @BookingID";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            command.Parameters.AddWithValue("@BookingID",id);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryInsTable(int User, DateTime LessonDate)
        {
            Sql = "Select * from Booking Where InstructorID = @Username and LessonDate = @BookingID";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            command.Parameters.AddWithValue("@BookingID", LessonDate);
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

        public DataTable QuerybookingInsTable(int User,DateTime d)
        {
            Sql = "SELECT Booking.LessonNumber, Booking.LessonDate, Booking.LessonTime, Car.Type FROM Booking INNER JOIN Car ON Booking.CarID = Car.CarID WHERE (Booking.InstructorID = CAST(@InstructorID AS Integer)) AND (Booking.LessonDate >= CAST(@Lesson AS Date)) AND (Booking.LessonDate <= CAST(@lessonDate AS Date)) AND Booking.BookingID =Booking.BookingID";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@InstructorID", User);
            command.Parameters.AddWithValue("@Lesson", d);
            command.Parameters.AddWithValue("@lessonDate", d);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QuerybookingInsTable2(int User, string d,string d2)
        {
            Sql = "SELECT Booking.LessonNumber, Booking.LessonDate, Booking.LessonTime, Car.Type FROM Booking INNER JOIN Car ON Booking.CarID = Car.CarID WHERE (Booking.InstructorID = CAST(@InstructorID AS Integer)) AND (Booking.LessonDate >= CAST(@Lesson AS Date)) AND (Booking.LessonDate <= CAST(@lessonDate AS Date)) AND Booking.BookingID =Booking.BookingID";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@InstructorID", User);
            command.Parameters.AddWithValue("@Lesson", d);
            command.Parameters.AddWithValue("@lessonDate", d2);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public DataTable QueryTable()
        {
            Sql = "Select * from Customer";
            command = new SqlCommand(Sql, conn);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryCustTableS(int User)
        {
            Sql = "Select * from Payment Where CustomerID = @Username";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@Username", User);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryPackagesTable()
        {
            Sql = "Select * from Packages";
            command = new SqlCommand(Sql, conn);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryPackagesTableID(int ID)
        {
            Sql = "Select * from Packages where PackageID= @PackageID";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@PackageID", ID);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryPaymentTable()
        {
            Sql = "Select * from Payment";
            command = new SqlCommand(Sql, conn);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryPaymentTableID(int ID)
        {
            Sql = "Select * from Payment where CustomerID= @CustomerID";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@CustomerID", ID);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable QueryCarTable()
        {
            Sql = "Select * from Car";
            command = new SqlCommand(Sql, conn);
            conn.Open();
            da = new SqlDataAdapter(command);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        } 
        public DataTable QueryPaymentTableIDs(int ID)
        {
            Sql = "SELECT TOP (1) Payment.ReceiptNumber, Payment.Date, Booking.LicenseCode, Booking.NumOfLessons, Payment.AmountOwing FROM Payment INNER JOIN Booking ON Payment.CustomerID = Booking.CustomerID WHERE (Payment.CustomerID = @CustomerID) AND (Booking.BookingID = Booking.BookingID) AND (Booking.LessonNumber < 2) OR (Booking.LessonNumber IS NULL)";
            command = new SqlCommand(Sql, conn);
            command.Parameters.AddWithValue("@CustomerID", ID);
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