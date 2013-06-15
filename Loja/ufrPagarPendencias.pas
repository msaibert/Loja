unit ufrPagarPendencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxDBLookupComboBox,
  ZqueryValidation, ZAbstractRODataset, ZAbstractDataset, ZDataset, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, Vcl.ExtCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxButtonEdit, cxCheckBox,
  cxCalendar, cxCurrencyEdit, cxGridBandedTableView, Datasnap.DBClient, cxDBEdit,
  Vcl.DBCtrls, frxClass, frxDBSet;

type
  TfrPagarPendencias = class(TForm)
    pnHeader: TPanel;
    pnFooter: TPanel;
    lbPessoa: TLabel;
    quPendencias: TZQuery;
    dsPendencias: TDataSource;
    quPessoa: TZQuery;
    dsPessoa: TDataSource;
    quPagar: TZqueryValidation;
    quCaixa: TZQuery;
    dsCaixa: TDataSource;
    quOperacoes: TZQuery;
    dsOperacoes: TDataSource;
    dsPagar: TDataSource;
    glPendencias: TcxGridLevel;
    gdPendencias: TcxGrid;
    grPendencias: TcxGridDBTableView;
    clPendenciasnome: TcxGridDBColumn;
    clPendenciasvenda_id: TcxGridDBColumn;
    clPendenciasdata_compra: TcxGridDBColumn;
    clPendenciasultimo_pgto_venda: TcxGridDBColumn;
    clPendenciassaldo: TcxGridDBColumn;
    clPendenciasPagamento: TcxGridDBColumn;
    clRelatorioItens: TcxGridDBColumn;
    gbValorPagamento: TGroupBox;
    edValorPagamento: TcxCurrencyEdit;
    lcPessoas: TcxLookupComboBox;
    lbOperacao: TLabel;
    lbCaixa: TLabel;
    btControleCaixa: TcxButton;
    btPagar: TcxButton;
    cdPendencias: TClientDataSet;
    ifPendenciasid: TIntegerField;
    quPendenciasnome: TWideStringField;
    ifPendenciasvenda_id1: TIntegerField;
    dfPendenciasdata_compra1: TDateField;
    dfPendenciasultimo_pgto_venda: TDateField;
    ffPendenciassaldo1: TFloatField;
    lcCaixa: TcxLookupComboBox;
    lcOperacao: TcxLookupComboBox;
    afPendenciassoma: TAggregateField;
    Label1: TLabel;
    fqItens: TfrxDBDataset;
    rpItens: TfrxReport;
    quItens: TZQuery;
    dsItens: TDataSource;
    procedure btControleCaixaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcPessoasExit(Sender: TObject);
    procedure edValorPagamentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcOperacaoExit(Sender: TObject);
    procedure btPagarClick(Sender: TObject);
  private
    procedure CopiarDadosDataSet;
    procedure GerarMovimentosDePendencia;
    procedure AdicionarValidacoes;
    function ValidaTotalASerPago: Boolean;
    procedure GerarMovimentoDeCaixa;
    function ValidarSeCaixaInformadoCasoOperacaoMovimenteo: Boolean;
    function ValidaParaQueValorSejaMaiorQueZero: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPagarPendencias: TfrPagarPendencias;

implementation

uses
  udmConexao, ufrControleDeCaixa, uMathUtil, uStringUtil;

{$R *.dfm}

procedure TfrPagarPendencias.btControleCaixaClick(Sender: TObject);
begin
  frControleDeCaixa := TfrControleDeCaixa.Create(nil);
  frControleDeCaixa.ShowModal;
end;

procedure TfrPagarPendencias.btPagarClick(Sender: TObject);
begin
  GerarMovimentosDePendencia;
  GerarMovimentoDeCaixa;
  quPendencias.Refresh;
end;

procedure TfrPagarPendencias.edValorPagamentoExit(Sender: TObject);
var
  LSaldoRestante : Double;
begin
  LSaldoRestante := edValorPagamento.Value;
  if cdPendencias.RecordCount = 0 then
    Exit;
  cdPendencias.First;
  repeat
    cdPendencias.Edit;
    cdPendencias.FieldByName('pagamento').AsFloat := Min(Abs(cdPendencias.FieldByName('saldo').AsFloat), LSaldoRestante);
    LSaldoRestante := LSaldoRestante - Abs(cdPendencias.FieldByName('saldo').AsFloat);
    cdPendencias.Next;
  until ((LSaldoRestante <= 0.00) or (cdPendencias.Eof));
end;

procedure TfrPagarPendencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrPagarPendencias.FormCreate(Sender: TObject);
begin
  quPendencias.Active := True;
  quPessoa.Active := True;
  quPagar.Active := True;
  quCaixa.Active := True;
  quOperacoes.Active := True;
  cdPendencias.Active := True;

  CopiarDadosDataSet;
  AdicionarValidacoes;
end;

procedure TfrPagarPendencias.lcOperacaoExit(Sender: TObject);
begin
  lcCaixa.Enabled := quOperacoes.FieldByName('movimentar_caixa').AsBoolean;
  btControleCaixa.Enabled := lcCaixa.Enabled;
