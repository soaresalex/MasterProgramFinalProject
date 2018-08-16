<%@ Page Title="" Language="VB" MasterPageFile="~/food-list.master" AutoEventWireup="false" CodeFile="generic.aspx.vb" Inherits="generic" %>

<%@ MasterType VirtualPath="~/food-list.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <label>Category</label>
    <asp:DropDownList
        ID="ddlCategory"
        runat="server"
        DataSourceID="sdsCategory"
        DataTextField="ShortName"
        DataValueField="CategoryID">
    </asp:DropDownList>
    <asp:SqlDataSource
        runat="server"
        ID="sdsCategory"
        ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
        SelectCommand="SELECT * FROM [Foodcategories]"></asp:SqlDataSource>
    <div class="foodlist">
        <asp:GridView ID="gridFoodList" runat="server" AutoGenerateColumns="False" DataSourceID="sdsFoodList" AllowPaging="True" AllowSorting="True" PageSize="15">
            <Columns>
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName"></asp:BoundField>
                <asp:BoundField DataField="ServingSize" HeaderText="ServingSize" SortExpression="ServingSize"></asp:BoundField>
                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource
            runat="server"
            ID="sdsFoodList"
            ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
            SelectCommand="SELECT [ItemName], [ServingSize], [Calories] FROM [FoodList] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" PropertyName="SelectedValue" Name="CategoryID" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

