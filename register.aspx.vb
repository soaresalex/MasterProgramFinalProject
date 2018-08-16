Imports System.Data.SqlClient

Partial Class register
    Inherits System.Web.UI.Page

    Private Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        'Add new registrant into the Registrants database
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim fname As String = txtFirstName.Text
        Dim lname As String = txtLastName.Text
        Dim email As String = txtEmail.Text
        Dim password As String = txtPassword.Text
        Dim weeks As Integer = CInt(txtWeeks.Text)
        Dim goalWeight As Decimal = CDec(txtGoal.Text)
        Dim height As Decimal = CDec(txtHeight.Text)
        Dim currentWeight As Decimal = CDec(txtWeight.Text)
        Dim age As Integer = CInt(txtAge.Text)
        Dim bmr, goal, calories, caloriesMaintain, poundsPerWeek, diffWeight As Integer
        Dim activity As Decimal = ddlActivity.SelectedValue
        Dim startdate As Date = Date.Today

        Session("firstName") = txtFirstName.Text
        Session("email") = txtEmail.Text
        Session("age") = txtAge.Text
        Session("height") = txtHeight.Text
        Session("weight") = txtWeight.Text
        Session("goal") = txtGoal.Text
        Session("activity") = ddlActivity.SelectedValue
        Session("weeks") = txtWeeks.Text
        Session("difference") = diffWeight

        bmr = 10 * (currentWeight * 0.453592) + 6.25 * (height * 2.54) - 5 * age + 5
        caloriesMaintain = bmr * activity
        diffWeight = currentWeight - goalWeight
        poundsPerWeek = diffWeight / weeks
        If diffWeight > 0 Then
            goal = diffWeight
            calories = caloriesMaintain - (500 * poundsPerWeek)
        Else
            goal = -1 * (diffWeight)
            calories = caloriesMaintain + (500 * poundsPerWeek)
        End If

        Try
            con.ConnectionString = "Data Source=shucsd.sacredheart.edu\sql2012;Initial Catalog=CS557_FA17_soaresa9;Persist Security Info=True;User ID=CS557_FA17_soaresa9;Password=CS557_FA17_soaresa9"
            cmd.CommandType = Data.CommandType.Text
            cmd.CommandText = "INSERT INTO Registrants VALUES ('" & fname & "', '" & lname & "', '" & email & "', '" & password & "', " & 2 & ", " & goal & ", " & weeks & ", " & calories & ", '" & startdate & "' );"
            con.Open()
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("success.aspx")
        Catch ex As Exception
        End Try

    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Response.Redirect("login.aspx")
    End Sub
End Class
