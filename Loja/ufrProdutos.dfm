inherited frProdutos: TfrProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 260
  ExplicitWidth = 651
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 13
  inherited nvDados: TcxDBNavigator
    Left = 353
    Top = 219
    Width = 240
    TabOrder = 10
    ExplicitLeft = 353
    ExplicitTop = 219
    ExplicitWidth = 240
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
    Left = 70
    Top = 68
    Caption = 'C'#243'digo'
  end
  object lbPrecoFinal: TcxLabel [4]
    Left = 51
    Top = 145
    Caption = 'Pre'#231'o Final'
  end
  object edPrecoFinal: TcxDBCurrencyEdit [5]
    Left = 113
    Top = 141
    DataBinding.DataField = 'preco_final'
    DataBinding.DataSource = dsDados
    TabOrder = 5
    Width = 121
  end
  object lbCategoria: TcxLabel [6]
    Left = 56
    Top = 118
    Caption = 'Categoria'
  end
  object lbDescricao: TcxLabel [7]
    Left = 57
    Top = 93
    Caption = 'Descri'#231#227'o'
  end
  object edCodigo: TcxDBTextEdit [8]
    Left = 113
    Top = 64
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsDados
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object edDescricao: TcxDBTextEdit [9]
    Left = 113
    Top = 89
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsDados
    TabOrder = 3
    Width = 480
  end
  object lcCategoria: TcxDBLookupComboBox [10]
    Left = 113
    Top = 114
    DataBinding.DataField = 'categoria_id'
    DataBinding.DataSource = dsDados
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'descricao'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListSource = dsCategoria
    TabOrder = 4
    Width = 480
  end
  object btRelatorio: TcxButton [11]
    Left = 472
    Top = 188
    Width = 121
    Height = 25
    Caption = 'Relat'#243'rio de Produtos'
    TabOrder = 11
    OnClick = btRelatorioClick
  end
  inherited quDados: TZqueryValidation
    SQL.Strings = (
      'select * from produtos;')
  end
  object quCategoria: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from categorias_produtos;')
    Params = <>
    Left = 16
    Top = 160
  end
  object dsCategoria: TDataSource
    DataSet = quCategoria
    Left = 48
    Top = 160
  end
  object rpProdutos: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41409.040598888900000000
    ReportOptions.LastChange = 41409.056869050910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 408
    Top = 176
    Datasets = <
      item
        DataSet = fqRelatorio
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = fqRelatorio
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1id: TfrxMemoView
          Left = 3.779530000000000000
          Top = 5.338590000000011000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id'
          DataSet = fqRelatorio
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."id"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 90.708720000000000000
          Top = 5.338590000000011000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'descricao'
          DataSet = fqRelatorio
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."descricao"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 380.630180000000000000
          Top = 5.338590000000011000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'preco_final'
          DataSet = fqRelatorio
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."preco_final"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 482.677490000000000000
          Top = 5.338590000000011000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'categoria'
          DataSet = fqRelatorio
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."categoria"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 623.622450000000000000
          Top = 5.338590000000011000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qtdestoque'
          DataSet = fqRelatorio
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."qtdestoque"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object mmTitulo: TfrxMemoView
          Left = 3.779530000000000000
          Top = 34.015770000000010000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio geral de produtos')
          ParentFont = False
        end
        object smData: TfrxSysMemoView
          Left = 22.677180000000000000
          Top = 7.559059999999999000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 608.504330000000000000
          Top = 7.559059999999999000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 90.708720000000000000
          Top = 71.811070000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 380.630180000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pre'#231'o Final')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 482.677490000000000000
          Top = 71.811070000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 623.622450000000000000
          Top = 71.811070000000000000
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
            'Em Estoque')
          ParentFont = False
        end
      end
    end
  end
  object fqRelatorio: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = quRelatorio
    BCDToCurrency = False
    Left = 368
    Top = 176
  end
  object quRelatorio: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select '
      #9'produtos.id, '
      #9'produtos.descricao, '
      #9'produtos.preco_final,  '
      #9'categorias_produtos.descricao as categoria, '
      
        #9'(select sum(case operacoes.tipo_estoque when '#39'S'#39' then -quantida' +
        'de else quantidade end) from movimento_estoque join operacoes on' +
        ' (movimento_estoque.operacao_id = operacoes.id) where produto_id' +
        ' = produtos.id) as qtdestoque'
      'from '
      #9'produtos '
      'join'
      
        #9'categorias_produtos on (produtos.categoria_id = categorias_prod' +
        'utos.id)'
      'order by 1'#9)
    Params = <>
    Left = 328
    Top = 176
  end
end
