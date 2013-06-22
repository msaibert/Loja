unit ufrControleDeCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, Vcl.Menus, ZqueryValidation,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxLabel, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, cxSpinEdit, cxMemo,
  Datasnap.DBClient;

type
  TfrControleDeCaixa = class(TForm)
    lcCaixa: TcxDBLookupComboBox;
    lbCaixa: TcxLabel;
    edData: TcxDBDateEdit;
    lbData: TcxLabel;
    glMoedas: TcxGridLevel;
    gdMoedas: TcxGrid;
    btAbrirFecharCaixa: TcxButton;
    quCaixas: TZQuery;
    dsCaixas: TDataSource;
    quControleCaixa: TZqueryValidation;
    dsMoedasControle: TDataSource;
    dsControleCaixa: TDataSource;
    mmObservacao: TcxDBMemo;
    lbObservacao: TcxLabel;
    quMoedas: TZQuery;
    dsMoedas: TDataSource;
    lbSaldoCaixa: TcxLabel;
    edSaldo: TcxDBCurrencyEdit;
    edSituacaoCaixa: TcxTextEdit;
    lbSituacaoCaixa: TcxLabel;
    grMoedas: TcxGridDBTableView;
    clExtenso: TcxGridDBColumn;
    clValor: TcxGridDBColumn;
    clQuantidade: TcxGridDBColumn;
    clTotal: TcxGridDBColumn;
    quMoedasControle: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btAbrirFecharCaixaClick(Sender: TObject);
    procedure lcCaixaExit(Sender: TObject);
    procedure grMoedasEditChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure clQuantidadePropertiesChange(Sender: TObject);
    procedure clTotalPropertiesChange(Sender: TObject);
  private
    function CaixaNaoPertenceAEsseUsuario: Boolean;
    function VerificarSeEhAberturaOuFechamentoDoCaixa : String;
    procedure AdicionarMoedasPadraoAoDataSet;
    procedure RelacionarControleComMoedas;
    function CaixaJaAbertoParaEssaData: Boolean;
    { Private declarations }
  public
     constructor Create(AOwner: TComponent; ACaixaId : Integer); overload;
    { Public declarations }
  end;

var
  frControleDeCaixa: TfrControleDeCaixa;

implementation

uses
  udmConexao, uSQLUtil;

{$R *.dfm}

procedure TfrControleDeCaixa.btAbrirFecharCaixaClick(Sender: TObject);
begin
  quControleCaixa.Post;
  RelacionarControleComMoedas;
  Self.Close;
end;

procedure TfrControleDeCaixa.FormCreate(Sender: TObject);
begin
  quCaixas.Active := True;
  quControleCaixa.Active := True;
  quMoedasControle.Active := True;
  quMoedas.Active := True;

  quControleCaixa.AddValidation('data', opNotBlank, null, 'Campo data � obrigat�rio.');
  quControleCaixa.AddValidation('caixa_id', opGreater, 0, 'Campo caixa � obrigat�rio.');
  quControleCaixa.AddValidation(CaixaNaoPertenceAEsseUsuario, 'Esse caixa n�o foi cadastrado para o usu�rio logado.');
  quControleCaixa.AddValidation(CaixaJaAbertoParaEssaData, 'Caixa j� foi aberto para data informada ou em uma data superior.');

  quControleCaixa.Append;
  AdicionarMoedasPadraoAoDataSet;
end;

procedure TfrControleDeCaixa.grMoedasEditChanged(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem);
begin
  if AItem = clQuantidade then
  begin
    clTotal.EditValue := clQuantidade.EditValue * clValor.EditValue;
  end;
end;

procedure TfrControleDeCaixa.lcCaixaExit(Sender: TObject);
begin
  VerificarSeEhAberturaOuFechamentoDoCaixa;
end;

