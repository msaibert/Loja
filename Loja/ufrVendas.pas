unit ufrVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxDBEdit, cxCurrencyEdit, cxLabel, Vcl.DBCtrls, cxTextEdit,
  cxMemo, Vcl.ExtCtrls, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZqueryValidation,
  System.Actions, Vcl.ActnList, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Datasnap.DBClient, Math, dxSkinsCore;

type
  TfrVendas = class(TForm)
    pnHeader: TPanel;
    pnFooter: TPanel;
    pnFita: TPanel;
    pcVendaItems: TcxPageControl;
    tsCompras: TcxTabSheet;
    pnCompras: TPanel;
    lbProduto: TcxLabel;
    lbQuantidade: TcxLabel;
    lbValorUnitario: TcxLabel;
    edValorUnitario: TcxDBCurrencyEdit;
    edQuantidade: TcxDBSpinEdit;
    lbTotalDoProduto: TcxLabel;
    lbDesconto: TcxLabel;
    edDesconto: TcxDBCurrencyEdit;
    btAdicionarItem: TcxButton;
    lbSubTotal: TcxLabel;
    tsPagamento: TcxTabSheet;
    Panel1: TPanel;
    lbValorPago: TcxLabel;
    lbSaldoRestante: TcxLabel;
    lbTroco: TcxLabel;
    lbUsuario: TcxLabel;
    lbCaixa: TcxLabel;
    lbData: TcxLabel;
    edData: TcxDBDateEdit;
    alEventos: TActionList;
    acNovoItem: TAction;
    lcProduto: TcxDBLookupComboBox;
    acFinalizarCompra: TAction;
    acCancelarItem: TAction;
    acConsultarCadastro: TAction;
    acPendurarCompra: TAction;
    acImprimirFita: TAction;
    btConsultar: TcxButton;
    btFinalizarCompra: TcxButton;
    btEfetuarPagamento: TcxButton;
    lbFormaPagemento: TcxLabel;
    lbOperacao: TcxLabel;
    btDesconto: TcxButton;
    lcFormaDePagamento: TcxDBLookupComboBox;
    lcOperacao: TcxDBLookupComboBox;
    acEfetuarPagamento: TAction;
    edSubTotal: TcxDBCurrencyEdit;
    pnImprimir: TPanel;
    btImprimirComprovante: TcxButton;
    grCupom: TcxGridDBTableView;
    glCupom: TcxGridLevel;
    gdCupom: TcxGrid;
    clTexto: TcxGridDBColumn;
    srCupom: TcxStyleRepository;
    stCupom: TcxStyle;
    edSaldoRestante: TcxCurrencyEdit;
    edTroco: TcxCurrencyEdit;
    edValorPago: TcxCurrencyEdit;
    quCupom: TClientDataSet;
    dsCupom: TDataSource;
    mmCupomText: TMemoField;
    pmFita: TPopupMenu;
    miExcluir: TMenuItem;
    miImprimir: TMenuItem;
    btCancelarItem: TcxButton;
    acExcluirItemPelaFita: TAction;
    acExcluirItemPelaTela: TAction;
    edTotalDoProduto: TcxCurrencyEdit;
    btAbrirCaixa: TcxButton;
    lcUsuario: TcxDBLookupComboBox;
    lcCaixa: TcxDBLookupComboBox;
    lbPessoa: TcxLabel;
    lcPessoa: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure acNovoItemExecute(Sender: TObject);
    procedure AtualizarValorTotalProduto(Sender: TObject);
    procedure lcProdutoPropertiesEditValueChanged(Sender: TObject);
    procedure acEfetuarPagamentoExecute(Sender: TObject);
    procedure acFinalizarCompraExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edValorPagoExit(Sender: TObject);
    procedure acCancelarItemExecute(Sender: TObject);
    procedure acExcluirItemPelaFitaExecute(Sender: TObject);
    procedure acExcluirItemPelaTelaExecute(Sender: TObject);
    procedure btAbrirCaixaClick(Sender: TObject);
    procedure lcOperacaoExit(Sender: TObject);
  private
    procedure NovoItem;
    procedure RelacionarVendaComItens;
    procedure AtivarDataSets(AAtivar : Boolean = True);
    function GerarMovimentoCaixa: Integer;
    procedure GerarMovimentoEstoque;
    procedure NovaVenda;
    procedure AdicionarCupom;
    function CabecalhoCupom: TStringList;
    procedure AcrescerSubTotal;
    procedure DecrescerSubTotal;
    procedure AdicionarValidacoes;
    function VerificaSeCaixaEstaAberto: Boolean;
    function VerificaDataDoCaixa: Boolean;
    procedure GerarMovimentoPendencias;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frVendas: TfrVendas;

