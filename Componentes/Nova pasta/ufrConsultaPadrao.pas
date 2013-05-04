unit ufrConsultaPadrao;

interface

uses cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Vcl.Menus, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.Classes,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, Vcl.Controls, cxGrid, forms,
  Connection, cxTextEdit, cxSpinEdit, sysUtils, cxcurrencyedit, cxCalendar,
  messages, variants;

type
  TfrConsultaPadrao = class(TForm)
    acAtalhos: TActionList;
    quCadastro: TZQuery;
    dsCadastro: TDataSource;
    lcStyle: TcxLookAndFeelController;
    acOk: TAction;
    acCancelar: TAction;
    gdConsulta: TcxGrid;
    gwConsulta: TcxGridDBTableView;
    glConsulta: TcxGridLevel;
    pnBotoesConsulta: TPanel;
    btExcluir: TcxButton;
    btAlterar: TcxButton;
    cxConsultaDBTableView1Column1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxPesquisaPropertiesEditValueChanged(Sender: TObject);
    function IsValid: Boolean; virtual; abstract;
    procedure acCancelarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure acOkExecute(Sender: TObject);
    procedure gwConsultaKeyPress(Sender: TObject; var Key: Char);
  private
    cxBusca: TcxCustomEdit;
    FComando: string;
    FWhere: string;
    FLimit: Integer;
    FFieldName: string;
    FFieldType: string;
    FFieldWidth: Integer;
    FFieldLeft: Integer;
    function getComando: string;
    procedure setComando(const Value: string);
    function getWhere: string;
    procedure setWhere(const Value: string);
    function MontarComandoSQL: string;
    function getLimit: integer;
    procedure setLimit(const Value: integer);
    function getFieldName: string;
    function getFieldType: string;
    procedure setFieldName(const Value: string);
    procedure setFieldType(const Value: string);
    function getFieldLeft: Integer;
    function getFieldWidth: Integer;
    procedure setFieldLeft(const Value: Integer);
    procedure setFieldWidth(const Value: Integer);
    function GetDescricao: string;
    procedure setDescricao(const Value: string);
    procedure setId(const Value: integer);
    function GetId: integer;
    property FieldName: string read getFieldName write setFieldName;
    property FieldType: string read getFieldType write setFieldType;
    property FieldWidth : Integer read getFieldWidth write setFieldWidth;
    property FieldLeft : Integer read getFieldLeft write setFieldLeft;
  private
    FID: Integer;
    FDescricao: string;
  published
    LConnection : IConnectionIntf;
    property Comando: string read getComando write setComando;
    property Where: string read getWhere write setWhere;
    property Limit: Integer read getLimit write setLimit default 10;
    property Id: integer read GetId write setId;
    property Descricao: string read GetDescricao write setDescricao;
  end;

implementation

uses
  Utilitarios, sistema;

{$R *.dfm}

procedure TfrConsultaPadrao.acCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrConsultaPadrao.acOkExecute(Sender: TObject);
begin
  if quCadastro.RecordCount > 0 then
  begin
    id := quCadastro.Fields[0].AsInteger;
    Descricao := quCadastro.Fields[1].AsString;
    Close;
  end;
end;

procedure TfrConsultaPadrao.cxBuscaKeyPress(Sender: TObject; var Key: Char);
var
  LFilter : string;
