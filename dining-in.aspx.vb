Imports System.Data.SqlClient

Partial Class dining_in
    Inherits System.Web.UI.Page

    Private Sub dining_in_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.Master.HeaderLabel.Text = "Dining In"
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

    Private Sub gridFoodList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridFoodList.SelectedIndexChanged
        'Add meal into the database
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim strSQL As String
        Dim row As GridViewRow = gridFoodList.SelectedRow
        Dim calories As Integer = CInt(row.Cells(3).Text)
        Dim mealName As String = row.Cells(1).Text
        Dim serving As String = row.Cells(2).Text
        Dim meal As String = mealName & " (" & serving & ")"
        Dim regID As Integer = Session("regID")
        Dim mealDate As Date = DateTime.Today

        Try
            con.ConnectionString = "Data Source=shucsd.sacredheart.edu\sql2012;Initial Catalog=CS557_FA17_soaresa9;Persist Security Info=True;User ID=CS557_FA17_soaresa9;Password=CS557_FA17_soaresa9"
            strSQL = "INSERT INTO MealsAdded VALUES ('" & meal & "', " & calories & ", " & regID & ", '" & mealDate & "');"
            cmd.CommandType = Data.CommandType.Text
            cmd.CommandText = strSQL
            con.Open()
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception
        End Try

        lblCaloriesAdded.Text = (Val(lblCaloriesAdded.Text) + calories).ToString()
        lblCaloriesLeft.Text = CInt(lblCaloriesLeft.Text) - CInt(lblCaloriesAdded.Text)
        cbMealsAdded.Items.Add(meal)
    End Sub

    Private Sub gridFoodList_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gridFoodList.RowDataBound
        Dim calories As Integer = Session("calories")
        Dim caloriesConsumed As Integer = Session("dailyCalories")
        Dim caloriesLeft As Integer = calories - caloriesConsumed
        If e.Row.RowType = DataControlRowType.DataRow Then
            If CInt(e.Row.Cells(3).Text) > caloriesLeft Then
                e.Row.Visible = False
            End If
        End If
    End Sub
End Class
