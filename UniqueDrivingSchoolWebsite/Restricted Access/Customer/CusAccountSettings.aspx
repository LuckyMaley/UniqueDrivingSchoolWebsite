<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="CusAccountSettings.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Customer.CusAccountSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            height: 45px;
        }
        .style2
        {
            height: 45px;
            width: 332px;
        }
        .style3
        {
            width: 332px;
        }
        .style4
        {
            height: 230px;
        }
        .style5
        {
            height: 45px;
            width: 162px;
        }
        .style6
        {
            width: 162px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="height: 1016px">
        <div id="AccountSetting" align="center" 
            
            
            style="width: 653px; height: 1000px; margin-bottom: 26px; position: relative; top: 0px; left: 0px;" >
            <fieldset id="Account" style=" height: 519px;">
            <div  style=" width: 250px; font-size: x-large;" 
                    align="center">
                Account Settings</div>
                    <div style="border: medium solid #000000;" class="img-rounded">
                  
                    <table><tr>
                    <td colspan ="2" class="style4" align="center">
                        <asp:image runat="server" Height="203px" Width="242px" 
                            ImageAlign="Middle" ImageUrl="~/Resources/user.png" ID="image1" 
                            CssClass="img-thumbnail">
                        </asp:image>
                    
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Change" onclick="Button1_Click" 
                            CssClass="btn" />
                        <br />
                         </td>   </tr>
            <tr><td class="style5"></td><td class="style2" align="center">
                <asp:fileupload runat="server" ID="fileup" Visible="False" 
                    CssClass="form-control">
                </asp:fileupload>
            </td>
            </tr>
            <tr><td colspan="2">
                
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                        <br />
                
                        <asp:button runat="server" text="Upload" ID="btnUpload" Width="109px" 
                            onclick="btnUpload_Click" Visible="False" CssClass="btn" />
            </td>
            </tr>
             <tr>              
            
               
            <td class="style5"><b>
            <asp:Label ID="lblFirstName" runat="server" Text="First Name "></asp:Label></b></td>
            <td class="style2"><b>
                <asp:TextBox ID="tbFirstName"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b></td>
            </tr>
             <tr>
             <td class="style5">
            
            <b>
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></b></td>
            <td class="style2"><b>
                <asp:TextBox ID="tbLastName"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b></td>
            </tr>  
             <tr>
              <td class="style5">  
            <b>
            <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth "></asp:Label></b></td>
            <td class="style2"><b>
            <div style="float: left; width: 60%">
            <asp:TextBox ID="tbDOB"
                runat="server" Width="192px" style="margin-left: 0px" CssClass="form-control"></asp:TextBox></div>
                <div style="width: 30%; float: left">
                <asp:ImageButton ID="ImageButton2" runat="server" Height="24px" 
                    ImageUrl="~/Resources/Calendar_Green.png" onclick="ImageButton2_Click" 
                    Width="37px" /></div></b></td>
                    <tr><td class="style6"></td><td class="style3"><b>
            <asp:calendar runat="server" ID="Calender1" 
                    onselectionchanged="Calender_SelectionChanged" BackColor="White" 
                    BorderColor="#3366CC" BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt" 
                    ForeColor="#003399" Height="200px" Visible="False" 
                    Width="332px" CellPadding="1" DayNameFormat="Shortest" CssClass="form-control">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                        Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:calendar>
                </b></td></tr>
            </tr> 
             <tr><td class="style5">
                
            <b>
            <asp:Label ID="lblGender" runat="server" Text="Gender "></asp:Label></b></td>
            <td class="style2"><b>
                <asp:dropdownlist ID="dpGender" runat="server" Width="90px" 
                    CssClass="form-control">
                    <asp:ListItem Value="M"></asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                </asp:dropdownlist>
            </b></td>
            </tr> 
             <tr><td class="style5">  
            <b>
            <asp:Label ID="lblCellphone" runat="server" Text="Cellphone"></asp:Label></b></td>
            <td class="style2"><b>
            <asp:TextBox ID="tbCellphone"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td></tr>
            <tr><td class="style5">  
            <b>
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></b></td>
            <td class="style2">  
            <b><asp:TextBox ID="tbEmail"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b></td>
            </tr>
             <tr><td class ="style5">
            <b>
            <asp:Label ID="lblHouseNumber" runat="server" Text="House Number"></asp:Label></b></td>
            <td class ="style2"><b>
            <asp:TextBox ID="tbHouseNumber"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td></tr>
             <tr><td class="style5"> 
            <b>
            <asp:Label ID="lblStreetName" runat="server" Text="Street Name"></asp:Label></b></td>
            <td class="style2"><b>
            <asp:TextBox ID="tbStreetName"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td></tr>
             <tr><td class="style5">
            <b>
            <asp:Label ID="lblCityOrTown" runat="server" Text="City or Town"></asp:Label></b></td>
            <td class="style2"><b>
            <asp:TextBox ID="tbCityOrTown"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td></tr>
             <tr><td class="style5"> 
            <b>
            <asp:Label ID="lblZipCode" runat="server" Text="Zip Code"></asp:Label></b></td>
            <td class="style2"><b>
            <asp:TextBox ID="tbZipCode"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td></tr>
             </table>
           <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" 
                            ForeColor="Red"></asp:Label>
            <hr />
            
             
                        <p id = "bot" align="right" style="border: medium solid #000000; height:44px" >
                           
                
           <asp:Button ID="Update" runat="server" Text="Update" Width="93px" Height="41px" 
                                onclick="Update_Click" CssClass="btn" 
                                 />
         
          
            
            </p> 
             <p>Click <a href="/Account/ChangePassword.aspx">Here</a> to change your password</p>
                        <p>
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [Customer]" 
                                
                                UpdateCommand="UPDATE Customer SET FirstName = @FirstName, LastName = @LastName, DateOfBirth = @DateOfBirth, Gender = @Gender, Cellphone = @Cellphone, HouseNumber = @HouseNumber, StreetName = @StreetName, CityOrTown = @CityOrTown, ZipCode = @ZipCode, EmailAddress = @EmailAddress WHERE (UserName = @UserName)">
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="tbFirstName" Name="FirstName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbLastName" Name="LastName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbDOB" Name="DateOfBirth" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="dpGender" Name="Gender" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="tbCellphone" Name="Cellphone" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbHouseNumber" Name="HouseNumber" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbStreetName" Name="StreetName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbCityOrTown" Name="CityOrTown" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbZipCode" Name="ZipCode" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbEmail" Name="EmailAddress" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="Label1" Name="UserName" 
                                        PropertyName="Text" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </p>
          </div>
               
               
              
               
               
               </fieldset>
               </div>
        
 </div>
 <div class="content3"></div>
</asp:Content>
