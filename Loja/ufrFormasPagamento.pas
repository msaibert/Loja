unit ufrFormasPagamento;

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
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZqueryValidation,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxNavigator, cxDBNavigator;

type
  TfrFormasPagamento = class(TfrCadastroPadrao)
    lbCodigo: TcxLabel;
    edCodigo: TcxDBTextEdit;
    lbDescricao: TcxLabel;
    edDescricao: TcxDBTextEdit;
    rgForma: TcxDBRadioGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frFormasPagamento: TfrFormasPagamento;

implementation

{$R *.dfm}

procedure TfrFormasPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  quDados.AddValidation('descricao', opNotBlank, null, 'Campo descrição deve ser preenchido.');
  quDados.AddValidation('tipo', opNotBlank, null, 'Campo forma de pagamento deve ser preenchido.');
end;

end.
