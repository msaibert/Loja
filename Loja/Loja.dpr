program Loja;

uses
  Forms,
  frProdutos in 'frProdutos.pas' {TelaProdutos},
  udmConexao in 'udmConexao.pas' {dmConexao: TDataModule},
  frOperacoes in 'frOperacoes.pas' {TelaOperacoes},
  frCategorias in 'frCategorias.pas' {TelaCategoriaProdutos},
  frFormasDePagamento in 'frFormasDePagamento.pas' {TelaFormasDePagamento},
  frPessoas in 'frPessoas.pas' {TelaPessoas},
  frUsuarios in 'frUsuarios.pas' {TelaUsuarios},
  frPrin in 'frPrin.pas' {TelaPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  ufrRelatorios in '..\Componentes\Nova pasta\ufrRelatorios.pas' {frRelatorios};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.Run;
end.
