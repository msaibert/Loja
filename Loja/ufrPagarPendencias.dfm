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
      TabOrder = 0
      OnExit = lcPessoasExit
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
      TabOrder = 3
      OnExit = lcOperacaoExit
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
      #9'pessoas.id,'
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
    object ifPendenciasid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object quPendenciasnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 120
    end
    object ifPendenciasvenda_id1: TIntegerField
      FieldName = 'venda_id'
    end
    object dfPendenciasdata_compra1: TDateField
      FieldName = 'data_compra'
      ReadOnly = True
    end
    object dfPendenciasultimo_pgto_venda: TDateField
      FieldName = 'ultimo_pgto_venda'
      ReadOnly = True
    end
    object ffPendenciassaldo1: TFloatField
      FieldName = 'saldo'
      ReadOnly = True
    end
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
    Left = 584
    Top = 176
  end
  object dsPessoa: TDataSource
    DataSet = quPessoa
    Left = 544
    Top = 176
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
    Left = 352
    Top = 280
  end
  object dsCaixa: TDataSource
    DataSet = quCaixa
    Left = 388
    Top = 288
  end
  object quOperacoes: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      
        'select * from operacoes where movimentar_pendencia and (not movi' +
        'mentar_estoque);')
    Params = <>
    Left = 352
    Top = 240
  end
  object dsOperacoes: TDataSource
    DataSet = quOperacoes
    Left = 388
    Top = 248
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
  object fqItens: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = quItens
    BCDToCurrency = False
    Left = 848
    Top = 160
  end
  object rpItens: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41433.570609976850000000
    ReportOptions.LastChange = 41433.570609976850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 848
    Top = 208
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object quItens: TZQuery
    Connection = dmConexao.connectionSistema
    Filter = 'FALSE'
    Filtered = True
    SQL.Strings = (
      'select '
      #9'vendas.data, '
      #9'operacoes.descricao,'
      #9'formas_de_pagamento.descricao,'
      #9'pessoa_usuario.nome as usuario'
      #9'vendas.valor_total,'
      #9'vendas.valor_pago,'
      #9'vendas.valor_desconto as desconto_na_compra,'
      #9'vendas.valor_pendente,'
      
        #9'(select sum(movimento_pendencia.valor) from movimento_pendencia' +
        ' join operacoes o on (o.id = movimento_pendencia.operacao_id) wh' +
        'ere movimento_pendencia.venda_id = vendas.id) valor_pago_posteri' +
        'ormente,'
      #9'caixas.descricao,'
      #9'produtos.descricao,'
      #9'venda_itens.valor_unitario,'
      #9'venda_itens.quantidade,'
      
        #9'venda_itens.valor_unitario * venda_itens.quantidade as sub_tota' +
        'l_produto,'
      #9'venda_itens.valor_desconto as desconto_no_item'
      'from vendas'
      'join venda_itens on (vendas.id = venda_itens.venda_id)'
      'join operacoes on (vendas.operacao_id = operacoes.id)'
      
        'left join formas_de_pagamento on (vendas.forma_pagamento_id = fo' +
        'rmas_de_pagamento.id)'
      'join caixas on (vendas.caixa_id = caixas.id)'
      'join produtos on (venda_itens.produto_id = produtos.id)'
      'join usuarios on (vendas.usuario_id = usuarios.id)'
      
        'join pessoas  as pessoa_usuario on (usuarios.pessoa_id = pessoa_' +
        'usuario.id);')
    Params = <>
    Left = 808
    Top = 160
  end
  object dsItens: TDataSource
    DataSet = quItens
    Left = 808
    Top = 208
  end
end
