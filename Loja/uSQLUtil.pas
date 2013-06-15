unit uSQLUtil;

interface

function GetBooleanThroughSQL(ASQL : String) : Boolean;
function GetIntegerThroughSQL(ASQL : String) : Integer;
function GetStringThroughSQL(ASQL : String) : String;
function GetDateThroughSQL(ASQL : String) : TDateTime;

implementation

uses
  ZDataset, udmConexao;

function ReturnDataSet(ASQL : String) : TZQuery;
begin
  Result := TZQuery.Create(nil);
  Result.Connection := dmConexao.connectionSistema;
  Result.SQL.Text := ASQL;
  Result.Active := True;
end;

function GetBooleanThroughSQL(ASQL : String) : Boolean;
var
  LDataSet : TZQuery;
begin
  LDataSet := ReturnDataSet(ASQL);
  Result := True;
  try
      if LDataSet.RecordCount = 0 then
      begin
        Result := False;
        Exit;
      end;
      Result := LDataSet.Fields[0].AsBoolean;
  finally
    LDataSet.Free
  end;
end;

function GetIntegerThroughSQL(ASQL : String) : Integer;
var
  LDataSet : TZQuery;
begin

  LDataSet := ReturnDataSet(ASQL);
  try
    if LDataSet.RecordCount = 0 then
    begin
      Result := -1;
      Exit;
    end;
    Result := LDataSet.Fields[0].AsInteger;
  finally
    LDataSet.Free
  end;
end;

function GetStringThroughSQL(ASQL : String) : String;
var
  LDataSet : TZQuery;
begin

  LDataSet := ReturnDataSet(ASQL);
  try
    if LDataSet.RecordCount = 0 then
    begin
      Result := '';
      Exit;
    end;
    Result := LDataSet.Fields[0].AsString;
  finally
    LDataSet.Free
  end;
end;

function GetDateThroughSQL(ASQL : String) : TDateTime;
var
  LDataSet : TZQuery;
begin
  LDataSet := ReturnDataSet(ASQL);
  try
    if LDataSet.RecordCount = 0 then
    begin
      Result := 0;
      Exit;
    end;
    Result := LDataSet.Fields[0].AsDateTime;
  finally
    LDataSet.Free
  end;
end;

end.
