<%@ Page Language="VB" AutoEventWireup="false" CodeFile="calculate-your-calories.aspx.vb" Inherits="calculate_your_calories" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculate Your Calories</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/calculator-foodlist.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid header calculating">
        <div class="container">
            <div class="col-sm-6"><a href="index.html">Calculories</a></div>
            <div class="col-sm-6 nav">
                <ul>
                    <li><a href="generic.aspx">Generic Foods</a></li>
                    <li><a href="restaurants.aspx">Restaurant Meals</a></li>
                    <li><a href="calculate-your-calories.aspx">Calculating Calories</a></li>
                    <li><a href="login.aspx">Log In</a></li>
                    <li><a href="register.aspx" name="nav-signup">
                        <input type="submit" value="Get Started" /></a></li>
                </ul>
            </div>
            <div class="col-sm-12">
                <div>
                    <h1>Calculate your calories</h1>
                    <h4>Enter your information to determine the amount of calories to eat daily and weekly</h4>
                </div>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
        <div class="container-fluid" id="calculator">
            <div class="container">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <asp:Label ID="lblPounds" runat="server" Text="0" /><label>Pounds to Gain/Lose</label>
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="lblDailyCalories" runat="server" Text="0" /><label>Daily Calories</label>
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="lblWeeklyCalories" runat="server" Text="0" /><label>Weekly Calories</label>
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="lblAccumulatedCalories" runat="server" Text="0" /><label>Accumulated Calories within
                            <asp:Label ID="lblWeeks" runat="server" Text="_" Font-Size="12px" Font-Bold="True" />
                            weeks</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-6">
                        <label>Weight (lbs)</label>
                        <asp:TextBox ID="txtWeight" runat="server" Text="" />
                    </div>
                    <div class="col-sm-6">
                        <label>Height (inches)</label>
                        <asp:TextBox ID="txtHeight" runat="server" Text="" />
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-6">
                        <label>Age</label>
                        <asp:TextBox ID="txtAge" runat="server" Text="" />
                    </div>
                    <div class="col-sm-6">
                        <label>Weight Goal (lbs)</label>
                        <asp:TextBox ID="txtGoalWeight" runat="server" Text="" />
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-6">
                        <label>Weeks to achieve goal</label>
                        <asp:TextBox ID="txtWeeks" runat="server" Text="" />
                    </div>
                    <div class="col-sm-6">
                        <label>Level of Activity</label>
                        <asp:DropDownList ID="ddlActivity" runat="server">
                            <asp:ListItem Value="1.2">Little or no exercise</asp:ListItem>
                            <asp:ListItem Value="1.375">Lightly Active (1-3 times a week)</asp:ListItem>
                            <asp:ListItem Value="1.55">Moderate (3-5 times a week)</asp:ListItem>
                            <asp:ListItem Value="1.725">Very Active (6-7 times a week)</asp:ListItem>
                            <asp:ListItem Value="1.9">Extra Active (Very hard exercise/sports or physical job)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-sm-12">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate Your Calories" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
