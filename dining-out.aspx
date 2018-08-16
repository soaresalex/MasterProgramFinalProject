<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="dining-out.aspx.vb" Inherits="dining_out" %>

<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dining.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12">
        <div class="col-sm-4">
            <asp:Image ID="imgLogo" runat="server" Width="300px" />
        </div>
        <div class="col-sm-8">
            <div class="col-sm-12">
                <asp:DropDownList
                    ID="ddlRestaurants"
                    runat="server"
                    DataSourceID="sdsRestaurants"
                    DataTextField="Name"
                    DataValueField="RestaurantID"
                    AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource
                    runat="server"
                    ID="sdsRestaurants"
                    ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
                    SelectCommand="SELECT * FROM [Restaurants]"></asp:SqlDataSource>
            </div>
            <div class="col-sm-12">
                <asp:DropDownList
                    ID="ddlCategory"
                    runat="server"
                    AutoPostBack="True"
                    DataSourceID="sdsCategory"
                    DataTextField="Name"
                    DataValueField="CategoryID">
                </asp:DropDownList>
                <asp:SqlDataSource
                    runat="server"
                    ID="sdsCategory"
                    ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
                    SelectCommand="SELECT * FROM [Categories] WHERE ([RestaurantID] = @RestaurantID)">
                    <SelectParameters>
                        <asp:ControlParameter
                            ControlID="ddlRestaurants"
                            PropertyName="SelectedValue"
                            Name="RestaurantID"
                            Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-sm-12">
                <asp:DropDownList
                    ID="ddlMealType"
                    runat="server"
                    AutoPostBack="True"
                    DataSourceID="sdsMealType"
                    DataTextField="Name"
                    DataValueField="MealTypeID">
                </asp:DropDownList>
                <asp:SqlDataSource
                    runat="server"
                    ID="sdsMealType"
                    ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
                    SelectCommand="SELECT * FROM [MealType] WHERE ([CategoryID] = @CategoryID)">
                    <SelectParameters>
                        <asp:ControlParameter
                            ControlID="ddlCategory"
                            PropertyName="SelectedValue"
                            Name="CategoryID"
                            Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="col-sm-3">
            <div class="col-sm-12"><h3><asp:Label ID="lblCaloriesAdded" runat="server" Text="0" /></h3>
                <label>Calories Added</label>
            </div>
            <div class="col-sm-12"><h3><asp:Label ID="lblCaloriesLeft" runat="server" Text="0" /></h3>
                <label>Daily Calories Remaining</label>
            </div>
            <div class="col-sm-12 meals-added">
                <h3>Meals Added</h3>
                <asp:CheckBoxList ID="cbMealsAdded" runat="server"></asp:CheckBoxList>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" />
            </div>
        </div>
        <div class="col-sm-9">
            <asp:GridView
                ID="gridMeals"
                runat="server"
                AutoGenerateColumns="False"
                DataSourceID="sdsMeals"
                AllowPaging="True"
                AllowSorting="True"
                PageSize="10">
                <Columns>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories"></asp:BoundField>
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
    </div>
</asp:Content>

