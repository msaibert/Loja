object frCadastroDeProdutos: TfrCadastroDeProdutos
  Left = 264
  Top = 176
  Width = 949
  Height = 779
  Caption = 'Cadastro de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object spCodigo: TcxDBSpinEdit
    Left = 80
    Top = 40
    Width = 121
    Height = 21
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsProduto
    Properties.ReadOnly = True
    TabOrder = 1
  end
  object edDescricao: TcxDBTextEdit
    Left = 80
    Top = 65
    Width = 537
    Height = 21
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsProduto
    TabOrder = 2
  end
  object edPreco: TcxDBCurrencyEdit
    Left = 80
    Top = 116
    Width = 121
    Height = 21
    DataBinding.DataField = 'preco'
    DataBinding.DataSource = dsProduto
    TabOrder = 4
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 44
    Width = 41
    Height = 17
    TabOrder = 6
    Caption = 'C'#243'digo'
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 69
    Width = 56
    Height = 17
    TabOrder = 7
    Caption = 'Descri'#231#227'o'
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 120
    Width = 32
    Height = 17
    TabOrder = 8
    Caption = 'Valor'
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 16
    Top = 178
    Width = 218
    Height = 25
    Buttons.Refresh.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    DataSource = dsProduto
    TabOrder = 9
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 224
    Width = 705
    Height = 497
    TabOrder = 10
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = dsProduto
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object cxGrid1DBTableView1id: TcxGridDBColumn
        DataBinding.FieldName = 'id'
      end
      object cxGrid1DBTableView1descricao: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        DataBinding.FieldName = 'descricao'
      end
      object cxGrid1DBTableView1preco: TcxGridDBColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Nullable = False
        DataBinding.FieldName = 'preco'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object lsPesquisa: TcxLookupComboBox
    Left = 16
    Top = 8
    Width = 697
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'descricao'
      end
      item
        FieldName = 'id'
      end>
    Properties.ListSource = dsProduto
    TabOrder = 0
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 94
    Width = 37
    Height = 17
    TabOrder = 11
    Caption = 'Grupo'
  end
  object lsGrupo: TcxLookupComboBox
    Left = 80
    Top = 90
    Width = 537
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'descricao'
      end
      item
        FieldName = 'id'
      end>
    Properties.ListOptions.ColumnSorting = False
    Properties.ListSource = dsGrupoProtudos
    TabOrder = 3
  end
  object cxLabel5: TcxLabel
    Left = 16
    Top = 146
    Width = 57
    Height = 17
    TabOrder = 12
    Caption = 'Valor Final'
  end
  object edValorFinal: TcxDBCurrencyEdit
    Left = 80
    Top = 142
    Width = 121
    Height = 21
    DataBinding.DataField = 'precofinal'
    DataBinding.DataSource = dsProduto
    TabOrder = 5
  end
  object ZConnection: TZConnection
    Protocol = 'postgresql'
    HostName = 'localhost'
    Database = 'maoe'
    User = 'postgres'
    Password = 'postgres'
    Connected = True
    Left = 848
    Top = 72
  end
  object dsProduto: TDataSource
    DataSet = quProduto
    Left = 848
    Top = 112
  end
  object quGrupoProduto: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'select * from grupoprodutos;')
    Params = <>
    Left = 888
    Top = 152
    object quGrupoProdutoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object quGrupoProdutodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
  end
  object dsGrupoProtudos: TDataSource
    DataSet = quGrupoProduto
    Left = 888
    Top = 112
  end
  object quProduto: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select * from produtos;')
    Params = <>
    Left = 848
    Top = 152
  end
end