const
  COLUNAS : Integer = 48;

implementation

{$R *.dfm}

uses udmConexao, udmVendas, uStringUtil, uMathUtil,
  ufrCancelarItem, ufrControleDeCaixa, uSQLUtil;

procedure TfrVendas.acCancelarItemExecute(Sender: TObject);
begin
  frCancelarItem := TfrCancelarItem.Create(nil);
  frCancelarItem.clBotao.Properties.Buttons[0].Action := acExcluirItemPelaTela;
  frCancelarItem.ShowModal;
  NovoItem;
end;

procedure TfrVendas.acEfetuarPagamentoExecute(Sender: TObject);
begin
  pcVendaItems.ActivePage := tsPagamento;
  edValorPago.Value := dmVendas.quVendas.FieldByName('valor_total').AsFloat;
end;

procedure TfrVendas.acExcluirItemPelaFitaExecute(Sender: TObject);
begin
  dmVendas.quVendaItens.DisableControls;
  dmVendas.quVendaItens.Cancel;
  dmVendas.quVendaItens.RecNo := quCupom.RecNo - 1;
  DecrescerSubTotal;
  dmVendas.quVendaItens.Delete;
  quCupom.Delete;
  NovoItem;
  dmVendas.quVendaItens.EnableControls;
end;

procedure TfrVendas.acExcluirItemPelaTelaExecute(Sender: TObject);
begin
  quCupom.RecNo := dmVendas.quVendaItens.RecNo + 1;
  DecrescerSubTotal;
  dmVendas.quVendaItens.Delete;
  quCupom.Delete;
end;

procedure TfrVendas.acFinalizarCompraExecute(Sender: TObject);
begin
  {sempre que é adicionado um item, é dado um append no data set o que causará uma linha
  em branco sempre no dataset, para isso a verificação abaixo.}
  try
    if dmVendas.quVendaItens.FieldByName('produto_id').AsInteger = 0 then
      dmVendas.quVendaItens.Cancel;

    dmConexao.connectionSistema.StartTransaction;

    dmVendas.quVendas.ApplyUpdates;
    RelacionarVendaComItens;
    dmVendas.quVendaItens.ApplyUpdates;

    GerarMovimentoCaixa;
    GerarMovimentoEstoque;
    GerarMovimentoPendencias;

    dmConexao.connectionSistema.Commit;

    NovaVenda;
    NovoItem;
  except
    dmConexao.connectionSistema.Rollback;
  end;
end;

procedure TfrVendas.acNovoItemExecute(Sender: TObject);
begin
  btAdicionarItem.SetFocus;
  AcrescerSubTotal;
  AdicionarCupom;
  NovoItem;
end;

procedure TfrVendas.AtualizarValorTotalProduto(Sender: TObject);
begin
  edTotalDoProduto.Value := (edQuantidade.Value * edValorUnitario.Value) - edDesconto.Value;
end;

procedure TfrVendas.btAbrirCaixaClick(Sender: TObject);
begin
  frControleDeCaixa := TfrControleDeCaixa.Create(nil);
  frControleDeCaixa.ShowModal;
end;

