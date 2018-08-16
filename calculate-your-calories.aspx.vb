Imports System
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Class calculate_your_calories
    Inherits System.Web.UI.Page

    Private Sub btnCalculate_Click(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim age, bmr, caloriesMaintain, caloriesPerDay As Integer
        Dim weight, height, weeks, activity, poundsPerWeek, goalWeight, weightDifference As Decimal

        weight = CDec(txtWeight.Text)
        height = CDec(txtHeight.Text)
        weeks = CDec(txtWeeks.Text)
        age = CInt(txtAge.Text)
        activity = CDec(ddlActivity.SelectedValue)
        goalWeight = CDec(txtGoalWeight.Text)

        lblWeeks.Text = txtWeeks.Text

        If goalWeight < weight Then
            weightDifference = weight - goalWeight
        Else
            weightDifference = goalWeight - weight
        End If

        bmr = 10 * (weight * 0.453592) + 6.25 * (height * 2.54) - 5 * age + 5
        caloriesMaintain = bmr * activity

        poundsPerWeek = weightDifference / weeks

        If goalWeight < weight Then
            caloriesPerDay = caloriesMaintain - (500 * poundsPerWeek)
        Else
            caloriesPerDay = caloriesMaintain + (500 * poundsPerWeek)
        End If

        lblDailyCalories.Text = caloriesPerDay
        lblWeeklyCalories.Text = caloriesPerDay * 7
        lblAccumulatedCalories.Text = caloriesPerDay * 7 * weeks
        lblPounds.Text = weightDifference
    End Sub
End Class
