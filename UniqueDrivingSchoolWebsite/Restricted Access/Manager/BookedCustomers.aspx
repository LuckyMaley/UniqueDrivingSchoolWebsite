<%@ Page Title="" Language="C#" MasterPageFile="~/Restricted Access/Manager/Site3.Master" AutoEventWireup="true" CodeBehind="BookedCustomers.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Manager.BookedCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <h1 align="center">Edit Customer</h1>
        <asp:textbox runat="server" ID="tbSearch"></asp:textbox><asp:button runat="server" text="Search By Customer ID" />
    </div>

    <div>
        <asp:gridview runat="server" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="CustomerID" DataSourceID="SqlDataSource2" ForeColor="Black" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                </asp:CommandField>
                <asp:BoundField DataField="CustomerID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="CustomerID"></asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName"></asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName"></asp:BoundField>
                <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" 
                    SortExpression="DateOfBirth"></asp:BoundField>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                </asp:BoundField>
                <asp:BoundField DataField="Cellphone" HeaderText="Cellphone" 
                    SortExpression="Cellphone"></asp:BoundField>
                <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" 
                    SortExpression="HouseNumber"></asp:BoundField>
                <asp:BoundField DataField="StreetName" HeaderText="StreetName" 
                    SortExpression="StreetName"></asp:BoundField>
                <asp:BoundField DataField="CityOrTown" HeaderText="CityOrTown" 
                    SortExpression="CityOrTown"></asp:BoundField>
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" 
                    SortExpression="ZipCode"></asp:BoundField>
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" 
                    SortExpression="EmailAddress"></asp:BoundField>
                <asp:BoundField DataField="DrivingTestDate" HeaderText="DrivingTestDate" 
                    SortExpression="DrivingTestDate"></asp:BoundField>
                <asp:BoundField DataField="DrivingTestResult" HeaderText="DrivingTestResult" 
                    SortExpression="DrivingTestResult"></asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName"></asp:BoundField>
                <asp:BoundField DataField="PassWord" HeaderText="PassWord" 
                    SortExpression="PassWord"></asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <sortedascendingcellstyle backcolor="#F1F1F1" />
            <sortedascendingheaderstyle backcolor="#007DBB" />
            <sorteddescendingcellstyle backcolor="#CAC9C9" />
            <sorteddescendingheaderstyle backcolor="#00547E" />

