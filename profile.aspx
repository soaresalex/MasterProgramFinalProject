<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" %>
<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/profile.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource runat="server" ID="sdsProfile" ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>' SelectCommand="SELECT [FirstName], [LastName], [Email], [Pass], [WeightDiff], [Weeks], [Calories] FROM [Registrants] WHERE ([RegistrantID] = @RegistrantID)">
        <SelectParameters>
            <asp:SessionParameter SessionField="regID" Name="RegistrantID" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="sdsProfile">
        <Fields>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" HtmlEncode="False" HtmlEncodeFormatString="False"></asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" HtmlEncode="False"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" HtmlEncode="False"></asp:BoundField>
            <asp:BoundField DataField="Pass" HeaderText="Password" SortExpression="Pass" HtmlEncode="False"></asp:BoundField>
            <asp:BoundField DataField="WeightDiff" HeaderText="Pounds to Gain/Lose" SortExpression="WeightDiff"></asp:BoundField>
            <asp:BoundField DataField="Weeks" HeaderText="Weeks to achieve goal" SortExpression="Weeks" HtmlEncode="False"></asp:BoundField>
            <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" HtmlEncode="False"></asp:BoundField>
        </Fields>
    </asp:DetailsView>
</asp:Content>

