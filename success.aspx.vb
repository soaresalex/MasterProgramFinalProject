
Partial Class success
    Inherits System.Web.UI.Page

    Private Sub success_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.Master.HeaderLabel.Text = "Welcome to the team"
        lblFirstName.Text = Session("firstName")
        lblEmail.Text = Session("email")
        lblAge.Text = Session("age")
        lblHeight.Text = Session("height")
        lblWeight.Text = Session("weight")
        lblGoal.Text = Session("goal")
        lblActivity.Text = Session("activity")
        lblWeeks.Text = Session("weeks")
        lblDiff.Text = Session("difference")
    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Response.Redirect("login.aspx")
    End Sub
End Class