function TfrControleDeCaixa.VerificarSeEhAberturaOuFechamentoDoCaixa : String;
begin
  if quCaixas.FieldByName('Situacao').AsString = 'F' then
  begin
    btAbrirFecharCaixa.Caption := 'Abrir Caixa';
    quControleCaixa.FieldByName('tipo').AsString := 'A';
    quControleCaixa.FieldByName('data').AsDateTime := quCaixas.FieldByName('data').AsDateTime + 1;
    edData.Enabled := True;
    edSituacaoCaixa.Text := 'Caixa Fechado';
  end
  else
  begin
    btAbrirFecharCaixa.Caption := 'Fechar Caixa';
    quControleCaixa.FieldByName('tipo').AsString := 'F';
    edData.Enabled := False;
    quControleCaixa.FieldByName('data').AsDateTime := quCaixas.FieldByName('data').AsDateTime;
    edSituacaoCaixa.Text := 'Caixa Aberto';
  end;

end;

procedure TfrControleDeCaixa.AdicionarMoedasPadraoAoDataSet;
begin
  quMoedasControle.DisableControls;
  quMoedas.First;
  while not quMoedas.Eof do
  begin
     quMoedasControle.Append;
     quMoedasControle.FieldByName('moeda_id').AsInteger := quMoedas.FieldByName('id').AsInteger;
     quMoedasControle.FieldByName('valor').AsFloat := quMoedas.FieldByName('valor').AsFloat;
     quMoedasControle.FieldByName('quantidade').AsInteger := 0;
     quMoedasControle.Post;
     quMoedas.Next;
  end;
  quMoedasControle.EnableControls;
end;

procedure TfrControleDeCaixa.RelacionarControleComMoedas;
var
  LSave : TZQuery;
begin
  LSave := TZQuery.Create(Self);
  LSave.Connection := quControleCaixa.Connection;
  LSave.CachedUpdates := True;
  LSave.SQL.Text := 'select * from controle_caixa_moedas where false;';
  LSave.Active := True;

  quMoedasControle.DisableControls;
  quMoedasControle.First;
  while not quMoedasControle.Eof do
  begin
    if quMoedasControle.FieldByName('quantidade').AsInteger <= 0 then
      quMoedasControle.Delete
    else
    begin
      LSave.Append;
      LSave.FieldByName('controle_caixa_id').AsInteger := quControleCaixa.FieldByName('id').AsInteger;
      LSave.FieldByName('moeda_id').AsInteger := quMoedasControle.FieldByName('moeda_id').AsInteger;
      LSave.FieldByName('quantidade').AsFloat := quMoedasControle.FieldByName('quantidade').AsFloat;
      LSave.FieldByName('total').AsFloat := quMoedasControle.FieldByName('total').AsFloat;
      LSave.Post;
    end;
  end;
  LSave.ApplyUpdates;
end;

{ Validations }

function TfrControleDeCaixa.CaixaNaoPertenceAEsseUsuario : Boolean;
begin
  Result := quCaixas.FieldByName('usuario_id').AsInteger = dmConexao.FUsuarioLogado;
end;


procedure TfrControleDeCaixa.clQuantidadePropertiesChange(Sender: TObject);
begin
  quMoedasControle.DisableControls;
  quMoedasControle.FieldByName('total').AsFloat := quMoedasControle.FieldByName('valor').AsFloat * TcxSpinEdit(Sender).Value;
  quMoedasControle.EnableControls;
end;

procedure TfrControleDeCaixa.clTotalPropertiesChange(Sender: TObject);
begin
  quMoedasControle.DisableControls;
  quMoedasControle.FieldByName('quantidade').AsFloat := TcxCurrencyEdit(Sender).Value / quMoedasControle.FieldByName('valor').AsFloat;
  quMoedasControle.EnableControls;
end;

constructor TfrControleDeCaixa.Create(AOwner: TComponent; ACaixaId : Integer);
begin
  inherited Create(AOwner);
  quCaixas.ParamByName('CAIXAID').Value := ACaixaId;
end;

function TfrControleDeCaixa.CaixaJaAbertoParaEssaData : Boolean;
begin
  if quCaixas.FieldByName('situacao').AsString = 'F' then
    Result := quControleCaixa.FieldByName('data').AsDateTime > quCaixas.FieldByName('data').AsDateTime
  else
    Result := quControleCaixa.FieldByName('data').AsDateTime = quCaixas.FieldByName('data').AsDateTime;
end;


end.
