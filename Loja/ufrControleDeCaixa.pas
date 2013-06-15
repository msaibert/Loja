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
    quMoedasControle: TZQuery;
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
    procedure FormCreate(Sender: TObject);
    procedure btAbrirFecharCaixaClick(Sender: TObject);
    procedure lcCaixaExit(Sender: TObject);
    procedure grMoedasEditChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
  private
    function CaixaNaoPertenceAEsseUsuario: Boolean;
    function VerificarSeEhAberturaOuFechamentoDoCaixa : String;
    procedure AdicionarMoedasPadraoAoDataSet;
    procedure RelacionarControleComMoedas;
    function CaixaJaAbertoParaEssaData: Boolean;
    { Private declarations }
  public
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
  quMoedasControle.ApplyUpdates;
  Self.Close;
end;

procedure TfrControleDeCaixa.FormCreate(Sender: TObject);
begin
  quCaixas.Active := True;
  quControleCaixa.Active := True;
  quMoedasControle.Active := True;
  quMoedas.Active := True;

  quControleCaixa.AddValidation('data', opNotBlank, null, 'Campo data é obrigatório.');
  quControleCaixa.AddValidation('caixa_id', opGreater, 0, 'Campo caixa é obrigatório.');
  quControleCaixa.AddValidation(CaixaNaoPertenceAEsseUsuario, 'Esse caixa não foi cadastrado para o usuário logado.');
  quControleCaixa.AddValidation(CaixaJaAbertoParaEssaData, 'Caixa já foi aberto para data informada ou em uma data superior.');

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
  while not quMoedas.Eof do
  begin
     quMoedasControle.Append;
     quMoedasControle.FieldByName('moeda_id').AsInteger := quMoedas.FieldByName('id').AsInteger;
     quMoedasControle.FieldByName('quantidade').AsInteger := 0;
     quMoedasControle.Post;
     quMoedas.Next;
  end;
  quMoedasControle.EnableControls;
end;

procedure TfrControleDeCaixa.RelacionarControleComMoedas;
begin
  quMoedasControle.DisableControls;
  quMoedasControle.First;
  while not quMoedasControle.Eof do
  begin
    if quMoedasControle.FieldByName('quantidade').AsInteger <= 0 then
      quMoedasControle.Delete
    else
    begin
      quMoedasControle.Edit;
      quMoedasControle.FieldByName('controle_caixa_id').AsInteger := quControleCaixa.FieldByName('id').AsInteger;
      quMoedasControle.Next;
    end;
  end;
end;

{ Validations }

function TfrControleDeCaixa.CaixaNaoPertenceAEsseUsuario : Boolean;
begin
  Result := quCaixas.FieldByName('usuario_id').AsInteger = dmConexao.FUsuarioLogado;
end;


function TfrControleDeCaixa.CaixaJaAbertoParaEssaData : Boolean;
begin
  if quCaixas.FieldByName('situacao').AsString = 'F' then
    Result := quControleCaixa.FieldByName('data').AsDateTime > quCaixas.FieldByName('data').AsDateTime
  else
    Result := quControleCaixa.FieldByName('data').AsDateTime = quCaixas.FieldByName('data').AsDateTime;
end;


end.
