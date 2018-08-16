<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="inner-box">
        <div class="col-sm-5"></div>
        <div class="col-sm-7">
            <h1><a href="index.html" name="calculories">Calculories</a></h1>
            <div class="col-sm-12">
                <label>Email</label><asp:TextBox ID="txtUsername" runat="server" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvUser"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtUsername"
                    ErrorMessage="Email">Enter your email</asp:RequiredFieldValidator>
            </div>
            <div class="col-sm-12">
                <label>Password</label><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvPassword"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtPassword"
                    ErrorMessage="Password">Enter your password</asp:RequiredFieldValidator>
            </div>
            <div class="col-sm-12">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CausesValidation="true" />
            </div>
            <div class="col-sm-12">
                Not a member?
        <asp:LinkButton ID="btnRegister" runat="server" CausesValidation="false">Register</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

