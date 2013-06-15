object dmVendas: TdmVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 656
  Width = 1067
  object quUsuario: TZQuery
    Connection = dmConexao.connectionSistema
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
    SQL.Strings = (
      'select *, SituacaoCaixa(id) as Situacao from caixas')
    Params = <>
    MasterFields = 'id'
    MasterSource = dsUsuario
    LinkedFields = 'usuario_id'
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
    Left = 481
    Top = 248
  end
  object dsProduto: TDataSource
    DataSet = quProduto
    Left = 513
    Top = 248
  end
  object quVendas: TZqueryValidation
    Connection = dmConexao.connectionSistema
    CachedUpdates = True
    SQL.Strings = (
      'select * from vendas where false;')
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
    CachedUpdates = True
    SQL.Strings = (
      'select * from venda_itens where false;')
    Params = <>
    Left = 224
    Top = 171
  end
  object dsVendaItens: TDataSource
    DataSet = quVendaItens
    Left = 257
    Top = 171
  end
  object quFormaDePagamento: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from formas_de_pagamento;')
    Params = <>
    Left = 480
    Top = 136
  end
  object dsFormaDePagamento: TDataSource
    DataSet = quFormaDePagamento
    Left = 520
    Top = 136
  end
  object quOperacao: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from operacoes;')
    Params = <>
    Left = 480
    Top = 192
  end
  object dsOperacao: TDataSource
    DataSet = quOperacao
    Left = 520
    Top = 192
  end
  object quMovimentoCaixa: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from movimento_caixa where false;')
    Params = <>
    Left = 224
    Top = 232
  end
  object dsMovimentoCaixa: TDataSource
    DataSet = quMovimentoCaixa
    Left = 264
    Top = 232
  end
  object quMovimentoEstoque: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from movimento_estoque where false;')
    Params = <>
    Left = 224
    Top = 288
  end
  object dsMovimentoEstoque: TDataSource
    DataSet = quMovimentoEstoque
    Left = 264
    Top = 288
  end
  object quMovimentoPendencia: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from movimento_pendencia where false;')
    Params = <>
    Left = 224
    Top = 344
  end
  object dsMovimentoPendencia: TDataSource
    DataSet = quMovimentoPendencia
    Left = 264
    Top = 344
  end
  object quPessoa: TZQuery
    Connection = dmConexao.connectionSistema
    SQL.Strings = (
      'select * from pessoas;')
    Params = <>
    Left = 480
    Top = 304
  end
  object dsPessoa: TDataSource
    DataSet = quPessoa
    Left = 520
    Top = 304
  end
end
