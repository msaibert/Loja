object frCadastroPadrao: TfrCadastroPadrao
  Left = 0
  Top = 0
  Caption = 'Cadastro de '
  ClientHeight = 463
  ClientWidth = 635
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
  DesignSize = (
    635
    463)
  PixelsPerInch = 96
  TextHeight = 13
  object nvDados: TcxDBNavigator
    Left = 357
    Top = 430
    Width = 252
    Height = 25
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Refresh.Visible = False
    DataSource = dsDados
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object lcPesquisa: TcxLookupComboBox
    Left = 8
    Top = 31
    Anchors = [akLeft, akTop, akRight]
    Properties.ListColumns = <>
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsDados
    TabOrder = 0
    OnExit = lcPesquisaExit
    Width = 619
  end
  object lbPesquisa: TcxLabel
    Left = 8
    Top = 8
    Caption = 'Pesquise aqui'
  end
  object quDados: TZqueryValidation
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from ')
    Params = <>
    Left = 8
    Top = 8
  end
  object dsDados: TDataSource
    DataSet = quDados
    Left = 48
    Top = 8
  end
end
