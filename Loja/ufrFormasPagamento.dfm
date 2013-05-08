inherited frFormasPagamento: TfrFormasPagamento
  Caption = 'Cadastro de formas de pagamento'
  ClientHeight = 190
  ClientWidth = 552
  OnCreate = FormCreate
  ExplicitWidth = 568
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Left = 274
    Top = 157
    TabOrder = 7
    ExplicitLeft = 274
    ExplicitTop = 157
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
    ExplicitWidth = 536
    Width = 536
  end
  object lbCodigo: TcxLabel [3]
    Left = 24
    Top = 80
    Caption = 'C'#243'digo'
  end
  object edCodigo: TcxDBTextEdit [4]
    Left = 69
    Top = 76
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsDados
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object lbDescricao: TcxLabel [5]
    Left = 9
    Top = 105
    Caption = 'Descri'#231#227'o'
  end
  object edDescricao: TcxDBTextEdit [6]
    Left = 69
    Top = 101
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsDados
    TabOrder = 3
    Width = 412
  end
  object rgForma: TcxDBRadioGroup [7]
    Left = 69
    Top = 126
    Caption = 'Forma de pagamento'
    DataBinding.DataField = 'tipo'
    DataBinding.DataSource = dsDados
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Vista'
        Value = 'V'
      end
      item
        Caption = 'Prazo'
        Value = 'P'
      end>
    TabOrder = 4
    Height = 34
    Width = 177
  end
  inherited quDados: TZqueryValidation
    Active = True
    SQL.Strings = (
      'select * from formas_de_pagamento;')
  end
end
