inherited frCaixas: TfrCaixas
  Caption = 'Cadastro de Caixas'
  ClientHeight = 201
  OnCreate = FormCreate
  ExplicitHeight = 239
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Top = 168
    ExplicitTop = 168
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
    Left = 32
    Top = 75
    Caption = 'C'#243'digo'
  end
  object lbDescricao: TcxLabel [4]
    Left = 19
    Top = 102
    Caption = 'Descri'#231#227'o'
  end
  object edCodigo: TcxDBTextEdit [5]
    Left = 75
    Top = 71
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsDados
    Enabled = False
    TabOrder = 5
    Width = 121
  end
  object edDescricao: TcxDBTextEdit [6]
    Left = 75
    Top = 98
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsDados
    TabOrder = 6
    Width = 121
  end
  object lcOperador: TcxDBLookupComboBox [7]
    Left = 75
    Top = 125
    DataBinding.DataField = 'usuario_id'
    DataBinding.DataSource = dsDados
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'login'
      end
      item
        FieldName = 'nome'
      end>
    Properties.ListFieldIndex = 2
    Properties.ListSource = dsOperador
    TabOrder = 7
    Width = 510
  end
  object lbOperador: TcxLabel [8]
    Left = 19
    Top = 129
    Caption = 'Operador'
  end
  inherited quDados: TZqueryValidation
    Active = True
    SQL.Strings = (
      'select * from caixas;')
  end
  object quOperador: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      
        'select usuarios.*, pessoas.nome from usuarios join pessoas on us' +
        'uarios.pessoa_id = pessoas.id;')
    Params = <>
    Left = 448
    Top = 88
  end
  object dsOperador: TDataSource
    DataSet = quOperador
    Left = 496
    Top = 88
  end
end
