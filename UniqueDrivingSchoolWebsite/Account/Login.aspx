<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            height: 32px;
        }
        .style2
        {
            height: 50px;
        }
        .style3
        {
            height: 70px;
        }
        .style4
        {
            height: 70px;
            width: 234px;
        }
        .style5
        {
            height: 50px;
            width: 234px;
        }
        .style6
        {
            width: 250px;
        }
        .style7
        {
            width: 113px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div align="center" style="margin: 200px">
   <p></p>
    
    <div align="center">
        <asp:panel runat="server" HorizontalAlign="Center" ScrollBars="Auto" 
            Width="700px" ID="PanelLogin" Height="465px" BackColor="#CCCCCC" 
            BorderColor="#999999" BorderStyle="Solid" CssClass="img-rounded">
        <h2 align="center">
        Log In
    </h2>
    <p align="center">
       <b> Please enter your username and password.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Sign up </asp:HyperLink> if you don't have an account.</b>
    </p>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" 
                RenderOuterTable="false" >
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText1" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
                 <br />
            <div class="accountInfo" align="center">
                <fieldset class="login"><table align="center">
                 <tr>  <td align="center" colspan="2"> <b style="font-size: large">Account Information</b></td></tr>
                   
                   <tr>
                    <td class="style4">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                      </td><td class="style3">  
                           <asp:TextBox ID="UserName" runat="server" 
                               CssClass="textEntry form-control" Height="36px" 
                            Width="234px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired1" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </td></tr>
                    <tr>
                    <td class="style5">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                       </td><td class="style2"> 
                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry form-control" 
                            TextMode="Password" Height="37px" Width="234px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator></td>
                    </td></tr>
                    <tr>
                    <td class="style6" colspan= "2" align="center">
                        <asp:CheckBox ID="RememberMe" runat="server" />
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label></td>
                    </tr>
                    </table>
                </fieldset>
                <table>
                <tr><td colspan="2" align="center">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                        ValidationGroup="LoginUserValidationGroup" onclick="LoginButton_Click" 
                        CssClass="btn"/>
                </td></tr>
               <tr> <td colspan="2" align="center">
                     <b>  Forgot your password?<asp:LinkButton runat="server" ID="btnLink" 
                           onclick="btnLink_Click" >Click Here</asp:LinkButton> </b>
                </td></tr>
                </table>
            </div>
        </LayoutTemplate>
    </asp:Login>
    
    </asp:panel>
    <div align="center">
                <asp:Panel id="PanelForgot" runat="server" Visible="False" Width="601px" 
                    HorizontalAlign="Center">
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
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;" 
                align="center">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:178px;width:372px;" align="center">
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
                                <td align="right" class="style7">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User 
                                    Name:</asp:Label>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Height="34px" 
                                        Width="183px" CssClass="form-control"></asp:TextBox>
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
                                        Height="43px" Text="Submit" ValidationGroup="ctl09$PasswordRecovery1" 
                                        Width="87px" CssClass="btn" />
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
    </div>
</asp:Content>
