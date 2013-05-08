object dmVendas: TdmVendas
  OldCreateOrder = False
  Height = 323
  Width = 633
  object quUsuario: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      
        'select usuarios.id, usuarios.login, pessoas.nome from usuarios j' +
        'oin pessoas on (usuarios.pessoa_id = pessoas.id)')
    Params = <>
    Left = 25
    Top = 20
  end
  object dsUsuario: TDataSource
    DataSet = quUsuario
    Left = 65
    Top = 20
  end
  object quCaixa: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select id, descricao from caixas')
    Params = <>
    Left = 121
    Top = 28
  end
  object dsCaixa: TDataSource
    DataSet = quCaixa
    Left = 169
    Top = 28
  end
  object quProduto: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select '
      '  produtos.id || '#39' - '#39' || produtos.descricao as exibir,'
      '  produtos.*, '
      '  categorias_produtos.descricao as categoria '
      'from '
      '  produtos '
      'join '
      '  categorias_produtos on '
      '  (categorias_produtos.id = produtos.categoria_id)'
      'order by '
      '  produtos.id')
    Params = <>
    Left = 225
    Top = 224
  end
  object dsProduto: TDataSource
    DataSet = quProduto
    Left = 257
    Top = 224
  end
  object quVendas: TZqueryValidation
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from vendas;')
    Params = <>
    Left = 224
    Top = 115
  end
  object dsVendas: TDataSource
    DataSet = quVendas
    Left = 256
    Top = 115
  end
  object quVendaItens: TZqueryValidation
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from venda_items;')
    Params = <>
    Left = 224
    Top = 171
  end
  object dsVendaItens: TDataSource
    DataSet = quVendaItens
    Left = 257
    Top = 171
  end
  object quPadroes: TZQuery
    Connection = dmConexao.connectionSistema
    Active = True
    SQL.Strings = (
      'select * from padroes;')
    Params = <>
    Left = 441
    Top = 35
  end
end
