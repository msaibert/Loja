object frCancelarItem: TfrCancelarItem
  Left = 0
  Top = 0
  Caption = 'frCancelarItem'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object gdCancelarItem: TcxGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 300
    Align = alClient
    TabOrder = 0
    object grCancelarItem: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dmVendas.dsVendaItens
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object clProduto: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'produto_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'descricao'
          end>
        Properties.ListSource = dmVendas.dsProduto
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object clCategoria: TcxGridDBColumn
        Caption = 'Categoria'
        DataBinding.FieldName = 'produto_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'categoria'
          end>
        Properties.ListSource = dmVendas.dsProduto
        Options.Focusing = False
      end
      object clValorUnitario: TcxGridDBColumn
        Caption = 'Valor Unit'#225'rio'
        DataBinding.FieldName = 'valor_unitario'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Focusing = False
      end
      object clQuantidade: TcxGridDBColumn
        Caption = 'Quantidade'
        DataBinding.FieldName = 'quantidade'
        Options.Focusing = False
      end
      object clValorTotal: TcxGridDBColumn
        Caption = 'Valor Total'
        DataBinding.FieldName = 'total_produto'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Focusing = False
      end
      object clBotao: TcxGridDBColumn
        Caption = 'Excluir'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Caption = 'Excluir'
            Default = True
            Kind = bkText
          end>
        Properties.ViewStyle = vsButtonsAutoWidth
        Options.ShowEditButtons = isebAlways
      end
    end
    object glCancelarItem: TcxGridLevel
      GridView = grCancelarItem
    end
  end
end
