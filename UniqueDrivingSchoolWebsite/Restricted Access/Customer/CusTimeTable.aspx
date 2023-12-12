<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="CusTimeTable.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Customer.CusTimeTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
        function BtnPrint_onclick() {
            var prtContent = document.getElementById("printArea1");
            var WinPrint = window.open('', '', 'letf=0,top=0,toolbar=0,sta­tus=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
        }



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content" align="center" style="margin: 0px">
    <div id="printArea1" align="center">
        <div id="imageUniq" align="center">
        
                <div align="center" class="img-rounded">
                <div align="center" id="v" class="img-rounded">
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
            <b> <asp:label runat="server" text="Date: " ID="datelblds" Font-Size="Large"></asp:label>
            <asp:label runat="server" text="Label" ID="datelbld" Font-Size="Large"></asp:label>
           
            <br />
           
            <asp:Label ID="Label2" runat="server" Text="Customer Name:" 
                Font-Size="XX-Large"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
            </b>
        
            <asp:gridview runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
                GridLines="Horizontal" Height="108px" Width="800px" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Font-Bold="True" 
                Font-Size="Large">
            <Columns>
                <asp:BoundField DataField="LessonNumber" HeaderText="Lesson" 
                    SortExpression="LessonNumber">
                </asp:BoundField>
                <asp:BoundField DataField="LessonDate" HeaderText="Date" 
                    SortExpression="LessonDate" DataFormatString="{0:d/M/yyyy}">
                </asp:BoundField>
                <asp:BoundField DataField="LessonTime" HeaderText="Time" 
                    SortExpression="LessonTime" DataFormatString="{0:t}"></asp:BoundField>
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
        
        
            </div>
        
    </div><input id="Button1" type="button" value="Print" class="btn" 
        onclick="return BtnPrint_onclick()" align="middle" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
            
            SelectCommand="SELECT LessonNumber, LessonDate, LessonTime FROM Booking WHERE (CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl" Name="CustomerID" PropertyName="Text" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        
</div>
<div class="content3"></div>
<div class="content3" align="center"></div>
</asp:Content>
