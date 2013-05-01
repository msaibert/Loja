object TelaProdutos: TTelaProdutos
  Left = 697
  Top = 184
  Width = 618
  Height = 281
  Caption = 'Cadastro de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbPesquisa: TcxLabel
    Left = 54
    Top = 20
    Width = 51
    Height = 17
    TabOrder = 0
    Caption = 'Pesquisa'
  end
  object lcPesquisa: TcxLookupComboBox
    Left = 113
    Top = 16
    Width = 480
    Height = 21
    Properties.HideSelection = False
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'descricao'
      end
      item
        FieldName = 'id'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListSource = dsProdutos
    EditValue = ''
    TabOrder = 1
  end
  object lbCodigo: TcxLabel
    Left = 64
    Top = 68
    Width = 41
    Height = 17
    TabOrder = 2
    Caption = 'C'#243'digo'
  end
  object edPrecoCusto: TcxDBCurrencyEdit
    Left = 113
    Top = 139
    Width = 121
    Height = 21
    DataBinding.DataField = 'precocusto'
    DataBinding.DataSource = dsProdutos
    TabOrder = 9
  end
  object lbPrecoCusto: TcxLabel
    Left = 24
    Top = 143
    Width = 81
    Height = 17
    TabOrder = 8
    Caption = 'Pre'#231'o de Custo'
  end
  object lbPrecoFinal: TcxLabel
    Left = 44
    Top = 168
    Width = 61
    Height = 17
    TabOrder = 10
    Caption = 'Pre'#231'o Final'
  end
  object edPrecoFinal: TcxDBCurrencyEdit
    Left = 113
    Top = 164
    Width = 121
    Height = 21
    DataBinding.DataField = 'precofinal'
    DataBinding.DataSource = dsProdutos
    TabOrder = 11
  end
  object lbCategoria: TcxLabel
    Left = 52
    Top = 118
    Width = 53
    Height = 17
    TabOrder = 6
    Caption = 'Categoria'
  end
  object lbDescricao: TcxLabel
    Left = 49
    Top = 93
    Width = 56
    Height = 17
    TabOrder = 4
    Caption = 'Descri'#231#227'o'
  end
  object edCodigo: TcxDBTextEdit
    Left = 113
    Top = 64
    Width = 121
    Height = 21
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsProdutos
    Enabled = False
    TabOrder = 3
  end
  object edDescricao: TcxDBTextEdit
    Left = 113
    Top = 89
    Width = 480
    Height = 21
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsProdutos
    TabOrder = 5
  end
  object nvProduto: TcxDBNavigator
    Left = 366
    Top = 203
    Width = 206
    Height = 25
    Buttons.First.Hint = 'Ir para primeiro produto cadastrado.'
    Buttons.PriorPage.Visible = False
    Buttons.Next.Hint = 'Vai para o pr'#243'ximo produto da lista.'
    Buttons.NextPage.Visible = False
    Buttons.Last.Hint = 'Ir para '#250'ltimo produto cadastrado.'
    Buttons.Insert.Hint = 'Novo produto.'
    Buttons.Delete.Hint = 'Deletar o produto atual.'
    Buttons.Edit.Hint = 'Editar o produto atual.'
    Buttons.Post.Hint = 'Salvar altera'#231#245'es.'
    Buttons.Cancel.Hint = 'Cancelar altera'#231#245'es\inclus'#227'o para o produto atual.'
    Buttons.Refresh.Visible = False
    Buttons.GotoBookmark.Hint = 'V'#225' para produto marcado.'
    Buttons.Filter.Hint = 'Criar filtro avan'#231'ado para localiza'#231#227'o de um produto.'
    DataSource = dsProdutos
    TabOrder = 12
  end
  object lcCategoria: TcxDBLookupComboBox
    Left = 112
    Top = 114
    Width = 480
    Height = 21
    DataBinding.DataField = 'categoria_id'
    DataBinding.DataSource = dsProdutos
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'descricao'
      end
      item
        FieldName = 'id'
      end>
    Properties.ListSource = dsCategoria
    TabOrder = 7
  end
  object quProdutos: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from produtos')
    Params = <>
    Left = 16
    Top = 208
  end
  object dsProdutos: TDataSource
    DataSet = quProdutos
    Left = 48
    Top = 208
  end
  object quCategoria: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from categoriaprodutos;')
    Params = <>
    Left = 104
    Top = 208
  end
  object dsCategoria: TDataSource
    DataSet = quCategoria
    Left = 136
    Top = 208
  end
end
