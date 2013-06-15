program Loja;

uses
  Forms,
  udmConexao in 'udmConexao.pas' {dmConexao: TDataModule},
  ufrPrin in 'ufrPrin.pas' {frPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  ufrRelatorios in '..\Componentes\Nova pasta\ufrRelatorios.pas' {frRelatorios},
  ufrPadrao in 'ufrPadrao.pas' {frCadastroPadrao},
  ufrPessoas in 'ufrPessoas.pas' {frPessoas},
  ufrCategoriasProdutos in 'ufrCategoriasProdutos.pas' {frCategoriasProdutos},
  ufrFormasPagamento in 'ufrFormasPagamento.pas' {frFormasPagamento},
  ufrOperacoes in 'ufrOperacoes.pas' {frOperacoes},
  ufrProdutos in 'ufrProdutos.pas' {frProdutos},
  ufrUsuarios in 'ufrUsuarios.pas' {frUsuarios},
  ufrCaixas in 'ufrCaixas.pas' {frCaixas},
  ufrLogin in 'ufrLogin.pas' {frLogin},
  ufrVendas in 'ufrVendas.pas' {frVendas},
  ufrMovimentoDeEstoque in 'ufrMovimentoDeEstoque.pas' {frMovimentoDeEstoque},
  udmVendas in 'udmVendas.pas' {dmVendas: TDataModule},
  uStringUtil in 'uStringUtil.pas',
  uSQLUtil in 'uSQLUtil.pas',
  uMathUtil in 'uMathUtil.pas',
  ufrCancelarItem in 'ufrCancelarItem.pas' {frCancelarItem},
  ufrPadroes in 'ufrPadroes.pas' {frPadroes},
  ufrControleDeCaixa in 'ufrControleDeCaixa.pas' {frControleDeCaixa},
  ufrRelatorioCaixa in 'ufrRelatorioCaixa.pas' {frRelatorioCaixa},
  ufrPagarPendencias in 'ufrPagarPendencias.pas' {frPagarPendencias};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.CreateForm(TfrRelatorioCaixa, frRelatorioCaixa);
  Application.Run;
end.
