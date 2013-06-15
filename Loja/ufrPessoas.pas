unit ufrPessoas;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxDBLookupComboBox, cxSpinEdit,
  cxDBEdit, cxGroupBox, cxRadioGroup, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZqueryValidation, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxNavigator, cxDBNavigator;

type
  TfrPessoas = class(TfrCadastroPadrao)
    lbCodigo: TcxLabel;
    edCodigo: TcxDBTextEdit;
    lbNome: TcxLabel;
    edNome: TcxDBTextEdit;
    lbDocumento: TcxLabel;
    lbEndereco: TcxLabel;
    edEndereco: TcxDBTextEdit;
    lbBairro: TcxLabel;
    edBairro: TcxDBTextEdit;
    edTelefone: TcxDBMaskEdit;
    edCelular: TcxDBMaskEdit;
    lbTelefone: TcxLabel;
    lbCelular: TcxLabel;
    rgSexo: TcxDBRadioGroup;
    edNumero: TcxDBSpinEdit;
    lbNumero: TcxLabel;
    lcCidade: TcxDBLookupComboBox;
    lbCidade: TcxLabel;
    edDocumento: TcxDBMaskEdit;
    quCidades: TZQuery;
    dsCidades: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    function ValidaSeDocumentoJaEstaCadastrado: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPessoas: TfrPessoas;

implementation

uses
  uSQLUtil;

{$R *.dfm}

procedure TfrPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  quCidades.Active := True;
  quDados.AddValidation('nome', opNotBlank, null, 'Campo nome deve ser preenchido.');
  quDados.AddValidation('sexo', opNotBlank, null, 'Campo sexo deve ser preenchido.');
  quDados.AddValidation('documento', opNotBlank, null, 'Campo documento não foi preenchido.', acWarning);
  quDados.AddValidation('telefone', opNotBlank, null, 'Campo telefone não foi preenchido.', acWarning);
  quDados.AddValidation(ValidaSeDocumentoJaEstaCadastrado, 'Documento já cadastrado para outra pessoa.');
end;

function TfrPessoas.ValidaSeDocumentoJaEstaCadastrado : Boolean;
var
  LDataSet : TZQuery;
begin
  Result := (quDados.FieldByName('documento').AsString = '') or
             GetBooleanThroughSQL('select count(*) = 0 from pessoas where documento = $$' + quDados.FieldByName('documento').AsString + '$$');
end;

end.
