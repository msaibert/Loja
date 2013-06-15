object frRelatorioCaixa: TfrRelatorioCaixa
  Left = 0
  Top = 0
  Caption = 'frRelatorioCaixa'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fqSQL: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = quRelatorio
    BCDToCurrency = False
    Left = 248
    Top = 104
  end
  object rpRelatorio: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41426.111708044000000000
    ReportOptions.LastChange = 41426.120096666670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 432
    Top = 136
    Datasets = <
      item
        DataSet = fqSQL
        DataSetName = 'frxDBDataset1'
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
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = fqSQL
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1tipo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 7.559060000000000000
          Top = 7.559060000000003000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tipo'
          DataSet = fqSQL
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."tipo"]')
          SuppressRepeated = True
        end
        object frxDBDataset1data: TfrxMemoView
          Left = 154.960730000000000000
          Top = 7.559060000000003000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'data'
          DataSet = fqSQL
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = 'mm/dd/yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[frxDBDataset1."data"]')
          SuppressRepeated = True
        end
        object frxDBDataset1extenso: TfrxMemoView
          Left = 241.889920000000000000
          Top = 7.559060000000003000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'extenso'
          DataSet = fqSQL
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."extenso"]')
        end
        object frxDBDataset1valor: TfrxMemoView
          Left = 464.882190000000000000
          Top = 7.559060000000003000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor'
          DataSet = fqSQL
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxDBDataset1."valor"]')
        end
        object frxDBDataset1quantidade: TfrxMemoView
          Left = 551.811380000000000000
          Top = 7.559060000000003000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'quantidade'
          DataSet = fqSQL
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxDBDataset1."quantidade"]')
        end
        object frxDBDataset1todal_moeda: TfrxMemoView
          Left = 634.961040000000000000
          Top = 7.559060000000003000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'todal_moeda'
          DataSet = fqSQL
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxDBDataset1."todal_moeda"]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 616.063390000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."todal_moeda">,MasterData1)]')
        end
      end
    end
  end
  object quRelatorio: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select '
      
        #9'CASE controle_caixas.tipo WHEN '#39'A'#39' THEN '#39'Abertura do Caixa'#39' ELS' +
        'E '#39'Fechamento do Caixa'#39' END as Tipo,'
      #9'controle_caixas.data,'
      #9'moedas.extenso, '
      #9'moedas.valor,'
      #9'controle_caixa_moedas.quantidade,'
      #9'moedas.valor * controle_caixa_moedas.quantidade as todal_moeda'
      'from '
      #9'controle_caixas '
      'left join'
      #9'controle_caixa_moedas on '
      
        #9#9#9#9'(controle_caixas.id = controle_caixa_moedas.controle_caixa_i' +
        'd)'
      'join moedas on '
      #9#9#9#9'(controle_caixa_moedas.moeda_id = moedas.id)'
      'where controle_caixas.data = '#39'2013-05-28'#39
      
        'order by controle_caixas.tipo, controle_caixas.data, moedas.valo' +
        'r')
    Params = <>
    Left = 336
    Top = 184
  end
end
