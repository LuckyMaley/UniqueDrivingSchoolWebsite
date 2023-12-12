<%@ Page Title="" Language="C#" MasterPageFile="~/Restricted Access/Customer/Site1.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Receipt" %>
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
        #imageUni
        {
            height: 192px;
        }
        #PrintArea
        {
            height: 665px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div  class="content" align="center">
    <br />

        <br />
        <div id="printArea" style="height: 513px" align="center">
        <div id="imageUni" align="center">
        
                <div align="center" class="img-rounded">
                <div align="center" id="v" class="img-img-rounded">
                <asp:Image ID="Image8" 
                    runat="server" BackColor="White"   
                Height="181px" ImageAlign="Middle" 
                ImageUrl="~/Resources/UniqueDrivingSchool.jpg" Width="316px" />
                &nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image9" 
                    runat="server" BackColor="White"   
                Height="181px" ImageAlign="Middle" 
                ImageUrl="~/Resources/service_fees_plan_charge-512.png" Width="316px" /></div></div>
                
        </div>
           <b> <asp:label runat="server" text="Label" ID="datelbl" Font-Size="XX-Large"></asp:label>
           
            <br />
            <asp:Label ID="Label2" runat="server" Text="Customer Name:" 
                Font-Size="XX-Large"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
            <br /></b>
        <br />
            <asp:gridview runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" 
                GridLines="Horizontal" Height="184px" Width="800px" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Font-Bold="True" 
                Font-Size="Large" ID="gv3">
                <Columns>
                    <asp:BoundField DataField="ReceiptNumber" HeaderText="Receipt" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ReceiptNumber">
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                        DataFormatString="{0:d/M/yyyy}">
                    </asp:BoundField>
                    <asp:BoundField DataField="LicenseCode" HeaderText="Code" 
                        SortExpression="LicenseCode"></asp:BoundField>
                    <asp:BoundField DataField="NumOfLessons" HeaderText="Lessons" 
                        SortExpression="NumOfLessons"></asp:BoundField>
                    <asp:BoundField DataField="AmountOwing" 
                        HeaderText="Amount Due" SortExpression="AmountOwing" 
                        DataFormatString="R {0}"></asp:BoundField>
                </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="#3366CC" 
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT TOP (1) Payment.ReceiptNumber, Payment.Date, Booking.LicenseCode, Booking.NumOfLessons, Payment.AmountOwing FROM Booking INNER JOIN Payment ON Payment.CustomerID = Booking.CustomerID WHERE (Booking.CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="CustomerID" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    
    <br />
        <asp:button runat="server" 
            text="Back To Home" CssClass="btn" ID="backho" onclick="Unnamed3_Click" 
            Height="48px" Width="144px" />
        &nbsp;&nbsp; <input id="Button1" type="button" value="Print" 
            onclick="return BtnPrint_onclick()" class="btn" /> &nbsp;
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </div>
    <br />
    <br />
    <div class="content3" align="center">
        <br />
        
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
</asp:Content>
