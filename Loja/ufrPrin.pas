unit ufrPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrPrincipal = class(TForm)
    mmPrin: TMainMenu;
    miCadastros: TMenuItem;
    miPessoas: TMenuItem;
    miUsuarios: TMenuItem;
    miProdutos: TMenuItem;
    miCategorias: TMenuItem;
    miFormasdePagamento: TMenuItem;
    miOperacoes: TMenuItem;
    miMovimentacoes: TMenuItem;
    miCaixa: TMenuItem;
    miEstoque: TMenuItem;
    miVendas: TMenuItem;
    miCaixas: TMenuItem;
    miPadroes: TMenuItem;
    miPagamentodePendencias: TMenuItem;
    miRelatorios: TMenuItem;
    miMovimentaoCaixaDirio: TMenuItem;
    procedure miUsuariosClick(Sender: TObject);
    procedure miProdutosClick(Sender: TObject);
    procedure miCategoriasClick(Sender: TObject);
    procedure miOperacoesClick(Sender: TObject);
    procedure miFormasdePagamentoClick(Sender: TObject);
    procedure miPessoasClick(Sender: TObject);
    procedure miCaixasClick(Sender: TObject);
    procedure miEstoqueClick(Sender: TObject);
    procedure miVendasClick(Sender: TObject);
    procedure miPadroesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miPagamentodePendenciasClick(Sender: TObject);
    procedure miMovimentaoCaixaDirioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

uses ufrUsuarios, ufrOperacoes,
  ufrProdutos, ufrPessoas, ufrCategoriasProdutos, ufrFormasPagamento, ufrCaixas,
  ufrLogin, ufrMovimentoDeEstoque, ufrVendas, ufrPadroes, ufrPagarPendencias,
  ufrRelatorioControleCaixa;

{$R *.dfm}

procedure TfrPrincipal.miUsuariosClick(Sender: TObject);
begin
  Application.CreateForm(TfrUsuarios, frUsuarios);
end;

procedure TfrPrincipal.miVendasClick(Sender: TObject);
begin
  Application.CreateForm(TfrVendas, frVendas);
end;

procedure TfrPrincipal.miPadroesClick(Sender: TObject);
begin
  Application.CreateForm(TfrPadroes, frPadroes);
end;

procedure TfrPrincipal.miPagamentodePendenciasClick(Sender: TObject);
begin
  Application.CreateForm(TfrPagarPendencias, frPagarPendencias);
end;

procedure TfrPrincipal.miPessoasClick(Sender: TObject);
begin
  Application.CreateForm(TfrPessoas, frPessoas);
end;

procedure TfrPrincipal.miProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TfrProdutos, frProdutos);
end;

procedure TfrPrincipal.FormCreate(Sender: TObject);
begin
  frLogin := TfrLogin.Create(nil);
  frLogin.ShowModal;
end;

procedure TfrPrincipal.miCaixasClick(Sender: TObject);
begin
  Application.CreateForm(TfrCaixas, frCaixas);
end;

procedure TfrPrincipal.miCategoriasClick(Sender: TObject);
begin
  Application.CreateForm(TfrCategoriasProdutos, frCategoriasProdutos);
end;

procedure TfrPrincipal.miEstoqueClick(Sender: TObject);
begin
  Application.CreateForm(TfrMovimentoDeEstoque, frMovimentoDeEstoque);
end;

procedure TfrPrincipal.miOperacoesClick(Sender: TObject);
begin
  Application.CreateForm(TfrOperacoes, frOperacoes);
end;

procedure TfrPrincipal.miFormasdePagamentoClick(Sender: TObject);
begin
  Application.CreateForm(TfrFormasPagamento, frFormasPagamento);
end;

procedure TfrPrincipal.miMovimentaoCaixaDirioClick(Sender: TObject);
begin
  Application.CreateForm(TfrRelatorioControleCaixa, frRelatorioControleCaixa);
end;

end.

