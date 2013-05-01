object TelaPessoas: TTelaPessoas
  Left = 639
  Top = 264
  Width = 555
  Height = 391
  Caption = 'Cadastro de Pessoas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TcxLabel
    Left = 24
    Top = 64
    Width = 41
    Height = 17
    TabOrder = 2
    Caption = 'C'#243'digo'
  end
  object edCodigo: TcxDBTextEdit
    Left = 69
    Top = 60
    Width = 121
    Height = 21
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsPessoas
    Enabled = False
    TabOrder = 3
  end
  object lbNome: TcxLabel
    Left = 29
    Top = 89
    Width = 36
    Height = 17
    TabOrder = 4
    Caption = 'Nome'
  end
  object edNome: TcxDBTextEdit
    Left = 69
    Top = 85
    Width = 457
    Height = 21
    DataBinding.DataField = 'nome'
    DataBinding.DataSource = dsPessoas
    TabOrder = 5
  end
  object lbDocumento: TcxLabel
    Left = 2
    Top = 114
    Width = 63
    Height = 17
    TabOrder = 6
    Caption = 'Documento'
  end
  object lbEndereco: TcxLabel
    Left = 11
    Top = 174
    Width = 54
    Height = 17
    TabOrder = 9
    Caption = 'Endere'#231'o'
  end
  object edEndereco: TcxDBTextEdit
    Left = 69
    Top = 170
    Width = 457
    Height = 21
    DataBinding.DataField = 'endereco'
    DataBinding.DataSource = dsPessoas
    TabOrder = 10
  end
  object lbBairro: TcxLabel
    Left = 30
    Top = 199
    Width = 35
    Height = 17
    TabOrder = 11
    Caption = 'Bairro'
  end
  object edBairro: TcxDBTextEdit
    Left = 69
    Top = 195
    Width = 457
    Height = 21
    DataBinding.DataField = 'bairro'
    DataBinding.DataSource = dsPessoas
    TabOrder = 12
  end
  object edTelefone: TcxDBMaskEdit
    Left = 69
    Top = 270
    Width = 121
    Height = 21
    DataBinding.DataField = 'telefone'
    DataBinding.DataSource = dsPessoas
    Properties.EditMask = '!\(99\) 0000-0000;0;_'
    Properties.MaxLength = 0
    TabOrder = 18
  end
  object edCelular: TcxDBMaskEdit
    Left = 69
    Top = 295
    Width = 121
    Height = 21
    DataBinding.DataField = 'celular'
    DataBinding.DataSource = dsPessoas
    Properties.IgnoreMaskBlank = True
    Properties.EditMask = '!\(99\) 0000-0000;0;_'
    Properties.MaxLength = 0
    TabOrder = 20
  end
  object lbTelefone: TcxLabel
    Left = 15
    Top = 274
    Width = 50
    Height = 17
    TabOrder = 17
    Caption = 'Telefone'
  end
  object lbCelular: TcxLabel
    Left = 25
    Top = 299
    Width = 40
    Height = 17
    TabOrder = 19
    Caption = 'Celular'
  end
  object rgSexo: TcxDBRadioGroup
    Left = 69
    Top = 135
    Width = 177
    Height = 30
    DataBinding.DataField = 'sexo'
    DataBinding.DataSource = dsPessoas
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
    TabOrder = 8
    Caption = 'Sexo'
  end
  object edNumero: TcxDBSpinEdit
    Left = 69
    Top = 220
    Width = 121
    Height = 21
    DataBinding.DataField = 'numero'
    DataBinding.DataSource = dsPessoas
    TabOrder = 14
  end
  object lbNumero: TcxLabel
    Left = 20
    Top = 224
    Width = 45
    Height = 17
    TabOrder = 13
    Caption = 'N'#250'mero'
  end
  object lcCidade: TcxDBLookupComboBox
    Left = 69
    Top = 245
    Width = 457
    Height = 21
    DataBinding.DataField = 'cidade_id'
    DataBinding.DataSource = dsPessoas
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
    TabOrder = 16
  end
  object lbCidade: TcxLabel
    Left = 24
    Top = 249
    Width = 41
    Height = 17
    TabOrder = 15
    Caption = 'Cidade'
  end
  object nvPessoas: TcxDBNavigator
    Left = 299
    Top = 320
    Width = 227
    Height = 25
    DataSource = dsPessoas
    TabOrder = 21
  end
  object lcPesquisa: TcxLookupComboBox
    Left = 69
    Top = 16
    Width = 457
    Height = 21
    Properties.ListColumns = <>
    TabOrder = 1
  end
  object lbPesquisa: TcxLabel
    Left = 14
    Top = 20
    Width = 51
    Height = 17
    TabOrder = 0
    Caption = 'Pesquisa'
  end
  object edDocumento: TcxDBMaskEdit
    Left = 69
    Top = 110
    Width = 121
    Height = 21
    DataBinding.DataField = 'documento'
    DataBinding.DataSource = dsPessoas
    Properties.EditMask = '000\.000\.000\-00;0;_'
    Properties.MaxLength = 0
    TabOrder = 7
  end
  object quPessoas: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from pessoas;')
    Params = <>
    Left = 8
    Top = 325
  end
  object dsPessoas: TDataSource
    DataSet = quPessoas
    Left = 48
    Top = 325
  end
  object dsCidades: TDataSource
    DataSet = quCidades
    Left = 120
    Top = 325
  end
  object quCidades: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from cidades;')
    Params = <>
    Left = 80
    Top = 325
  end
end
