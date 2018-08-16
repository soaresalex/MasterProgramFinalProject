
Partial Class profile
    Inherits System.Web.UI.Page

    Private Sub profile_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.Master.HeaderLabel.Text = "Profile Page"
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
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
