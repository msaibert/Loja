unit frFormasDePagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxNavigator, cxDBNavigator, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxTextEdit, cxDBEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxRadioGroup;

type
  TTelaFormasDePagamento = class(TForm)
    lbCodigo: TcxLabel;
    edCodigo: TcxDBTextEdit;
    lbDescricao: TcxLabel;
    edDescricao: TcxDBTextEdit;
    quFormasDePagamento: TZQuery;
    dsFormasDePagamento: TDataSource;
    nvCategorias: TcxDBNavigator;
    rgForma: TcxDBRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaFormasDePagamento: TTelaFormasDePagamento;

implementation

uses udmConexao;

{$R *.dfm}

end.
