program Loja;

uses
  Forms,
  frProdutos in 'frProdutos.pas' {TelaProdutos},
  udmConexao in 'udmConexao.pas' {dmConexao: TDataModule},
  frOperacoes in 'frOperacoes.pas' {TelaOperacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TTelaOperacoes, TelaOperacoes);
  Application.CreateForm(TTelaProdutos, TelaProdutos);
  Application.Run;
end.
