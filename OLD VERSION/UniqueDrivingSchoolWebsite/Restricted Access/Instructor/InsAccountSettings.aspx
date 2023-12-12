<%@ Page Title="" Language="C#" MasterPageFile="Site2.Master" AutoEventWireup="true" CodeBehind="InsAccountSettings.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Instructor.InsAccountSettings"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            height: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
<p></p>
<p></p>
    <div align="center" style="height: 711px">
        <div id="AccountSetting" align="center" 
            style="width: 637px; height: 594px; margin-bottom: 26px;" >
            <fieldset id="Account" style=" height: 519px;">
            <legend  style="border: medium solid #000000; width: 250px; font-size: x-large;" 
                    align="top">
                Account Settings</legend>
                    <div style="border: medium solid #000000;">
                    <table><tr><td colspan = "2"><b>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="203px" Width="242px" 
                            ImageAlign="Middle" ImageUrl="~/Resources/user.png" />
                            </b></td></tr>
            <tr><td class="style1">
                
            <b>
            <asp:Label ID="lblFirstName" runat="server" Text="First Name "></asp:Label></b></td>
            <td class="style1">
            <b><asp:TextBox ID="tbFirstName"
                runat="server" Width="231px"></asp:TextBox>
            </b>
            </td></tr>
            <tr><td class="style1">
            <b>
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></b></td>
            <td class="style1"><b>
            <asp:TextBox ID="tbLastName"
                runat="server" Width="231px"></asp:TextBox>
            </b></td>
            </tr>
            <tr>
            <td class="style1">
            <b>
            <asp:Label ID="lblHouseNumber" runat="server" Text="House Number"></asp:Label></b></td>
               <td class="style1"><b>
            <asp:TextBox ID="tbHouseNumber"
                runat="server" Width="231px"></asp:TextBox>
            </b></td>
            </tr>
            <tr>
            <td class="style1">
            <b>
            <asp:Label ID="lblStreetName" runat="server" Text="Street Name"></asp:Label></b></td>
            <td class="style1">
            <b>
            <asp:TextBox ID="tbStreetName"
                runat="server" Width="231px"></asp:TextBox>
            </b></td>
            </tr>
            <tr> <td class="style1">
            <b>
            <asp:Label ID="lblCityOrTown" runat="server" Text="City or Town"></asp:Label></b></td>
            <td class="style1">
            <b><asp:TextBox ID="tbCityOrTown"
                runat="server" Width="231px"></asp:TextBox>
            </b></td>
            </tr>
            <tr><td class="style1">
            <b>
            <asp:Label ID="lblZipCode" runat="server" Text="Zip Code"></asp:Label></b></td>
            <td class="style1"><b>
            <asp:TextBox ID="tbZipCode"
                runat="server" Width="231px"></asp:TextBox>
            
            </b></td></tr>
            </table>
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" 
                            ForeColor="Red"></asp:Label>
            <hr />
            
             
                        <p id = "bot" align="right" 
                            style="border: medium solid #000000; height:40px; width: 628px;" >
                           
                
           <asp:Button ID="Button1" runat="server" Text="Update" Width="93px" Height="35px" 
                                onclick="Button1_Click" />
         
          
            
            </p> 
             <p>Click <a href="../../Account/ChangePassword.aspx">Here</a> to change your password</p>
                        <p>
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [Instructor]" 
                                
                                UpdateCommand="UPDATE Instructor SET FirstName = @FirstName, LastName = @LastName, HouseNumber = @HouseNumber, StreetName = @StreetName, CityOrTown = @CityOrTown, ZipCode = @ZipCode WHERE (UserName = @UserName)">
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="tbFirstName" Name="FirstName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbLastName" Name="LastName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbHouseNumber" Name="HouseNumber" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbStreetName" Name="StreetName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbCityOrTown" Name="CityOrTown" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbZipCode" Name="ZipCode" 
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
</asp:Content>
