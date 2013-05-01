program Loja;

uses
  Forms,
  frProdutos in 'frProdutos.pas' {TelaProdutos},
  udmConexao in 'udmConexao.pas' {dmConexao: TDataModule},
  frOperacoes in 'frOperacoes.pas' {TelaOperacoes},
  frCategorias in 'frCategorias.pas' {TelaCategoriaProdutos},
  frFormasDePagamento in 'frFormasDePagamento.pas' {TelaFormasDePagamento},
  frPessoas in 'frPessoas.pas' {TelaPessoas},
  frUsuarios in 'frUsuarios.pas' {TelaUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TTelaUsuarios, TelaUsuarios);
  Application.CreateForm(TTelaPessoas, TelaPessoas);
  Application.CreateForm(TTelaFormasDePagamento, TelaFormasDePagamento);
  Application.CreateForm(TTelaCategoriaProdutos, TelaCategoriaProdutos);
  Application.CreateForm(TTelaOperacoes, TelaOperacoes);
  Application.CreateForm(TTelaProdutos, TelaProdutos);
  Application.Run;
end.
