﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="PackageView.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.PackageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top">
           <img src="Resources/212751248e6f6591846481281fe045dc.jpg" alt="" style="width: 100%; height: 160px" />
       
       </div>
    <div align="center"  style=" width: 100%">
    <div class="container" style="padding-top:50px; ">
        <div align="center" style="width: 100%">
            <div  style="float: left; width: 35%; height: 357px;">
            <br />
            <br />
                <div style="max-width:100%" class="thumbnail">

                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        
                   
                    <div class="carousel-inner" role="listbox">
                        
                            <div class="item active">
                            
                                 <asp:Image ID="im" ImageUrl="Resources/noImage.png"  Width="100%" Height="500px"
                                     runat="server" ImageAlign="Middle" CssClass="img-responsive"></asp:Image>
                                <div class="carousel-caption"></div>
                            </div>
                        
                    </div>
                    </div>
                    </div>
                </div>
                <br />
                <br />
                <div style="float: left; width: 50%; margin-left: 70px;">
                 <asp:repeater ID="rptrImages2" runat="server">
                            <ItemTemplate>
             <div  style="float: left; width: 100%" align="center">
           
                <div>
                    <h1><%#Eval("PackageName") %></h1>
                    <p style="font-size: xx-large; font-weight: bolder"><%#Eval("PackageType") %></p>
                    <p style="font-size: x-large">R <%#Eval("PackageCost") %></p>
                    <hr />
                    <p style="font-size: x-large">Description</p>
                    <p style="font-size: x-large"><%#Eval("PackageDescription")%></p>
                    <hr />

                </div>
                <asp:Label runat="server" id="llb" Text=""></asp:Label>
                <div>
                    <asp:button runat="server" text="Add To Cart" ID="btnAddToCart" 
                        CssClass="btn" onclick="btnAddToCart_Click" />
                </div>
                <div>
                    
                </div>
                <hr />
                
                
                <p><b>Cash Payments Only</b></p>
                <p><b>No Refunds</b></p>
             </div> 
              <br />
               <br />   
             </ItemTemplate>
                        </asp:repeater>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </div>
                
                
                
                
                
                
                
                <br />
            </div>   
            <br />
                 
        </div>
        <br />
        
    </div>
    <p align="center">
        <asp:Image ID="Image5" runat="server" Height="10px" ImageAlign="Middle" 
            Visible="False" Width="10px" />
        </p>
<br />
<div class="content3"></div>
</asp:Content>
