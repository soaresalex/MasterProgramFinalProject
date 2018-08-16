Imports System.Data.SqlClient

Partial Class dashboard
    Inherits System.Web.UI.Page

    Private Sub dashboard_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.Master.HeaderLabel.Text = "Dashboard"
        Me.Master.UserLabel.Text = Session("name")

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
        End Try

        'Retrieve and display data from the database
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim strSQL As String
        Dim dtr As SqlDataReader
        Dim regID As Integer = Session("regID")
        Dim projectedWeeks As Integer = Session("duration")
        Dim days As Integer = WeeksRemaining()
        Dim weeks As Integer = days / 7
        Dim weeksLeft As Integer = projectedWeeks - weeks
        lblWeeks.Text = CStr(weeksLeft)


        Try
            con.ConnectionString = "Data Source=shucsd.sacredheart.edu\sql2012;Initial Catalog=CS557_FA17_soaresa9;Persist Security Info=True;User ID=CS557_FA17_soaresa9;Password=CS557_FA17_soaresa9"
            strSQL = "SELECT * FROM Registrants WHERE RegistrantID=" & regID
            cmd.CommandType = Data.CommandType.Text
            cmd.CommandText = strSQL

            con.Open()
            cmd.Connection = con
            dtr = cmd.ExecuteReader()

            If dtr.HasRows Then
                dtr.Read()
                lblWeight.Text = dtr("WeightDiff")
                lblDailyCalories.Text = dtr("DailyCalories")
            Else
            End If
            dtr.Close()
            con.Close()

        Catch ex As Exception
        End Try
    End Sub

    'Get weeks left to achieve goal
    Private Function WeeksRemaining() As Integer
        Dim startDate As Date = Session("startDate")
        Dim daysLeft As TimeSpan = Date.Today - startDate
        Return daysLeft.Days
    End Function
End Class
