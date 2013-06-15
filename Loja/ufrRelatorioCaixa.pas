unit ufrRelatorioCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, frxClass, frxDBSet;

type
  TfrRelatorioCaixa = class(TForm)
    fqSQL: TfrxDBDataset;
    rpRelatorio: TfrxReport;
    quRelatorio: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRelatorioCaixa: TfrRelatorioCaixa;

implementation

uses
  udmConexao;

{$R *.dfm}

end.
