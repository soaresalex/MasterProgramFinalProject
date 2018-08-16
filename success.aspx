<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="success.aspx.vb" Inherits="success" %>

<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/register.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-5"></div>
    <div class="col-sm-7">
        <div class="col-sm-12 success">
            <h1><a href="index.html" name="calculories">Calculories</a></h1>
            <h2>Thank you for registering <asp:Label ID="lblFirstName" runat="server" Text="" />!</h2>
            <h4>Below is your calculations and information. Login and begin your meal selections.</h4>
        </div>
        <div class="col-sm-12 success">
            <table>
                <tr>
                    <td>
                        Email Address:</td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td>
                        Age:</td>
                    <td>
                        <asp:Label ID="lblAge" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td>
                        Height:</td>
                    <td>
                        <asp:Label ID="lblHeight" runat="server" Text="" />
                        inches</td>
                </tr>
                <tr>
                    <td>
                        Current Weight:</td>
                    <td>
                        <asp:Label ID="lblWeight" runat="server" Text="" /> lbs</td>
                </tr>
                <tr>
                    <td>
                        Goal Weight:</td>
                    <td>
                        <asp:Label ID="lblGoal" runat="server" Text="" /> lbs</td>
                </tr>
                <tr>
                    <td>
                        Pounds to gain/lose:</td>
                    <td>
                        <asp:Label ID="lblDiff" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td>
                        Level of Activity:</td>
                    <td>
                        <asp:Label ID="lblActivity" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td>
                        Weeks to complete goal:</td>
                    <td>
                        <asp:Label ID="lblWeeks" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="btnLogin" runat="server" Text="Log In" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

