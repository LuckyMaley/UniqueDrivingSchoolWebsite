<%@ Page Title="" Language="C#" MasterPageFile="~/Restricted Access/Instructor/Site2.Master" AutoEventWireup="true" CodeBehind="InsTimeTable.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Instructor.InsTimeTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
        function BtnPrint_onclick() {
            var prtContent = document.getElementById("printArea");
            var WinPrint = window.open('', '', 'letf=0,top=0,toolbar=0,sta­tus=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
        }
        

    </script>
    <style type="text/css"> 
    .gvPagerCss span
    {
        background-color:#DEE1E7;
        font-size:20px;
    }  
    .gvPagerCss td
    {
        padding-left: 5px;   
        padding-right: 5px;  
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" align="center" style="width: 100%">
    <div align="center" style="border-style: double; width: 50%">
    <h2 align="center">Filter TimeTable</h2>
       <asp:label runat="server" text="Weekly From Date" ID="from" Font-Size="Large"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="Date" 
            DataValueField="Date" DataTextFormatString="{0:d}">
        </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:button runat="server" text="Load" CssClass="btn" Width="168px" ID="btn2" onclick="btn2_Click" 
           />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT [Date] FROM [Payment]">
        </asp:SqlDataSource>
        <br />
                  <asp:label runat="server" text="Monthly From Date" ID="todate" 
            Font-Size="Large"></asp:label>&nbsp;&nbsp;&nbsp;
            <asp:DropDownList 
            ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="Date" DataValueField="Date" DataTextFormatString="{0:d}" >
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:button runat="server" text="Load" CssClass="btn" Width="168px" ID="btn" onclick="btn_Click" 
           />

        <br />
        
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        
        <br />

</div>
<br />
    <div id="printArea" align="center">
        <div id="imageUniq" align="center">
        
                <div align="center" >
                <div align="center" id="v" >
                <asp:Image ID="Image83" 
                    runat="server" BackColor="White"   
                Height="181px" ImageAlign="Middle" 
                ImageUrl="~/Resources/UniqueDrivingSchool.jpg" Width="316px" />
                &nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image23" 
                    runat="server" BackColor="White"   
                Height="181px" ImageAlign="Middle" 
                ImageUrl="~/Resources/timetable.png" Width="299px" /></div></div>
                
        </div>
     
        <div><asp:label runat="server" ID="lbl" Visible="False" ></asp:label>
            <b> <asp:label runat="server" text="Date:   " ID="datelbd" Font-Size="XX-Large"></asp:label><asp:label runat="server" text="Label" ID="datelbld" Font-Size="XX-Large"></asp:label>
           
            <br />
           
            <asp:Label ID="Label2" runat="server" Text="Instructor Name:" 
                Font-Size="XX-Large"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
            <br /></b>
        
            <asp:gridview runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="Black" 
                GridLines="Horizontal" Height="108px" Width="800px" BackColor="#CCCCCC" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Font-Bold="True" 
                Font-Size="Large" ID="gvd" AllowPaging="True" 
                onpageindexchanging="gvd_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="LessonNumber" HeaderText="Lesson" 
                        SortExpression="LessonNumber"></asp:BoundField>
                    <asp:BoundField DataField="LessonDate" DataFormatString="{0:d/M/yyyy}" 
                        HeaderText="Date" SortExpression="LessonDate"></asp:BoundField>
                    <asp:BoundField DataField="LessonTime" HeaderText="Time" 
                        SortExpression="LessonTime"></asp:BoundField>
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type">
                    </asp:BoundField>
                </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="#3366CC" 
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" 
                    CssClass="gvPagerCss" />
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <sortedascendingcellstyle backcolor="#E9E7E2" />
            <sortedascendingheaderstyle backcolor="#506C8C" />
            <sorteddescendingcellstyle backcolor="#FFFDF8" />
            <sorteddescendingheaderstyle backcolor="#6F8DAE" />

<SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
            </asp:gridview> 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT Booking.LessonNumber, Booking.LessonDate, Booking.LessonTime, Car.Type FROM Booking INNER JOIN Car ON Booking.CarID = Car.CarID WHERE (Booking.InstructorID = CAST(@InstructorID AS Integer)) AND (Booking.LessonDate &gt;= CAST(@Lesson AS Date)) AND (Booking.LessonDate &lt;= CAST(@lessonDate AS Date)) and Booking.BookingID =Booking.BookingID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl" Name="InstructorID" 
                        PropertyName="Text" />
                    <asp:Parameter Name="Lesson" />
                    <asp:Parameter Name="lessonDate" />
                </SelectParameters>
            </asp:SqlDataSource>
        
            <br />
            <br />
        
        </div>
        
    </div>
    
<b><input id="Button1" type="button" value="Print" class="btn" onclick="return BtnPrint_onclick()" /></b>
</div>
<div class="content3" align="center">
            </div>
</asp:Content>
