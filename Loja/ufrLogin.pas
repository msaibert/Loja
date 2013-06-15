unit ufrLogin;

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
  dxSkinXmas2008Blue, Vcl.Menus, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZqueryValidation, Vcl.StdCtrls, cxButtons, cxMaskEdit, cxTextEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.ExtCtrls, cxLabel, Vcl.Imaging.jpeg;

type
  TfrLogin = class(TForm)
    igLogo: TImage;
    lcUser: TcxLookupComboBox;
    edSenha: TcxMaskEdit;
    btLogar: TcxButton;
    quLogin: TZqueryValidation;
    dsLogin: TDataSource;
    lbErro: TcxLabel;
    procedure btLogarClick(Sender: TObject);
    procedure lcUserEnter(Sender: TObject);
    procedure edSenhaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcUserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frLogin: TfrLogin;

implementation

{$R *.dfm}

uses udmConexao, ufrPrin;

procedure TfrLogin.btLogarClick(Sender: TObject);
begin
  if quLogin.FieldByName('senha').AsString = edSenha.Text then
  begin
    Self.Close;
    dmConexao.FUsuarioLogado := quLogin.FieldByName('id').AsInteger;
  end
  else
    lbErro.Visible := True;
end;

procedure TfrLogin.edSenhaEnter(Sender: TObject);
begin
  lbErro.Visible := False;
end;

procedure TfrLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Application.Terminate;
end;

procedure TfrLogin.FormCreate(Sender: TObject);
begin
  quLogin.Active := True;
end;

procedure TfrLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
     Self.Close;
end;

procedure TfrLogin.lcUserEnter(Sender: TObject);
begin
  lbErro.Visible := False;
end;

procedure TfrLogin.lcUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
     edSenha.SetFocus;
end;

procedure TfrLogin.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btLogar.SetFocus;
end;


end.
