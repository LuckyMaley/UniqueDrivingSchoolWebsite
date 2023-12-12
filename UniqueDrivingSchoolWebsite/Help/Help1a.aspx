<%@ Page Language="C#" MasterPageFile="Help.Master" AutoEventWireup="true" CodeBehind="Help1a.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Help.Help1a" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Help.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top">
           <img src="Resources/212751248e6f6591846481281fe045dc.jpg" style="width: 100%; height: 160px" />
       
       </div>
<div class="container">
   <div style="width: 100%; height: auto;">
   <div style="float: left; width: 35%;">
    <asp:menu runat="server" BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" 
        Height="67px" Width="145px"  
           ID="menu1">
        <Items>
            <asp:MenuItem Text="Login" Value="Login" NavigateUrl="~/Helpa.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Sign-Up" Value="Sign-Up" NavigateUrl="~/Help/Help0a.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Prices" Value="Prices" NavigateUrl="~/Help/Help1a.aspx">
                <asp:MenuItem Text="Price-Update" Value="Price-Update" 
                    NavigateUrl="~/Help/Help1.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Add-Price" Value="Add-Price" 
                    NavigateUrl="~/Help/Help2.aspx"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="Package" Value="Package">
                <asp:MenuItem Text="Add-Package" Value="Add-Package" 
                    NavigateUrl="~/Help/Help3.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Update-Package" Value="Update-Package"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="Cart" Value="Cart">
                <asp:MenuItem Text="AddToCart" Value="AddToCart" 
                    NavigateUrl="~/Help/Help4.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Access-Cart" Value="Access-Cart" 
                    NavigateUrl="~/Help/Help5.aspx"></asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:menu>
     </div>
     <div style="float: left; width: 60%">
         <asp:Image ID="Image5" runat="server" Height="549px" 
             ImageUrl="~/Resources/Help/PriceUdate.png" Width="647px" />
     </div>
    </div>
    </div></div>
</div>
</asp:Content>


