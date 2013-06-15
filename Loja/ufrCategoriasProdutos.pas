unit ufrCategoriasProdutos;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxDBEdit, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZqueryValidation, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxNavigator, cxDBNavigator;

type
  TfrCategoriasProdutos = class(TfrCadastroPadrao)
    edDescricao: TcxDBTextEdit;
    lbDescricao: TcxLabel;
    lbCodigo: TcxLabel;
    edCodigo: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
  private
    function ValidaParaQueCateriaJaUsadaNaoSejaAlterada: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCategoriasProdutos: TfrCategoriasProdutos;

implementation

uses
  uSQLUtil;

{$R *.dfm}

procedure TfrCategoriasProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  quDados.AddValidation('descricao', opNotBlank, null, 'Campo descrição deve ser preenchido.');
  quDados.AddValidation(ValidaParaQueCateriaJaUsadaNaoSejaAlterada, 'Você não pode alterar essa categoria de produto, pois ela já esta vinculada a produtos cadastrados.');
end;

function TfrCategoriasProdutos.ValidaParaQueCateriaJaUsadaNaoSejaAlterada : Boolean;
begin
  Result := True;
  if quDados.FieldByName('id').AsInteger = 0 then
    Exit;
  if quDados.FieldByName('descricao').Value <> quDados.FieldByName('descricao').OldValue then
    Result := GetBooleanThroughSQL('select count(*) = 0 from produtos where categoria_id = $$' + quDados.FieldByName('id').AsString + '$$');
end;

end.