procedure TfrVendas.edValorPagoExit(Sender: TObject);
begin
  edSaldoRestante.Value := Abs(Min(0.00, (edValorPago.Value - edSubTotal.Value)));
  edTroco.Value := Abs(Max(0.00, (edValorPago.Value - edSubTotal.Value)));
  dmVendas.quVendas.FieldByName('valor_pendente').AsFloat := edSaldoRestante.Value;
end;

procedure TfrVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmVendas.Free;
  Action := caFree;
end;

procedure TfrVendas.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TdmVendas, dmVendas);
  AtivarDataSets;
  AdicionarValidacoes;
  NovaVenda;
  NovoItem;
end;

procedure TfrVendas.lcOperacaoExit(Sender: TObject);
begin
  lcPessoa.Enabled := dmVendas.quOperacao.FieldByName('movimentar_pendencia').AsBoolean;
end;

procedure TfrVendas.lcProdutoPropertiesEditValueChanged(Sender: TObject);
begin
  if dmVendas.quVendaItens.State = dsInsert then
    dmVendas.quVendaItens.FieldByName('valor_unitario').AsFloat := dmVendas.quProduto.FieldByName('preco_final').AsFloat;
  edTotalDoProduto.Value := edQuantidade.Value * edValorUnitario.Value;
end;


procedure TfrVendas.AtivarDataSets(AAtivar : Boolean = True);
begin
  dmVendas.quProduto.Active := AAtivar;
  dmVendas.quPessoa.Active := AAtivar;
  dmVendas.quVendaItens.Active := AAtivar;
  dmVendas.quVendas.Active := AAtivar;
  dmVendas.quUsuario.Active := AAtivar;
  dmVendas.quCaixa.Active := AAtivar;
  dmVendas.quOperacao.Active := AAtivar;
  dmVendas.quFormaDePagamento.Active := AAtivar;
  dmVendas.quMovimentoCaixa.Active := AAtivar;
  dmVendas.quMovimentoEstoque.Active := AAtivar;
  dmVendas.quMovimentoPendencia.Active := AAtivar;
end;

procedure TfrVendas.NovoItem;
begin
  dmVendas.quVendaItens.Append;
  dmVendas.quVendaItens.FieldByName('quantidade').AsInteger := 1;
  try
    lcProduto.SetFocus;
  except

  end;
end;

procedure TfrVendas.NovaVenda;
begin
  pcVendaItems.ActivePage := tsCompras;
  dmVendas.quVendas.Close;
  dmVendas.quVendas.Open;
  dmVendas.quVendaItens.Close;
  dmVendas.quVendaItens.Open;
  dmVendas.quVendas.Append;
  quCupom.EmptyDataSet;
  quCupom.Append;
  quCupom.FieldByName('cupom').AsString := CabecalhoCupom.Text;
  quCupom.Post;
  dmVendas.quVendas.FieldByName('data').AsDateTime := Now;
  dmVendas.quVendas.FieldByName('usuario_id').AsInteger := dmVendas.quUsuario.FieldByName('id').AsInteger;
end;

procedure TfrVendas.RelacionarVendaComItens;
var
  LVendaId : Integer;
begin
  LVendaId := dmVendas.quVendas.FieldByName('id').AsInteger;
  dmVendas.quVendaItens.First;
  while not dmVendas.quVendaItens.Eof do
  begin
    dmVendas.quVendaItens.Edit;
    dmVendas.quVendaItens.FieldByName('venda_id').AsInteger := LVendaId;
    dmVendas.quVendaItens.Next;
  end;

end;

procedure TfrVendas.AcrescerSubTotal;
begin
  with dmVendas.quVendaItens do
  begin
    dmVendas.quVendas.FieldByName('valor_total').asFloat := dmVendas.quVendas.FieldByName('valor_total').asFloat +
    ((FieldByName('valor_unitario').AsFloat * FieldByName('quantidade').AsInteger) - FieldByName('valor_desconto').AsFloat);
  end;
end;

