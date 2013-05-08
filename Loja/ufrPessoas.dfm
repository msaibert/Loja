inherited frPessoas: TfrPessoas
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 381
  OnCreate = FormCreate
  ExplicitWidth = 651
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Top = 351
    Height = 22
    TabOrder = 21
    ExplicitTop = 351
    ExplicitHeight = 22
  end
  inherited lcPesquisa: TcxLookupComboBox
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'nome'
      end
      item
        FieldName = 'documento'
      end>
    Properties.ListFieldIndex = 1
  end
  object lbCodigo: TcxLabel [3]
    Left = 24
    Top = 79
    Caption = 'C'#243'digo'
  end
  object edCodigo: TcxDBTextEdit [4]
    Left = 69
    Top = 75
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsDados
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object lbNome: TcxLabel [5]
    Left = 29
    Top = 104
    Caption = 'Nome'
  end
  object edNome: TcxDBTextEdit [6]
    Left = 69
    Top = 100
    DataBinding.DataField = 'nome'
    DataBinding.DataSource = dsDados
    TabOrder = 3
    Width = 457
  end
  object lbDocumento: TcxLabel [7]
    Left = 2
    Top = 129
    Caption = 'Documento'
  end
  object lbEndereco: TcxLabel [8]
    Left = 11
    Top = 196
    Caption = 'Endere'#231'o'
  end
  object edEndereco: TcxDBTextEdit [9]
    Left = 69
    Top = 192
    DataBinding.DataField = 'endereco'
    DataBinding.DataSource = dsDados
    TabOrder = 6
    Width = 457
  end
  object lbBairro: TcxLabel [10]
    Left = 30
    Top = 221
    Caption = 'Bairro'
  end
  object edBairro: TcxDBTextEdit [11]
    Left = 69
    Top = 217
    DataBinding.DataField = 'bairro'
    DataBinding.DataSource = dsDados
    TabOrder = 7
    Width = 457
  end
  object edTelefone: TcxDBMaskEdit [12]
    Left = 69
    Top = 292
    DataBinding.DataField = 'telefone'
    DataBinding.DataSource = dsDados
    Properties.EditMask = '!\(99\) 0000-0000;0;_'
    Properties.MaxLength = 0
    TabOrder = 10
    Width = 121
  end
  object edCelular: TcxDBMaskEdit [13]
    Left = 69
    Top = 317
    DataBinding.DataField = 'celular'
    DataBinding.DataSource = dsDados
    Properties.IgnoreMaskBlank = True
    Properties.EditMask = '!\(99\) 0000-0000;0;_'
    Properties.MaxLength = 0
    TabOrder = 13
    Width = 121
  end
  object lbTelefone: TcxLabel [14]
    Left = 15
    Top = 296
    Caption = 'Telefone'
  end
  object lbCelular: TcxLabel [15]
    Left = 25
    Top = 321
    Caption = 'Celular'
  end
  object rgSexo: TcxDBRadioGroup [16]
    Left = 69
    Top = 150
    Caption = 'Sexo'
    DataBinding.DataField = 'sexo'
    DataBinding.DataSource = dsDados
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Masculino'
        Value = 'M'
      end
      item
        Caption = 'Feminino'
        Value = 'F'
      end>
    TabOrder = 5
    Height = 36
    Width = 177
  end
  object edNumero: TcxDBSpinEdit [17]
    Left = 69
    Top = 242
    DataBinding.DataField = 'numero'
    DataBinding.DataSource = dsDados
    TabOrder = 8
    Width = 121
  end
  object lbNumero: TcxLabel [18]
    Left = 20
    Top = 246
    Caption = 'N'#250'mero'
  end
  object lcCidade: TcxDBLookupComboBox [19]
    Left = 69
    Top = 267
    DataBinding.DataField = 'cidade_id'
    DataBinding.DataSource = dsDados
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'nome'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListSource = dsCidades
    TabOrder = 9
    Width = 457
  end
  object lbCidade: TcxLabel [20]
    Left = 24
    Top = 271
    Caption = 'Cidade'
  end
  object edDocumento: TcxDBMaskEdit [21]
    Left = 69
    Top = 125
    DataBinding.DataField = 'documento'
    DataBinding.DataSource = dsDados
    Properties.EditMask = '000\.000\.000\-00;0;_'
    Properties.MaxLength = 0
    TabOrder = 4
    Width = 121
  end
  inherited quDados: TZqueryValidation
    Active = True
    SQL.Strings = (
      'select * from pessoas;')
    Left = 584
    Top = 256
  end
  inherited dsDados: TDataSource
    Left = 592
    Top = 304
  end
  object quCidades: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from cidades')
    Params = <>
    Left = 592
    Top = 200
  end
  object dsCidades: TDataSource
    DataSet = quCidades
    Left = 592
    Top = 152
  end
end
