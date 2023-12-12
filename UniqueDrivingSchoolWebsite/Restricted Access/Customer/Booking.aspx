<%@ Page Title="Schedule" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Customer.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            height: 47px;
            width: 92px;
        }
        .style2
        {
        width: 159px;
    }
    .style3
    {
        height: 46px;
        width: 92px;
    }
    .style4
    {
        width: 159px;
        height: 46px;
    }
    </style>
    <script type="text/javascript">
        function confirmation() {
            if (confirm("are you sure you want to add this Lesson Date and Time ?")) {
                return true;
            } 
            else {
                return false;
            }
        }
   </script>
    
    </asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center"  >
    <div style="width: 100%; text-align: center; font-family: 'Arial Black'; font-size: larger; color: #000000; height: 59px;" 
        align="center"><h1 align="center">SCHEDULE BOOKING</h1></div>
    
    <div align="center" style="width: 35%; float: left; display: block;">
        <table id="cust" style="width: 100%">
            <tr>
                <td class="style1">
                    <b>
                        <asp:label id="instLabel" runat="server" text="Instructor ID"></asp:label>
                    </b>
                 </td>
                 <td class="style2">
                    <b>                        
                     <asp:dropdownlist id="ddlIns" runat="server" AutoPostBack="True" 
                         DataSourceID="source3" DataTextField="InstructorID" 
                         DataValueField="InstructorID" CssClass="form-control" 
                         onselectedindexchanged="ddlIns_SelectedIndexChanged">
                     </asp:dropdownlist>
                     <asp:dropdownlist id="ddlIns2" runat="server" AutoPostBack="True" 
                         DataSourceID="SqlDataSource1" DataTextField="FirstName" 
                         DataValueField="InstructorID" CssClass="form-control" Enabled="False">
                     </asp:dropdownlist>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                         SelectCommand="SELECT * FROM [Instructor] WHERE ([InstructorID] = @InstructorID)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="ddlIns" Name="InstructorID" 
                                 PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                    </b>
                 </td>
            </tr>
            <tr>
                <td class="style1">
                    <b>
                        <asp:label id="LessonNumber" runat="server" text="Lesson "></asp:label>
                    </b>
                 </td>
                 <td class="style2">
                    <b>                        
                     <asp:dropdownlist id="ddllessonN" runat="server" AutoPostBack="True" 
                         DataSourceID="source1" DataTextField="LessonNumber" 
                         DataValueField="LessonNumber" 
                         onselectedindexchanged="ddllessonN_SelectedIndexChanged" 
                         CssClass="form-control">
                     </asp:dropdownlist>
                    </b>
                 </td>
            </tr>
            <tr>
                <td class="style1">
                    <b>
                        <asp:label id="LessonDate" runat="server" text="Lesson Date"></asp:label>
                    </b>
                 </td>
                 <td class="style2">
                    <div style="float: left; width: 78%"><b>                        
                         <asp:textbox runat="server" ID="tbLessonDate" Width="91px" 
                         AutoPostBack="false" ReadOnly="True" CssClass="form-control" ></asp:textbox></b></div><div style="float: left; width: 20%"><b>
                <asp:ImageButton ID="ImageButton2" runat="server" Height="24px" 
                    ImageUrl="~/Resources/Calendar_Green.png" onclick="ImageButton2_Click" 
                    Width="37px" /></b></div>
                 </td>
            </tr>
            <tr>
                <td >
                   
                 </td>
                
                 <td class="style2">
                    <b>                        
                         <asp:calendar id="Calender1" runat="server" 
                         ondayrender="Calender1_DayRender" 
                         onselectionchanged="Calender1_SelectionChanged" Visible="False" 
                         SelectedDate="09/30/2019 22:17:56" Width="203px"></asp:calendar>
                    </b>
                 </td>
            </tr>
            <tr>
                <td class="style3">
                    <b>
                        <asp:label id="LessonTime" runat="server" text="Lesson Time"></asp:label>
                    </b>
                 </td>
                 <td class="style4">
                    <b>                 
                        <asp:dropdownlist runat="server" ID="ddllessonTime" AutoPostBack="True" 
                         CssClass="form-control"  >
                         <asp:ListItem>08:00</asp:ListItem>
                             <asp:ListItem>09:00</asp:ListItem>
                             <asp:ListItem>10:00</asp:ListItem>
                             <asp:ListItem>11:00</asp:ListItem>
                             <asp:ListItem>12:00</asp:ListItem>
                             <asp:ListItem>13:00</asp:ListItem>
                             <asp:ListItem>14:00</asp:ListItem>
                             <asp:ListItem>15:00</asp:ListItem>
                             <asp:ListItem>16:00</asp:ListItem>
                             <asp:ListItem>17:00</asp:ListItem>
                        </asp:dropdownlist>       
                         
                    </b>
                 </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                <div align="right" style="float: right; width: 109px;">
                    <asp:button runat="server" text="Submit" 
                        ID="btnSubmitBooking" onclick="btnSubmitBooking_Click" BackColor="Red" 
                        Enabled="False" onclientclick="return confirmation();" 
                        CssClass="form-control" Width="100px" /></div>
                </td>
            </tr>
         </table>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="BookingID" DataSourceID="source1" 
            ForeColor="Black" GridLines="Horizontal" Width="279px" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                 <Columns>
                     <asp:BoundField DataField="LessonNumber" HeaderText="Lesson" 
                         SortExpression="LessonNumber"></asp:BoundField>
                     <asp:BoundField DataField="LessonDate" DataFormatString="{0:d/M/yyyy}" 
                         HeaderText="Date" SortExpression="LessonDate"></asp:BoundField>
                     <asp:BoundField DataField="LessonTime" HeaderText="Time" 
                         SortExpression="LessonTime" DataFormatString="{0:t}"></asp:BoundField>
                 </Columns>
                 <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                 <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                 <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                 <sortedascendingcellstyle backcolor="#E9E7E2" />
                 <sortedascendingheaderstyle backcolor="#506C8C" />
                 <sorteddescendingcellstyle backcolor="#FFFDF8" />
                 <sorteddescendingheaderstyle backcolor="#6F8DAE" />

<SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
        </asp:GridView>
                <asp:GridView ID="GridView2" runat="server" Visible="False">
        </asp:GridView>
                <asp:sqldatasource Id="source1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Booking.BookingID, Booking.CustomerID, Booking.ManagerID, Booking.InstructorID, Booking.CarID, Booking.PaymentID, Booking.BookingDate, Booking.LicenseCode, Booking.BookingStatus, Booking.PickupVenue, Booking.NumOfLessons, Booking.LessonNumber, Booking.LessonCost, Booking.LessonDate, Booking.LessonTime FROM Booking INNER JOIN Customer ON Booking.CustomerID = Customer.CustomerID WHERE (Customer.UserName = @Customer)" 
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [Booking] WHERE [BookingID] = @original_BookingID AND (([CustomerID] = @original_CustomerID) OR ([CustomerID] IS NULL AND @original_CustomerID IS NULL)) AND (([ManagerID] = @original_ManagerID) OR ([ManagerID] IS NULL AND @original_ManagerID IS NULL)) AND (([InstructorID] = @original_InstructorID) OR ([InstructorID] IS NULL AND @original_InstructorID IS NULL)) AND (([CarID] = @original_CarID) OR ([CarID] IS NULL AND @original_CarID IS NULL)) AND (([PaymentID] = @original_PaymentID) OR ([PaymentID] IS NULL AND @original_PaymentID IS NULL)) AND (([BookingDate] = @original_BookingDate) OR ([BookingDate] IS NULL AND @original_BookingDate IS NULL)) AND (([LicenseCode] = @original_LicenseCode) OR ([LicenseCode] IS NULL AND @original_LicenseCode IS NULL)) AND (([BookingStatus] = @original_BookingStatus) OR ([BookingStatus] IS NULL AND @original_BookingStatus IS NULL)) AND (([PickupVenue] = @original_PickupVenue) OR ([PickupVenue] IS NULL AND @original_PickupVenue IS NULL)) AND (([NumOfLessons] = @original_NumOfLessons) OR ([NumOfLessons] IS NULL AND @original_NumOfLessons IS NULL)) AND (([LessonNumber] = @original_LessonNumber) OR ([LessonNumber] IS NULL AND @original_LessonNumber IS NULL)) AND (([LessonCost] = @original_LessonCost) OR ([LessonCost] IS NULL AND @original_LessonCost IS NULL)) AND (([LessonDate] = @original_LessonDate) OR ([LessonDate] IS NULL AND @original_LessonDate IS NULL)) AND (([LessonTime] = @original_LessonTime) OR ([LessonTime] IS NULL AND @original_LessonTime IS NULL))" 
            InsertCommand="INSERT INTO [Booking] ([CustomerID], [ManagerID], [InstructorID], [CarID], [PaymentID], [BookingDate], [LicenseCode], [BookingStatus], [PickupVenue], [NumOfLessons], [LessonNumber], [LessonCost], [LessonDate], [LessonTime]) VALUES (@CustomerID, @ManagerID, @InstructorID, @CarID, @PaymentID, @BookingDate, @LicenseCode, @BookingStatus, @PickupVenue, @NumOfLessons, @LessonNumber, @LessonCost, @LessonDate, @LessonTime)" 
            OldValuesParameterFormatString="original_{0}" 
            
            
            UpdateCommand="UPDATE [Booking] SET [CustomerID] = @CustomerID, [ManagerID] = @ManagerID, [InstructorID] = @InstructorID, [CarID] = @CarID, [PaymentID] = @PaymentID, [BookingDate] = @BookingDate, [LicenseCode] = @LicenseCode, [BookingStatus] = @BookingStatus, [PickupVenue] = @PickupVenue, [NumOfLessons] = @NumOfLessons, [LessonNumber] = @LessonNumber, [LessonCost] = @LessonCost, [LessonDate] = @LessonDate, [LessonTime] = @LessonTime WHERE [BookingID] = @original_BookingID AND (([CustomerID] = @original_CustomerID) OR ([CustomerID] IS NULL AND @original_CustomerID IS NULL)) AND (([ManagerID] = @original_ManagerID) OR ([ManagerID] IS NULL AND @original_ManagerID IS NULL)) AND (([InstructorID] = @original_InstructorID) OR ([InstructorID] IS NULL AND @original_InstructorID IS NULL)) AND (([CarID] = @original_CarID) OR ([CarID] IS NULL AND @original_CarID IS NULL)) AND (([PaymentID] = @original_PaymentID) OR ([PaymentID] IS NULL AND @original_PaymentID IS NULL)) AND (([BookingDate] = @original_BookingDate) OR ([BookingDate] IS NULL AND @original_BookingDate IS NULL)) AND (([LicenseCode] = @original_LicenseCode) OR ([LicenseCode] IS NULL AND @original_LicenseCode IS NULL)) AND (([BookingStatus] = @original_BookingStatus) OR ([BookingStatus] IS NULL AND @original_BookingStatus IS NULL)) AND (([PickupVenue] = @original_PickupVenue) OR ([PickupVenue] IS NULL AND @original_PickupVenue IS NULL)) AND (([NumOfLessons] = @original_NumOfLessons) OR ([NumOfLessons] IS NULL AND @original_NumOfLessons IS NULL)) AND (([LessonNumber] = @original_LessonNumber) OR ([LessonNumber] IS NULL AND @original_LessonNumber IS NULL)) AND (([LessonCost] = @original_LessonCost) OR ([LessonCost] IS NULL AND @original_LessonCost IS NULL)) AND (([LessonDate] = @original_LessonDate) OR ([LessonDate] IS NULL AND @original_LessonDate IS NULL)) AND (([LessonTime] = @original_LessonTime) OR ([LessonTime] IS NULL AND @original_LessonTime IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_BookingID" Type="Int32" />
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                        <asp:Parameter Name="original_ManagerID" Type="Int32" />
                        <asp:Parameter Name="original_InstructorID" Type="Int32" />
                        <asp:Parameter Name="original_CarID" Type="Int32" />
                        <asp:Parameter Name="original_PaymentID" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="original_BookingDate" />
                        <asp:Parameter Name="original_LicenseCode" Type="String" />
                        <asp:Parameter Name="original_BookingStatus" Type="String" />
                        <asp:Parameter Name="original_PickupVenue" Type="String" />
                        <asp:Parameter Name="original_NumOfLessons" Type="Int16" />
                        <asp:Parameter Name="original_LessonNumber" Type="Int32" />
                        <asp:Parameter Name="original_LessonCost" Type="Decimal" />
                        <asp:Parameter DbType="Date" Name="original_LessonDate" />
                        <asp:Parameter DbType="Time" Name="original_LessonTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="ManagerID" Type="Int32" />
                        <asp:Parameter Name="InstructorID" Type="Int32" />
                        <asp:Parameter Name="CarID" Type="Int32" />
                        <asp:Parameter Name="PaymentID" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="BookingDate" />
                        <asp:Parameter Name="LicenseCode" Type="String" />
                        <asp:Parameter Name="BookingStatus" Type="String" />
                        <asp:Parameter Name="PickupVenue" Type="String" />
                        <asp:Parameter Name="NumOfLessons" Type="Int16" />
                        <asp:Parameter Name="LessonNumber" Type="Int32" />
                        <asp:Parameter Name="LessonCost" Type="Decimal" />
                        <asp:Parameter DbType="Date" Name="LessonDate" />
                        <asp:Parameter DbType="Time" Name="LessonTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="Customer" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="ManagerID" Type="Int32" />
                        <asp:Parameter Name="InstructorID" Type="Int32" />
                        <asp:Parameter Name="CarID" Type="Int32" />
                        <asp:Parameter Name="PaymentID" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="BookingDate" />
                        <asp:Parameter Name="LicenseCode" Type="String" />
                        <asp:Parameter Name="BookingStatus" Type="String" />
                        <asp:Parameter Name="PickupVenue" Type="String" />
                        <asp:Parameter Name="NumOfLessons" Type="Int16" />
                        <asp:Parameter Name="LessonNumber" Type="Int32" />
                        <asp:Parameter Name="LessonCost" Type="Decimal" />
                        <asp:Parameter DbType="Date" Name="LessonDate" />
                        <asp:Parameter DbType="Time" Name="LessonTime" />
                        <asp:Parameter Name="original_BookingID" Type="Int32" />
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                        <asp:Parameter Name="original_ManagerID" Type="Int32" />
                        <asp:Parameter Name="original_InstructorID" Type="Int32" />
                        <asp:Parameter Name="original_CarID" Type="Int32" />
                        <asp:Parameter Name="original_PaymentID" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="original_BookingDate" />
                        <asp:Parameter Name="original_LicenseCode" Type="String" />
                        <asp:Parameter Name="original_BookingStatus" Type="String" />
                        <asp:Parameter Name="original_PickupVenue" Type="String" />
                        <asp:Parameter Name="original_NumOfLessons" Type="Int16" />
                        <asp:Parameter Name="original_LessonNumber" Type="Int32" />
                        <asp:Parameter Name="original_LessonCost" Type="Decimal" />
                        <asp:Parameter DbType="Date" Name="original_LessonDate" />
                        <asp:Parameter DbType="Time" Name="original_LessonTime" />
                    </UpdateParameters>
        </asp:sqldatasource>
        <asp:sqldatasource Id="source2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Booking.BookingID, Booking.CustomerID, Booking.ManagerID, Booking.InstructorID, Booking.CarID, Booking.PaymentID, Booking.BookingDate, Booking.LicenseCode, Booking.BookingStatus, Booking.PickupVenue, Booking.NumOfLessons, Booking.LessonNumber, Booking.LessonCost, Booking.LessonDate, Booking.LessonTime FROM Booking INNER JOIN Customer ON Booking.CustomerID = Customer.CustomerID WHERE (Customer.UserName = @Customer)" 
            
            UpdateCommand="UPDATE Booking SET InstructorID = @InstructorID, LessonDate = CAST(@LessonDate AS Date), LessonTime = CAST(@LessonTime AS Time) WHERE (LessonNumber = @LessonNumber) and CustomerID = CustomerID" >
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="Customer" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="ddlIns" Name="InstructorID" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="tbLessonDate" Name="LessonDate" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="LessonTime" Name="LessonTime" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="ddllessonN" Name="LessonNumber" 
                    PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:sqldatasource>
        <asp:sqldatasource Id="source3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Instructor]"  >
        </asp:sqldatasource>


                    <asp:Label ID="LblTrack" runat="server" Text="Label" 
            Visible="False" ForeColor="Red"></asp:Label>
                <br />


         <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
         <br />
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
         <br />
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
         </div>
   
    
    <div align="center" style="width: 65%; float: left; height: 661px;">
        <asp:calendar runat="server" BackColor="White" BorderColor="#3366CC" 
            BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" 
            Font-Size="8pt" ForeColor="#003399" Height="655px" Width="100%" 
            ID="BookingCalender" ondayrender="BookingCalender_DayRender" 
            onselectionchanged="BookingCalender_SelectionChanged" >
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" 
                Wrap="True" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:calendar>
    </div>
    </div> 
    
</asp:Content>
