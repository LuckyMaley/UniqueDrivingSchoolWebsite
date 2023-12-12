<%@ Page Title="" Language="C#" MasterPageFile="~/Restricted Access/Manager/Site3.Master" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Manager.Bookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <h1 align="center">Search Booking</h1>
        <asp:textbox runat="server" ID="tbSearch"></asp:textbox><asp:button runat="server" text="Search By Customer ID" />
    </div>

    <div align="center">
        <asp:gridview runat="server" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="ID" 
                    SortExpression="CustomerID"></asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName"></asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName"></asp:BoundField>
                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" 
                    SortExpression="BookingDate"></asp:BoundField>
                <asp:BoundField DataField="LicenseCode" HeaderText="LicenseCode" 
                    SortExpression="LicenseCode">
                </asp:BoundField>
                <asp:BoundField DataField="BookingStatus" HeaderText="BookingStatus" 
                    SortExpression="BookingStatus"></asp:BoundField>
                <asp:BoundField DataField="PickupVenue" HeaderText="PickupVenue" 
                    SortExpression="PickupVenue"></asp:BoundField>
                <asp:BoundField DataField="NumOfLessons" HeaderText="NumOfLessons" 
                    SortExpression="NumOfLessons"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <sortedascendingcellstyle backcolor="#F1F1F1" />
            <sortedascendingheaderstyle backcolor="#007DBB" />
            <sorteddescendingcellstyle backcolor="#CAC9C9" />
            <sorteddescendingheaderstyle backcolor="#00547E" />

<SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
        </asp:gridview>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            OldValuesParameterFormatString="original_{0}" 
            
            
            SelectCommand="SELECT DISTINCT Booking.CustomerID, Customer.FirstName, Customer.LastName, Booking.BookingDate, Booking.LicenseCode, Booking.BookingStatus, Booking.PickupVenue, Booking.NumOfLessons FROM Booking INNER JOIN Customer ON Booking.CustomerID = Customer.CustomerID WHERE (Booking.CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbSearch" Name="CustomerID" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div align="center">
        <br />
        <h1 align="center">Booking Details</h1>
        <asp:gridview runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="CustomerID"></asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName"></asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName"></asp:BoundField>
                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" 
                    SortExpression="BookingDate"></asp:BoundField>
                <asp:BoundField DataField="LicenseCode" HeaderText="LicenseCode" 
                    SortExpression="LicenseCode">
                </asp:BoundField>
                <asp:BoundField DataField="BookingStatus" HeaderText="BookingStatus" 
                    SortExpression="BookingStatus"></asp:BoundField>
                <asp:BoundField DataField="PickupVenue" HeaderText="PickupVenue" 
                    SortExpression="PickupVenue"></asp:BoundField>
                <asp:BoundField DataField="NumOfLessons" HeaderText="NumOfLessons" 
                    SortExpression="NumOfLessons"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

<SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
        </asp:gridview>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT DISTINCT Customer.CustomerID, Customer.FirstName, Customer.LastName, Booking.BookingDate, Booking.LicenseCode, Booking.BookingStatus, Booking.PickupVenue, Booking.NumOfLessons FROM Customer INNER JOIN Booking ON Customer.CustomerID = Booking.CustomerID">
        </asp:SqlDataSource>
    </div>
</asp:Content>