end;

procedure TfrPagarPendencias.lcPessoasExit(Sender: TObject);
begin
  quPendencias.Filtered := False;
  quPendencias.Filter := 'ID = '+ quPessoa.FieldByName('id').AsString;
  quPendencias.Filtered := True;
  CopiarDadosDataSet;
end;

procedure TfrPagarPendencias.CopiarDadosDataSet;
begin
  while not quPendencias.Eof do
  begin
    cdPendencias.DisableControls;
    cdPendencias.EmptyDataSet;
    cdPendencias.Append;
    cdPendencias.FieldByName('venda_id').AsInteger           := quPendencias.FieldByName('venda_id').AsInteger;
    cdPendencias.FieldByName('data_compra').AsDateTime       := quPendencias.FieldByName('data_compra').AsDateTime;
    cdPendencias.FieldByName('nome').AsString                := quPendencias.FieldByName('nome').AsString;
    cdPendencias.FieldByName('ultimo_pgto_venda').AsDateTime := quPendencias.FieldByName('ultimo_pgto_venda').AsDateTime;
    cdPendencias.FieldByName('saldo').AsFloat                := quPendencias.FieldByName('saldo').AsFloat;
    cdPendencias.Post;
    cdPendencias.EnableControls;
    quPendencias.Next;
  end;
end;

procedure TfrPagarPendencias.GerarMovimentosDePendencia;
begin
   cdPendencias.DisableControls;
   cdPendencias.First;
   while not cdPendencias.Eof do
   begin
     quPagar.Append;
     quPagar.FieldByName('operacao_id').AsInteger := quOperacoes.FieldByName('id').AsInteger;
     quPagar.FieldByName('pessoa_id').AsInteger := quPessoa.FieldByName('id').AsInteger;
     quPagar.FieldByName('caixa_id').AsInteger := quCaixa.FieldByName('id').AsInteger;
     quPagar.FieldByName('venda_id').AsInteger := cdPendencias.FieldByName('venda_id').AsInteger;
     quPagar.FieldByName('valor').AsFloat := cdPendencias.FieldByName('pagamento').AsFloat;
     quPagar.FieldByName('data').AsDateTime := Now();
     quPagar.Post;
     cdPendencias.Next;
   end;
   cdPendencias.EnableControls;
end;

procedure TfrPagarPendencias.GerarMovimentoDeCaixa;
var
  AMovimentoCaixa : TZQuery;
begin
  AMovimentoCaixa := TZQuery.Create(Self);
  try
    if quOperacoes.FieldByName('movimentar_caixa').AsBoolean then
    begin
      AMovimentoCaixa.SQL.Text  := 'select * from movimento_caixa where false;';
      AMovimentoCaixa.Connection := quPagar.Connection;
      AMovimentoCaixa.Active := True;
      cdPendencias.First;
      cdPendencias.DisableControls;
      while not cdPendencias.Eof do
      begin
        AMovimentoCaixa.Append;
        AMovimentoCaixa.FieldByName('operacao_id').AsInteger := quOperacoes.FieldByName('id').AsInteger;
        AMovimentoCaixa.FieldByName('caixa_id').AsInteger    := quCaixa.FieldByName('id').AsInteger;
        AMovimentoCaixa.FieldByName('valor').AsFloat         := cdPendencias.FieldByName('pagamento').AsFloat;
        AMovimentoCaixa.FieldByName('data').AsDateTime       := Now();
        AMovimentoCaixa.FieldByName('venda_id').AsInteger    := cdPendencias.FieldByName('venda_id').AsInteger;
        AMovimentoCaixa.Post;
        cdPendencias.Next;
      end;
      cdPendencias.EnableControls;
    end;
  finally
    AMovimentoCaixa.Free
  end;
end;

procedure TfrPagarPendencias.AdicionarValidacoes;
begin
   quPagar.AddValidation('operacao_id', opNotBlank, null, 'Campo operação deve ser preenchido.');
   quPagar.AddValidation(ValidarSeCaixaInformadoCasoOperacaoMovimenteo, 'Campo caixa deve ser preenchido');
   quPagar.AddValidation(ValidaTotalASerPago, 'Soma dos valores informados individualmente para pagamento das vendas não condiz com valor informado para pagamento.');
   quPagar.AddValidation(ValidaParaQueValorSejaMaiorQueZero, 'Valor para pagamento deve ser maior que zero.');
end;

function TfrPagarPendencias.ValidaTotalASerPago : Boolean;
var
   ASoma : Double;
begin
   ASoma := StrToFloat(cdPendencias.FieldByName('soma').AsString);
   Result := edValorPagamento.Value = ASoma;
end;

function TfrPagarPendencias.ValidarSeCaixaInformadoCasoOperacaoMovimenteo : Boolean;
begin
  Result := (not quOperacoes.FieldByName('movimentar_caixa').AsBoolean) or
            (quCaixa.FieldByName('id').AsInteger > 0)
end;

function TfrPagarPendencias.ValidaParaQueValorSejaMaiorQueZero : Boolean;
begin
  Result := edValorPagamento.Value > 0;
end;

end.
