Imports System.Data.SqlClient

Public Class cancelamentos_dia
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' preenche filtro com mes atual
        If IsPostBack() = False Then

            Dim dataAtual As Date = Now
            Dim inicio As Date = dataAtual

            RadDatePickerInicio.SelectedDate = inicio
            SqlDataSourceVendasMarca.SelectParameters("dataselecionada").DefaultValue = RadDatePickerInicio.SelectedDate.ToString()

            Dim quantidade As Integer = buscaQuantidadeTotal(RadDatePickerInicio.SelectedDate)
            divQuantidadeVendas.InnerText = quantidade

        End If

    End Sub


    Private Sub RadGridNfse_PreRender(sender As Object, e As EventArgs) Handles RadGridVendasMarca.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridVendasMarca, 3)
            RadGridVendasMarca.MasterTableView.PageSize = 10
            RadGridVendasMarca.MasterTableView.CommandItemSettings.ShowExportToExcelButton = True
            RadGridVendasMarca.MasterTableView.CommandItemSettings.ShowExportToCsvButton = False
            RadGridVendasMarca.MasterTableView.CommandItemSettings.ShowExportToPdfButton = False
            RadGridVendasMarca.Rebind()
        End If
    End Sub



    Public Function buscaQuantidadeTotal(ByVal dia As Date) As Integer

        Dim id_FRANQUIA As Integer = Session("idEmpresa_PS_PESSOA")
        Dim total As Integer = 0

        Dim CslSqlConetion As New Sql
        Using con As New SqlConnection(CslSqlConetion.StrConectionString)
            Using cmd As New SqlCommand("SELECT COUNT(*) AS total
                    from ALUGUEL_LINHAS_CONTRATOS 
                    INNER JOIN ALUGUEL_LINHAS_CLIENTES 
                    ON ALUGUEL_LINHAS_CLIENTES.id_ALUGUEL_LINHAS_CLIENTES = ALUGUEL_LINHAS_CONTRATOS.id_ALUGUEL_LINHAS_CLIENTES
                    inner join aluguel_linhas_contratos_linhas ON aluguel_linhas_contratos_linhas.id_ALUGUEL_LINHAS_CONTRATOS=ALUGUEL_LINHAS_CONTRATOS.id_ALUGUEL_LINHAS_CONTRATOS
                    INNER JOIN ALUGUEL_LINHAS_CHIPS ON ALUGUEL_LINHAS_CHIPS.id_ALUGUEL_LINHAS_CHIPS = ALUGUEL_LINHAS_CONTRATOS_LINHAS.id_ALUGUEL_LINHAS_CHIPS
                    WHERE st_ALUGUEL_LINHAS_CONTRATOS = 0
                    AND (ALUGUEL_LINHAS_CONTRATOS.id_FRANQUIA = '" & id_FRANQUIA & "') 
                    and dataCancelamento_ALUGUEL_LINHAS_CONTRATOS IS NOT NULL
                    and convert(DATE, ALUGUEL_LINHAS_CONTRATOS.dataCancelamento_ALUGUEL_LINHAS_CONTRATOS) = '" & dia & "'")
                Try
                    cmd.Connection = con
                    con.Open()
                    Dim rd As SqlDataReader = cmd.ExecuteReader()
                    If rd.HasRows Then
                        While rd.Read
                            total = rd("total")
                        End While
                    End If
                    con.Close()
                Catch ex As Exception
                End Try
            End Using
        End Using

        Return total

    End Function



    Protected Sub Unnamed_Click(sender As Object, e As EventArgs)


        caixaAlerta.InnerHtml = New caixa_alerta().mensagem(99, "")
        If RadDatePickerInicio.SelectedDate.ToString = "" Then
            caixaAlerta.InnerHtml = New caixa_alerta().mensagem(0, "ERRO! PREENCHA O CAMPO DATA")

        Else

            If RadDatePickerInicio.SelectedDate.ToString <> "" Then
                SqlDataSourceVendasMarca.SelectParameters("dataselecionada").DefaultValue = RadDatePickerInicio.SelectedDate
            End If

            SqlDataSourceVendasMarca.Select(DataSourceSelectArguments.Empty)

            ' cards
            Dim quantidade As Integer = buscaQuantidadeTotal(RadDatePickerInicio.SelectedDate)

            divQuantidadeVendas.InnerText = quantidade

        End If

    End Sub

    Protected Sub Unnamed_Click1(sender As Object, e As EventArgs)
        Response.Redirect("")
    End Sub

End Class
