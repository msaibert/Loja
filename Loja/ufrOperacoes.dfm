inherited frOperacoes: TfrOperacoes
  Caption = 'Cadastro de Opera'#231#245'es'
  ClientHeight = 247
  ClientWidth = 590
  OnCreate = FormCreate
  ExplicitWidth = 606
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Left = 312
    Top = 214
    TabOrder = 10
    ExplicitLeft = 312
    ExplicitTop = 214
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
    ExplicitWidth = 574
    Width = 574
  end
  object edCodigo: TcxDBTextEdit [3]
    Left = 85
    Top = 69
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsDados
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object edDescricao: TcxDBTextEdit [4]
    Left = 85
    Top = 94
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsDados
    TabOrder = 3
    Width = 460
  end
  object cbEstoque: TcxDBCheckBox [5]
    Left = 85
    Top = 125
    Caption = 'Movimentar Estoque'
    DataBinding.DataField = 'movimentar_estoque'
    DataBinding.DataSource = dsDados
    Properties.NullStyle = nssUnchecked
    TabOrder = 4
    Width = 121
  end
  object rgEstoque: TcxDBRadioGroup [6]
    Left = 85
    Top = 149
    Caption = 'Tipo da movimenta'#231#227'o'
    DataBinding.DataField = 'tipo_estoque'
    DataBinding.DataSource = dsDados
    Properties.Items = <
      item
        Caption = 'Entrada'
        Value = 'E'
      end
      item
        Caption = 'Sa'#237'da'
        Value = 'S'
      end>
    TabOrder = 5
    Height = 49
    Width = 153
  end
  object cbCaixa: TcxDBCheckBox [7]
    Left = 242
    Top = 125
    Caption = 'Movimentar Caixa'
    DataBinding.DataField = 'movimentar_caixa'
    DataBinding.DataSource = dsDados
    Properties.NullStyle = nssUnchecked
    TabOrder = 6
    Width = 121
  end
  object rgCaixa: TcxDBRadioGroup [8]
    Left = 242
    Top = 149
    Caption = 'Tipo da movimenta'#231#227'o'
    DataBinding.DataField = 'tipo_caixa'
    DataBinding.DataSource = dsDados
    Properties.Items = <
      item
        Caption = 'Cr'#233'dito'
        Value = 'C'
      end
      item
        Caption = 'D'#233'bito'
        Value = 'D'
      end>
    TabOrder = 8
    Height = 49
    Width = 153
  end
  object lbCodigo: TcxLabel [9]
    Left = 45
    Top = 73
    Caption = 'C'#243'digo'
  end
  object lbDescricao: TcxLabel [10]
    Left = 29
    Top = 98
    Caption = 'Descric'#227'o'
  end
  inherited quDados: TZqueryValidation
    Active = True
    SQL.Strings = (
      'select * from operacoes;')
  end
end
