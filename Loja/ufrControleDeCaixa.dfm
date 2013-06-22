object frControleDeCaixa: TfrControleDeCaixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Controle de Caixa'
  ClientHeight = 647
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    381
    647)
  PixelsPerInch = 96
  TextHeight = 13
  object lcCaixa: TcxDBLookupComboBox
    Left = 15
    Top = 40
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'caixa_id'
    DataBinding.DataSource = dsControleCaixa
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'descricao'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsCaixas
    TabOrder = 0
    OnExit = lcCaixaExit
    Width = 350
  end
  object lbCaixa: TcxLabel
    Left = 15
    Top = 19
    Caption = 'Caixa'
  end
  object edData: TcxDBDateEdit
    Left = 15
    Top = 90
    DataBinding.DataField = 'data'
    DataBinding.DataSource = dsControleCaixa
    TabOrder = 2
    Width = 121
  end
  object lbData: TcxLabel
    Left = 15
    Top = 69
    Caption = 'Data'
  end
  object gdMoedas: TcxGrid
    Left = 15
    Top = 171
    Width = 350
    Height = 296
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    object grMoedas: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsMoedasControle
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
          Column = clTotal
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'total'
          Column = clTotal
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soNullIgnore]
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object clExtenso: TcxGridDBColumn
        Caption = 'Extenso'
        DataBinding.FieldName = 'moeda_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'extenso'
          end>
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsMoedas
        Options.Editing = False
      end
      object clValor: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'moeda_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'valor'
          end>
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsMoedas
        Options.Editing = False
      end
      object clQuantidade: TcxGridDBColumn
        Caption = 'Quantidade'
        DataBinding.FieldName = 'quantidade'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ValueType = vtFloat
        Properties.OnChange = clQuantidadePropertiesChange
      end
      object clTotal: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnChange = clTotalPropertiesChange
      end
    end
    object glMoedas: TcxGridLevel
      GridView = grMoedas
    end
  end
  object btAbrirFecharCaixa: TcxButton
    Left = 244
    Top = 612
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Abrir/Fechar Caixa'
    TabOrder = 5
    OnClick = btAbrirFecharCaixaClick
    ExplicitTop = 585
  end
  object mmObservacao: TcxDBMemo
    Left = 15
    Top = 496
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataBinding.DataField = 'observacao'
    DataBinding.DataSource = dsControleCaixa
    TabOrder = 6
    Height = 110
    Width = 350
  end
  object lbObservacao: TcxLabel
    Left = 15
    Top = 473
    Caption = 'Observa'#231#245'es'
  end
  object lbSaldoCaixa: TcxLabel
    Left = 244
    Top = 69
    Anchors = [akTop, akRight]
    Caption = 'Saldo do Caixa'
  end
  object edSaldo: TcxDBCurrencyEdit
    Left = 244
    Top = 90
    Anchors = [akTop, akRight]
    DataBinding.DataField = 'saldo'
    DataBinding.DataSource = dsCaixas
    Enabled = False
    TabOrder = 9
    Width = 121
  end
  object edSituacaoCaixa: TcxTextEdit
    Left = 244
    Top = 137
    Anchors = [akTop, akRight]
    Enabled = False
    TabOrder = 10
    Width = 121
  end
  object lbSituacaoCaixa: TcxLabel
    Left = 244
    Top = 117
    Anchors = [akTop, akRight]
    Caption = 'Situa'#231#227'o Caixa'
  end
  object quCaixas: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select *, '
      'SaldoCaixa(id, DataCaixa(id)) as Saldo,'
      'DataCaixa(id) as Data, '
      'SituacaoCaixa(id) as Situacao'
      'from caixas'
      'where id = :CAIXAID;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
  end
  object dsCaixas: TDataSource
    DataSet = quCaixas
    Left = 320
    Top = 40
  end
  object quControleCaixa: TZqueryValidation
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from controle_caixas where false;')
    Params = <>
    Left = 328
    Top = 584
  end
  object dsMoedasControle: TDataSource
    DataSet = quMoedasControle
    Left = 32
    Top = 384
  end
  object dsControleCaixa: TDataSource
    DataSet = quControleCaixa
    Left = 296
    Top = 584
  end
  object quMoedas: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select  * from moedas;')
    Params = <>
    Left = 136
    Top = 384
  end
  object dsMoedas: TDataSource
    DataSet = quMoedas
    Left = 168
    Top = 384
  end
  object quMoedasControle: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'moeda_id'
        DataType = ftInteger
      end
      item
        Name = 'quantidade'
        DataType = ftInteger
      end
      item
        Name = 'total'
        DataType = ftFloat
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 384
    Data = {
      5A0000009619E0BD0100000018000000040000000000030000005A00086D6F65
      64615F696404000100000000000A7175616E7469646164650400010000000000
      05746F74616C08000400000000000576616C6F7208000400000000000000}
  end
end
