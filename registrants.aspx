<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="registrants.aspx.vb" Inherits="registrants" %>

<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView
        ID="gridRegistrants"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="RegistrantID"
        DataSourceID="sdsRegistrants"
        AllowPaging="True"
        AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="RegistrantID" HeaderText="RegistrantID" ReadOnly="True" InsertVisible="False" SortExpression="RegistrantID"></asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Pass" HeaderText="Pass" SortExpression="Pass"></asp:BoundField>
            <asp:BoundField DataField="RegLevel" HeaderText="RegLevel" SortExpression="RegLevel"></asp:BoundField>
            <asp:BoundField DataField="WeightDiff" HeaderText="WeightDiff" SortExpression="WeightDiff"></asp:BoundField>
            <asp:BoundField DataField="Weeks" HeaderText="Weeks" SortExpression="Weeks"></asp:BoundField>
            <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource
        runat="server"
        ID="sdsRegistrants"
        ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
        SelectCommand="SELECT * FROM [Registrants]"></asp:SqlDataSource>
</asp:Content>

