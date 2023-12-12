<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/Contact.css" />
    <style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

    <h2 align="center">Contact Us</h2>
    <hr />

  
    
    <div class="col" style="float:left; width:40%">
      <form action="#">
        <label for="fname">Your Name</label>
        <input type="text" id="fname" name="firstname" placeholder="Your name.." 
            runat = "server" style="width: 100%" />
        <label for="lname">Your Email</label>
        <input type="text" runat = "server" id="EmailAddress" name="lastname" 
            placeholder="Your email address.." style="width: 100%" />
        <br />
        <label for="fname">Subject</label><input type="text" id="Text1" 
            name="firstname" placeholder="Subject" runat = "server" style="width: 100%"/><br />
        <label for="subject">Message</label>
        <textarea  rows="0" id="subject" name="subject" runat = "server" 
            placeholder="Write something.." style="height:170px; width: 100%;" cols="0"></textarea>&nbsp;
      </form>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Submit" />
        <br />
        
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    <div class="col" style="float:left; width:40%; margin-left: 20px;">
      <div class="mapouter">
      <div class="gmap_canvas">
      <iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=140%20langalibalele%20street%20engen&t=&z=19&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
      </iframe><a href="https://www.embedgooglemap.org">wordpress embed a google map on contact page</a>
    </div>
  </div>
</div>
</div>

        
</asp:Content>
