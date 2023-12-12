<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class= "container">
    <div align="center">
        
        <div style="margin-left: 40px" >
            <br />
            
                <div class="container" style="padding-top:50px; ">
        <div align="center" style="width: 100%">
            <div  style="float: left; width: 35%; height: 357px;">
            <br />
            <br />
                <div style="max-width:100%" class="thumbnail">

                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        
                   
                    <div class="carousel-inner" role="listbox">
                        
                            <div class="item active">
                            
                                 <asp:Image ID="imsdf1" ImageUrl="Resources/noImage.png"  Width="100%" Height="500px"
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
                 <asp:repeater ID="rprtCart1" runat="server">
                            <ItemTemplate>
             <div  style="float: left; width: 100%" align="center">
           
                <div>
                    <h1 ><%#Eval("PackageName") %></h1>
                    <p style="font-size: xx-large"><%#Eval("PackageType") %></p>
                    <p style="font-size: x-large">R <%#Eval("PackageCost") %></p>
                    <hr />
                    <p></p>
                    
                  

                </div>
                <asp:Label runat="server" id="llb" Text=""></asp:Label>
                
                <div>
                   <p><b>We Accept Cash Payments Only</b></p>
                   <p><b>No Refunds</b></p>
                   <p>Click below to proceed</p>
                </div>
                <hr />
                
                
                
             </div> 
              <br />
               <br />   
             </ItemTemplate>
                        </asp:repeater><div align="center">
            <asp:label runat="server" ID="sa"></asp:label>
                    <br />
                    <asp:button runat="server" ID="btnProceed" 
                        CssClass="btn" Text="Proceed" onclick="btnProceed_Click" />
            <asp:sqldatasource runat="server" ID="sq" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                InsertCommand="INSERT INTO Payment(PaymentID, CustomerID, Date, AmountOwing) VALUES (@PaymentID, @CustomerID, @Date, @AmountOwing)" 
                SelectCommand="SELECT * FROM [Payment]">
                <InsertParameters>
                    <asp:Parameter Name="PaymentID" />
                    <asp:Parameter Name="CustomerID" />
                    <asp:Parameter Name="Date" />
                    <asp:Parameter Name="AmountOwing" />
                </InsertParameters>
            </asp:sqldatasource>
                </div>
            <asp:label runat="server" text="Label" ID="idf" Visible="False"></asp:label>
            
        </div>
                </div>
                
                
                
                <br />
            </div>   
            <br />
                  
        </div>
        
            
    
    </div>
        


</div>
<div class="content3"></div>
    
</asp:Content>
