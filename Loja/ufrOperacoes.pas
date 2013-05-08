unit ufrOperacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit,
  cxCheckBox, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZqueryValidation, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxNavigator, cxDBNavigator;

type
  TfrOperacoes = class(TfrCadastroPadrao)
    edCodigo: TcxDBTextEdit;
    edDescricao: TcxDBTextEdit;
    cbEstoque: TcxDBCheckBox;
    rgEstoque: TcxDBRadioGroup;
    cbCaixa: TcxDBCheckBox;
    rgCaixa: TcxDBRadioGroup;
    lbCodigo: TcxLabel;
    lbDescricao: TcxLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frOperacoes: TfrOperacoes;

implementation

{$R *.dfm}

procedure TfrOperacoes.FormCreate(Sender: TObject);
begin
  inherited;
  quDados.AddValidation('descricao', opNotBlank, null, 'Campo descrição deve ser preenchido.');
  quDados.AddValidation('movimentar_estoque', opEqual, False, 'Campo movimentar estoque não marcado. Operação não irá realizar movimento em estoque', acWarning);
  quDados.AddValidation('movimentar_caixa', opEqual, False, 'Campo movimentar caixa não marcado. Operação não irá realizar movimentos em caixa.', acWarning);
end;

end.
