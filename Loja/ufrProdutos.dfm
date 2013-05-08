inherited frProdutos: TfrProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 230
  OnCreate = FormCreate
  ExplicitWidth = 651
  ExplicitHeight = 268
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Left = 340
    Top = 189
    TabOrder = 12
    ExplicitLeft = 340
    ExplicitTop = 189
  end
  inherited lcPesquisa: TcxLookupComboBox
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'descricao'
      end>
    Properties.ListFieldIndex = 1
  end
  object lbCodigo: TcxLabel [3]
    Left = 70
    Top = 68
    Caption = 'C'#243'digo'
  end
  object edPrecoCusto: TcxDBCurrencyEdit [4]
    Left = 109
    Top = 141
    DataBinding.DataField = 'preco_custo'
    DataBinding.DataSource = dsDados
    TabOrder = 6
    Width = 121
  end
  object lbPrecoCusto: TcxLabel [5]
    Left = 24
    Top = 143
    Caption = 'Pre'#231'o de Custo'
  end
  object lbPrecoFinal: TcxLabel [6]
    Left = 44
    Top = 168
    Caption = 'Pre'#231'o Final'
  end
  object edPrecoFinal: TcxDBCurrencyEdit [7]
    Left = 113
    Top = 164
    DataBinding.DataField = 'preco_final'
    DataBinding.DataSource = dsDados
    TabOrder = 8
    Width = 121
  end
  object lbCategoria: TcxLabel [8]
    Left = 52
    Top = 118
    Caption = 'Categoria'
  end
  object lbDescricao: TcxLabel [9]
    Left = 49
    Top = 93
    Caption = 'Descri'#231#227'o'
  end
  object edCodigo: TcxDBTextEdit [10]
    Left = 113
    Top = 64
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsDados
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object edDescricao: TcxDBTextEdit [11]
    Left = 113
    Top = 89
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsDados
    TabOrder = 3
    Width = 480
  end
  object lcCategoria: TcxDBLookupComboBox [12]
    Left = 112
    Top = 114
    DataBinding.DataField = 'categoria_id'
    DataBinding.DataSource = dsDados
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
    TabOrder = 4
    Width = 480
  end
  inherited quDados: TZqueryValidation
    Active = True
    SQL.Strings = (
      'select * from produtos;')
  end
  object quCategoria: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from categorias_produtos;')
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
