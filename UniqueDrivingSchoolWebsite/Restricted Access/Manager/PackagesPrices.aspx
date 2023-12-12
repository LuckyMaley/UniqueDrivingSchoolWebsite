<%@ Page Title="" Language="C#" MasterPageFile="~/Restricted Access/Manager/Site3.Master" AutoEventWireup="true" CodeBehind="PackagesPrices.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Manager.PackagePrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            height: 60px;
        }
    .style3
    {
        height: 43px;
    }
        .style4
        {
            height: 60px;
            width: 167px;
        }
    .style5
    {
        height: 55px;
    }
    </style>
        <script type="text/javascript">
            function confirmation() {
                if (confirm("are you sure you want to Delete this package ?")) {
                    return true;
                }
                else {
                    return false;
                }
            }
   </script>
   <script type="text/javascript">
       function confirmationOne() {
           if (confirm("are you sure you want to Save this package ?")) {
               return true;
           }
           else {
               return false;
           }
       }
   </script>
      <script type="text/javascript">
          function confirmationTwo() {
              if (confirm("are you sure you want to Update this package ?")) {
                  return true;
              }
              else {
                  return false;
              }
          }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2 align="center">Packages</h2>
            <hr />
            
            <div class="form-group" align="center">
            <table >
            <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="ID" ID="lblID" ></asp:label>
                </b></td>
                <td class="style2">
                  
                    <asp:dropdownlist runat="server" CssClass="form-control" Width="185px" 
                        ID="ddlID" AutoPostBack="True" 
                        onselectedindexchanged="ddlID_SelectedIndexChanged">
                    </asp:dropdownlist>
                
            </td>
            </tr>
            <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="Name" ID="lblName" ></asp:label>
                </b></td>
                <td class="style2">
                  
                    <asp:TextBox runat="server" CssClass="form-control" Width="247px" 
                        ID="packageName"></asp:TextBox>
                
            </td>
        </tr>
            <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="Type" ID="lblType" ></asp:label>
                </b></td>
                <td class="style2">
                  
                    <asp:dropdownlist runat="server" CssClass="form-control" Width="185px" 
                        ID="ddlType">
                        <asp:ListItem>Full Course</asp:ListItem>
                        <asp:ListItem>Per Lesson</asp:ListItem>
                    </asp:dropdownlist>
                
            </td>
        </tr>
        <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="Lessons" ID="lblCout" ></asp:label>
                </b></td>
                <td class="style2">
                  
                    <asp:dropdownlist runat="server" CssClass="form-control" Width="187px" 
                        ID="ddlCount">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                    </asp:dropdownlist>
                
            </td>
        </tr>
            <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="Code" ID="lblCode" ></asp:label>
                </b></td>
                <td class="style2">
                  
                    <asp:dropdownlist runat="server" CssClass="form-control" Width="187px" 
                        ID="ddlcode">
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:dropdownlist>
                
            </td>
        </tr>

        <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="Description" ID="lblDescription" ></asp:label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </b></td>
                <td class="style2">
                  
                    <asp:textbox runat="server" CssClass="form-control" Width="463px" 
                        ID="tbDescription" Height="216px" TextMode="MultiLine"></asp:textbox>
                
            </td>
        </tr>
        
        <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="Cost" ID="lblCost" ></asp:label>
                </b></td>
                <td class="style2">
                  
                    <asp:TextBox runat="server" CssClass="form-control" Width="187px" 
                        ID="tbCost">
                        
                    </asp:TextBox>
                
            </td>
        </tr>

        <tr>
            <td class="style4"><b>
                <asp:label runat="server" text="Picture" ID="lblPic" ></asp:label>
                </b></td>
                <td class="style2">
                    
                    <asp:Image  ID="Image1" runat="server" Height="199px" Width="207px" 
                        CssClass="img-rounded" ImageUrl="~/Resources/noImage.png" />
                        <asp:Image  ID="Imagedup" runat="server" Height="199px" Width="207px" 
                        ImageUrl="~/Resources/noImage.png" 
                        Visible="False" />
                       
                        <br />
                                            
                     
                    <b><asp:label runat="server" text="Change Picture"></asp:label></b>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" 
                        Width="291px" />
                
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" class="style3">
                
                
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    InsertCommand="INSERT INTO Packages(ManagerID, PackageName, PackageType, PackageCount, PackageCode, PackageDescription, PackageCost) VALUES (@ManagerID, @PackageName, @PackageType, @PackageCount, @PackageCode, @PackageDescription, @PackageCost)" 
                    SelectCommand="SELECT * FROM [Packages]" 
                    DeleteCommand="DELETE FROM Packages WHERE (PackageID = @PackageID)" UpdateCommand="UPDATE Packages SET PackageName = @1, PackageType = @2, PackageCount = @3, PackageCode = @4, PackageDescription = @5, PackageCost = @6
WHERE PackageID=@PackageID">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="ddlID" Name="PackageID" 
                            PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter DefaultValue="1" Name="ManagerID" />
                        <asp:ControlParameter ControlID="packageName" DefaultValue="" 
                            Name="PackageName" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlType" Name="PackageType" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlCount" Name="PackageCount" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlcode" Name="PackageCode" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbDescription" Name="PackageDescription" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbCost" Name="PackageCost" 
                            PropertyName="Text" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="packageName" Name="1" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlType" Name="2" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlCount" Name="3" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlcode" Name="4" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbDescription" Name="5" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbCost" Name="6" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlID" Name="PackageID" 
                            PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" class="style5">
                
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="90px" CssClass="btn" 
                    onclick="btnAdd_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Save" runat="server" Text="Save" Visible="False" Width="90px" 
                    CssClass="btn" onclick="Save_Click" 
                    onclientclick="return confirmationOne();" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Update" Width="90px" 
                    CssClass="btn" onclick="Button2_Click" 
                    onclientclick="return confirmationTwo();" />
                
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" CssClass="btn" onclick="Button3_Click" 
                    Text="Delete" onclientclick="return confirmation();" />
                
            </td>
        </tr>
        </table>
    
    
    
    </div>
    </div>
 </div>
 <div class = "content3></div>
  <div class = "content3></div>
 <div class = "content3></div>
   <div class = "content3></div>
</asp:Content>
