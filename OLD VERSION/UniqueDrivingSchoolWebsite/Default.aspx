<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<script runat="server">
    
    protected void btnEmail_Click(object sender, EventArgs e)
    {
        try
        {
            System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage();
            mm.From = new System.Net.Mail.MailAddress("Earlshawboss@gmail.com");
            mm.Subject = "NewsLetter Subcription";
            mm.To.Add(new System.Net.Mail.MailAddress("Earlshawboss@gmail.com"));
            mm.Body = "Hi I would like to subscribe to your newsletter, account is " + tbEmailHome.Text;
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            smtp.EnableSsl = true;
            smtp.Send(mm);
            Label1.Text = "Successful! We shall send you our latest offers";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.ToString();
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="Server">
    <div>
        <div class="slide">
            <div class="row">
                <div class="container-fluid">
                    <div class="row">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner" align="center">
                                <div class="item active">
                                    <img src="Resources/slides/p1.jpg" width="100%" alt="First slide" />
                                </div>
                                <div class="item">
                                    <img src="Resources/slides/p2.jpg" width="100%" alt="Second slide" />
                                </div>
                                <div class="item">
                                    <img src="Resources/slides/p3.jpg" width="100%" alt="Third slide" />
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                                    href="#carousel-example-generic" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                                    </span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="push">
            </div>
            <br />
             <h1 align="center">Affordable Top ranked driving school</h1>
             <p align="center">some information about us below </p>
    </div>
    


    <div class = "container"  align="center">
          <div class="row2" align="center" >
              <div class="col-md-4">
          <div class="card mb-4 shadow-sm" style="text-align: center">
              <a href="Packages.aspx">
                   <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/motor-driving-school-250x250.jpg" 
                       Height="118px" /></a>
                  <p align="center" style="margin: 30px"><b>We teach students all the rules of the road and how to drive confidently. We 
                      offer full courses and per lesson courses. These courses allow students to have 
                      flexible lesson times. The packages prices are reasonable and competitive, so 
                      come take a look at some of our courses.</b></p>
                   <p>&nbsp;</p><a href="Packages.aspx">
                   <p><b>Learn More </b></p></a>
              </div>
              </div>
               <div class="col-md-4">
          <div class="card mb-4 shadow-sm" style="text-align: center">
               <a href="Account/Register.aspx">
                     <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/Register_Now_Button.jpg" 
                         Height="119px" Width="163px" /></a>
                         
                     <p align="center" style="margin: 30px"><b>Flexible schedule. Unlike many other schools out there we do offer theory classes on the weekends 
                        and driving practice all day long to fit the demanding schedule of a student or a working person. 
                         visit our nearest branch and get yourself a customer ID then register online to 
                         set your own schedule times for your books.</b></p>
                   <p>&nbsp;</p><p><a  href="Account/Register.aspx" >
                     <b>Learn More</b>
              </a></p>
              </div>
              </div>
               <div class="col-md-4">
          <div class="card mb-4 shadow-sm" style="text-align: center">
               <a href="About.aspx">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Resources/about-us-banner-design-png.png" 
                        Height="109px" Width="243px" /></a>
                     
                    <p align="center" style="margin: 30px"><b>We offer code 08 and 10 driving lessons.Personal approach. Our teaching methods are truly unique to every student whether a complete novice or 
                  someone who just needs to brush up his skills. We know exactly what you need to succeed as a driver. 
                        A student has a one instructor that instructs, so students habituate to one 
                        style of instructing. We are with stuffed with real people for real results.</b></p>
                       <p> <a  href="About.aspx" >
                   <b>Learn More</b>
              </a></p> 
              </div>
              </div>
              </div> 
          </div>
              
    
   
          
    <h1 align="center">
                Our Services</h1>
  <div class="album py-5 bg-light">
    <div class="container" >

      <div class="row2">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="Resources/packages/1.jpeg" alt="" class="img_inner" width="100%" height="300px" />
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="Resources/packages/2.jpeg" alt="" class="img_inner" width="100%" height="300px" />
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="Resources/packages/3.jpeg" alt="" class="img_inner" width="100%" height="300px" />
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
             
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="Resources/packages/4.jpeg" alt="" class="img_inner" width="100%" height="300px" />
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="Resources/packages/5.jpeg" alt="" class="img_inner" width="100%" height="300px" />
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="Resources/packages/5.jpeg" alt="" class="img_inner" width="100%" height="300px" />
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<br />
<div class="container" align="center" style="background-color: #4D67A0">
    <form action="#" id="newsletter">
               <h1>signup for the daily learns classes  or newsLetter</h1>
               <br/>
                    <asp:label runat="server" ID="Label1"></asp:label>
                    <br />
                 <asp:textbox   runat="server"  ID="tbEmailHome" Height="27px" Width="272px"></asp:textbox>
               <asp:Button runat="server" text="Subscribe" ID="btnEmail" Height="32px" 
                   onclick="btnEmail_Click" />
</form>
               
          </div>
</div>
</asp:content>
