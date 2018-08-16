<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="dashboard.aspx.vb" Inherits="dashboard" %>

<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-4">
        <h2>
            <asp:Label ID="lblWeight" runat="server" Text="0" /></h2>
        <label>Projected pounds to gain/lose</label>
    </div>
    <div class="col-sm-4">
        <h2>
            <asp:Label ID="lblDailyCalories" runat="server" Text="0" /></h2>
        <label>Projected daily calories consumed</label>
    </div>
    <div class="col-sm-4">
        <h2>
            <asp:Label ID="lblWeeks" runat="server" Text="0" /></h2>
        <label>Projected weeks</label>
    </div>
    <div class="col-sm-12">
        <asp:GridView
            ID="gridMealsAdded"
            runat="server"
            AutoGenerateColumns="False"
            DataSourceID="sdsMealsAdded"
            AllowPaging="True"
            AllowSorting="True"
            PageSize="10">
            <Columns>
                <asp:BoundField DataField="MealDate" HeaderText="MealDate" SortExpression="Date" DataFormatString="{0:MM/dd/yyyy}"></asp:BoundField>
                <asp:BoundField DataField="MealName" HeaderText="MealName" SortExpression="Meal Name"></asp:BoundField>
                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource
            runat="server"
            ID="sdsMealsAdded"
            ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
            SelectCommand="SELECT [MealDate], [MealName], [Calories] FROM [MealsAdded] WHERE ([RegistrantID] = @RegistrantID)">
            <SelectParameters>
                <asp:SessionParameter SessionField="regID" DefaultValue="0" Name="RegistrantID" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

