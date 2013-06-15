object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 264
  Width = 436
  object connectionSistema: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    Catalog = ''
    Connected = True
    HostName = 'localhost'
    Port = 0
    Database = 'loja'
    User = 'System'
    Password = 'M&A280309'
    Protocol = 'postgresql-9'
    Left = 192
    Top = 96
  end
  object quPadroes: TZqueryValidation
    Connection = connectionSistema
    Active = True
    SQL.Strings = (
      'select * from padroes;')
    Params = <>
    Left = 272
    Top = 184
  end
  object dsPadroes: TDataSource
    DataSet = quPadroes
    Left = 312
    Top = 184
  end
end
