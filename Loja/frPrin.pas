unit frPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TTelaPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    miCadastros: TMenuItem;
    miPessoas: TMenuItem;
    miUsuarios: TMenuItem;
    miProdutos: TMenuItem;
    miCategorias: TMenuItem;
    miFormasdePagamento: TMenuItem;
    miOperacoes: TMenuItem;
    procedure miUsuariosClick(Sender: TObject);
    procedure miProdutosClick(Sender: TObject);
    procedure miCategoriasClick(Sender: TObject);
    procedure miOperacoesClick(Sender: TObject);
    procedure miFormasdePagamentoClick(Sender: TObject);
    procedure miPessoaClick(Sender: TObject);
    procedure miPessoasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

uses frPessoas, frUsuarios, frCategorias, frFormasDePagamento, frOperacoes,
  frProdutos;

{$R *.dfm}

procedure TTelaPrincipal.miUsuariosClick(Sender: TObject);
begin
  Application.CreateForm(TTelaUsuarios, TelaUsuarios);
end;

procedure TTelaPrincipal.miPessoaClick(Sender: TObject);
begin
  Application.CreateForm(TTelaPessoas, TelaPessoas);
end;

procedure TTelaPrincipal.miPessoasClick(Sender: TObject);
begin
  Application.CreateForm(TTelaPessoas, TelaPessoas);
end;

procedure TTelaPrincipal.miProdutosClick(Sender: TObject);
begin
    Application.CreateForm(TTelaProdutos, TelaProdutos);
end;

procedure TTelaPrincipal.miCategoriasClick(Sender: TObject);
begin
  Application.CreateForm(TTelaCategoriaProdutos, TelaCategoriaProdutos);
end;

procedure TTelaPrincipal.miOperacoesClick(Sender: TObject);
begin
  Application.CreateForm(TTelaOperacoes, TelaOperacoes);
end;

procedure TTelaPrincipal.miFormasdePagamentoClick(Sender: TObject);
begin
  Application.CreateForm(TTelaFormasDePagamento, TelaFormasDePagamento);
end;

end.

