unit frProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxNavigator, cxCurrencyEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxLabel, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxDBNavigator, cxGraphics, cxLookAndFeels, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, Vcl.Menus, cxLookAndFeelPainters, Vcl.StdCtrls, cxButtons;

type
  TTelaProdutos = class(TForm)
    lbPesquisa: TcxLabel;
    lcPesquisa: TcxLookupComboBox;
    lbCodigo: TcxLabel;
    edPrecoCusto: TcxDBCurrencyEdit;
    lbPrecoCusto: TcxLabel;
    lbPrecoFinal: TcxLabel;
    edPrecoFinal: TcxDBCurrencyEdit;
    lbCategoria: TcxLabel;
    lbDescricao: TcxLabel;
    quProdutos: TZQuery;
    edCodigo: TcxDBTextEdit;
    dsProdutos: TDataSource;
    edDescricao: TcxDBTextEdit;
    nvProduto: TcxDBNavigator;
    quCategoria: TZQuery;
    dsCategoria: TDataSource;
    lcCategoria: TcxDBLookupComboBox;
    btRelatorios: TcxButton;
  private
    { Private declarations }
  public
  end;

var
  TelaProdutos: TTelaProdutos;

implementation

uses udmConexao;

{$R *.dfm}

end.
