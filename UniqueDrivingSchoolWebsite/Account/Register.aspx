<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Account.Register" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Styles/Contact.css" rel="Stylesheet" />
    <style type="text/css">
        .style2
        {
            height: 47px;
        }
        .style3
        {
            height: 47px;
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div  align="center" style="margin: 0px; ">
    <div  align="center">
    <br />
    <br />
    
    <h2 align="center">
        Sign Up
    </h2>
    
    <p align="center" style="font-weight: bolder">
        Passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
    </p>
    <p align="center">
        <b style="color: #FF0000">
            <asp:Label ID="Mess" runat="server" ></asp:Label>
            
        </b>
    </p>
    <br />
   
        <asp:Panel ID="Panel4" runat="server" Height="38px" Width="350px" 
            HorizontalAlign="Center">
   
        <asp:radiobuttonlist runat="server" ID="radioList" AutoPostBack="True" Width="1235px" 
                onselectedindexchanged="radioList_SelectedIndexChanged" Height="106px" 
                CellPadding="50" CellSpacing="60" RepeatDirection="Horizontal">
            <asp:ListItem>Customer with ID</asp:ListItem>
            <asp:ListItem>Customer no ID</asp:ListItem>
            <asp:ListItem>Instructor</asp:ListItem>
        </asp:radiobuttonlist>   
        </asp:Panel>
        
        <br />
    <div>
        &nbsp;<asp:Panel ID="Panel2" runat="server" Height="71px" Visible="False" 
            HorizontalAlign="Center" Width="500px">
        <table align="center">
        <tr>
        <td class="style3"><b>
            <asp:Label  ID = "lblCustID"  Text="Customer ID" runat="server"></asp:Label></b></td>
          <td class="style2" align="center"> <b> 
              <asp:TextBox ID="txtCustID"  runat="server" 
                  placeholder="Enter Customer ID" Width="194px" CssClass="form-control"></asp:TextBox></b></td>
            <td class="style2"><b>
                &nbsp;&nbsp;
                <asp:Button ID="btnSubmitID" runat="server" Text="Search ID" 
                onclick="btnSubmitID_Click" Width="133px" CssClass="btn" Height="47px" /></b></td></tr></table>
            </asp:Panel>
            &nbsp;<asp:Panel ID="Panel3" runat="server" Height="71px" Visible="False" 
            Width="500px">
            <table align="center"><tr><td class="style3"><b>
            <asp:Label  ID = "lblInsID"  Text="Instructor ID" runat="server"></asp:Label></b></td>
           <td class="style2"> <b>
               <asp:TextBox ID="txtInsID"  runat="server" placeholder="Enter Instructor ID" 
                Width="196px" CssClass="form-control"></asp:TextBox></b></td>
           <td class="style2"> <b>&nbsp; 
               <asp:Button ID="btnSubmitInsID" runat="server" Text="Search ID" 
                onclick="btnSubmitInsID_Click" CssClass="btn" Height="44px"/></b></td></tr></table>
            </asp:Panel>
    </div>
    </div>
    <div  align="center" id="RegisterDiv" 
            style="width: 40%; height: 995px;" >
                    <asp:Panel runat = "server" ID="Panel1" Visible="False" Height="1002px" 
                        HorizontalAlign="Center" ScrollBars="Auto" Width="815px">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" 
    EnableViewState="false" OnCreatedUser="RegisterUser_CreatedUser" BackColor="#CCCCCC" 
                            BorderColor="#CCCCCC" BorderStyle="Solid" CssClass="img-rounded" 
    >
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                    
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/> 

                    <div class="accountInfo" align="center">
                        <fieldset class="register">
                            <table id="tblreg">
                            <tr><td colspan="2" align="center">
                                <p style="text-align: center; font-weight: bold; font-size: x-large; text-decoration: underline;" align="center"> Account Information</p></td></tr>
                           
                           <tr>
                           <td class="style2"><b>
            <asp:Label ID="lblFirstName" class="col-xs-11" runat="server" Text="First Name " Visible="False"></asp:Label></b></td>
            <td class="style2"><div class="col-xs-11"> <b>
                <asp:TextBox ID="tbFirstName"
                runat="server" Width="231px" placeholder="First Name" Visible="False" 
                    CssClass="form-control"></asp:TextBox>
            </b></div></td>
            </tr>
             <tr>
             <td class="style2">
            
            <b>
            <asp:Label ID="lblLastName" class="col-xs-11" runat="server" Text="Last Name" 
                     Visible="False"></asp:Label></b></td>
            <td class="style2">
            <div class="col-xs-11"> <b>
                <asp:TextBox ID="tbLastName"
                runat="server" Width="231px" placeholder="Last Name" Visible="False" 
                    CssClass="form-control"></asp:TextBox>
            </b></div></td>
            </tr>  
             <tr>
              <td class="style2">  
            <b>
            <asp:Label ID="lblDOB" class="col-xs-11" runat="server" Text="Date Of Birth " 
                      Visible="False"></asp:Label></b></td>
            <td class="style2">
            <div class="col-xs-11"> <b >
                <div style="width: 67%; float: left;">
            <asp:TextBox ID="tbDOB"
                runat="server" Width="172px" placeholder="mm/dd/yyyy" Visible="False" 
                        CssClass="form-control" ></asp:TextBox></div>
                <div align="right" style="float: right; width:20%;">
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="24px" 
                    ImageUrl="~/Resources/Calendar_Green.png"  
                    Width="37px" onclick="ImageButton2_Click" Visible="False" /></div></b></div></td></tr>
                    <tr><td></td><td class="style2"><b>
            <asp:calendar runat="server" ID="Calender1" 
                    onselectionchanged="Calender_SelectionChanged" BackColor="White" 
                    BorderColor="#3366CC" BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt" 
                    ForeColor="#003399" Height="200px" Visible="False" 
                    Width="332px" CellPadding="1" DayNameFormat="Shortest" 
                            onvisiblemonthchanged="Calender1_VisibleMonthChanged">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                        Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:calendar>
                </b></td></tr>
                <tr><td class="style2">
                
            <b>
            <asp:Label ID="lblGender" runat="server" Text="Gender " class="col-xs-11" 
                        Visible="False"></asp:Label></b></td>
            <td class="style2"><div class="col-xs-11"><b>
                <asp:dropdownlist ID="dpGender" 
                    runat="server" Width="102px" Visible="False" CssClass="form-control">
                    <asp:ListItem Value="M"></asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                </asp:dropdownlist>
            </b></div></td>
            </tr>
                           <tr>
                           <td class="style2">
                                <asp:Label ID="EmailLabel" class="col-xs-11" runat="server" AssociatedControlID="Email">E-mail:</asp:Label><br />
                               </td>
                               <td class="style2">
                                <div class="col-xs-11">                                
                                <b>
                                <asp:TextBox ID="Email" runat="server" class="form-control " Width="231px" 
                                        CssClass="textEntry form-control" placeholder="Email"></asp:TextBox>
                               </b> </div>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </td>
                            </tr>
                            <tr>
                            <td class="style2">
                                <asp:Label ID="UserNameLabel" class="col-xs-11" runat="server" AssociatedControlID="UserName">User Name:</asp:Label><br />
                               </td>
                                <td class="style2">
                                <div class="col-xs-11">                                
                                <b>
                                <asp:TextBox ID="UserName" class="form-control" runat="server" 
                                        CssClass="textEntry form-control" placeholder="Username" Width="231px"></asp:TextBox>
                                </b></div>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                     CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                        
                            
                            </td></tr>
                            <tr>
                            <td class="style2">
                            
                                <asp:Label ID="PasswordLabel" class="col-xs-11" runat="server" AssociatedControlID="Password">Password:</asp:Label><br />
                                </td><td>
                                <div class="col-xs-11">
                                <b>
                                <asp:TextBox ID="Password" class="form-control" runat="server" Width="231px" 
                                        CssClass="passwordEntry form-control" TextMode="Password" 
                                        placeholder="Password"></asp:TextBox>
                                </b></div>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                     CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                           </td>
                           </tr>
                           <tr>
                           <td class="style2">
                                <asp:Label ID="ConfirmPasswordLabel" class="col-xs-11" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label><br />
                                </td>
                                <td class="style2"><div class="col-xs-11">
                                <b><asp:TextBox ID="ConfirmPassword" Width="231px" class="form-control-static" 
                                        runat="server" CssClass="passwordEntry form-control" TextMode="Password" 
                                        placeholder="Confirm Password"></asp:TextBox>
                               </b> </div>
                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                     ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                                     ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                            </td></tr> 
                            </table>
                        </fieldset>
                        <p class="submitButton">
                        <b>
                            <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Sign Up" 
                                 ValidationGroup="RegisterUserValidationGroup" CssClass="btn"/>
                       </b> 
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                InsertCommand="INSERT INTO Customer(CustomerID, FirstName, LastName, DateOfBirth, Gender, EmailAddress, UserName, PassWord) VALUES (@CustomerID, @FirstName, @LastName, CAST(@DateOfBirth AS DATE), @Gender, @EmailAddress, @UserName, @PassWord)" 
                                SelectCommand="SELECT * FROM [Customer]">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="CustomerID" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbFirstName" Name="FirstName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbLastName" Name="LastName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tbDOB" Name="DateOfBirth" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="dpGender" Name="Gender" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="Email" Name="EmailAddress" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="UserName" Name="UserName" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="Password" Name="PassWord" 
                                        PropertyName="Text" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </p>
                       
                    </div>
                    
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </asp:Panel>
    </div>
    
    <br />
    <div class="content3" align="center">
    </div>
    </div>
    
</asp:Content>
