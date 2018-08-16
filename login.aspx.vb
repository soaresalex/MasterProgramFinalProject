Imports System.Data.SqlClient

Partial Class login
    Inherits System.Web.UI.Page

    Private Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Response.Redirect("~/register.aspx")
    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim strSQL As String
        Dim dtr As SqlDataReader

        Try
            con.ConnectionString = "Data Source=shucsd.sacredheart.edu\sql2012;Initial Catalog=CS557_FA17_soaresa9;Persist Security Info=True;User ID=CS557_FA17_soaresa9;Password=CS557_FA17_soaresa9"
            strSQL = "SELECT * FROM Registrants WHERE Email=@user and " & "Pass=@pwd"
            cmd.CommandType = Data.CommandType.Text
            cmd.CommandText = strSQL
            cmd.Parameters.Add("@user", Data.SqlDbType.VarChar).Value = txtUsername.Text
            cmd.Parameters.Add("@pwd", Data.SqlDbType.VarChar).Value = txtPassword.Text

            con.Open()
            cmd.Connection = con
            dtr = cmd.ExecuteReader()

            If dtr.HasRows Then
                dtr.Read()
                Session("user") = dtr("Email")
                Session("level") = dtr("RegLevel")
                Session("regID") = dtr("RegistrantID")
                Session("pounds") = dtr("WeightDiff")
                Session("calories") = dtr("Calories")
                Session("duration") = dtr("Weeks")
                Session("name") = dtr("FirstName")
                Session("startDate") = dtr("StartDate")
                Session("dailyCalories") = dtr("DailyCalories")
                Response.Redirect("dashboard.aspx")
            Else
                MsgBox("Invaid User or password")
            End If
            dtr.Close()
            con.Close()

        Catch ex As Exception
        End Try
    End Sub

    Private Sub login_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.Master.HeaderLabel.Text = "Log In"
    End Sub
End Class
