<%@ Page Title="" Language="C#" MasterPageFile="~/Restricted Access/Customer/Site1.Master" AutoEventWireup="true" CodeBehind="NonPayment.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.NonPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
     <div align="center">
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <asp:Label ID="Label1" runat="server" Font-Size="X-Large" 
             Text="No Payment Made Yet, Please visit to our local branch to make a full payment."></asp:Label>
             <br />
             <asp:Label ID="Label2" runat="server" Font-Size="X-Large" 
             Text="After the payment is made, you will enjoy the full benefits of the website."></asp:Label>
         <br />
         <asp:Button ID="Button1" runat="server" CssClass="btn" onclick="Button1_Click" 
             Text="Print Receipt" />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <div class="content3"></div>
     </div>
</div>
</asp:Content>
