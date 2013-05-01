object TelaOperacoes: TTelaOperacoes
  Left = 853
  Top = 274
  Width = 573
  Height = 230
  Caption = 'Cadastro de opera'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edCodigo: TcxDBTextEdit
    Left = 85
    Top = 16
    Width = 121
    Height = 21
    DataBinding.DataField = 'id'
    DataBinding.DataSource = dsOperacoes
    Enabled = False
    TabOrder = 0
  end
  object edDescricao: TcxDBTextEdit
    Left = 85
    Top = 41
    Width = 460
    Height = 21
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = dsOperacoes
    TabOrder = 1
  end
  object cbEstoque: TcxDBCheckBox
    Left = 85
    Top = 72
    Width = 121
    Height = 21
    DataBinding.DataField = 'movimentar_estoque'
    DataBinding.DataSource = dsOperacoes
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.Caption = 'Movimentar Estoque'
    TabOrder = 2
  end
  object rgEstoque: TcxDBRadioGroup
    Left = 85
    Top = 96
    Width = 153
    Height = 49
    DataBinding.DataField = 'tipo_estoque'
    DataBinding.DataSource = dsOperacoes
    Properties.Items = <
      item
        Caption = 'Entrada'
        Value = 'E'
      end
      item
        Caption = 'Sa'#237'da'
        Value = 'S'
      end>
    TabOrder = 3
    Caption = 'Tipo da movimenta'#231#227'o'
  end
  object cbCaixa: TcxDBCheckBox
    Left = 242
    Top = 72
    Width = 121
    Height = 21
    DataBinding.DataField = 'movimentar_caixa'
    DataBinding.DataSource = dsOperacoes
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.Caption = 'Movimentar Caixa'
    TabOrder = 4
  end
  object rgCaixa: TcxDBRadioGroup
    Left = 242
    Top = 96
    Width = 153
    Height = 49
    DataBinding.DataField = 'tipo_caixa'
    DataBinding.DataSource = dsOperacoes
    Properties.Items = <
      item
        Caption = 'Cr'#233'dito'
        Value = 'C'
      end
      item
        Caption = 'D'#233'bito'
        Value = 'D'
      end>
    TabOrder = 5
    Caption = 'Tipo da movimenta'#231#227'o'
  end
  object lbCodigo: TcxLabel
    Left = 45
    Top = 20
    Width = 41
    Height = 17
    TabOrder = 6
    Caption = 'C'#243'digo'
  end
  object lbDescricao: TcxLabel
    Left = 29
    Top = 45
    Width = 56
    Height = 17
    TabOrder = 7
    Caption = 'Descric'#227'o'
  end
  object nvOperacoes: TcxDBNavigator
    Left = 318
    Top = 160
    Width = 206
    Height = 25
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Refresh.Visible = False
    DataSource = dsOperacoes
    TabOrder = 8
  end
  object quOperacoes: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from operacoes;')
    Params = <>
    Left = 472
    Top = 120
  end
  object dsOperacoes: TDataSource
    DataSet = quOperacoes
    Left = 504
    Top = 120
  end
end
