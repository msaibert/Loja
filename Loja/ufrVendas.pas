unit ufrVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxDBEdit, cxCurrencyEdit, cxLabel, Vcl.DBCtrls, cxTextEdit,
  cxMemo, Vcl.ExtCtrls, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZqueryValidation,
  System.Actions, Vcl.ActnList, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrVendas = class(TForm)
    pnHeader: TPanel;
    pnFooter: TPanel;
    pnFita: TPanel;
    meFita: TcxMemo;
    pcVendaItems: TcxPageControl;
    tsCompras: TcxTabSheet;
    pnCompras: TPanel;
    lbProduto: TcxLabel;
    lbQuantidade: TcxLabel;
    lbValorUnitario: TcxLabel;
    edValorUnitario: TcxDBCurrencyEdit;
    edQuantidade: TcxDBSpinEdit;
    lbTotalDoProduto: TcxLabel;
    edTotalDoProduto: TcxDBCurrencyEdit;
    lbDesconto: TcxLabel;
    edDesconto: TcxDBCurrencyEdit;
    btAdicionarItem: TcxButton;
    btCancelarItem: TcxButton;
    lbSubTotal: TcxLabel;
    btFinalizarCompra: TcxButton;
    btConsultar: TcxButton;
    tsPagamento: TcxTabSheet;
    Panel1: TPanel;
    lbFormaPagemento: TcxLabel;
    lcFormaPagamento: TDBLookupComboBox;
    lbValorPago: TcxLabel;
    edValorPago: TcxDBCurrencyEdit;
    edSaldoRestante: TcxDBCurrencyEdit;
    lbSaldoRestante: TcxLabel;
    edTroco: TcxDBCurrencyEdit;
    lbTroco: TcxLabel;
    btPendurar: TcxButton;
    btImprimirComprovante: TcxButton;
    grGrid1DBTableView1: TcxGridDBTableView;
    glGridLevelSugestaoTroco: TcxGridLevel;
    gdSugestaoTroco: TcxGrid;
    lbUsuario: TcxLabel;
    lcUsuario: TDBLookupComboBox;
    lbCaixa: TcxLabel;
    lcCaixa: TDBLookupComboBox;
    lbData: TcxLabel;
    edData: TcxDBDateEdit;
    alEventos: TActionList;
    acNovoItem: TAction;
    lcProduto: TcxDBLookupComboBox;
    edSubTotal: TcxCurrencyEdit;
    acFinalizarCompra: TAction;
    acCancelarItem: TAction;
    acConsultarCadastro: TAction;
    acPendurarCompra: TAction;
    acImprimirFita: TAction;
    procedure FormCreate(Sender: TObject);
    procedure acNovoItemExecute(Sender: TObject);
    procedure edQuantidadePropertiesEditValueChanged(Sender: TObject);
    procedure lcProdutoPropertiesEditValueChanged(Sender: TObject);
    procedure acFinalizarCompraExecute(Sender: TObject);
  private
    procedure AbrirVenda;
    procedure NovoItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frVendas: TfrVendas;

implementation

{$R *.dfm}

uses udmConexao, udmVendas;

procedure TfrVendas.acFinalizarCompraExecute(Sender: TObject);
begin
  pcVendaItems.SelectNextPage(True);
  tsPagamento.TabVisible := True;
  tsCompras.TabVisible := False;
end;

procedure TfrVendas.acNovoItemExecute(Sender: TObject);
begin
  dmVendas.quVendaItens.Post;
  meFita.Text := meFita.Text + dmVendas.quProduto.FieldByName('descricao').AsString + ' - '  + lcProduto.Text + ' * ' + edQuantidade.Text + #13;
  edSubTotal.Value := edSubTotal.Value + edTotalDoProduto.Value;
  NovoItem;
end;

procedure TfrVendas.edQuantidadePropertiesEditValueChanged(Sender: TObject);
begin
  edTotalDoProduto.Value := edQuantidade.Value * edValorUnitario.Value;
end;

procedure TfrVendas.FormCreate(Sender: TObject);
begin
  dmVendas.quPadroes.Active := True;
  dmVendas.quProduto.Active := True;
  AbrirVenda;
  dmVendas.quVendaItens.Active := True;
  NovoItem;
end;

procedure TfrVendas.lcProdutoPropertiesEditValueChanged(Sender: TObject);
begin
  edValorUnitario.Value := dmVendas.quProduto.FieldByName('preco_final').AsFloat;
  edTotalDoProduto.Value := edQuantidade.Value * edValorUnitario.Value;
end;

procedure TfrVendas.AbrirVenda;
begin
  tsPagamento.TabVisible := False;
  dmVendas.quVendas.Active := True;
  dmVendas.quVendas.Append;
  dmVendas.quVendas.FieldByName('data').AsDateTime := Now;
  dmVendas.quVendas.FieldByName('operacao_id').AsInteger := dmVendas.quPadroes.FieldByName('operacao_venda').AsInteger;
  dmVendas.quVendas.FieldByName('usuario_id').AsInteger := 1;
  dmVendas.quVendas.Post;
end;

procedure TfrVendas.NovoItem;
begin
  dmVendas.quVendaItens.Append;
  dmVendas.quVendaItens.FieldByName('venda_id').AsInteger := dmVendas.quVendas.FieldByName('Id').AsInteger;
  dmVendas.quVendaItens.FieldByName('quantidade').AsInteger := 1;
end;

end.
