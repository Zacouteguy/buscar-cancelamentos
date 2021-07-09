


      
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    
    <span id='topo'></span>
    <div id="caixaAlerta" class="alert" style="padding:0;" runat="server"></div>
    
    <style>
        .menufiltro {
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
         }
        .principal {
             display:flex;
         }
         .corpreto {
             width:15px;
             height:15px;
             background-color:black;
             border-radius: 7px;
             margin-top: 2px;
         }
         .corverde {
             width:15px;
             height:15px;
             background-color:rgb(14, 102, 52);
             border-radius: 7px;
             margin-top: 2px;
         }
         .corcinza {
             width:15px;
             height:15px;
             background-color:rgb(142, 144, 145);
             border-radius: 7px;
             margin-top: 2px;
         }
         .corvermelho {
             width:15px;
             height:15px;
             background-color:red;
             border-radius: 7px;
             margin-top: 2px;
         }
         .textopreto {
             margin-left:5px;
             text-transform: uppercase;
         }
         .textoverde {
             color:rgb(14, 102, 52);
             margin-left:5px;
             text-transform: uppercase;
         }
         .textovermelho {
             color:red;
             margin-left:5px;
             text-transform: uppercase;
         }
         .textocinza {
             color:rgb(142, 144, 145);
             margin-left:5px;
             text-transform: uppercase;
         }

         .totalarea {

            display:flex;
            justify-content:space-evenly;
            flex-wrap: wrap;
            
        }

       .areacamposmenor {

            height: 60px;
            width: 200px;
            background-image: linear-gradient(#0474a9, #03adca);
            background-color:#00bedc;
            margin-left: 10px;
            margin-right: 10px;
            margin-bottom: 10px;
            margin-top: 10px;
            border-radius: 3px;
            box-shadow: 1px 2px 3px #010101;

        }

        .alinhatextooutro {

           text-align: center;
           padding: 6px;
           PADDING-LEFT: 5PX;
           PADDING-RIGHT: 5PX;
        }
        .textogrande {

            color: #fff;
            font-size: 19px;
            font-weight: bold;
        }

        .textopequeno {

            color: #00ff37;
            font-size: 15px;
        }

        #ctl00_ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolderMenu_ContentPlaceHolderNormal_RadGridClientes_GroupPanel {
           display:none;
       }

        caption {
           display:none;
       }

       .RadGrid_Bootstrap .rgCommandTable td {
           padding-bottom: 5px;
           padding-top: 5px;
           color:white;
       }

       .textopequeno{
           color:#ffffff;
       }


       #ctl00_ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolderMenu_ContentPlaceHolderNormal_RadGridExemplo_GroupPanel {
           display:none;
       }
       caption {
           display:none;
       }
       .RadGrid_Bootstrap .rgCommandTable td {
           padding-bottom: 5px;
           padding-top: 5px;
           color:white;
       }

       
      .subir { display: inline-block; float: right;}


 </style>

  


    
   
    <div runat="server">

                     <div class="panel-heading menufiltro" style="background-image: linear-gradient(#3c6382,#60a3bc); display: flex;justify-content: space-between;">
                <h3 style="color: #ffffff;FONT-SIZE: 20PX;" class="panel-title">FILTRO</h3>
                <div align="right"><img runat="server" src="~/img/lupa.png"></div>
            </div>

                      <div class="panel-body col-lg-12" runat="server">
                    
                    <asp:Label ID="Label1" runat="server" Text="SELECIONAR DATA: " CssClass="col-lg-2 control-label" Font-Bold="true"></asp:Label>
                    <div class="col-lg-4">
                        <telerik:RadDatePicker Width="100%" ID="RadDatePickerInicio" runat="server">
                        </telerik:RadDatePicker>
                    </div>
                                

                       <br /><br />
               
                               

                </div>

                <div class="panel-body" >
                        <div class="col-lg-12" style="text-align: right; margin-right:10px;margin-top:15px;" >
                            <asp:Button Text="Limpar filtro" CssClass="btn btn-default" OnClick="Unnamed_Click1" Font-Bold="false" runat="server" />
                            <asp:Button Text="FILTRAR" CssClass="btn btn-primary" OnClick="Unnamed_Click" Font-Bold="false" runat="server" />
                        </div>
                </div>

            </div><!-- fim form-horizontal -->
   
    
    <div runat="server" class="col-lg-12 col-xs-12">
        <div id="linha1" runat="server" style="border:1px solid #17A3AF; margin-bottom:15px;"></div>
        </div>

    <br />

        <br />

        <div class="totalarea" >

            <div class="areacamposmenor"  >
                <div class="alinhatextooutro" id="corCards1" runat="server">
                    <div class="textopequeno" id="corTexto" runat="server"> TOTAL CANCELADOS </div>
                    <div id="divQuantidadeVendas" class="textogrande" runat="server"></div>
                    
                </div>
            </div>         
   

       </div>    

      <br />    
             <div runat="server" class="col-lg-12 col-xs-12">

            <div class="panel panel-default" style="cursor: auto !important; border: 1px solid #17A3AF;">

                 <div class="panel-heading" style="background-image: linear-gradient(#3c6382,#60a3bc);">
                    <h3 style="color: #ffffff;" class="panel-title">LEVANTAMENTO <B> CANCELAMENTOS-DIA </B>  </h3>
                 </div>

                    <div class="table-responsive tabela">
                    
                    <telerik:RadGrid AllowPaging="true" runat="server" ID="RadGridVendasMarca" DataSourceID="SqlDataSourceVendasMarca" AutoGenerateColumns="false" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="-1" Culture="pt-BR" GridLines="Both">
                        
                        <MasterTableView DataKeyNames="id_ALUGUEL_LINHAS_CLIENTES" CssClass="tabelaajustada" Name="Master" AllowPaging="true" DataSourceID="SqlDataSourceVendasMarca">
                        
                            <NoRecordsTemplate>
                                <table width="100%" border="0" cellpadding="20" cellspacing="20">
                                    <tr>
                                        <td align="center">
                                            <br />
                                                 <h2 style="color:Black"><b>Nenhum registro encontrado.</b></h2>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </NoRecordsTemplate>
                            
                            <Columns>                   
                                                                
                                 <telerik:GridTemplateColumn Visible="false" DataField="id_ALUGUEL_LINHAS_CLIENTES" UniqueName="id_ALUGUEL_LINHAS_CLIENTES" ReadOnly="True">
                                    <ItemTemplate>
                                        <asp:Label ID="id_ALUGUEL_LINHAS_CLIENTESLabel" runat="server" Text='<%# Eval("id_ALUGUEL_LINHAS_CLIENTES") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                                
                                <telerik:GridTemplateColumn HeaderText="CLIENTE" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataType="System.Int32">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("nome_ALUGUEL_LINHAS_CLIENTES") %> ' ID="nome_ALUGUEL_LINHAS_CLIENTESLabel" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-lg-2"/>
                                </telerik:GridTemplateColumn>

                                                                      
                                 <telerik:GridTemplateColumn HeaderText="LINHA" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >                                   
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("numero_ALUGUEL_LINHAS_CHIPS") %> ' ID="numero_ALUGUEL_LINHAS_CHIPSLabel" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-lg-2"/>
                                </telerik:GridTemplateColumn>


                                <telerik:GridTemplateColumn HeaderText="DATA CONTRATO" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >                                   
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("dataContrato_ALUGUEL_LINHAS_CONTRATOS", "{0:d}") %> ' ID="dataContrato_ALUGUEL_LINHAS_CONTRATOSlabel" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-lg-2"/>
                                </telerik:GridTemplateColumn>
                                                         

                                                                           
                                <telerik:GridTemplateColumn HeaderText="DATA CANCELAMENTO" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >                                   
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("dataCancelamento_ALUGUEL_LINHAS_CONTRATOS", "{0:d}") %> ' ID="dataCancelamento_ALUGUEL_LINHAS_CONTRATOSlabel" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-lg-2"/>
                                </telerik:GridTemplateColumn>                                                        
                                            
                                                             
                            </Columns>   
                            
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                </div>
            </div>

                 </div>

          <div class="subir">
             <a href='#topo'>Voltar ao topo  </a>
              <br />
              <br />
          </div>

    

        <asp:SqlDataSource ID="SqlDataSourceVendasMarca" CancelSelectOnNullParameter="true" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT ALUGUEL_LINHAS_CONTRATOS.dataContrato_ALUGUEL_LINHAS_CONTRATOS, ALUGUEL_LINHAS_CONTRATOS.dataCancelamento_ALUGUEL_LINHAS_CONTRATOS, ALUGUEL_LINHAS_CONTRATOS.id_ALUGUEL_LINHAS_CLIENTES, ALUGUEL_LINHAS_CLIENTES.nome_ALUGUEL_LINHAS_CLIENTES , dbo.MascaraTelefone(numero_ALUGUEL_LINHAS_CHIPS) as numero_ALUGUEL_LINHAS_CHIPS from ALUGUEL_LINHAS_CONTRATOS INNER JOIN ALUGUEL_LINHAS_CLIENTES ON ALUGUEL_LINHAS_CLIENTES.id_ALUGUEL_LINHAS_CLIENTES = ALUGUEL_LINHAS_CONTRATOS.id_ALUGUEL_LINHAS_CLIENTES inner join aluguel_linhas_contratos_linhas ON aluguel_linhas_contratos_linhas.id_ALUGUEL_LINHAS_CONTRATOS=ALUGUEL_LINHAS_CONTRATOS.id_ALUGUEL_LINHAS_CONTRATOS INNER JOIN ALUGUEL_LINHAS_CHIPS ON ALUGUEL_LINHAS_CHIPS.id_ALUGUEL_LINHAS_CHIPS = ALUGUEL_LINHAS_CONTRATOS_LINHAS.id_ALUGUEL_LINHAS_CHIPS WHERE st_ALUGUEL_LINHAS_CONTRATOS = 0 AND (ALUGUEL_LINHAS_CONTRATOS.id_FRANQUIA = @idEmpresa_PS_PESSOA) and convert(DATE, ALUGUEL_LINHAS_CONTRATOS.dataCancelamento_ALUGUEL_LINHAS_CONTRATOS ) = ISNULL(@dataselecionada, CONVERT(date, dataCancelamento_ALUGUEL_LINHAS_CONTRATOS )) ORDER BY dataCancelamento_ALUGUEL_LINHAS_CONTRATOS DESC">

        <SelectParameters>
         <asp:SessionParameter SessionField="idEmpresa_PS_PESSOA" Name="idEmpresa_PS_PESSOA"></asp:SessionParameter>
        <asp:Parameter Name="dataselecionada" ConvertEmptyStringToNull="False"></asp:Parameter>       
        </SelectParameters>

</asp:SqlDataSource>

</asp:Content>
