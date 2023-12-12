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
    <h2>
        Sign Up
    </h2>
    <p>
        Customers must first visit our nearest branch to get a customer ID before they can register here.
    </p>
    <p>
        Passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
    </p>
    <p align="center">
        <b style="color: #FF0000">
            <asp:Label ID="Mess" runat="server" ></asp:Label>
            
        </b>
    </p>
        <asp:Panel ID="Panel4" runat="server" Height="49px" Width="100px">
       
        <asp:radiobuttonlist runat="server" ID="radioList" AutoPostBack="True" Width="99px" 
                onselectedindexchanged="radioList_SelectedIndexChanged">
            <asp:ListItem>Customer</asp:ListItem>
            <asp:ListItem>Instructor</asp:ListItem>
        </asp:radiobuttonlist>
       
    
        </asp:Panel>
        
    <p>
        &nbsp;<asp:Panel ID="Panel2" runat="server" Height="71px" Visible="False">
        <table>
        <tr>
        <td class="style3"><b>
            <asp:Label  ID = "lblCustID"  Text="Customer ID" runat="server"></asp:Label></b></td>
          <td class="style2"> <b> <asp:TextBox ID="txtCustID"  runat="server" 
                  placeholder="Enter Customer ID" Width="150px"></asp:TextBox></b></td>
            <td class="style2"><b>
                <asp:Button ID="btnSubmitID" runat="server" Text="Search ID" 
                onclick="btnSubmitID_Click" Width="135px" /></b></td></tr></table>
            </asp:Panel>
            &nbsp;<asp:Panel ID="Panel3" runat="server" Height="71px" Visible="False"><table><tr><td class="style3"><b>
            <asp:Label  ID = "lblInsID"  Text="Instructor ID" runat="server"></asp:Label></b></td>
           <td class="style2"> <b><asp:TextBox ID="txtInsID"  runat="server" placeholder="Enter Instructor ID" 
                Width="150px"></asp:TextBox></b></td>
           <td class="style2"> <b><asp:Button ID="btnSubmitInsID" runat="server" Text="Search ID" 
                onclick="btnSubmitInsID_Click"/></b></td></tr></table>
            </asp:Panel>
    </p>
    </div>
    <div class="col-xs-11" align="center" id="RegisterDiv" >
                    <asp:Panel runat = "server" ID="Panel1" Visible="False" Height="600px" 
                        HorizontalAlign="Center" ScrollBars="Auto" Width="600px">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" 
    EnableViewState="false" OnCreatedUser="RegisterUser_CreatedUser" 
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
                            <legend align="top"><b style="text-align: center"> Account Information</b></legend>
                           <table>
                           <tr>
                           <td class="style2">
                                <asp:Label ID="EmailLabel" class="col-xs-11" runat="server" AssociatedControlID="Email">E-mail:</asp:Label><br />
                               </td>
                               <td class="style2">
                                <div class="col-xs-11">                                
                                <b>
                                <asp:TextBox ID="Email" runat="server" class="form-control " CssClass="textEntry" AutoPostBack="True" placeholder="Email"></asp:TextBox>
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
                                <asp:TextBox ID="UserName" class="form-control" runat="server" CssClass="textEntry" placeholder="Username"></asp:TextBox>
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
                                <asp:TextBox ID="Password" class="form-control" runat="server" CssClass="passwordEntry" TextMode="Password" placeholder="Password"></asp:TextBox>
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
                                <b><asp:TextBox ID="ConfirmPassword" class="form-control-static" runat="server" CssClass="passwordEntry" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
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
                                 ValidationGroup="RegisterUserValidationGroup"/>
                       </b> </p>
                       
                    </div>
                    
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </asp:Panel>
    </div>
    </div>
</asp:Content>
