unit udmVendas;

interface

uses
  System.SysUtils, System.Classes, ZqueryValidation, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

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
    quPadroes: TZQuery;
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

end.
