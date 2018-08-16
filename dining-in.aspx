<%@ Page Title="" Language="VB" MasterPageFile="~/calculories.master" AutoEventWireup="false" CodeFile="dining-in.aspx.vb" Inherits="dining_in" %>

<%@ MasterType VirtualPath="~/calculories.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dining.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12">
        <div class="col-sm-4"><img src="https://cdn0.iconfinder.com/data/icons/vectr-examples/640/food-hamburder-v1-128.png" /></div>
        <div class="col-sm-8">
            <asp:DropDownList
                ID="ddlCategory"
                runat="server"
                AutoPostBack="True"
                DataSourceID="sdsFoodCategory"
                DataTextField="ShortName"
                DataValueField="CategoryID">
            </asp:DropDownList>
            <asp:SqlDataSource
                runat="server"
                ID="sdsFoodCategory"
                ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
                SelectCommand="SELECT * FROM [Foodcategories]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="col-sm-3">
            <div class="col-sm-12"><h3><asp:Label ID="lblCaloriesAdded" runat="server" Text="0" /></h3><br />
                <label>Calories Added</label>
            </div>
            <div class="col-sm-12"><h3><asp:Label ID="lblCaloriesLeft" runat="server" Text="0" /></h3><br />
                <label>Daily Calories Remaining</label>
            </div>
            <div class="col-sm-12 meals-added">
                <h3>Meals Added</h3>
                <asp:CheckBoxList ID="cbMealsAdded" runat="server"></asp:CheckBoxList>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" />
            </div>
        </div>
        <div class="col-sm-9 dine-in">
            <asp:GridView
                ID="gridFoodList"
                runat="server"
                AutoGenerateColumns="False"
                DataSourceID="sdsFoodList"
                AllowPaging="True"
                AllowSorting="True"
                PageSize="15">
                <Columns>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName"></asp:BoundField>
                    <asp:BoundField DataField="ServingSize" HeaderText="ServingSize" SortExpression="ServingSize"></asp:BoundField>
                    <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource
                runat="server"
                ID="sdsFoodList"
                ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
                SelectCommand="SELECT [ItemName], [ServingSize], [Calories] FROM [FoodList] WHERE ([CategoryID] = @CategoryID) ORDER BY [ItemName], [Calories]">
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
</asp:Content>

