object frPadroes: TfrPadroes
  Left = 0
  Top = 0
  Caption = 'Cadastro dos padr'#245'es do sistema'
  ClientHeight = 188
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object edCNPJ: TcxDBMaskEdit
    Left = 96
    Top = 40
    DataBinding.DataField = 'cnpj'
    DataBinding.DataSource = dmConexao.dsPadroes
    Properties.EditMask = '00\.000\.000\.0000\-00;0;_'
    TabOrder = 0
    Width = 121
  end
  object edNomeFantasia: TcxDBTextEdit
    Left = 96
    Top = 67
    DataBinding.DataField = 'nome_fantasia'
    DataBinding.DataSource = dmConexao.dsPadroes
    TabOrder = 1
    Width = 334
  end
  object edRazaoSocial: TcxDBTextEdit
    Left = 96
    Top = 94
    DataBinding.DataField = 'razao_social'
    DataBinding.DataSource = dmConexao.dsPadroes
    TabOrder = 2
    Width = 334
  end
  object edTelefone: TcxDBMaskEdit
    Left = 96
    Top = 121
    DataBinding.DataField = 'telefone'
    DataBinding.DataSource = dmConexao.dsPadroes
    Properties.EditMask = '!\(99\)0000-0000;0;_'
    TabOrder = 3
    Width = 121
  end
  object lbCNPJ: TcxLabel
    Left = 63
    Top = 41
    Caption = 'CNPJ'
  end
  object lbNomeFantasia: TcxLabel
    Left = 13
    Top = 68
    Caption = 'Nome Fantasia:'
  end
  object lbRazaoSocial: TcxLabel
    Left = 28
    Top = 95
    Caption = 'Raz'#227'o Social'
  end
  object lbTelefone: TcxLabel
    Left = 46
    Top = 122
    Caption = 'Telefone'
  end
  object nvPadroes: TcxDBNavigator
    Left = 334
    Top = 155
    Width = 96
    Height = 25
    Buttons.CustomButtons = <>
    Buttons.First.Visible = False
    Buttons.PriorPage.Visible = False
    Buttons.Prior.Visible = False
    Buttons.Next.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Last.Visible = False
    Buttons.Insert.Visible = False
    Buttons.Append.Visible = False
    Buttons.Delete.Visible = False
    Buttons.Cancel.Visible = True
    Buttons.Refresh.Visible = False
    Buttons.SaveBookmark.Enabled = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dmConexao.dsPadroes
    TabOrder = 8
  end
end
