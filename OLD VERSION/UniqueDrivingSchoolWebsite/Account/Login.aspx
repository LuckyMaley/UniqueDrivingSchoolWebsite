<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class = "ccontainer" align="center" style="margin: 200px">
   <p></p>
   <p></p>
    
    
        <asp:panel runat="server" HorizontalAlign="Center" ScrollBars="Auto" 
            Width="370px" ID="PanelLogin">
        <h2 align="center">
        Log In
    </h2>
    <p align="center">
        Please enter your username and password.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Sign up </asp:HyperLink> if you don't have an account.
    </p>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" 
                RenderOuterTable="false" >
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText1" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo" align="center">
                <fieldset class="login">
                   <legend align="top"> <b>Account Information</b></legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired1" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                        ValidationGroup="LoginUserValidationGroup" onclick="LoginButton_Click"/>
                </p>
                <p>
                       Forgot your password?<asp:LinkButton runat="server" ID="btnLink" 
                           onclick="btnLink_Click" >Click Here</asp:LinkButton> 
                </p>
                
            </div>
        </LayoutTemplate>
    </asp:Login>
    
    </asp:panel>
    <div align="center">
                <asp:Panel id="PanelForgot" runat="server" Visible="False" Width="370px">
    <asp:label runat="server" ID="Label1"></asp:label>
    <asp:PasswordRecovery ID="PasswordRecovery2" runat="server" 
        onsendingmail="PasswordRecovery2_SendingMail1" Height="178px" 
        Width="292px">
        <SuccessTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:178px;width:292px;">
                            <tr>
                                <td>
                                    Your password has been sent to you.<asp:Button ID="Button1" runat="server" 
                                        onclick="Button1_Click" Text="Click Here" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </SuccessTemplate>
        <UserNameTemplate>
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:178px;width:286px;">
                            <tr>
                                <td align="center" colspan="2" 
                                    
                                    style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold;" 
                                    class="style1">
                                    Enter your User Name to receive your password.</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Black;font-style:italic;">
                                    Forgot Your Password?</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User 
                                    Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Height="22px" 
                                        Width="128px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="ctl09$PasswordRecovery1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="SubmitButton" runat="server" BackColor="#FFFBFF" 
                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                        CommandName="Submit" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" 
                                        Height="26px" Text="Submit" ValidationGroup="ctl09$PasswordRecovery1" 
                                        Width="87px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </UserNameTemplate>
    </asp:PasswordRecovery></asp:Panel>
</div>
    </div>
</asp:Content>
