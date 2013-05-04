object TelaProdutos: TTelaProdutos
  Left = 697
  Top = 184
  BorderStyle = bsNone
  Caption = 'Cadastro de Produtos'
  ClientHeight = 257
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbPesquisa: TcxLabel
    Left = 54
    Top = 20
    Caption = 'Pesquisa'
  end
  object lcPesquisa: TcxLookupComboBox
    Left = 113
    Top = 16
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
    Width = 480
  end
  object lbCodigo: TcxLabel
    Left = 64
    Top = 68
    Caption = 'C'#243'digo'
  end
  object edPrecoCusto: TcxDBCurrencyEdit
    Left = 113
    Top = 139
    DataBinding.DataField = 'precocusto'
    DataBinding.DataSource = dsProdutos
    TabOrder = 9
    Width = 121
  end
  object lbPrecoCusto: TcxLabel
    Left = 24
    Top = 143
    Caption = 'Pre'#231'o de Custo'
  end
  object lbPrecoFinal: TcxLabel
    Left = 44
    Top = 168
    Caption = 'Pre'#231'o Final'
  end
  object edPrecoFinal: TcxDBCurrencyEdit
    Left = 113
    Top = 164
    DataBinding.DataField = 'precofinal'
    DataBinding.DataSource = dsProdutos
    TabOrder = 11
    Width = 121
  end
  object lbCategoria: TcxLabel
    Left = 52
    Top = 118
    Caption = 'Categoria'
  end
  object lbDescricao: TcxLabel
    Left = 49
    Top = 93
    Caption = 'Descri'#231#227'o'
  end
  object edCodigo: TcxDBTextEdit
    Left = 113
    Top = 64
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsProdutos
    Enabled = False
    TabOrder = 3
    Width = 121
  end
  object edDescricao: TcxDBTextEdit
    Left = 113
    Top = 89
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsProdutos
    TabOrder = 5
    Width = 480
  end
  object nvProduto: TcxDBNavigator
    Left = 366
    Top = 203
    Width = 216
    Height = 25
    Buttons.CustomButtons = <>
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
    DataBinding.DataField = 'categoria_id'
    DataBinding.DataSource = dsProdutos
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'descricao'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListSource = dsCategoria
    TabOrder = 7
    Width = 480
  end
  object btRelatorios: TcxButton
    Left = 176
    Top = 208
    Width = 75
    Height = 25
    Caption = 'btRelatorios'
    TabOrder = 13
  end
  object quProdutos: TZQuery
    Connection = dmConexao.connectionSistema
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