procedure TfrVendas.DecrescerSubTotal;
begin
  with dmVendas.quVendaItens do
  begin
    dmVendas.quVendas.FieldByName('valor_total').asFloat := dmVendas.quVendas.FieldByName('valor_total').asFloat -
    ((FieldByName('valor_unitario').AsFloat * FieldByName('quantidade').AsInteger) - FieldByName('valor_desconto').AsFloat);
  end;
end;

function TfrVendas.GerarMovimentoCaixa : Integer;
begin
  if dmVendas.quOperacao.FieldByName('movimentar_caixa').AsBoolean then
  begin
    with dmVendas do
    begin
      quMovimentoCaixa.Append;
      quMovimentoCaixa.FieldByName('venda_id').AsInteger     := quVendas.FieldByName('id').AsInteger;
      quMovimentoCaixa.FieldByName('operacao_id').AsInteger  := quVendas.FieldByName('operacao_id').AsInteger;
      quMovimentoCaixa.FieldByName('caixa_id').AsInteger     := quVendas.FieldByName('caixa_id').AsInteger;
      quMovimentoCaixa.FieldByName('valor').AsFloat          := quVendas.FieldByName('valor_pago').AsFloat;
      quMovimentoCaixa.FieldByName('valor_desconto').AsFloat := quVendas.FieldByName('valor_desconto').AsFloat;
      quMovimentoCaixa.FieldByName('data').AsDateTime        := quVendas.FieldByName('data').AsDateTime;
      quMovimentoCaixa.Post;
      Result := quMovimentoCaixa.FieldByName('id').AsInteger;
    end;
  end;
end;

procedure TfrVendas.GerarMovimentoEstoque;
begin
  if dmVendas.quOperacao.FieldByName('movimentar_estoque').AsBoolean then
  begin
    with dmVendas do
    begin
      quVendaItens.First;
      while not quVendaItens.Eof do
      begin
        quMovimentoEstoque.Append;
        quMovimentoEstoque.FieldByName('venda_id').AsInteger     := quVendas.FieldByName('id').AsInteger;
        quMovimentoEstoque.FieldByName('operacao_id').AsInteger  := quVendas.FieldByName('operacao_id').AsInteger;
        quMovimentoEstoque.FieldByName('data').AsDateTime        := quVendas.FieldByName('data').AsDateTime;
        quMovimentoEstoque.FieldByName('produto_id').AsInteger   := quVendaItens.FieldByName('produto_id').AsInteger;
        quMovimentoEstoque.FieldByName('quantidade').AsInteger   := quVendaItens.FieldByName('quantidade').AsInteger;
        quMovimentoEstoque.FieldByName('valor_unitario').AsFloat := quVendaItens.FieldByName('valor_unitario').AsFloat;
        quMovimentoEstoque.FieldByName('valor_desconto').AsFloat := quVendaItens.FieldByName('valor_desconto').AsFloat;
        quVendaItens.Next;
      end;
    end;
  end;
end;

procedure TfrVendas.GerarMovimentoPendencias;
begin
  if dmVendas.quOperacao.FieldByName('movimentar_pendencia').AsBoolean and
     (dmVendas.quVendas.FieldByName('valor_pendente').AsFloat > 0.00)
  then
  begin
    with dmVendas do
    begin
        quMovimentoPendencia.Append;
        quMovimentoPendencia.FieldByName('pessoa_id').AsInteger    := quPessoa.FieldByName('id').AsInteger;
        quMovimentoPendencia.FieldByName('venda_id').AsInteger     := quVendas.FieldByName('id').AsInteger;
        quMovimentoPendencia.FieldByName('operacao_id').AsInteger  := quVendas.FieldByName('operacao_id').AsInteger;
        quMovimentoPendencia.FieldByName('caixa_id').AsInteger     := quVendas.FieldByName('caixa_id').AsInteger;
        quMovimentoPendencia.FieldByName('valor').AsFloat          := quVendas.FieldByName('valor_pendente').AsFloat;
        quMovimentoPendencia.FieldByName('data').AsDateTime        := quVendas.FieldByName('data').AsDateTime;
        quMovimentoPendencia.Post;
    end;
  end;
