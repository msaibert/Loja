unit ufrMovimentoDeEstoque;

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
  dxSkinXmas2008Blue, cxNavigator, cxDBNavigator, cxMemo, cxDBEdit,
  cxCurrencyEdit, cxSpinEdit, cxLabel, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZqueryValidation;

type
  TfrMovimentoDeEstoque = class(TForm)
    quMovimento: TZqueryValidation;
    dsMovimento: TDataSource;
    lcProduto: TcxDBLookupComboBox;
    edData: TcxDBDateEdit;
    lbData: TcxLabel;
    lbProduto: TcxLabel;
    lcOperacao: TcxDBLookupComboBox;
    lbOperacao: TcxLabel;
    edQuantidade: TcxDBSpinEdit;
    lbQuantidade: TcxLabel;
    edValorUnitario: TcxDBCurrencyEdit;
    lbValorUnitario: TcxLabel;
    lbValorTotal: TcxLabel;
    lbDesconto: TcxLabel;
    mmObservacoes: TcxDBMemo;
    lbObservacoes: TcxLabel;
    nvMovimento: TcxDBNavigator;
    quOperacoes: TZQuery;
    dsOperacoes: TDataSource;
    quProdutos: TZQuery;
    dsProdutos: TDataSource;
    edDesconto: TcxDBCurrencyEdit;
    edNotaFiscal: TcxDBTextEdit;
    lbNotaFiscal: TcxLabel;
    edValorTotal: TcxDBCurrencyEdit;
    procedure edValorUnitarioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMovimentoDeEstoque: TfrMovimentoDeEstoque;

implementation

{$R *.dfm}

uses udmConexao;

procedure TfrMovimentoDeEstoque.edValorUnitarioExit(Sender: TObject);
begin
   edValorTotal.Value := edQuantidade.Value * edValorUnitario.Value;
end;

procedure TfrMovimentoDeEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrMovimentoDeEstoque.FormCreate(Sender: TObject);
begin
  quMovimento.AddValidation('operacao_id', opGreater, 0, 'Campo operação deve ser preenchido');
  quMovimento.AddValidation('produto_id', opGreater, 0, 'Campo produto deve ser preenchido');
  quMovimento.AddValidation('quantidade', opGreater, 0, 'Campo quantidade deve ser preenchido');
  quMovimento.AddValidation('valor_unitario', opGreater, 0, 'Campo valor unitário deve ser preenchido');
  quMovimento.AddValidation('data', opGreater, Now, 'Campo data não deve ser maior que a data atual', acError, True);
  quMovimento.AddValidation('data', opNotBlank, null, 'Campo data deve ser preenchido');
end;

end.
