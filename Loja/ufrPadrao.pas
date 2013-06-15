unit ufrPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxNavigator,
  cxDBNavigator, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZqueryValidation;

type
  TfrCadastroPadrao = class(TForm)
    quDados: TZqueryValidation;
    dsDados: TDataSource;
    nvDados: TcxDBNavigator;
    lcPesquisa: TcxLookupComboBox;
    lbPesquisa: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcPesquisaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroPadrao: TfrCadastroPadrao;

implementation

{$R *.dfm}

uses udmConexao;

procedure TfrCadastroPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  quDados.Free;
  Action := caFree;
end;

procedure TfrCadastroPadrao.FormCreate(Sender: TObject);
begin
  quDados.Active := True;
end;

procedure TfrCadastroPadrao.lcPesquisaExit(Sender: TObject);
begin
  lcPesquisa.Text := '';
end;

end.
