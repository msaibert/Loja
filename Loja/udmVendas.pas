unit udmVendas;

interface

uses
  System.SysUtils, System.Classes, ZqueryValidation, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdmVendas = class(TDataModule)
    quUsuario: TZQuery;
    dsUsuario: TDataSource;
    quCaixa: TZQuery;
    dsCaixa: TDataSource;
    quProduto: TZQuery;
    dsProduto: TDataSource;
    quVendas: TZqueryValidation;
    dsVendas: TDataSource;
    quVendaItens: TZqueryValidation;
    dsVendaItens: TDataSource;
    quFormaDePagamento: TZQuery;
    dsFormaDePagamento: TDataSource;
    quOperacao: TZQuery;
    dsOperacao: TDataSource;
    quMovimentoCaixa: TZQuery;
    dsMovimentoCaixa: TDataSource;
    quMovimentoEstoque: TZQuery;
    dsMovimentoEstoque: TDataSource;
    quMovimentoPendencia: TZQuery;
    dsMovimentoPendencia: TDataSource;
    quPessoa: TZQuery;
    dsPessoa: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmVendas: TdmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

procedure TdmVendas.DataModuleCreate(Sender: TObject);
begin
  quUsuario.Filtered := False;
  quUsuario.Filter := 'id = ' + IntToStr(dmConexao.FUsuarioLogado);
  quUsuario.Filtered := True;
end;

end.
