unit ufrPadroes;

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
  dxSkinXmas2008Blue, cxNavigator, cxDBNavigator, cxLabel, cxDBEdit, cxTextEdit,
  cxMaskEdit;

type
  TfrPadroes = class(TForm)
    edCNPJ: TcxDBMaskEdit;
    edNomeFantasia: TcxDBTextEdit;
    edRazaoSocial: TcxDBTextEdit;
    edTelefone: TcxDBMaskEdit;
    lbCNPJ: TcxLabel;
    lbNomeFantasia: TcxLabel;
    lbRazaoSocial: TcxLabel;
    lbTelefone: TcxLabel;
    nvPadroes: TcxDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPadroes: TfrPadroes;

implementation

uses
  udmConexao;

{$R *.dfm}

procedure TfrPadroes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
