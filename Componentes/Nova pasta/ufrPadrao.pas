unit ufrPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxDBEdit, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, cxLabel,
  Vcl.StdCtrls, cxButtons, System.Actions, Vcl.ActnList, Connection,
  cxDropDownEdit, cxDBLookupComboBox,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC,
  cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  cxCurrencyEdit, cxNavigator, Vcl.Menus, cxStyles, cxCustomData, cxFilter,
  cxData;

type
  TFrPadrao = class(TForm)
    acAtalhos: TActionList;
    actSalvar: TAction;
    acNovo: TAction;
    quCadastro: TZQuery;
    dsCadastro: TDataSource;
    lcStyle: TcxLookAndFeelController;
    pgCadastro: TcxPageControl;
    tbConsulta: TcxTabSheet;
    tbInclusao: TcxTabSheet;
    pnBotoes: TPanel;
    btSalvar: TcxButton;
    pnCampos: TPanel;
    cxID: TcxDBSpinEdit;
    lbID: TcxLabel;
    lbDescricao: TcxLabel;
    cxDescricao: TcxDBTextEdit;
    pnBotoesConsulta: TPanel;
    gdConsultaDBTableView1: TcxGridDBTableView;
    gdConsultaLevel1: TcxGridLevel;
    gdConsulta: TcxGrid;
    btAlterar: TcxButton;
    btExcluir: TcxButton;
    acExcluir: TAction;
    acAlterar: TAction;
    acCancelar: TAction;
    btCancelar: TcxButton;
    acBuscar: TAction;
    gdConsultaDBTableView1Column1: TcxGridDBColumn;
    acAtualizarCampos: TAction;
    btNovo: TcxButton;
    btAtualizarCampos: TcxButton;
    procedure actSalvarExecute(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxPesquisaPropertiesEditValueChanged(Sender: TObject);
    function IsValid: Boolean; virtual; abstract;
    procedure AtualizarCamposDeBusca; virtual; abstract;
    procedure acAlterarExecute(Sender: TObject);
    procedure gdConsultaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure acAtualizarCamposExecute(Sender: TObject);
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
    property FieldName: string read getFieldName write setFieldName;
    property FieldType: string read getFieldType write setFieldType;
    property FieldWidth : Integer read getFieldWidth write setFieldWidth;
    property FieldLeft : Integer read getFieldLeft write setFieldLeft;
  published
    LConnection : IConnectionIntf;
    property Comando: string read getComando write setComando;
    property Where: string read getWhere write setWhere;
    property Limit: Integer read getLimit write setLimit default 10;
  end;

implementation

uses
  Utilitarios, sistema;

{$R *.dfm}

procedure TFrPadrao.acAlterarExecute(Sender: TObject);
begin
  if (pgCadastro.ActivePage = tbConsulta) then
  begin
    FreeAndNil(cxBusca);
    tbConsulta.TabVisible := False;
    tbInclusao.TabVisible := True;
    pgCadastro.ActivePageIndex := 1;
    quCadastro.Edit;

    if cxID.Visible and cxID.Enabled then
       cxID.SetFocus
    else
    if cxDescricao.Visible and cxDescricao.Enabled then
      cxDescricao.SetFocus;
  end;
end;

procedure TFrPadrao.acAtualizarCamposExecute(Sender: TObject);
begin
  AtualizarCamposDeBusca;
end;

procedure TFrPadrao.acCancelarExecute(Sender: TObject);
begin
  if (cxBusca <> nil) and cxBusca.Visible then
  begin
    cxBusca.Hide;
    FreeAndNil(cxBusca);
    gdConsulta.SetFocus;
  end
  else
  if pgCadastro.ActivePage <> tbConsulta then
  begin
    tbConsulta.TabVisible := True;
    tbInclusao.TabVisible := False;
    pgCadastro.ActivePageIndex := 0;

    quCadastro.Cancel;
    gdConsulta.SetFocus;
  end
  else
  if pgCadastro.ActivePage = tbConsulta then
    Close;
end;

procedure TFrPadrao.acExcluirExecute(Sender: TObject);
begin
  if (pgCadastro.ActivePage = tbConsulta) and
     ShowConfirmation('Deseja excluir o registro?') then
    quCadastro.Delete;
end;

procedure TFrPadrao.acNovoExecute(Sender: TObject);
begin
  if pgCadastro.ActivePage = tbConsulta then
  begin
    FreeAndNil(cxBusca);
    tbConsulta.TabVisible := False;
    tbInclusao.TabVisible := True;
    pgCadastro.ActivePageIndex := 1;

    quCadastro.Insert;

    if cxid.Visible and cxID.Enabled and not cxID.Properties.ReadOnly then
       cxID.SetFocus
    else
    if cxDescricao.Visible and cxDescricao.Enabled then
      cxDescricao.SetFocus;
  end;
end;

procedure TFrPadrao.actSalvarExecute(Sender: TObject);
var
  LRecNo : Integer;
begin
  if pgCadastro.ActivePage <> tbConsulta then
  begin
    LRecNo := quCadastro.RecNo;

    if quCadastro.State in [dsInsert, dsEdit] then
    begin
      try
        if IsValid then
        begin
          if quCadastro.FindField('usuario_id') <> nil then
            quCadastro.FieldByName('usuario_id').AsInteger := UsuarioID;

          quCadastro.Post;

          if quCadastro.State = dsEdit then
            quCadastro.RecNo := LRecNo;

          tbConsulta.TabVisible := True;
          tbInclusao.TabVisible := False;
          pgCadastro.ActivePageIndex := 0;
          gdConsulta.SetFocus;
        end;
      except on e: Exception  do
        ShowMessage('erro ao salvar ' + e.Message);
      end;
    end;
  end;
end;

procedure TFrPadrao.cxBuscaKeyPress(Sender: TObject; var Key: Char);
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
      LFilter := ' <= ' + IntToStr(TcxSpinEdit(cxBusca).Value)
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

procedure TFrPadrao.cxPesquisaPropertiesEditValueChanged(Sender: TObject);
begin
  quCadastro.Edit;
end;

procedure TFrPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrPadrao.FormCreate(Sender: TObject);
begin
  tbInclusao.TabVisible := False;
  pgCadastro.ActivePageIndex := 0;
  Limit := 100;

  LConnection := TConnection.Create;
  LConnection.Connect;

  quCadastro.Connection := LConnection.ConnectionActive;
  quCadastro.SQL.Text := MontarComandoSQL;
  quCadastro.Open;
end;

function TFrPadrao.MontarComandoSQL: string;
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

procedure TFrPadrao.FormDestroy(Sender: TObject);
begin
  LConnection.Disconnect;
end;

procedure TFrPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if cxBusca <> nil then
  Exit;

 if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFrPadrao.FormShow(Sender: TObject);
begin
  gdConsulta.SetFocus;

  acNovo.Enabled    := PermiteIncluir;
  acAlterar.Enabled := PermiteAlterar;
  acExcluir.Enabled := PermiteExcluir;
end;

procedure TFrPadrao.gdConsultaDBTableView1KeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
begin
  FieldType  := gdConsultaDBTableView1.Controller.FocusedColumn.DataBinding.ValueType;
  FieldName  := gdConsultaDBTableView1.Controller.FocusedColumn.DataBinding.DefaultCaption;
  FieldWidth := gdConsultaDBTableView1.Controller.FocusedColumn.Width;
  FieldLeft := 0;

  for i := 0 to gdConsultaDBTableView1.Controller.FocusedColumnIndex -1 do
    FieldLeft := FieldLeft + gdConsultaDBTableView1.Columns[i].Width;

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

function TFrPadrao.getComando: string;
begin
  Result := FComando;
end;

function TFrPadrao.getFieldLeft: Integer;
begin
  Result := FFieldLeft;
end;

function TFrPadrao.getFieldName: string;
begin
  Result := FFieldName;
end;

function TFrPadrao.getFieldType: string;
begin
  Result := FFieldType;
end;

function TFrPadrao.getFieldWidth: Integer;
begin
  Result := FFieldWidth;
end;

function TFrPadrao.getLimit: Integer;
begin
  Result := FLimit;
end;

function TFrPadrao.getWhere: string;
begin
  Result := FWhere;
end;

procedure TFrPadrao.setComando(const Value: string);
begin
  FComando := Value;
end;

procedure TFrPadrao.setFieldLeft(const Value: Integer);
begin
  FFieldLeft := Value;
end;

procedure TFrPadrao.setFieldName(const Value: string);
begin
  FFieldName := Value;
end;

procedure TFrPadrao.setFieldType(const Value: string);
begin
  FFieldType := Value;
end;

procedure TFrPadrao.setFieldWidth(const Value: Integer);
begin
  FFieldWidth := Value;
end;

procedure TFrPadrao.setLimit(const Value: Integer);
begin
  FLimit := Value;
end;

procedure TFrPadrao.setWhere(const Value: string);
begin
  FWhere := Value;
end;

end.