<SortedAscendingCellStyle BackColor="#FBFBF2"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#848384"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#EAEAD3"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#575357"></SortedDescendingHeaderStyle>
        </asp:gridview>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [DateOfBirth] = @original_DateOfBirth AND [Gender] = @original_Gender AND (([Cellphone] = @original_Cellphone) OR ([Cellphone] IS NULL AND @original_Cellphone IS NULL)) AND (([HouseNumber] = @original_HouseNumber) OR ([HouseNumber] IS NULL AND @original_HouseNumber IS NULL)) AND (([StreetName] = @original_StreetName) OR ([StreetName] IS NULL AND @original_StreetName IS NULL)) AND (([CityOrTown] = @original_CityOrTown) OR ([CityOrTown] IS NULL AND @original_CityOrTown IS NULL)) AND (([ZipCode] = @original_ZipCode) OR ([ZipCode] IS NULL AND @original_ZipCode IS NULL)) AND (([EmailAddress] = @original_EmailAddress) OR ([EmailAddress] IS NULL AND @original_EmailAddress IS NULL)) AND (([DrivingTestDate] = @original_DrivingTestDate) OR ([DrivingTestDate] IS NULL AND @original_DrivingTestDate IS NULL)) AND (([DrivingTestResult] = @original_DrivingTestResult) OR ([DrivingTestResult] IS NULL AND @original_DrivingTestResult IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([PassWord] = @original_PassWord) OR ([PassWord] IS NULL AND @original_PassWord IS NULL))" 
            InsertCommand="INSERT INTO [Customer] ([CustomerID], [FirstName], [LastName], [DateOfBirth], [Gender], [Cellphone], [HouseNumber], [StreetName], [CityOrTown], [ZipCode], [EmailAddress], [DrivingTestDate], [DrivingTestResult], [UserName], [PassWord]) VALUES (@CustomerID, @FirstName, @LastName, @DateOfBirth, @Gender, @Cellphone, @HouseNumber, @StreetName, @CityOrTown, @ZipCode, @EmailAddress, @DrivingTestDate, @DrivingTestResult, @UserName, @PassWord)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [CustomerID], [FirstName], [LastName], [DateOfBirth], [Gender], [Cellphone], [HouseNumber], [StreetName], [CityOrTown], [ZipCode], [EmailAddress], [DrivingTestDate], [DrivingTestResult], [UserName], [PassWord] FROM [Customer] WHERE ([CustomerID] = @CustomerID)" 
            UpdateCommand="UPDATE [Customer] SET [FirstName] = @FirstName, [LastName] = @LastName, [DateOfBirth] = @DateOfBirth, [Gender] = @Gender, [Cellphone] = @Cellphone, [HouseNumber] = @HouseNumber, [StreetName] = @StreetName, [CityOrTown] = @CityOrTown, [ZipCode] = @ZipCode, [EmailAddress] = @EmailAddress, [DrivingTestDate] = @DrivingTestDate, [DrivingTestResult] = @DrivingTestResult, [UserName] = @UserName, [PassWord] = @PassWord WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [DateOfBirth] = @original_DateOfBirth AND [Gender] = @original_Gender AND (([Cellphone] = @original_Cellphone) OR ([Cellphone] IS NULL AND @original_Cellphone IS NULL)) AND (([HouseNumber] = @original_HouseNumber) OR ([HouseNumber] IS NULL AND @original_HouseNumber IS NULL)) AND (([StreetName] = @original_StreetName) OR ([StreetName] IS NULL AND @original_StreetName IS NULL)) AND (([CityOrTown] = @original_CityOrTown) OR ([CityOrTown] IS NULL AND @original_CityOrTown IS NULL)) AND (([ZipCode] = @original_ZipCode) OR ([ZipCode] IS NULL AND @original_ZipCode IS NULL)) AND (([EmailAddress] = @original_EmailAddress) OR ([EmailAddress] IS NULL AND @original_EmailAddress IS NULL)) AND (([DrivingTestDate] = @original_DrivingTestDate) OR ([DrivingTestDate] IS NULL AND @original_DrivingTestDate IS NULL)) AND (([DrivingTestResult] = @original_DrivingTestResult) OR ([DrivingTestResult] IS NULL AND @original_DrivingTestResult IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([PassWord] = @original_PassWord) OR ([PassWord] IS NULL AND @original_PassWord IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DateOfBirth" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Cellphone" Type="String" />
                <asp:Parameter Name="original_HouseNumber" Type="String" />
                <asp:Parameter Name="original_StreetName" Type="String" />
                <asp:Parameter Name="original_CityOrTown" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_EmailAddress" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DrivingTestDate" />
                <asp:Parameter Name="original_DrivingTestResult" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_PassWord" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfBirth" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Cellphone" Type="String" />
                <asp:Parameter Name="HouseNumber" Type="String" />
                <asp:Parameter Name="StreetName" Type="String" />
                <asp:Parameter Name="CityOrTown" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter DbType="Date" Name="DrivingTestDate" />
                <asp:Parameter Name="DrivingTestResult" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="PassWord" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="tbSearch" Name="CustomerID" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfBirth" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Cellphone" Type="String" />
                <asp:Parameter Name="HouseNumber" Type="String" />
                <asp:Parameter Name="StreetName" Type="String" />
                <asp:Parameter Name="CityOrTown" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter DbType="Date" Name="DrivingTestDate" />
                <asp:Parameter Name="DrivingTestResult" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="PassWord" Type="String" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DateOfBirth" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Cellphone" Type="String" />
                <asp:Parameter Name="original_HouseNumber" Type="String" />
                <asp:Parameter Name="original_StreetName" Type="String" />
                <asp:Parameter Name="original_CityOrTown" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_EmailAddress" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DrivingTestDate" />
                <asp:Parameter Name="original_DrivingTestResult" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_PassWord" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div>
        <br />
        <h1 align="center">Booked Customers</h1>
        <asp:gridview runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID"></asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName"></asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName"></asp:BoundField>
                <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" 
                    SortExpression="DateOfBirth"></asp:BoundField>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                </asp:BoundField>
                <asp:BoundField DataField="Cellphone" HeaderText="Cellphone" 
                    SortExpression="Cellphone"></asp:BoundField>
                <asp:BoundField DataField="HouseNumber" HeaderText="HouseNumber" 
                    SortExpression="HouseNumber"></asp:BoundField>
                <asp:BoundField DataField="StreetName" HeaderText="StreetName" 
                    SortExpression="StreetName"></asp:BoundField>
                <asp:BoundField DataField="CityOrTown" HeaderText="CityOrTown" 
                    SortExpression="CityOrTown"></asp:BoundField>
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" 
                    SortExpression="ZipCode"></asp:BoundField>
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" 
                    SortExpression="EmailAddress"></asp:BoundField>
                <asp:BoundField DataField="DrivingTestDate" HeaderText="DrivingTestDate" 
                    SortExpression="DrivingTestDate"></asp:BoundField>
                <asp:BoundField DataField="DrivingTestResult" HeaderText="DrivingTestResult" 
                    SortExpression="DrivingTestResult"></asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName"></asp:BoundField>
                <asp:BoundField DataField="PassWord" HeaderText="PassWord" 
                    SortExpression="PassWord"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <sortedascendingcellstyle backcolor="#EDF6F6" />
            <sortedascendingheaderstyle backcolor="#0D4AC4" />
            <sorteddescendingcellstyle backcolor="#D6DFDF" />
            <sorteddescendingheaderstyle backcolor="#002876" />

<SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
        </asp:gridview>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [CustomerID], [FirstName], [LastName], [DateOfBirth], [Gender], [Cellphone], [HouseNumber], [StreetName], [CityOrTown], [ZipCode], [EmailAddress], [DrivingTestDate], [DrivingTestResult], [UserName], [PassWord] FROM [Customer]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
