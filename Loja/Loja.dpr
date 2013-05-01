program Loja;

uses
  Forms,
  frProdutos in 'frProdutos.pas' {TelaProdutos},
  udmConexao in 'udmConexao.pas' {dmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TTelaProdutos, TelaProdutos);
  Application.Run;
end.
