
Partial Class calculories
    Inherits System.Web.UI.MasterPage
    Public Property HeaderLabel() As Label
        Get
            Return lblHeader
        End Get
        Set(ByVal value As Label)
            lblHeader = value
        End Set
    End Property

    Public Property UserLabel() As Label
        Get
            Return lblUser
        End Get
        Set(ByVal value As Label)
            lblUser = value
        End Set
    End Property

    Public WriteOnly Property AdminMenu() As Boolean
        Set(ByVal value As Boolean)
            mnuAdmin.Visible = value
        End Set
    End Property

    Public WriteOnly Property UserMenu() As Boolean
        Set(ByVal value As Boolean)
            mnuUser.Visible = value
        End Set
    End Property


    Private Sub btnLogout_Click(sender As Object, e As EventArgs) Handles btnLogout.Click
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub
End Class

