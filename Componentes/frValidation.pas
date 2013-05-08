unit frValidation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, DBClient,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons,
  ExtCtrls, cxMemo, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator, Vcl.Menus;

type
  TFormValidation = class(TForm)
    quError: TClientDataSet;
    sfErrorDescricao: TStringField;
    quWarning: TClientDataSet;
    sfWarningDescricao: TStringField;
    dsError: TDataSource;
    dsWarning: TDataSource;
    gdErros: TcxGrid;
    glErrosLevel: TcxGridLevel;
    pnErros: TPanel;
    imgErrors: TImage;
    lbErrors: TLabel;
    srStyles: TcxStyleRepository;
    stErrors: TcxStyle;
    pnWarnings: TPanel;
    imgWarnings: TImage;
    lbWarnings: TLabel;
    gdWarnings: TcxGrid;
    glWarningsLevel: TcxGridLevel;
    grErrosDBTableView: TcxGridDBTableView;
    clErrosDBTableViewErrorsDBColumnMessage: TcxGridDBColumn;
    grWarningsDBTableView: TcxGridDBTableView;
    clWarningDBTableViewDBColumnMessage: TcxGridDBColumn;
    stWarning: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure AddError(AMessage : String);
    procedure AddWarning(AMessage : String);
  end;

var
  FormValidation: TFormValidation;

implementation

{$R *.dfm}

procedure TFormValidation.AddError(AMessage: String);
begin
  quError.Append;
  quError.FieldByName('message').AsString := AMessage;
  quError.Post;
end;

procedure TFormValidation.AddWarning(AMessage: String);
begin
  quWarning.Append;
  quWarning.FieldByName('message').AsString := AMessage;
  quWarning.Post;
end;

procedure TFormValidation.btOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormValidation.FormCreate(Sender: TObject);
begin
  quError.CreateDataSet;
  quWarning.CreateDataSet;
  quError.Open;
  quWarning.Open;
end;

procedure TFormValidation.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

end.
