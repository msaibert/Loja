unit ufrUsuarios;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxMaskEdit, cxDBEdit,
  cxDBLookupComboBox, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZqueryValidation, cxLabel, cxTextEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxNavigator, cxDBNavigator;

type
  TfrUsuarios = class(TfrCadastroPadrao)
    lbPessoa: TcxLabel;
    lcPessoa: TcxDBLookupComboBox;
    edLogin: TcxDBTextEdit;
    edPassWord: TcxDBMaskEdit;
    lbLogin: TcxLabel;
    lbSenha: TcxLabel;
    lbConfirmarSenha: TcxLabel;
    edConfirmarSenha: TcxMaskEdit;
    quPessoa: TZQuery;
    dsPessoa: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edConfirmarSenhaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frUsuarios: TfrUsuarios;

implementation

{$R *.dfm}

procedure TfrUsuarios.edConfirmarSenhaExit(Sender: TObject);
begin
  inherited;
  (quDados.Validations[3] as IValidation).Expected := edConfirmarSenha.Text;
end;

procedure TfrUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  quPessoa.Active := True;
  quDados.AddValidation('pessoa_id', opGreater, 0, 'Campo pessoa deve ser preenchido.');
  quDados.AddValidation('login', opNotBlank, Null, 'Campo login deve ser preenchido.');
  quDados.AddValidation('senha', opNotBlank, Null, 'Campo senha deve ser preenchido.');
  quDados.AddValidation('senha', opEqual, edConfirmarSenha.Text, 'Senha e Confirmação de senha não correspondem.');
end;


end.