end;

procedure TfrVendas.AdicionarCupom;
var
  LItem, LValorTotal : String;
const
  QUEBRA_DE_LINHA : String = #13#10;
begin
  LValorTotal :=
  FloatToStr((dmVendas.quProduto.FieldByName('preco_final').AsFloat * dmVendas.quVendaItens.FieldByName('quantidade').AsInteger) - dmVendas.quVendaItens.FieldByName('valor_desconto').AsFloat);

  LItem := S(dmVendas.quProduto.FieldByName('descricao').AsString).LPAD(' ', COLUNAS - 3).Value + 'Uni';
  LItem := LItem + QUEBRA_DE_LINHA;
  LItem := LItem + S(dmVendas.quVendaItens.FieldByName('quantidade').AsString).LPAD(' ', 12).Value;
  LItem := LItem + S(dmVendas.quProduto.FieldByName('preco_final').AsString).LPAD(' ', 12).Value;
  LItem := LItem + S(dmVendas.quVendaItens.FieldByName('valor_desconto').AsString).LPAD(' ', 12).Value;
  LItem := LItem + S(LValorTotal).LPAD(' ', 12, alRight).Value;

  quCupom.Append;
  quCupom.FieldByName('cupom').AsString := LItem;
  quCupom.Post;
end;

function TfrVendas.CabecalhoCupom : TStringList;
var
  LLinha : String;
const
  CARACTERE_TRACADO_UM : string = '=';
  CARACTERE_TRACADO_DOIS : string = '-';
begin
  Result := TStringList.Create;
  Result.Add(S(CARACTERE_TRACADO_UM).RepeatString(COLUNAS).Value);

  Result.Add(S(dmConexao.quPadroes.FieldByName('nome_fantasia').AsString).LPAD(' ', COLUNAS).Value);

  LLinha := S('Telefone: ' + dmConexao.quPadroes.FieldByName('telefone').AsString).LPAD(' ', Trunc(COLUNAS / 2)).Value;
  LLinha := LLinha + S('CNPJ: '+ dmConexao.quPadroes.FieldByName('cnpj').AsString).LPAD(' ', Trunc(COLUNAS / 2), alRight).Value;
  Result.Add(LLinha);

  Result.Add(S(CARACTERE_TRACADO_DOIS).RepeatString(COLUNAS).Value);

  LLinha := S('Venda: ' + dmVendas.quVendas.FieldByName('id').AsString).LPAD('0', 8).LPAD(' ', Trunc(COLUNAS / 2)).Value;
  LLinha := LLinha + S(DateToStr(Now)).LPAD(' ', Trunc(COLUNAS / 2), alRight).Value;
  Result.Add(LLinha);

  Result.Add(S(CARACTERE_TRACADO_UM).RepeatString(COLUNAS).Value)
end;


{Validações}

procedure TfrVendas.AdicionarValidacoes;
begin
  dmVendas.quVendas.AddValidation('operacao_id', opGreater, 0, 'Campo operação deve ser preenchido.');
  dmVendas.quVendas.AddValidation('caixa_id', opGreater, 0, 'Campo caixa deve ser preenchido.');
  dmVendas.quVendas.AddValidation(VerificaSeCaixaEstaAberto, 'Caixa deve estar aberto para efetuar vendas.');
  dmVendas.quVendas.AddValidation(VerificaDataDoCaixa, 'Caixa não esta aberto para a data do sistema.');
end;

function TfrVendas.VerificaSeCaixaEstaAberto : Boolean;
begin
  Result := 'A' = GetStringThroughSQL('select SituacaoCaixa('+dmVendas.quCaixa.FieldByName('id').AsString+');');
end;

function TfrVendas.VerificaDataDoCaixa : Boolean;
begin
  Result := GetDateThroughSQL('select DataCaixa('+dmVendas.quCaixa.FieldByName('id').AsString+');') = dmVendas.quVendas.FieldByName('data').AsDateTime;
end;

end.
