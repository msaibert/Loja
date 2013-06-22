object frPagarPendencias: TfrPagarPendencias
  Left = 0
  Top = 0
  Caption = 'Pagamento de Pend'#234'ncias'
  ClientHeight = 623
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 448
    Top = 328
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 81
    Align = alTop
    TabOrder = 0
    DesignSize = (
      907
      81)
    object lbPessoa: TLabel
      Left = 11
      Top = 15
      Width = 173
      Height = 13
      Caption = 'Pesquise aqui pelo nome da pessoa:'
    end
    object gbValorPagamento: TGroupBox
      Left = 717
      Top = 15
      Width = 178
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Valor Pagamento'
      TabOrder = 1
      object edValorPagamento: TcxCurrencyEdit
        Left = 12
        Top = 16
        TabOrder = 0
        OnExit = edValorPagamentoExit
        Width = 159
      end
    end
    object lcPessoas: TcxLookupComboBox
      Left = 11
      Top = 31
      Anchors = [akLeft, akTop, akRight]
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
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsPessoa
      Properties.OnChange = lcPessoasPropertiesChange
      TabOrder = 0
      Width = 692
    end
  end
  object pnFooter: TPanel
    Left = 0
    Top = 512
    Width = 907
    Height = 111
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      907
      111)
    object lbOperacao: TLabel
      Left = 11
      Top = 14
      Width = 47
      Height = 13
      Caption = 'Opera'#231#227'o'
    end
    object lbCaixa: TLabel
      Left = 31
      Top = 41
      Width = 27
      Height = 13
      Caption = 'Caixa'
    end
    object btControleCaixa: TcxButton
      Left = 796
      Top = 36
      Width = 99
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Controle de Caixa'
      Enabled = False
      TabOrder = 0
      OnClick = btControleCaixaClick
    end
    object btPagar: TcxButton
      Left = 796
      Top = 81
      Width = 99
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'Pagar'
      TabOrder = 1
      OnClick = btPagarClick
    end
    object lcCaixa: TcxLookupComboBox
      Left = 64
      Top = 38
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
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
      Properties.ListSource = dsCaixa
      TabOrder = 2
      Width = 726
    end
    object lcOperacao: TcxLookupComboBox
      Left = 64
      Top = 11
      Anchors = [akLeft, akTop, akRight]
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
      Properties.ListSource = dsOperacoes
      Properties.OnChange = lcOperacaoPropertiesChange
      TabOrder = 3
      Width = 831
    end
  end
  object gdPendencias: TcxGrid
    Left = 0
    Top = 81
    Width = 907
    Height = 431
    Align = alClient
    TabOrder = 2
    object grPendencias: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsPendencias
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'R$ ,0.00;-R$ ,0.00'
          Kind = skSum
          Column = clPendenciassaldo
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object clPendenciasnome: TcxGridDBColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'nome'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Sorting = False
        Width = 250
      end
      object clPendenciasvenda_id: TcxGridDBColumn
        Caption = 'N'#250'mero da venda'
        DataBinding.FieldName = 'venda_id'
        Visible = False
        GroupIndex = 0
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Sorting = False
      end
      object clPendenciasdata_compra: TcxGridDBColumn
        Caption = 'Data da compra'
        DataBinding.FieldName = 'data_compra'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Sorting = False
      end
      object clPendenciasultimo_pgto_venda: TcxGridDBColumn
        Caption = #218'ltimo pagamento'
        DataBinding.FieldName = 'ultimo_pgto_venda'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Sorting = False
      end
      object clPendenciassaldo: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'saldo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Sorting = False
      end
      object clPendenciasPagamento: TcxGridDBColumn
        Caption = 'Pagamento'
        DataBinding.FieldName = 'pagamento'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.Sorting = False
      end
      object clRelatorioItens: TcxGridDBColumn
        Caption = 'Relat'#243'rio'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Caption = 'Itens'
            Default = True
            Kind = bkText
          end>
        Properties.ViewStyle = vsButtonsAutoWidth
        Properties.OnButtonClick = clRelatorioItensPropertiesButtonClick
        Options.ShowEditButtons = isebAlways
      end
    end
    object glPendencias: TcxGridLevel
      GridView = grPendencias
    end
  end
  object quPendencias: TZQuery
    Connection = dmConexao.connectionSistema
    Filter = 'FALSE'
    Filtered = True
    CachedUpdates = True
    SQL.Strings = (
      'select '
      #9'pessoas.id as pessoa_id,'
      #9'pessoas.nome, '
      #9'movimento_pendencia.venda_id, '
      #9'min(data) as data_compra, '
      #9'max(data) as ultimo_pgto_venda,'
      
        #9'sum(case operacoes.tipo_pendencia when '#39'D'#39' then -valor else val' +
        'or end) as saldo'
      'from '
      #9'movimento_pendencia '
      'join'
      #9'operacoes on '
      #9#9'(movimento_pendencia.operacao_id = operacoes.id)'
      'join'
      #9'pessoas on '
      #9#9'(movimento_pendencia.pessoa_id = pessoas.id)'
      'group by pessoas.id, movimento_pendencia.venda_id, pessoas.nome'
      
        'having sum(case operacoes.tipo_pendencia when '#39'D'#39' then -valor el' +
        'se valor end) <> 0'
      'order by 3, 4;')
    Params = <>
    Left = 584
    Top = 224
  end
  object dsPendencias: TDataSource
    DataSet = cdPendencias
    Left = 544
    Top = 224
  end
  object quPessoa: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from pessoas;')
    Params = <>
    Left = 664
    Top = 24
  end
  object dsPessoa: TDataSource
    DataSet = quPessoa
    Left = 624
    Top = 24
  end
  object quPagar: TZqueryValidation
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from movimento_pendencia where false;')
    Params = <>
    Left = 592
    Top = 280
  end
  object quCaixa: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from caixas;')
    Params = <>
    Left = 728
    Top = 552
  end
  object dsCaixa: TDataSource
    DataSet = quCaixa
    Left = 764
    Top = 552
  end
  object quOperacoes: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      
        'select * from operacoes where movimentar_pendencia and (not movi' +
        'mentar_estoque);')
    Params = <>
    Left = 832
    Top = 520
  end
  object dsOperacoes: TDataSource
    DataSet = quOperacoes
    Left = 860
    Top = 520
  end
  object dsPagar: TDataSource
    DataSet = quPagar
    Left = 552
    Top = 280
  end
  object cdPendencias: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 504
    Top = 224
    Data = {
      BA0000009619E0BD010000001800000006000000000003000000BA000876656E
      64615F69640400010000000000046E6F6D650100490000000100055749445448
      0200020014000B646174615F636F6D707261040006000000000011756C74696D
      6F5F7067746F5F76656E646104000600000000000573616C646F080004000000
      010007535542545950450200490006004D6F6E65790009706167616D656E746F
      080004000000010007535542545950450200490006004D6F6E6579000000}
    object afPendenciassoma: TAggregateField
      FieldName = 'soma'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(pagamento)'
    end
  end
  object fqRelatorioItens: TfrxDBDataset
    UserName = 'frxDBItens'
    CloseDataSource = False
    DataSet = quRelatorioItens
    BCDToCurrency = False
    Left = 848
    Top = 160
  end
  object quRelatorioItens: TZQuery
    Connection = dmConexao.connectionSistema
    Filter = 'FALSE'
    SQL.Strings = (
      'select '
      #9'venda_itens.venda_id, '
      #9'produtos.descricao as produto,'
      #9'venda_itens.valor_unitario,'
      #9'venda_itens.quantidade,'
      
        #9'venda_itens.valor_unitario * venda_itens.quantidade as sub_tota' +
        'l_produto,'
      #9'venda_itens.valor_desconto as desconto_no_item'
      'from venda_itens '
      'join produtos on (venda_itens.produto_id = produtos.id)'
      'where venda_itens.venda_id = :VENDAID;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'VENDAID'
        ParamType = ptUnknown
      end>
    Left = 808
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VENDAID'
        ParamType = ptUnknown
      end>
  end
  object rpItens: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41446.939609328700000000
    ReportOptions.LastChange = 41446.939609328700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 848
    Top = 208
    Datasets = <
      item
        DataSet = fqRelatorioItens
        DataSetName = 'frxDBItens'
      end
      item
        DataSet = fqTeste
        DataSetName = 'frxDBVenda'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object MasterData1: TfrxMasterData
        Height = 294.803340000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        DataSet = fqTeste
        DataSetName = 'frxDBVenda'
        RowCount = 0
        object frxDBVendaid: TfrxMemoView
          Left = 124.708720000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          Memo.UTF8W = (
            '[frxDBVenda."id"]')
        end
        object frxDBVendadata: TfrxMemoView
          Left = 321.244280000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'data'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          Memo.UTF8W = (
            '[frxDBVenda."data"]')
        end
        object frxDBVendaoperacao: TfrxMemoView
          Left = 124.708720000000000000
          Top = 26.456709999999990000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'operacao'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          Memo.UTF8W = (
            '[frxDBVenda."operacao"]')
        end
        object frxDBVendaformapgto: TfrxMemoView
          Left = 124.708720000000000000
          Top = 49.133890000000010000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'formapgto'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          Memo.UTF8W = (
            '[frxDBVenda."formapgto"]')
        end
        object frxDBVendausuario: TfrxMemoView
          Left = 124.708720000000000000
          Top = 71.811070000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'usuario'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          Memo.UTF8W = (
            '[frxDBVenda."usuario"]')
        end
        object frxDBVendavalor_total: TfrxMemoView
          Left = 167.724490000000000000
          Top = 129.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor_total'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVenda."valor_total"]')
          ParentFont = False
        end
        object frxDBVendavalor_pago: TfrxMemoView
          Left = 167.724490000000000000
          Top = 156.181200000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor_pago'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVenda."valor_pago"]')
          ParentFont = False
        end
        object frxDBVendadesconto_na_compra: TfrxMemoView
          Left = 167.724490000000000000
          Top = 206.094620000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'desconto_na_compra'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVenda."desconto_na_compra"]')
          ParentFont = False
        end
        object frxDBVendavalor_pendente: TfrxMemoView
          Left = 167.724490000000000000
          Top = 232.551330000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor_pendente'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVenda."valor_pendente"]')
          ParentFont = False
        end
        object frxDBVendacaixa: TfrxMemoView
          Left = 124.708720000000000000
          Top = 96.267779999999990000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'caixa'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          Memo.UTF8W = (
            '[frxDBVenda."caixa"]')
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'N'#250'mero:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 215.417440000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456709999999990000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Opera'#231#227'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000010000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Forma de Pgto.:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 71.811070000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Atendente:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 96.267779999999990000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Caixa:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 46.779530000000000000
          Top = 129.724490000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor TOTAL:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 8.984230000000000000
          Top = 156.181200000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor PAGO NA DATA:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 12.763760000000000000
          Top = 206.094620000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor DESCONTO:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 39.220470000000000000
          Top = 232.551330000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor PENDENTE:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 167.724490000000000000
          Top = 181.417440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor_pago_posteriormente'
          DataSet = fqTeste
          DataSetName = 'frxDBVenda'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVenda."valor_pago_posteriormente"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 8.984230000000000000
          Top = 181.417440000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor PAGO POSTER.:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 7.559060000000000000
          Top = 271.787570000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 366.614410000000000000
          Top = 271.787570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 453.543600000000000000
          Top = 271.787570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Un.:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 540.472790000000000000
          Top = 271.787570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 627.401980000000000000
          Top = 271.787570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Sub-Total:')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 260.787570000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object DetailData1: TfrxDetailData
        Height = 34.015770000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        DataSet = fqRelatorioItens
        DataSetName = 'frxDBItens'
        RowCount = 0
        object frxDBItensproduto: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'produto'
          DataSet = fqRelatorioItens
          DataSetName = 'frxDBItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBItens."produto"]')
          ParentFont = False
        end
        object frxDBItensquantidade: TfrxMemoView
          Left = 366.614410000000000000
          Top = 7.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'quantidade'
          DataSet = fqRelatorioItens
          DataSetName = 'frxDBItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."quantidade"]')
          ParentFont = False
        end
        object frxDBItensvalor_unitario: TfrxMemoView
          Left = 453.543600000000000000
          Top = 7.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor_unitario'
          DataSet = fqRelatorioItens
          DataSetName = 'frxDBItens'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."valor_unitario"]')
          ParentFont = False
        end
        object frxDBItenssub_total_produto: TfrxMemoView
          Left = 627.401980000000000000
          Top = 7.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fqRelatorioItens
          DataSetName = 'frxDBItens'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."sub_total_produto"]')
          ParentFont = False
        end
        object frxDBItensdesconto_no_item: TfrxMemoView
          Left = 540.472790000000000000
          Top = 7.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'desconto_no_item'
          DataSet = fqRelatorioItens
          DataSetName = 'frxDBItens'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."desconto_no_item"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000001000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Compra')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 34.015770000000000000
        Top = 536.693260000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 359.055350000000000000
          Top = 7.559060000000045000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total da Compra: [SUM(<frxDBItens."sub_total_produto">,DetailDat' +
              'a1)]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object fqTeste: TfrxDBDataset
    UserName = 'frxDBVenda'
    CloseDataSource = False
    DataSet = quRelatorioVenda
    BCDToCurrency = False
    Left = 848
    Top = 120
  end
  object quRelatorioVenda: TZQuery
    Connection = dmConexao.connectionSistema
    Filter = 'FALSE'
    SQL.Strings = (
      'select '
      #9'vendas.id,'
      #9'vendas.data, '
      #9'operacoes.descricao as operacao,'
      #9'formas_de_pagamento.descricao as formapgto,'
      #9'pessoa_usuario.nome as usuario, '
      #9'vendas.valor_total,'
      #9'vendas.valor_pago,'
      #9'vendas.valor_desconto as desconto_na_compra,'
      #9'vendas.valor_pendente,'
      
        #9'(select sum(movimento_pendencia.valor) from movimento_pendencia' +
        ' join operacoes o on (o.id = movimento_pendencia.operacao_id) wh' +
        'ere movimento_pendencia.venda_id = vendas.id) valor_pago_posteri' +
        'ormente,'
      #9'caixas.descricao as caixa'
      'from vendas'
      'join operacoes on (vendas.operacao_id = operacoes.id)'
      
        'left join formas_de_pagamento on (vendas.forma_pagamento_id = fo' +
        'rmas_de_pagamento.id)'
      'join caixas on (vendas.caixa_id = caixas.id)'
      'join usuarios on (vendas.usuario_id = usuarios.id)'
      
        'join pessoas  as pessoa_usuario on (usuarios.pessoa_id = pessoa_' +
        'usuario.id)'
      'where vendas.id = :VENDAID;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'VENDAID'
        ParamType = ptUnknown
      end>
    Left = 808
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VENDAID'
        ParamType = ptUnknown
      end>
  end
end
