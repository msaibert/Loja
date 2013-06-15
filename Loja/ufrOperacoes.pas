unit ufrOperacoes;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit,
  cxCheckBox, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZqueryValidation, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxNavigator, cxDBNavigator;

type
  TfrOperacoes = class(TfrCadastroPadrao)
    edCodigo: TcxDBTextEdit;
    edDescricao: TcxDBTextEdit;
    cbEstoque: TcxDBCheckBox;
    rgEstoque: TcxDBRadioGroup;
    cbCaixa: TcxDBCheckBox;
    rgCaixa: TcxDBRadioGroup;
    lbCodigo: TcxLabel;
    lbDescricao: TcxLabel;
    cbCadastroClientes: TcxDBCheckBox;
    rgCadastroClientes: TcxDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure quDadosBeforeDelete(DataSet: TDataSet);
    procedure cbEstoquePropertiesChange(Sender: TObject);
    procedure cbCaixaPropertiesChange(Sender: TObject);
    procedure cbCadastroClientesPropertiesChange(Sender: TObject);
  private
    function NaoDevePermitirEditarFlagsDoDataSet: Boolean;
    function OperacaoJaUtilizadaEmMovimentacoes: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frOperacoes: TfrOperacoes;

implementation

uses
  uSQLUtil;

{$R *.dfm}

procedure TfrOperacoes.cbCadastroClientesPropertiesChange(Sender: TObject);
begin
  inherited;
  rgCadastroClientes.Enabled := cbCadastroClientes.Checked;
end;

procedure TfrOperacoes.cbCaixaPropertiesChange(Sender: TObject);
begin
  inherited;
  rgCaixa.Enabled := cbCaixa.Checked;
end;

procedure TfrOperacoes.cbEstoquePropertiesChange(Sender: TObject);
begin
  inherited;
  rgEstoque.Enabled := cbEstoque.Checked;
end;

procedure TfrOperacoes.FormCreate(Sender: TObject);
begin
  inherited;
  quDados.AddValidation('descricao', opNotBlank, null, 'Campo descrição deve ser preenchido.');
  quDados.AddValidation('movimentar_estoque', opEqual, True, 'Campo movimentar estoque não marcado. Operação não irá realizar movimento em estoque', acWarning);
  quDados.AddValidation('movimentar_caixa', opEqual, True, 'Campo movimentar caixa não marcado. Operação não irá realizar movimentos em caixa.', acWarning);
  quDados.AddValidation('movimentar_pendencia', opEqual, True, 'Campo cadastro de pendência não marcado. Operação não irá realizar movimentos em cadastros de pendências.', acWarning);
  quDados.AddValidation(NaoDevePermitirEditarFlagsDoDataSet, 'Não é permitido alterar os módulos que uma operação movimenta.');
end;

function TfrOperacoes.NaoDevePermitirEditarFlagsDoDataSet : Boolean;
begin
  Result := not OperacaoJaUtilizadaEmMovimentacoes;

  if quDados.State = dsInsert then
    Exit;

  if quDados.RecordCount = 0 then
    Exit;

  if Result then
    Result := (quDados.FieldByName('movimentar_estoque').Value = quDados.FieldByName('movimentar_estoque').OldValue) and
              (quDados.FieldByName('movimentar_caixa').Value = quDados.FieldByName('movimentar_caixa').OldValue) and
              (quDados.FieldByName('movimentar_pendencia').Value = quDados.FieldByName('movimentar_pendencia').OldValue);
end;

procedure TfrOperacoes.quDadosBeforeDelete(DataSet: TDataSet);
begin
  if OperacaoJaUtilizadaEmMovimentacoes then
  begin
    Application.MessageBox('Não é possível excluir um operação já utilizada em movimentações.', 'ERRO.', MB_IConerror);
    Abort;
  end;
  inherited;
end;

function TfrOperacoes.OperacaoJaUtilizadaEmMovimentacoes : Boolean;
var
  LSQL : String;
begin
  Result := False;
  if quDados.State = dsInsert then
    Exit;

  if quDados.RecordCount = 0 then
    Exit;

  LSQL := 'select count(*) > 0 from ( ' +
          'select operacao_id from movimento_estoque ' +
          'union  ' +
          'select operacao_id from movimento_caixa  ' +
          'union  ' +
          'select operacao_id from movimento_pendencia  ' +
          ') as a ' +
          'where operacao_id = ' + quDados.FieldByName('id').AsString;
  Result := GetBooleanThroughSQL(LSQL);
end;

end.
