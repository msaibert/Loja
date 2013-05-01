object TelaUsuarios: TTelaUsuarios
  Left = 817
  Top = 253
  Width = 595
  Height = 194
  Caption = 'Cadastro de usu'#225'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbPessoa: TcxLabel
    Left = 59
    Top = 20
    Width = 43
    Height = 17
    TabOrder = 0
    Caption = 'Pessoa'
  end
  object lcPessoa: TcxDBLookupComboBox
    Left = 106
    Top = 16
    Width = 465
    Height = 21
    DataBinding.DataField = 'pessoa_id'
    DataBinding.DataSource = dsUsuarios
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'nome'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListSource = dsPessoa
    TabOrder = 1
  end
  object edLogin: TcxDBTextEdit
    Left = 106
    Top = 41
    Width = 121
    Height = 21
    DataBinding.DataField = 'login'
    DataBinding.DataSource = dsUsuarios
    TabOrder = 2
  end
  object edPassWord: TcxDBMaskEdit
    Left = 106
    Top = 66
    Width = 121
    Height = 21
    DataBinding.DataField = 'senha'
    DataBinding.DataSource = dsUsuarios
    Properties.EchoMode = eemPassword
    TabOrder = 3
  end
  object nvUsuarios: TcxDBNavigator
    Left = 344
    Top = 122
    Width = 227
    Height = 25
    DataSource = dsUsuarios
    TabOrder = 4
  end
  object lbLogin: TcxLabel
    Left = 59
    Top = 45
    Width = 34
    Height = 17
    TabOrder = 5
    Caption = 'Login'
  end
  object lbSenha: TcxLabel
    Left = 59
    Top = 70
    Width = 39
    Height = 17
    TabOrder = 6
    Caption = 'Senha'
  end
  object lbConfirmarSenha: TcxLabel
    Left = 16
    Top = 95
    Width = 86
    Height = 17
    TabOrder = 7
    Caption = 'Confirmar Senha'
  end
  object edConfirmarSenha: TcxMaskEdit
    Left = 106
    Top = 91
    Width = 121
    Height = 21
    Properties.EchoMode = eemPassword
    TabOrder = 8
  end
  object quUsuarios: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from usuarios;')
    Params = <>
    Left = 16
    Top = 120
  end
  object dsUsuarios: TDataSource
    DataSet = quUsuarios
    Left = 56
    Top = 120
  end
  object dsPessoa: TDataSource
    DataSet = quPessoa
    Left = 136
    Top = 120
  end
  object quPessoa: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from Pessoas;')
    Params = <>
    Left = 96
    Top = 120
  end
end
