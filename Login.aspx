<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/site.master" CodeFile="Login.aspx.cs"
    Inherits="createusers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Login</title>
    <meta name="description" content="Login" />
    <style type="text/css">
        div.fieldset
        {
            margin: 1em 0px;
            padding: 1em;
            border: 2px solid #4f81bd;
            color: #4f81bd;
            -webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
        }
        
        div.fieldset p
        {
            margin: 2px 12px 10px 10px;
        }
        
        div.fieldset.login label, div.fieldset.register label, div.fieldset.changePassword label
        {
            display: block;
        }
        
        div.fieldset label.inline
        {
            display: inline;
        }
        
        legend
        {
            font-size: 1.1em;
            font-weight: 600;
            padding: 2px 4px 8px 4px;
            color: #4f81bd;
        }
        
        input.textEntry
        {
            width: 320px;
            border: 1px solid #ccc;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            height: 25px;
        }
        
        input.passwordEntry
        {
            width: 320px;
            border: 1px solid #ccc;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            height: 25px;
        }
        
        div.accountInfo
        {
            width: 376px;
            
            margin: 0 auto;
        }
        .failureNotification
        {
            color: Red;
        }
        .submitButton
        {
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 25px 50px 0;">
        <asp:Login ID="Login1" runat="server" EnableViewState="false" Width="100%" RenderOuterTable="false"
            OnLoggedIn="Login1_LoggedIn">
            <LayoutTemplate>
                <asp:Panel ID="Panel1" DefaultButton="LoginButton" runat="server">
                    <span class="failureNotification">
                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                        ValidationGroup="LoginUserValidationGroup" />
                    <div class="accountInfo">
                        <div class="fieldset login">
                            <legend>Sign In</legend>
                            <p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    CssClass="failureNotification" ErrorMessage="UserName Required." Display="Dynamic"
                                    ToolTip="Enter UserName." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="PasswordRequired" runat="server"
                                    ControlToValidate="Password" CssClass="failureNotification" ErrorMessage="Password Required."
                                    ToolTip="Enter Password." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <div class="submitButton">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Sign In" ValidationGroup="LoginUserValidationGroup"
                                        CssClass="button" />
                                </div>
                                <asp:CheckBox ID="RememberMe" runat="server" />
                                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                              
                            </p>
                        </div>
                        <p class="submitButton">
                        </p>
                    </div>
                </asp:Panel>
            </LayoutTemplate>
        </asp:Login>
    </div>
    <div class="clr">
    </div>
</asp:Content>
