unit ufrPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrPrincipal = class(TForm)
    MainMenu: TMainMenu;
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
    procedure miUsuariosClick(Sender: TObject);
    procedure miProdutosClick(Sender: TObject);
    procedure miCategoriasClick(Sender: TObject);
    procedure miOperacoesClick(Sender: TObject);
    procedure miFormasdePagamentoClick(Sender: TObject);
    procedure miPessoasClick(Sender: TObject);
    procedure miCaixasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miEstoqueClick(Sender: TObject);
    procedure miVendasClick(Sender: TObject);
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
  ufrLogin, ufrMovimentoDeEstoque, ufrVendas;

{$R *.dfm}

procedure TfrPrincipal.miUsuariosClick(Sender: TObject);
begin
  Application.CreateForm(TfrUsuarios, frUsuarios);
end;

procedure TfrPrincipal.miVendasClick(Sender: TObject);
begin
  Application.CreateForm(TfrVendas, frVendas);
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
//var
//  LFormLogin : TfrLogin;
begin
//  LFormLogin := TfrLogin.Create(Self);
//  LFormLogin.ShowModal;
//  LFormLogin.Free;
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

end.

