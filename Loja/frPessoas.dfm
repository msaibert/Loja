object TelaPessoas: TTelaPessoas
  Left = 639
  Top = 264
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 353
  ClientWidth = 539
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TcxLabel
    Left = 24
    Top = 64
    Caption = 'C'#243'digo'
  end
  object edCodigo: TcxDBTextEdit
    Left = 69
    Top = 60
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsPessoas
    Enabled = False
    TabOrder = 3
    Width = 121
  end
  object lbNome: TcxLabel
    Left = 29
    Top = 89
    Caption = 'Nome'
  end
  object edNome: TcxDBTextEdit
    Left = 69
    Top = 85
    DataBinding.DataField = 'nome'
    DataBinding.DataSource = dsPessoas
    TabOrder = 5
    Width = 457
  end
  object lbDocumento: TcxLabel
    Left = 2
    Top = 114
    Caption = 'Documento'
  end
  object lbEndereco: TcxLabel
    Left = 11
    Top = 174
    Caption = 'Endere'#231'o'
  end
  object edEndereco: TcxDBTextEdit
    Left = 69
    Top = 170
    DataBinding.DataField = 'endereco'
    DataBinding.DataSource = dsPessoas
    TabOrder = 10
    Width = 457
  end
  object lbBairro: TcxLabel
    Left = 30
    Top = 199
    Caption = 'Bairro'
  end
  object edBairro: TcxDBTextEdit
    Left = 69
    Top = 195
    DataBinding.DataField = 'bairro'
    DataBinding.DataSource = dsPessoas
    TabOrder = 11
    Width = 457
  end
  object edTelefone: TcxDBMaskEdit
    Left = 69
    Top = 270
    DataBinding.DataField = 'telefone'
    DataBinding.DataSource = dsPessoas
    Properties.EditMask = '!\(99\) 0000-0000;0;_'
    Properties.MaxLength = 0
    TabOrder = 14
    Width = 121
  end
  object edCelular: TcxDBMaskEdit
    Left = 69
    Top = 295
    DataBinding.DataField = 'celular'
    DataBinding.DataSource = dsPessoas
    Properties.IgnoreMaskBlank = True
    Properties.EditMask = '!\(99\) 0000-0000;0;_'
    Properties.MaxLength = 0
    TabOrder = 19
    Width = 121
  end
  object lbTelefone: TcxLabel
    Left = 15
    Top = 274
    Caption = 'Telefone'
  end
  object lbCelular: TcxLabel
    Left = 25
    Top = 299
    Caption = 'Celular'
  end
  object rgSexo: TcxDBRadioGroup
    Left = 69
    Top = 135
    Caption = 'Sexo'
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
    Height = 30
    Width = 177
  end
  object edNumero: TcxDBSpinEdit
    Left = 69
    Top = 220
    DataBinding.DataField = 'numero'
    DataBinding.DataSource = dsPessoas
    TabOrder = 12
    Width = 121
  end
  object lbNumero: TcxLabel
    Left = 20
    Top = 224
    Caption = 'N'#250'mero'
  end
  object lcCidade: TcxDBLookupComboBox
    Left = 69
    Top = 245
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
    TabOrder = 13
    Width = 457
  end
  object lbCidade: TcxLabel
    Left = 24
    Top = 249
    Caption = 'Cidade'
  end
  object nvPessoas: TcxDBNavigator
    Left = 299
    Top = 320
    Width = 270
    Height = 25
    Buttons.CustomButtons = <>
    DataSource = dsPessoas
    TabOrder = 21
  end
  object lcPesquisa: TcxLookupComboBox
    Left = 69
    Top = 16
    Properties.ListColumns = <>
    TabOrder = 1
    Width = 457
  end
  object lbPesquisa: TcxLabel
    Left = 14
    Top = 20
    Caption = 'Pesquisa'
  end
  object edDocumento: TcxDBMaskEdit
    Left = 69
    Top = 110
    DataBinding.DataField = 'documento'
    DataBinding.DataSource = dsPessoas
    Properties.EditMask = '000\.000\.000\-00;0;_'
    Properties.MaxLength = 0
    TabOrder = 7
    Width = 121
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
  object quPessoas: TZqueryValidation
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from pessoas;')
    Params = <>
    Left = 8
    Top = 320
  end
  object dsPessoas: TDataSource
    DataSet = quPessoas
    Left = 40
    Top = 323
  end
end
