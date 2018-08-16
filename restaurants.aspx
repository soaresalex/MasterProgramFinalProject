<%@ Page Title="" Language="VB" MasterPageFile="~/food-list.master" AutoEventWireup="false" CodeFile="restaurants.aspx.vb" Inherits="restaurants" %>

<%@ MasterType VirtualPath="~/food-list.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-4">
        <label>Restaurants</label>
        <asp:DropDownList
            ID="ddlRestaurants"
            runat="server"
            DataSourceID="sdsRestaurants"
            DataTextField="Name"
            DataValueField="RestaurantID"
            AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource
            runat="server"
            ID="sdsRestaurants"
            ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
            SelectCommand="SELECT * FROM [Restaurants]"></asp:SqlDataSource>
    </div>
    <div class="col-sm-4">
        <label>Category</label>
        <asp:DropDownList
            ID="ddlCategory"
            runat="server"
            DataSourceID="sdsCategory"
            DataTextField="Name"
            DataValueField="CategoryID"
            AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource
            runat="server"
            ID="sdsCategory"
            ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
            SelectCommand="SELECT [CategoryID], [Name] FROM [Categories] WHERE ([RestaurantID] = @RestaurantID)">
            <SelectParameters>
                <asp:ControlParameter
                    ControlID="ddlRestaurants"
                    PropertyName="SelectedValue"
                    Name="RestaurantID"
                    Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-sm-4">
        <label>Meal Type</label>
        <asp:DropDownList
            ID="ddlMealType"
            runat="server"
            DataSourceID="sdsMealType"
            DataTextField="Name"
            DataValueField="MealTypeID"
            AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource
            runat="server"
            ID="sdsMealType"
            ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
            SelectCommand="SELECT [MealTypeID], [Name] FROM [MealType] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter
                    ControlID="ddlCategory"
                    PropertyName="SelectedValue"
                    Name="CategoryID"
                    Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-sm-12">
        <asp:GridView
            ID="gwMeals"
            runat="server"
            AutoGenerateColumns="False"
            DataSourceID="sdsMeals"
            AllowSorting="True"
            AllowPaging="True"
            PageSize="15">
            <Columns>
                <asp:BoundField
                    DataField="Name"
                    HeaderText="Meal Name"
                    SortExpression="Name"></asp:BoundField>
                <asp:BoundField
                    DataField="Calories"
                    HeaderText="Calories"
                    SortExpression="Calories"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource
            runat="server"
            ID="sdsMeals"
            ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
            SelectCommand="SELECT [Name], [Calories] FROM [Meal] WHERE ([MealTypeID] = @MealTypeID)">
            <SelectParameters>
                <asp:ControlParameter
                    ControlID="ddlMealType"
                    PropertyName="SelectedValue"
                    Name="MealTypeID"
                    Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

