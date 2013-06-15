object frMovimentoDeEstoque: TfrMovimentoDeEstoque
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#227'o do Estoque'
  ClientHeight = 356
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    644
    356)
  PixelsPerInch = 96
  TextHeight = 13
  object lcProduto: TcxDBLookupComboBox
    Left = 89
    Top = 71
    DataBinding.DataField = 'produto_id'
    DataBinding.DataSource = dsMovimento
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'descricao'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListSource = dsProdutos
    TabOrder = 5
    Width = 537
  end
  object edData: TcxDBDateEdit
    Left = 89
    Top = 20
    DataBinding.DataField = 'data'
    DataBinding.DataSource = dsMovimento
    TabOrder = 0
    Width = 121
  end
  object lbData: TcxLabel
    Left = 56
    Top = 24
    Caption = 'Data'
  end
  object lbProduto: TcxLabel
    Left = 41
    Top = 75
    Caption = 'Produto'
  end
  object lcOperacao: TcxDBLookupComboBox
    Left = 89
    Top = 46
    DataBinding.DataField = 'operacao_id'
    DataBinding.DataSource = dsMovimento
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'descricao'
      end
      item
        FieldName = 'tipo_estoque'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListSource = dsOperacoes
    TabOrder = 1
    Width = 537
  end
  object lbOperacao: TcxLabel
    Left = 32
    Top = 50
    Caption = 'Opera'#231#227'o'
  end
  object edQuantidade: TcxDBSpinEdit
    Left = 89
    Top = 96
    DataBinding.DataField = 'quantidade'
    DataBinding.DataSource = dsMovimento
    Properties.MinValue = 1.000000000000000000
    TabOrder = 7
    Width = 121
  end
  object lbQuantidade: TcxLabel
    Left = 23
    Top = 100
    Caption = 'Quantidade'
  end
  object edValorUnitario: TcxDBCurrencyEdit
    Left = 89
    Top = 121
    DataBinding.DataField = 'valor_unitario'
    DataBinding.DataSource = dsMovimento
    TabOrder = 9
    OnExit = edValorUnitarioExit
    Width = 121
  end
  object lbValorUnitario: TcxLabel
    Left = 16
    Top = 125
    Caption = 'Valor unit'#225'rio'
  end
  object lbValorTotal: TcxLabel
    Left = 30
    Top = 150
    Caption = 'Valor total'
  end
  object lbDesconto: TcxLabel
    Left = 34
    Top = 175
    Caption = 'Desconto'
  end
  object mmObservacoes: TcxDBMemo
    Left = 89
    Top = 221
    DataBinding.DataField = 'observacao'
    DataBinding.DataSource = dsMovimento
    TabOrder = 16
    Height = 89
    Width = 537
  end
  object lbObservacoes: TcxLabel
    Left = 16
    Top = 221
    Caption = 'Observa'#231#245'es'
  end
  object nvMovimento: TcxDBNavigator
    Left = 374
    Top = 323
    Width = 252
    Height = 25
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Refresh.Visible = False
    DataSource = dsMovimento
    Anchors = [akRight, akBottom]
    TabOrder = 18
  end
  object edDesconto: TcxDBCurrencyEdit
    Left = 89
    Top = 171
    DataBinding.DataField = 'valor_desconto'
    DataBinding.DataSource = dsMovimento
    TabOrder = 13
    Width = 121
  end
  object edNotaFiscal: TcxDBTextEdit
    Left = 89
    Top = 196
    DataBinding.DataField = 'nota_fiscal'
    DataBinding.DataSource = dsMovimento
    TabOrder = 14
    Width = 121
  end
  object lbNotaFiscal: TcxLabel
    Left = 27
    Top = 200
    Caption = 'Nota Fiscal'
  end
  object edValorTotal: TcxDBCurrencyEdit
    Left = 89
    Top = 148
    DataBinding.DataField = 'valor_total'
    DataBinding.DataSource = dsMovimento
    Enabled = False
    TabOrder = 11
    OnExit = edValorUnitarioExit
    Width = 121
  end
  object quMovimento: TZqueryValidation
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      
        'select *, (valor_unitario * quantidade) as valor_total from movi' +
        'mento_estoque;')
    Params = <>
    Left = 496
    Top = 8
  end
  object dsMovimento: TDataSource
    DataSet = quMovimento
    Left = 552
    Top = 8
  end
  object quOperacoes: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      
        'select * from operacoes where movimentar_estoque and not movimen' +
        'tar_caixa and not movimentar_pendura;')
    Params = <>
    Left = 8
    Top = 296
  end
  object dsOperacoes: TDataSource
    DataSet = quOperacoes
    Left = 40
    Top = 296
  end
  object quProdutos: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from produtos;')
    Params = <>
    Left = 96
    Top = 296
  end
  object dsProdutos: TDataSource
    DataSet = quProdutos
    Left = 128
    Top = 296
  end
end
