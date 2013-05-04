unit udmConexao;

interface

uses
  SysUtils, Classes, ZConnection, ZAbstractConnection;

type
  TdmConexao = class(TDataModule)
    connectionSistema: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{$R *.dfm}

end.
