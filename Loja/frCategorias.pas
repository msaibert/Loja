unit frCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, cxTextEdit,
  cxDBEdit, cxContainer, cxEdit, cxLabel, cxControls, cxNavigator,
  cxDBNavigator;

type
  TTelaCategoriaProdutos = class(TForm)
    nvCategorias: TcxDBNavigator;
    lbCodigo: TcxLabel;
    edCodigo: TcxDBTextEdit;
    lbDescricao: TcxLabel;
    edDescricao: TcxDBTextEdit;
    quCategorias: TZQuery;
    dsCategorias: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCategoriaProdutos: TTelaCategoriaProdutos;

implementation

uses udmConexao;

{$R *.dfm}

end.
