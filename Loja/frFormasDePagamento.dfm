object TelaFormasDePagamento: TTelaFormasDePagamento
  Left = 378
  Top = 177
  Width = 507
  Height = 170
  Caption = 'Cadastro de Formas de Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TcxLabel
    Left = 24
    Top = 20
    Width = 41
    Height = 17
    TabOrder = 0
    Caption = 'C'#243'digo'
  end
  object edCodigo: TcxDBTextEdit
    Left = 69
    Top = 16
    Width = 121
    Height = 21
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsFormasDePagamento
    Enabled = False
    TabOrder = 1
  end
  object lbDescricao: TcxLabel
    Left = 9
    Top = 45
    Width = 56
    Height = 17
    TabOrder = 2
    Caption = 'Descri'#231#227'o'
  end
  object edDescricao: TcxDBTextEdit
    Left = 69
    Top = 41
    Width = 412
    Height = 21
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsFormasDePagamento
    TabOrder = 3
  end
  object nvCategorias: TcxDBNavigator
    Left = 263
    Top = 101
    Width = 218
    Height = 25
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Refresh.Visible = False
    DataSource = dsFormasDePagamento
    TabOrder = 4
  end
  object rgForma: TcxDBRadioGroup
    Left = 69
    Top = 66
    Width = 177
    Height = 34
    DataBinding.DataField = 'tipo'
    DataBinding.DataSource = dsFormasDePagamento
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Vista'
        Value = 'V'
      end
      item
        Caption = 'Prazo'
        Value = 'P'
      end>
    TabOrder = 5
    Caption = 'Forma de pagamento'
  end
  object quFormasDePagamento: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from formaspagamento;')
    Params = <>
    Left = 16
    Top = 93
  end
  object dsFormasDePagamento: TDataSource
    DataSet = quFormasDePagamento
    Left = 48
    Top = 93
  end
end
