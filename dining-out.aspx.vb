Imports System.Data.SqlClient

Partial Class dining_out
    Inherits System.Web.UI.Page

    Private Sub dining_out_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.Master.HeaderLabel.Text = "Dining Out"
        imgLogo.ImageUrl = "img/logos/applebees.png"
        Dim calories As Integer = Session("calories")
        Dim caloriesConsumed As Integer = Session("dailyCalories")
        Dim caloriesLeft As Integer = calories - caloriesConsumed

        Try
            If Session("user") = "" Then
                Response.Redirect("login.aspx")
            Else
                If Session("level") = 1 Then
                    Me.Master.AdminMenu = True
                    Me.Master.UserMenu = False
                Else
                    Me.Master.AdminMenu = False
                    Me.Master.UserMenu = True
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        lblCaloriesLeft.Text = caloriesLeft
        lblCaloriesAdded.Text = Session("dailyCalories")
        Me.Master.UserLabel.Text = Session("name")
    End Sub

    Private Sub ddlRestaurants_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlRestaurants.SelectedIndexChanged

        'Image logo changes based on the restaurant selected from the dropdown
        Dim restaurant As String
        restaurant = ddlRestaurants.SelectedIndex

        Select Case restaurant
            Case 0
                imgLogo.ImageUrl = "img/logos/applebees.png"
            Case 1
                imgLogo.ImageUrl = "img/logos/buffalo-wild-wings.png"
            Case 2
                imgLogo.ImageUrl = "img/logos/capital-grille.png"
            Case 3
                imgLogo.ImageUrl = "img/logos/cheddars-scratch-kitchen.png"
            Case 4
                imgLogo.ImageUrl = "img/logos/cheesecake-factory.png"
            Case 5
                imgLogo.ImageUrl = "img/logos/chilis.png"
            Case 6
                imgLogo.ImageUrl = "img/logos/ihop.png"
            Case 7
                imgLogo.ImageUrl = "img/logos/longhorn-steakhouse.png"
            Case 8
                imgLogo.ImageUrl = "img/logos/olive-garden.png"
            Case 9
                imgLogo.ImageUrl = "img/logos/outback-steakhouse.png"
            Case 10
                imgLogo.ImageUrl = "img/logos/red-lobster.png"
            Case 11
                imgLogo.ImageUrl = "img/logos/red-robin.png"
            Case 12
                imgLogo.ImageUrl = "img/logos/texas-roadhouse.png"
            Case 13
                imgLogo.ImageUrl = "img/logos/tgi-fridays.png"
        End Select
    End Sub

    Dim caloriesAdded As Integer
    Private Sub gridMeals_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridMeals.SelectedIndexChanged
        'Add meal into the database
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim strSQL As String
        Dim strCalories As String
        Dim row As GridViewRow = gridMeals.SelectedRow
        Dim calories As Integer = CInt(row.Cells(2).Text)
        Dim meal As String = row.Cells(1).Text
        Dim regID As Integer = Session("regID")
        Dim dailyCalories As Integer = Session("dailyCalories")
        Dim mealDate As Date = DateTime.Today
        Dim caloriesConsumed As Integer = CInt(lblCaloriesAdded.Text)

        Try
            con.ConnectionString = "Data Source=shucsd.sacredheart.edu\sql2012;Initial Catalog=CS557_FA17_soaresa9;Persist Security Info=True;User ID=CS557_FA17_soaresa9;Password=CS557_FA17_soaresa9"
            strSQL = "INSERT INTO MealsAdded VALUES ('" & meal & "', " & calories & ", " & regID & ", '" & mealDate & "');"
            strCalories = "UPDATE Registrants SET DailyCalories=" & caloriesConsumed & "WHERE RegistrantID=" & regID & ";"
            cmd.CommandType = Data.CommandType.Text
            cmd.CommandText = strSQL
            cmd.CommandText = strCalories
            con.Open()
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        lblCaloriesAdded.Text = (Val(lblCaloriesAdded.Text) + calories).ToString()
        lblCaloriesLeft.Text = CInt(lblCaloriesLeft.Text) - CInt(lblCaloriesAdded.Text)
        cbMealsAdded.Items.Add(meal)

    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        While cbMealsAdded.Items.Count > 0
            cbMealsAdded.Items.RemoveAt(cbMealsAdded.Items.Count - 1)
        End While
    End Sub

    Private Sub gridMeals_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gridMeals.RowDataBound
        Dim calories As Integer = Session("calories")
        Dim caloriesConsumed As Integer = Session("dailyCalories")
        Dim caloriesLeft As Integer = calories - caloriesConsumed
        If e.Row.RowType = DataControlRowType.DataRow Then
            If CInt(e.Row.Cells(2).Text) > caloriesLeft Then
                e.Row.Visible = False
            End If
        End If
    End Sub
End Class
