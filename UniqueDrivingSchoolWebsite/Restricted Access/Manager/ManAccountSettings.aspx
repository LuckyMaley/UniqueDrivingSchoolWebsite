<%@ Page Title="" Language="C#" MasterPageFile="Site3.Master" AutoEventWireup="true" CodeBehind="ManAccountSettings.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Manager.ManAccountSettings"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            height: 45px;
        }
    .style2
    {
        width: 271px;
    }
    .style3
    {
        height: 45px;
        width: 271px;
    }
        .style4
        {
            width: 152px;
        }
        .style5
        {
            height: 45px;
            width: 139px;
        }
        .style6
        {
            width: 139px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="height: 711px">
        <div id="AccountSetting" align="center" 
            style="width: 637px; height: 594px; margin-bottom: 26px;" >
            <fieldset id="Account" style=" height: 519px;">
            <div  style=" width: 250px; font-size: x-large;" 
                    align="center">
                Account Settings</div>
                    <div style="border: medium solid #000000;" class="img-rounded">
                    <table><tr>
                    <td colspan ="2" class="style4" align="center">
                    <div align="center" style="width: 454px">
                        <asp:image runat="server" Height="203px" Width="242px" 
                            ImageAlign="Middle" ImageUrl="~/Resources/user.png" ID="imagehere" 
                            CssClass="img-thumbnail">
                        </asp:image>
                    
                        <br />
                        <asp:Button ID="Buttonbtn" runat="server" Text="Change" 
                            onclick="Buttonbtn_Click" CssClass="btn" />
                        </div><br />
                         </td>   </tr>
            <tr><td class="style6"></td><td class="style2" align="center">
                <asp:fileupload runat="server" ID="fileup" Visible="False" 
                    CssClass="form-control">
                </asp:fileupload>
            </td>
            </tr>
            <tr><td colspan="2" align="center">
                
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                        <br />
                
                        <asp:button runat="server" text="Upload" ID="btnUpload" Width="102px" 
                            onclick="btnUpload_Click" Visible="False" CssClass="btn" />
            </td>
            </tr>
            <tr>
            <td class="style5">                
            <b>
            <asp:Label ID="lblFirstName" runat="server" Text="First Name "></asp:Label></b></td>
            <td class="style3">
            <b>
            <asp:TextBox ID="tbFirstName"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b></td>
            </tr>
            <tr>
            <td class="style5">
            <b>
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></b></td>
            <td class="style3"><b>
            <asp:TextBox ID="tbLastName"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td>
            </tr>
            <tr><td class="style5">
            <b>
            <asp:Label ID="lblHouseNumber" runat="server" Text="House Number"></asp:Label></b></td>
            <td class="style3"><b>
            <asp:TextBox ID="tbHouseNumber"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td>
            </tr>
            <tr><td class="style5">
            <b>
            <asp:Label ID="lblStreetName" runat="server" Text="Street Name"></asp:Label></b></td>
            <td class="style3"><b>
            <asp:TextBox ID="tbStreetName"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b></td>
            </tr>
            <tr><td class="style5">
            <b>
            <asp:Label ID="lblCityOrTown" runat="server" Text="City or Town"></asp:Label></b></td>
            <td class="style3"><b>
            <asp:TextBox ID="tbCityOrTown"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b></td>
            </tr>
            <tr><td class="style5">
            <b>
            <asp:Label ID="lblZipCode" runat="server" Text="Zip Code"></asp:Label></b></td>
            <td class="style2"><b>
            <asp:TextBox ID="tbZipCode"
                runat="server" Width="231px" CssClass="form-control"></asp:TextBox>
            </b>
            </td></tr></table>
           
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" 
                            ForeColor="Red"></asp:Label>
           
            <hr />
            
             
                        <p id = "bot" align="right" style="border: medium solid #000000; height:53px" >
                           
                
           <asp:Button ID="Button1" runat="server" Text="Update" Width="93px" Height="43px" 
                                onclick="Button1_Click" CssClass="form-control pull-right" />
         
          
            
            </p> 
             <p>Click <a href="../../Account/ChangePassword.aspx">Here</a> to change your password</p>
             <p>
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [Manager]" 
                                
                                
                                UpdateCommand="UPDATE Manager SET FirstName = @FirstName, LastName = @LastName, HouseNumber = @HouseNumber, StreetName = @StreetName, CityOrTown = @CityOrTown, ZipCode = @ZipCode WHERE (UserName = @UserName)">
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
              
        
 </div> <div class = "content3"></div>
</asp:Content>
