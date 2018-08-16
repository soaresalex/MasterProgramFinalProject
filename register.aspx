<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" %>

<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/register.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-5"></div>
    <div class="col-sm-7">
        <h1><a href="index.html" name="calculories">Calculories</a></h1>
        <h2 class="register">Become a member</h2>
        <div class="col-sm-12">
            <div class="col-sm-6">
                <label>First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvFirstName"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtFirstName">*</asp:RequiredFieldValidator>
            </div>
            <div class="col-sm-6">
                <label>Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvLastName"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtLastName">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-sm-6">
                <label>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvEmail"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please enter corect email</asp:RegularExpressionValidator>
            </div>
            <div class="col-sm-6">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvPassword"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-sm-6">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtPassConfirm" runat="server" TextMode="Password" Text="" />
                <asp:CompareValidator
                    ID="cvPassword"
                    runat="server"
                    Display="Dynamic"
                    ControlToCompare="txtPassword"
                    ControlToValidate="txtPassConfirm"
                    ErrorMessage="Passwords do not match">*</asp:CompareValidator>
            </div>
            <div class="col-sm-6">
                <label>Age</label>
                <asp:TextBox ID="txtAge" runat="server" TextMode="Number" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvAge"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtAge">*</asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="cvAge"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtAge"
                    Type="Integer"
                    Operator="GreaterThan"
                    ValueToCompare="10"
                    ErrorMessage="Age must be greater than 10">*</asp:CompareValidator>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-sm-6">
                <label>Height</label>
                <asp:TextBox ID="txtHeight" runat="server" TextMode="Number" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvHeight"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtHeight">*</asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="cvHeight"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtHeight"
                    Type="Integer"
                    Operator="GreaterThan"
                    ValueToCompare="0"
                    ErrorMessage="Height must be greater than 0">*</asp:CompareValidator>
            </div>
            <div class="col-sm-6">
                <label>Current Weight</label>
                <asp:TextBox ID="txtWeight" runat="server" TextMode="Number" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvWeight"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtWeight">*</asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="cvWeight"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtWeight"
                    Type="Integer"
                    Operator="GreaterThan"
                    ValueToCompare="0"
                    ErrorMessage="Current weight must be greater than 0">*</asp:CompareValidator>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-sm-6">
                <label>Goal Weight</label>
                <asp:TextBox ID="txtGoal" runat="server" TextMode="Number" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvGoal"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtGoal">*</asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="cvGoal"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtGoal"
                    Type="Integer"
                    Operator="GreaterThan"
                    ValueToCompare="0"
                    ErrorMessage="Goal weight must be greater than 0">*</asp:CompareValidator>
            </div>
            <div class="col-sm-6">
                <label>Weeks to Achieve Goal</label>
                <asp:TextBox ID="txtWeeks" runat="server" TextMode="Number" Text="" />
                <asp:RequiredFieldValidator
                    ID="rfvWeeks"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtWeeks">*</asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="cvWeeks"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txtWeeks"
                    Type="Integer"
                    Operator="GreaterThan"
                    ValueToCompare="0"
                    ErrorMessage="Weeks must be greater than 0">*</asp:CompareValidator>
            </div>
        </div>
        <div class="col-sm-12">
            <label>Level of Activity</label>
            <asp:DropDownList ID="ddlActivity" runat="server">
                <asp:ListItem Value="0">Select a level</asp:ListItem>
                <asp:ListItem Value="1.2">Little or no exercise</asp:ListItem>
                <asp:ListItem Value="1.375">Lightly active (1-3 times/week)</asp:ListItem>
                <asp:ListItem Value="1.55">Moderate (3-5 times/week)</asp:ListItem>
                <asp:ListItem Value="1.725">Very active (6-7 times/week)</asp:ListItem>
                <asp:ListItem Value="1.9">Extra active (Very hard exercise/sports or physical job)</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator
                ID="rfvActivity"
                runat="server"
                Display="Dynamic"
                ControlToValidate="ddlActivity"
                InitialValue="0">*</asp:RequiredFieldValidator>
        </div>
        <div class="col-sm-12">
            <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Please fill in the required fields" />
            <asp:Button ID="btnRegister" runat="server" Text="Register" CausesValidation="true" />
            Already a member?
            <asp:LinkButton ID="btnLogin" runat="server" CausesValidation="false">Log in</asp:LinkButton>
        </div>
    </div>
</asp:Content>

