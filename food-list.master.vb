
Partial Class food_list
    Inherits System.Web.UI.MasterPage
    Public Property HeaderLabel() As Label
        Get
            Return lblHeader
        End Get
        Set(ByVal value As Label)
            lblHeader = value
        End Set
    End Property
End Class

