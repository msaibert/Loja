unit ufrRelatorioControleCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, Vcl.Menus, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, cxLabel, Vcl.StdCtrls, cxButtons, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  frxClass, frxDBSet;

type
  TfrRelatorioControleCaixa = class(TForm)
    edData: TcxDateEdit;
    lcCaixa: TcxLookupComboBox;
    btExibirRelatorio: TcxButton;
    lbCaixa: TcxLabel;
    lbData: TcxLabel;
    quCaixa: TZQuery;
    dsCaixa: TDataSource;
    rpCaixa: TfrxReport;
    fqAbertura: TfrxDBDataset;
    quAbertura: TZQuery;
    fqHeader: TfrxDBDataset;
    quHeader: TZQuery;
    fqMovimentacoes: TfrxDBDataset;
    quMovimentacoes: TZQuery;
    fqFechamento: TfrxDBDataset;
    quFechamento: TZQuery;
    procedure btExibirRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ActiveDataSets(AAtivar: Boolean = True);
    { Private declarations }
  public
    { Public declarations }
    procedure ExibeRelatorioCaixa(AData: TDateTime; ACaixaId: Integer);
  end;

var
  frRelatorioControleCaixa: TfrRelatorioControleCaixa;

implementation

uses
  udmConexao;

{$R *.dfm}

procedure TfrRelatorioControleCaixa.btExibirRelatorioClick(Sender: TObject);
begin
  ExibeRelatorioCaixa(StrToDate(edData.Text), quCaixa.FieldByName('id').AsInteger);
end;

procedure TfrRelatorioControleCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrRelatorioControleCaixa.FormCreate(Sender: TObject);
begin
  quCaixa.Active := True;
end;

procedure TfrRelatorioControleCaixa.ActiveDataSets(AAtivar : Boolean);
begin
  quAbertura.Active := AAtivar;
  quHeader.Active := AAtivar;
  quMovimentacoes.Active := AAtivar;
  quFechamento.Active := AAtivar;
end;

procedure TfrRelatorioControleCaixa.ExibeRelatorioCaixa(AData : TDateTime; ACaixaId : Integer);
  procedure AlteraParametros(ADataSet : TZQuery);
  begin
    ADataSet.ParamByName('DATA').Value := AData;
    ADataSet.ParamByName('CAIXAID').Value := ACaixaId;
  end;
begin
  ActiveDataSets(False);
  AlteraParametros(quAbertura);
  AlteraParametros(quHeader);
  AlteraParametros(quMovimentacoes);
  AlteraParametros(quFechamento);
  ActiveDataSets();
  rpCaixa.ShowReport(True);
end;

end.
