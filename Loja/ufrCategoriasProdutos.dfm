inherited frCategoriasProdutos: TfrCategoriasProdutos
  Caption = 'Cadastro de Categorias de Produtos'
  ClientHeight = 166
  ClientWidth = 507
  ExplicitWidth = 523
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Left = 247
    Top = 133
    TabOrder = 6
    ExplicitLeft = 247
    ExplicitTop = 133
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
    TabOrder = 1
    ExplicitWidth = 491
    Width = 491
  end
  object edDescricao: TcxDBTextEdit [3]
    Left = 69
    Top = 97
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsDados
    TabOrder = 3
    Width = 430
  end
  object lbDescricao: TcxLabel [4]
    Left = 9
    Top = 101
    Caption = 'Descri'#231#227'o'
  end
  object lbCodigo: TcxLabel [5]
    Left = 24
    Top = 76
    Caption = 'C'#243'digo'
  end
  object edCodigo: TcxDBTextEdit [6]
    Left = 69
    Top = 72
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsDados
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  inherited quDados: TZqueryValidation
    SQL.Strings = (
      'select * from categorias_produtos;')
  end
end
