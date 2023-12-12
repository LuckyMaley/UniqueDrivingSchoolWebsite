<%@ Page Title="Schedule" Language="C#" MasterPageFile="Site3.Master" AutoEventWireup="true" CodeBehind="Schedules.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Manager.Booking" %>
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
            height: 51px;
            width: 111px;
        }
        .style4
        {
            width: 159px;
            height: 51px;
        }
        .style5
        {
            height: 47px;
            width: 111px;
        }
        .style6
        {
            width: 111px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous" type="text/javascript"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous" type="text/javascript"></script>
    
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
        align="center"><h1 align="center">SCHEDULES</h1>
        </div>
    
    <div align="center" style="width: 30%; float: left">
        <table style="width: 100%">
            <tr>
                <td class="style5">
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
                         DataSourceID="SqlDataSource3" DataTextField="FirstName" 
                         DataValueField="InstructorID" CssClass="form-control" Enabled="False" >
                     </asp:dropdownlist>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
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
                <td class="style5">
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
                    Width="37px" /></b></div></td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                 <td class="style2">
                    
                     <b>                        
                         <asp:calendar id="Calender1" runat="server" 
                         ondayrender="Calender1_DayRender" 
                         onselectionchanged="Calender1_SelectionChanged" Visible="False" 
                         SelectedDate="09/30/2019 22:17:56" Width="239px"></asp:calendar>
                         
                    </b>
                 </td>
            </tr>
            <tr>
                <td class="style3" >
                   
                    <b>
                        <asp:label id="LessonTime" runat="server" text="Lesson Time"></asp:label>
                    </b>
                   
                 </td>
                
                 <td class="style4">
                    
                     <b>                        
                        <asp:dropdownlist runat="server" ID="ddllessonTime" AutoPostBack="True" 
                         CssClass="form-control" DataSourceID="SqlDataSource2" 
                         DataTextField="LessonTime" DataTextFormatString="{0:t}" 
                         DataValueField="LessonTime" 
                         onselectedindexchanged="ddllessonTime_SelectedIndexChanged"  >
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
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                         SelectCommand="SELECT * FROM [Booking] WHERE (([InstructorID] = @InstructorID) AND ([LessonDate] = @LessonDate))">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="ddlIns" Name="InstructorID" 
                                      PropertyName="SelectedValue" Type="Int32" />
                                  <asp:ControlParameter ControlID="tbLessonDate" DbType="Date" Name="LessonDate" 
                                      PropertyName="Text" />
                              </SelectParameters>
                     </asp:SqlDataSource>
                          <asp:dropdownlist runat="server" ID="ddllessonTime3" AutoPostBack="True" 
                         CssClass="form-control" DataSourceID="SqlDataSource1" 
                         DataTextField="BookingID" DataValueField="BookingID"  >
                        
                        </asp:dropdownlist>       
                        
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                         
                         SelectCommand="SELECT BookingID, CustomerID, ManagerID, InstructorID, CarID, PaymentID, BookingDate, LicenseCode, BookingStatus, PickupVenue, NumOfLessons, LessonNumber, LessonCost, LessonDate, LessonTime FROM Booking WHERE (InstructorID = @InstructorID) AND (LessonTime = CAST(@LessonTime AS Time)) AND (LessonDate = CAST(@LessonDate AS DATE))">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="ddlIns" Name="InstructorID" 
                                 PropertyName="SelectedValue" Type="Int32" />
                             <asp:ControlParameter ControlID="ddllessonTime" DbType="Time" Name="LessonTime" 
                                 PropertyName="SelectedValue" />
                             <asp:ControlParameter ControlID="tbLessonDate" Name="LessonDate" 
                                 PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                        
                    </b>
                 </td>
            </tr>
          
          <tr>
                <td class="style6" >
                   
                    <b>
                        <asp:label id="LessonTime1" runat="server" text="New Lesson Time"></asp:label>
                    </b>
                   
                 </td>
                
                 <td class="style2">
                    
                     <b>                        
                        <asp:dropdownlist runat="server" ID="ddllessonTime1" AutoPostBack="True" 
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
                        CssClass="form-control" Width="100px" /></div></td>
            </tr>
        </table>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="BookingID" DataSourceID="source1" 
            ForeColor="Black" GridLines="Horizontal" Width="279px" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            AllowPaging="True" AllowSorting="True" Visible="False">
                 <Columns>
                     <asp:BoundField DataField="LessonDate" HeaderText="LessonDate" 
                         SortExpression="LessonDate" DataFormatString="{0:d/M/yyyy}"></asp:BoundField>
                     <asp:BoundField DataField="LessonTime" HeaderText="LessonTime" 
                         SortExpression="LessonTime"></asp:BoundField>
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
            SelectCommand="SELECT Booking.BookingID, Booking.CustomerID, Booking.ManagerID, Booking.InstructorID, Booking.CarID, Booking.PaymentID, Booking.BookingDate, Booking.LicenseCode, Booking.BookingStatus, Booking.PickupVenue, Booking.NumOfLessons, Booking.LessonNumber, Booking.LessonCost, Booking.LessonDate, Booking.LessonTime FROM Booking INNER JOIN Instructor ON Booking.InstructorID = Instructor.InstructorID WHERE (Instructor.InstructorID = @InstructorID)" 
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
                        <asp:ControlParameter ControlID="ddlIns" Name="instructorID" 
                            PropertyName="SelectedValue" />
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


         <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
         <br />
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
         <br />
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
         </div>
   
    
    <div align="center" style="width: 62%; height: 661px; float: left;">
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
