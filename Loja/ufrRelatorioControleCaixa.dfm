object frRelatorioControleCaixa: TfrRelatorioControleCaixa
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Controle Caixa'
  ClientHeight = 98
  ClientWidth = 504
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
  object edData: TcxDateEdit
    Left = 63
    Top = 43
    TabOrder = 0
    Width = 121
  end
  object lcCaixa: TcxLookupComboBox
    Left = 63
    Top = 16
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
    TabOrder = 1
    Width = 433
  end
  object btExibirRelatorio: TcxButton
    Left = 421
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 2
    OnClick = btExibirRelatorioClick
  end
  object lbCaixa: TcxLabel
    Left = 30
    Top = 17
    Caption = 'Caixa'
  end
  object lbData: TcxLabel
    Left = 34
    Top = 44
    Caption = 'Data'
  end
  object quCaixa: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from caixas')
    Params = <>
    Left = 432
    Top = 16
  end
  object dsCaixa: TDataSource
    DataSet = quCaixa
    Left = 464
    Top = 16
  end
  object rpCaixa: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41449.929048298600000000
    ReportOptions.LastChange = 41453.977818368100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 304
    Top = 56
    Datasets = <
      item
        DataSet = fqAbertura
        DataSetName = 'frxDBAbertura'
      end
      item
        DataSet = fqFechamento
        DataSetName = 'frxDBFechamento'
      end
      item
        DataSet = fqHeader
        DataSetName = 'frxDBHeader'
      end
      item
        DataSet = fqMovimentacoes
        DataSetName = 'frxDBMovimentacoes'
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
      object MasterDataHeader: TfrxMasterData
        Height = 83.149660000000000000
        Top = 120.944960000000000000
        Width = 718.110700000000000000
        DataSet = fqHeader
        DataSetName = 'frxDBHeader'
        KeepHeader = True
        RowCount = 0
        object frxDBHeaderdescricao: TfrxMemoView
          Left = 71.811070000000000000
          Top = 3.779529999999994000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'descricao'
          DataSet = fqHeader
          DataSetName = 'frxDBHeader'
          Memo.UTF8W = (
            '[frxDBHeader."descricao"]')
        end
        object frxDBHeaderdata_solicitada: TfrxMemoView
          Left = 521.575140000000000000
          Top = 3.779529999999994000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'data_solicitada'
          DataSet = fqHeader
          DataSetName = 'frxDBHeader'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBHeader."data_solicitada"]')
          ParentFont = False
        end
        object frxDBHeadernome: TfrxMemoView
          Left = 71.811070000000000000
          Top = 26.456710000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nome'
          DataSet = fqHeader
          DataSetName = 'frxDBHeader'
          Memo.UTF8W = (
            '[frxDBHeader."nome"]')
        end
        object frxDBHeadersaldo: TfrxMemoView
          Left = 521.575140000000000000
          Top = 26.456710000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fqHeader
          DataSetName = 'frxDBHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value <> SUM(<frxDBFechamento."total">,DetailDataFechamento)'
          Memo.UTF8W = (
            '[frxDBHeader."saldo"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 60.472480000000000000
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
        object Memo3: TfrxMemoView
          Left = 442.205010000000000000
          Top = 3.779529999999994000
          Width = 71.811070000000000000
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
        object Memo4: TfrxMemoView
          Left = 442.205010000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo em [frxDBHeader."data_solicitada"]:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 442.205010000000000000
          Top = 49.133889999999990000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo em [frxDBHeader."dia_anterior"]:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 521.575140000000000000
          Top = 49.133889999999990000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fqHeader
          DataSetName = 'frxDBHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value <> SUM(<frxDBAbertura."total">,DetailDataAbertura)'
          Memo.UTF8W = (
            '[frxDBHeader."saldo_anterior"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 702.992580000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Movimenta'#231#227'o completa do caixa')
          ParentFont = False
        end
      end
      object DetailDataFechamento: TfrxDetailData
        Height = 20.787401574803100000
        Top = 676.535870000000000000
        Width = 718.110700000000000000
        DataSet = fqFechamento
        DataSetName = 'frxDBFechamento'
        RowCount = 0
        object frxDBFechamentoextenso: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.559060000000045000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'extenso'
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBFechamento."extenso"]')
          ParentFont = False
        end
        object frxDBFechamentovalor: TfrxMemoView
          Left = 287.244280000000000000
          Top = 1.559060000000045000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor'
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFechamento."valor"]')
          ParentFont = False
        end
        object frxDBFechamentoquantidade: TfrxMemoView
          Left = 415.748300000000000000
          Top = 1.559060000000045000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'quantidade'
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBFechamento."quantidade"]')
          ParentFont = False
        end
        object frxDBFechamentoquantidade1: TfrxMemoView
          Left = 597.165740000000000000
          Top = 1.559060000000045000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'quantidade'
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBFechamento."quantidade"]')
          ParentFont = False
        end
      end
      object DetailDataAbertura: TfrxDetailData
        Height = 20.787401574803100000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        DataSet = fqAbertura
        DataSetName = 'frxDBAbertura'
        RowCount = 0
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBAbertura."extenso"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 287.244280000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAbertura."valor"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 415.748300000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBAbertura."quantidade"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 597.165740000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fqFechamento
          DataSetName = 'frxDBFechamento'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBAbertura."quantidade"]')
          ParentFont = False
        end
      end
      object HeaderAbertura: TfrxHeader
        Height = 56.692950000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.236239999999810000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Extenso')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 287.244280000000000000
          Top = 30.236239999999810000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 30.236239999999810000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 597.165740000000000000
          Top = 30.236239999999810000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000051000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valores informados na abertura')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object HeaderFechamento: TfrxHeader
        Height = 56.692950000000000000
        Top = 597.165740000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.236239999999960000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Extenso')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 287.244280000000000000
          Top = 30.236239999999960000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 415.748300000000000000
          Top = 30.236239999999960000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 597.165740000000000000
          Top = 30.236239999999960000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valores informados no fechamento')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 3.779530000000000000
          Top = 52.913419999999970000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object DetailDataMovimentacao: TfrxDetailData
        Height = 20.787401574803100000
        Top = 491.338900000000000000
        Width = 718.110700000000000000
        DataSet = fqMovimentacoes
        DataSetName = 'frxDBMovimentacoes'
        RowCount = 0
        object frxDBMovimentacoesvenda_id: TfrxMemoView
          Left = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'venda_id'
          DataSet = fqMovimentacoes
          DataSetName = 'frxDBMovimentacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacoes."venda_id"]')
          ParentFont = False
        end
        object frxDBMovimentacoesdescricao: TfrxMemoView
          Left = 102.047310000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'descricao'
          DataSet = fqMovimentacoes
          DataSetName = 'frxDBMovimentacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacoes."descricao"]')
          ParentFont = False
        end
        object frxDBMovimentacoesvalor: TfrxMemoView
          Left = 464.882190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor'
          DataSet = fqMovimentacoes
          DataSetName = 'frxDBMovimentacoes'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacoes."valor"]')
          ParentFont = False
        end
        object frxDBMovimentacoesvalor_desconto: TfrxMemoView
          Left = 551.811380000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor_desconto'
          DataSet = fqMovimentacoes
          DataSetName = 'frxDBMovimentacoes'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacoes."valor_desconto"]')
          ParentFont = False
        end
        object frxDBMovimentacoesdata: TfrxMemoView
          Left = 377.953000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'data'
          DataSet = fqMovimentacoes
          DataSetName = 'frxDBMovimentacoes'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacoes."data"]')
          ParentFont = False
        end
        object frxDBMovimentacoesvalor_total: TfrxMemoView
          Left = 634.961040000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor_total'
          DataSet = fqMovimentacoes
          DataSetName = 'frxDBMovimentacoes'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMovimentacoes."valor_total"]')
          ParentFont = False
        end
      end
      object HeaderMovimentacao: TfrxHeader
        Height = 56.692950000000000000
        Top = 411.968770000000000000
        Width = 718.110700000000000000
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.236240000000010000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186' Venda')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 102.047310000000000000
          Top = 30.236240000000010000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Opera'#231#227'o')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 377.953000000000000000
          Top = 30.236240000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Movimenta'#231#227'o do dia')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 464.882190000000000000
          Top = 30.236240000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 551.811380000000000000
          Top = 30.236240000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 634.961040000000000000
          Top = 30.236240000000010000
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
            'Total')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 3.779530000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 3.779530000000000000
          Top = 52.913419999999970000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object FooterAbertura: TfrxFooter
        Height = 37.795275590000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 606.165740000000000000
          Top = 4.000000000000000000
          Width = 105.826840000000000000
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
            '[SUM(<frxDBAbertura."total">,DetailDataAbertura)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 506.457020000000000000
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
            'Total:')
          ParentFont = False
        end
      end
      object FooterMovimentacao: TfrxFooter
        Height = 37.795275590000000000
        Top = 536.693260000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 606.165740000000000000
          Top = 5.000000000000000000
          Width = 94.488250000000000000
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
            '[SUM(<frxDBMovimentacoes."valor_total">,DetailDataMovimentacao)]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          Left = 506.457020000000000000
          Top = 5.000000000000000000
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
            'Total:')
          ParentFont = False
        end
      end
      object FooterFechamento: TfrxFooter
        Height = 30.236240000000000000
        Top = 721.890230000000000000
        Width = 718.110700000000000000
        PrintChildIfInvisible = True
        object SysMemo4: TfrxSysMemoView
          Left = 608.504330000000000000
          Top = 6.000000000000000000
          Width = 105.826840000000000000
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
            '[SUM(<frxDBFechamento."total">,DetailDataFechamento)]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Left = 506.457020000000000000
          Top = 6.000000000000000000
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
            'Total:')
          ParentFont = False
        end
      end
    end
  end
  object fqAbertura: TfrxDBDataset
    UserName = 'frxDBAbertura'
    CloseDataSource = False
    DataSet = quAbertura
    BCDToCurrency = False
    Left = 32
    Top = 104
  end
  object quAbertura: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select '
      #9'moedas.extenso, '
      #9'moedas.valor,'
      #9'controle.quantidade,'
      #9'controle.total'
      'from '
      
        #9'controle_caixa_moedas as controle join moedas on (controle.moed' +
        'a_id = moedas.id)'
      'join'
      
        #9'controle_caixas on (controle.controle_caixa_id = controle_caixa' +
        's.id)'
      'where '
      #9'controle_caixas.tipo = '#39'A'#39' and'
      #9'controle_caixas.data = :DATA and'
      #9'controle_caixas.caixa_id = :CAIXAID;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
  end
  object fqHeader: TfrxDBDataset
    UserName = 'frxDBHeader'
    CloseDataSource = False
    DataSet = quHeader
    BCDToCurrency = False
    Left = 24
    Top = 160
  end
  object quHeader: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select '
      #9'caixas.descricao,'
      #9'CAST( :DATA as date) as data_solicitada,'
      #9'saldocaixa(caixas.id, cast(:DATA as date)) as saldo,'
      #9'cast( :DATA AS date)-1 as dia_anterior,'
      
        #9'saldocaixa(caixas.id, cast( :DATA as date)-1) as saldo_anterior' +
        ','
      #9'pessoas.nome'
      'from caixas '
      'join usuarios on (caixas.usuario_id = usuarios.id)'
      'join pessoas on (usuarios.pessoa_id = pessoas.id)'
      'where'
      #9'caixas.id = :CAIXAID;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
  end
  object fqMovimentacoes: TfrxDBDataset
    UserName = 'frxDBMovimentacoes'
    CloseDataSource = False
    DataSet = quMovimentacoes
    BCDToCurrency = False
    Left = 160
    Top = 112
  end
  object quMovimentacoes: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select '
      #9'movimento_caixa.venda_id,'
      #9'operacoes.descricao,'
      #9'coalesce(movimento_caixa.valor, 0) as valor,'
      #9'coalesce(movimento_caixa.valor_desconto, 0) as valor_desconto,'
      
        #9'coalesce(movimento_caixa.valor, 0) - coalesce(movimento_caixa.v' +
        'alor_desconto, 0) as valor_total,'
      #9'movimento_caixa.data'
      'from movimento_caixa '
      'join operacoes on (movimento_caixa.operacao_id = operacoes.id)'
      'where '
      #9'movimento_caixa.data = :DATA and'
      #9'movimento_caixa.caixa_id = :CAIXAID;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
  end
  object fqFechamento: TfrxDBDataset
    UserName = 'frxDBFechamento'
    CloseDataSource = False
    DataSet = quFechamento
    BCDToCurrency = False
    Left = 160
    Top = 160
  end
  object quFechamento: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select '
      #9'moedas.extenso, '
      #9'moedas.valor,'
      #9'controle.quantidade,'
      #9'controle.total'
      'from '
      
        #9'controle_caixa_moedas as controle join moedas on (controle.moed' +
        'a_id = moedas.id)'
      'join'
      
        #9'controle_caixas on (controle.controle_caixa_id = controle_caixa' +
        's.id)'
      'where '
      #9'controle_caixas.tipo = '#39'F'#39' and'
      #9'controle_caixas.data =  :DATA and'
      #9'controle_caixas.caixa_id = :CAIXAID;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXAID'
        ParamType = ptUnknown
      end>
  end
end
