unit frProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxNavigator, cxCurrencyEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxLabel, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxDBNavigator;

type
  TTelaProdutos = class(TForm)
    lbPesquisa: TcxLabel;
    lcPesquisa: TcxLookupComboBox;
    lbCodigo: TcxLabel;
    edPrecoCusto: TcxDBCurrencyEdit;
    lbPrecoCusto: TcxLabel;
    lbPrecoFinal: TcxLabel;
    edPrecoFinal: TcxDBCurrencyEdit;
    lbCategoria: TcxLabel;
    lbDescricao: TcxLabel;
    quProdutos: TZQuery;
    edCodigo: TcxDBTextEdit;
    dsProdutos: TDataSource;
    edDescricao: TcxDBTextEdit;
    nvProduto: TcxDBNavigator;
    quCategoria: TZQuery;
    dsCategoria: TDataSource;
    lcCategoria: TcxDBComboBox;
    procedure quProdutosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
  end;

var
  TelaProdutos: TTelaProdutos;

implementation

uses udmConexao;

{$R *.dfm}

procedure TTelaProdutos.quProdutosAfterScroll(DataSet: TDataSet);
var
  Lteste : Boolean;
begin
  try
  Lteste := quCategoria.Locate('id', 2, []);
  ShowMessage(BoolToStr(Lteste));
  except
  end;
end;

end.
