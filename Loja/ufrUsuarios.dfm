inherited frUsuarios: TfrUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 204
  ExplicitHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Top = 171
    TabOrder = 10
    ExplicitTop = 171
  end
  inherited lcPesquisa: TcxLookupComboBox
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'login'
      end
      item
        FieldName = 'pessoa_nome'
      end>
    Properties.ListFieldIndex = 1
    TabOrder = 1
  end
  object lbPessoa: TcxLabel [3]
    Left = 59
    Top = 67
    Caption = 'Pessoa'
  end
  object lcPessoa: TcxDBLookupComboBox [4]
    Left = 103
    Top = 61
    DataBinding.DataField = 'pessoa_id'
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
    Properties.ListSource = dsPessoa
    TabOrder = 2
    Width = 465
  end
  object edLogin: TcxDBTextEdit [5]
    Left = 103
    Top = 88
    DataBinding.DataField = 'login'
    DataBinding.DataSource = dsDados
    TabOrder = 3
    Width = 121
  end
  object edPassWord: TcxDBMaskEdit [6]
    Left = 103
    Top = 113
    DataBinding.DataField = 'senha'
    DataBinding.DataSource = dsDados
    Properties.EchoMode = eemPassword
    TabOrder = 4
    Width = 121
  end
  object lbLogin: TcxLabel [7]
    Left = 68
    Top = 92
    Caption = 'Login'
  end
  object lbSenha: TcxLabel [8]
    Left = 63
    Top = 117
    Caption = 'Senha'
  end
  object lbConfirmarSenha: TcxLabel [9]
    Left = 13
    Top = 142
    Caption = 'Confirmar Senha'
  end
  object edConfirmarSenha: TcxMaskEdit [10]
    Left = 103
    Top = 138
    Properties.EchoMode = eemPassword
    TabOrder = 5
    OnExit = edConfirmarSenhaExit
    Width = 121
  end
  inherited quDados: TZqueryValidation
    SQL.Strings = (
      
        'select *, pessoas.nome as pessoa_nome from usuarios join pessoas' +
        ' on (pessoas.id = usuarios.pessoa_id);')
  end
  object quPessoa: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from pessoas')
    Params = <>
    Left = 528
    Top = 104
  end
  object dsPessoa: TDataSource
    DataSet = quPessoa
    Left = 472
    Top = 104
  end
end
