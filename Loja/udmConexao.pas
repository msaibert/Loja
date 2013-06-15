unit udmConexao;

interface

uses
  SysUtils, Classes, ZConnection, ZAbstractConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZqueryValidation;

type
  TdmConexao = class(TDataModule)
    connectionSistema: TZConnection;
    quPadroes: TZqueryValidation;
    dsPadroes: TDataSource;
  private
    { Private declarations }
  public
  FUsuarioLogado : Integer;
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;


implementation

{$R *.dfm}

end.
