object TelaCategoriaProdutos: TTelaCategoriaProdutos
  Left = 894
  Top = 347
  Width = 505
  Height = 156
  Caption = 'Cadastro de Categorias de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object nvCategorias: TcxDBNavigator
    Left = 254
    Top = 80
    Width = 218
    Height = 25
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Refresh.Visible = False
    DataSource = dsCategorias
    TabOrder = 4
  end
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
    DataBinding.DataSource = dsCategorias
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
    DataBinding.DataSource = dsCategorias
    TabOrder = 3
  end
  object quCategorias: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from categoriaprodutos;')
    Params = <>
    Left = 16
    Top = 80
  end
  object dsCategorias: TDataSource
    DataSet = quCategorias
    Left = 48
    Top = 80
  end
end
