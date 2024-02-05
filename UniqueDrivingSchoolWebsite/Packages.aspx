<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Packages1" %>
 
 <script runat="server" type="text/C#">
     int c;
     public void getImage(object obj)
     {
         UniqueDrivingSchoolWebsite.SqlDBConnection sqlcon = new UniqueDrivingSchoolWebsite.SqlDBConnection();
         System.Data.DataTable dataT = sqlcon.QueryPackagesTable();
         if (dataT.Rows[0]["PackagePicture"] != DBNull.Value)
         {
             byte[] imageData = (byte[])dataT.Rows[0]["Managerpic"];
             string img = Convert.ToBase64String(imageData, 0, imageData.Length);
             Image imagPac = (Image)rptrPackages.FindControl("imgPac");
             imagPac.ImageUrl = "data:image/png;base64," + img;
              
         }
         Label lbl2 = (Label)rptrPackages.TemplateControl.FindControl("Label2");
     }
 </script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/packages.css" />
    <link rel="Stylesheet" type="text/css" href="Styles/main.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="top">
           <img src="Resources/212751248e6f6591846481281fe045dc.jpg" alt="" style="width: 100%; height: 160px" />
            <h1 align="center">Packages</h1>
       </div>
<div align="center" class="container">
    <div  class="row2" style="padding-top:50px; " align="center">
                    
                    <asp:repeater ID="rptrPackages" runat="server" 
                        onitemdatabound="rptrPackages_ItemDataBound">
                    <ItemTemplate> 
        <div class=" col-md-3 col-md-4" align="center">
            
            <a style="text-decoration:none;" href="PackageView.aspx?PackageID=<%#Eval("PackageID") %>">
            <div class="thumbnail">
                <div align="center" style="width: 100%; height: 30%">
                
                    <asp:Image ID="imgs" ImageUrl="Resources/noImage.png"  Width="100%" Height="300px" ImageAlign="Middle" runat="server"></asp:Image>
                </div>
                <div class= "caption">
                    <h1><%#Eval("PackageType") %></h1>
                    <h2 style=" font-weight: bold; font-size: xx-large;" align="center">Code <%#Eval("PackageCode") %></h2>
                    <h2 style=" font-weight: normal; font-size:x-large;">R <%#Eval("PackageCost")%></h2>
                    <asp:Label ID="Label1" runat="server" Visible="False" Text='<%# Eval("PackageID") %>'></asp:Label>
                </div>
            </div></a>
        </div></ItemTemplate>
        </asp:repeater>
    </div>
</div> 

</asp:Content>
