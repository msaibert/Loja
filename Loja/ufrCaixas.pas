unit ufrCaixas;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxDBLookupComboBox, cxDBEdit,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZqueryValidation,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxNavigator, cxDBNavigator;

type
  TfrCaixas = class(TfrCadastroPadrao)
    lbCodigo: TcxLabel;
    lbDescricao: TcxLabel;
    edCodigo: TcxDBTextEdit;
    edDescricao: TcxDBTextEdit;
    lcOperador: TcxDBLookupComboBox;
    lbOperador: TcxLabel;
    quOperador: TZQuery;
    dsOperador: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCaixas: TfrCaixas;

implementation

{$R *.dfm}

procedure TfrCaixas.FormCreate(Sender: TObject);
begin
  inherited;
  quOperador.Active := True;
  quDados.AddValidation('descricao', opNotBlank, Null, 'Campo descrição deve ser preenchido.');
  quDados.AddValidation('usuario_id', opGreater, 0, 'Campo operador do caixa deve ser preenchido');
end;

end.
