unit ufrRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxButtons, System.Actions, Vcl.ActnList,
  frxClass, ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, frxDBSet, frxbarcode, Vcl.Menus, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrRelatorios = class(TForm)
    pnCampos: TPanel;
    pnBotoes: TPanel;
    btImprimir: TcxButton;
    lcStyle: TcxLookAndFeelController;
    acAtalhos: TActionList;
    acImprimir: TAction;
    acCancelar: TAction;
    btCancelar: TcxButton;
    frRelatorio: TfrxReport;
    quDataset: TfrxDBDataset;
    quRelatorio: TZQuery;
    procedure acCancelarExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  published
    function IsValid: Boolean; virtual; abstract;
    procedure AddParameter; virtual; abstract;
  end;


implementation

{$R *.dfm}

procedure TfrRelatorios.acCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrRelatorios.acImprimirExecute(Sender: TObject);
begin
  if not IsValid then
    Exit;

  AddParameter;

  frRelatorio.ShowReport;
end;

procedure TfrRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfrRelatorios.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