begin
  if (Key = #13) then
  begin
    gdConsulta.SetFocus;
    cxBusca.Hide;

    if (FieldType = 'String') or (FieldType = 'Memo') or (FieldType = 'WideString') or (FieldType =  'WideMemo') then
      LFilter := ' ilike $$%' + TcxTextEdit(cxBusca).Text + '%$$'
    else
    if (FieldType = 'Smallint') or (FieldType = 'Integer') or (FieldType = 'Largeint') then
      LFilter := ' <= ' + IntToStr(TcxSpinEdit(cxBusca).Value) // "<="
    else
    if (FieldType = 'Float') or (FieldType = 'Currency') then
      LFilter := ' <= ' + FloatToStr(TcxCurrencyEdit(cxBusca).Value)
    else
    if (FieldType = 'Date') or (FieldType = 'DateTime') or (FieldType = 'Time') then
      LFilter := ' <= $$' + DateToStr(TcxDateEdit(cxBusca).Date)+ '$$';

    if not LFilter.IsEmpty then
    begin
      LFilter := ' ' + FieldName + ' ' + LFilter;

      if Where.IsEmpty then
        LFilter := ' where ' + LFilter
      else
        LFilter := ' and ' + LFilter;

      quCadastro.Close;
      quCadastro.sql.Text := Comando + where + LFilter + ' limit ' + IntToStr(Limit);
      quCadastro.Open;
    end;
  end;
end;

procedure TfrConsultaPadrao.cxPesquisaPropertiesEditValueChanged(Sender: TObject);
begin
  quCadastro.Edit;
end;

procedure TfrConsultaPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrConsultaPadrao.FormCreate(Sender: TObject);
begin
  Limit := 100;

  LConnection := TConnection.Create;
  LConnection.Connect;

  quCadastro.Connection := LConnection.ConnectionActive;
  quCadastro.SQL.Text := MontarComandoSQL;
  quCadastro.Open;
end;

function TfrConsultaPadrao.MontarComandoSQL: string;
begin
  Result := 'select MontarSQL';

  if not Comando.IsEmpty then
  begin
    Result := Comando;

    if not Where.IsEmpty then
      Result := Result + ' where '+ Where;

    Result := Result + ' limit ' + IntToStr(Limit);
  end;
end;

procedure TfrConsultaPadrao.FormDestroy(Sender: TObject);
begin
  LConnection.Disconnect;
end;

procedure TfrConsultaPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (cxBusca <> nil) or gwConsulta.Focused then
  Exit;

 if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrConsultaPadrao.FormShow(Sender: TObject);
begin
  gdConsulta.SetFocus;
end;


function TfrConsultaPadrao.getComando: string;
begin
  Result := FComando;
end;

function TfrConsultaPadrao.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TfrConsultaPadrao.getFieldLeft: Integer;
begin
  Result := FFieldLeft;
end;

function TfrConsultaPadrao.getFieldName: string;
begin
  Result := FFieldName;
end;

function TfrConsultaPadrao.getFieldType: string;
begin
  Result := FFieldType;
end;

function TfrConsultaPadrao.getFieldWidth: Integer;
begin
  Result := FFieldWidth;
end;

function TfrConsultaPadrao.GetId: Integer;
begin
  Result := FID;
end;

function TfrConsultaPadrao.getLimit: Integer;
begin
  Result := FLimit;
end;

function TfrConsultaPadrao.getWhere: string;
begin
  Result := FWhere;
end;

procedure TfrConsultaPadrao.gwConsultaKeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
begin
  if key = #13 then
  begin
    acOk.Execute;
    Exit;
  end;

  FieldType  := gwConsulta.Controller.FocusedColumn.DataBinding.ValueType;
  FieldName  := gwConsulta.Controller.FocusedColumn.DataBinding.DefaultCaption;
  FieldWidth := gwConsulta.Controller.FocusedColumn.Width;
  FieldLeft := 0;

  for i := 0 to gwConsulta.Controller.FocusedColumnIndex -1 do
    FieldLeft := FieldLeft + gwConsulta.Columns[i].Width;

  FreeAndNil(cxBusca);

  if (FieldType = 'String') or (FieldType = 'Memo') or (FieldType = 'WideString') or (FieldType =  'WideMemo') then
    cxBusca := TcxTextEdit.Create(Self)
  else
  if (FieldType = 'Smallint') or (FieldType = 'Integer') or (FieldType = 'Largeint') then
    cxBusca := TcxSpinEdit.Create(Self)
  else
  if (FieldType = 'Float') or (FieldType = 'Currency') then
    cxBusca := TcxCurrencyEdit.Create(Self)
  else
  if (FieldType = 'Date') or (FieldType = 'DateTime') or (FieldType = 'Time') then
    cxBusca := TcxDateEdit.Create(Self);

  if key <> #13 then
    cxBusca.EditValue := Key;

  cxbusca.OnKeyPress := cxBuscaKeyPress;
  cxBusca.Parent := gdConsulta;
  cxBusca.Width := FieldWidth;
  cxBusca.Left := FieldLeft;
  cxbusca.Top := gdConsulta.Height - 22;
  cxBusca.Align := alNone;
  cxBusca.Show;
  cxBusca.SetFocus;

  if cxBusca.EditingValue <> null then
    TcxCustomTextEdit(cxbusca).SelStart := Length(cxBusca.EditingValue);
end;

procedure TfrConsultaPadrao.setComando(const Value: string);
begin
  FComando := Value;
end;

procedure TfrConsultaPadrao.setDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TfrConsultaPadrao.setFieldLeft(const Value: Integer);
begin
  FFieldLeft := Value;
end;

procedure TfrConsultaPadrao.setFieldName(const Value: string);
begin
  FFieldName := Value;
end;

procedure TfrConsultaPadrao.setFieldType(const Value: string);
begin
  FFieldType := Value;
end;

procedure TfrConsultaPadrao.setFieldWidth(const Value: Integer);
begin
  FFieldWidth := Value;
end;

procedure TfrConsultaPadrao.setId(const Value: Integer);
begin
  FID := Value;
end;

procedure TfrConsultaPadrao.setLimit(const Value: Integer);
begin
  FLimit := Value;
end;

procedure TfrConsultaPadrao.setWhere(const Value: string);
begin
  FWhere := Value;
end;

end.

