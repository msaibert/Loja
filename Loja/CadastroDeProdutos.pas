unit CadastroDeProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxDBEdit, cxCurrencyEdit, ExtCtrls, DBCtrls, cxLabel, cxNavigator,
  cxDBNavigator, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrCadastroDeProdutos = class(TForm)
    spCodigo: TcxDBSpinEdit;
    ZConnection: TZConnection;
    edDescricao: TcxDBTextEdit;
    edPreco: TcxDBCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBNavigator1: TcxDBNavigator;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1preco: TcxGridDBColumn;
    lsPesquisa: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    lsGrupo: TcxLookupComboBox;
    dsProduto: TDataSource;
    quGrupoProduto: TZQuery;
    cxLabel5: TcxLabel;
    edValorFinal: TcxDBCurrencyEdit;
    dsGrupoProtudos: TDataSource;
    quGrupoProdutoid: TIntegerField;
    quGrupoProdutodescricao: TStringField;
    quProduto: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroDeProdutos: TfrCadastroDeProdutos;

implementation

{$R *.dfm}

end.
