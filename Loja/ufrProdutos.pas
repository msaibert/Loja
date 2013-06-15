unit ufrProdutos;

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
  cxCurrencyEdit, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZqueryValidation, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxNavigator, cxDBNavigator, Vcl.Menus, frxClass,
  frxDBSet, Vcl.StdCtrls, cxButtons;

type
  TfrProdutos = class(TfrCadastroPadrao)
    lbCodigo: TcxLabel;
    lbPrecoFinal: TcxLabel;
    edPrecoFinal: TcxDBCurrencyEdit;
    lbCategoria: TcxLabel;
    lbDescricao: TcxLabel;
    edCodigo: TcxDBTextEdit;
    edDescricao: TcxDBTextEdit;
    lcCategoria: TcxDBLookupComboBox;
    quCategoria: TZQuery;
    dsCategoria: TDataSource;
    btRelatorio: TcxButton;
    rpProdutos: TfrxReport;
    fqRelatorio: TfrxDBDataset;
    quRelatorio: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure btRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frProdutos: TfrProdutos;

implementation

{$R *.dfm}

procedure TfrProdutos.btRelatorioClick(Sender: TObject);
begin
  quRelatorio.Active := False;
  quRelatorio.Active := True;
  rpProdutos.ShowReport;
end;

procedure TfrProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  quCategoria.Active := True;
  quDados.AddValidation('descricao', opNotBlank, null, 'Campo descrição deve ser preenchido..');
  quDados.AddValidation('categoria_id', opGreater, 0, 'Campo categoria deve ser preenchido.');
  quDados.AddValidation('preco_final', opGreater, 0.00, 'Campo preço final deve ser preenchido.');
end;

end.
