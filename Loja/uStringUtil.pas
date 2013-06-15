unit uStringUtil;

interface
uses System.SysUtils;

type
  TAlignment = (alLeft, alRight);

  IStringUtil = interface
//    function Cut(ALength: Integer): IStringUtil;
//    function RepeatString(ATimes: Integer): IStringUtil;
//    function LPAD(ACaracter: String; ALength : Integer; AAlign : TAlignment = alLeft): IStringUtil;
//    function Value : String;
  end;

  TStringUtil = class
  private
    FValue : String;
  public
    function RepeatString(ATimes: Integer): TStringUtil;
    function LPAD(ACaracter: String; ALength : Integer; AAlign : TAlignment = alLeft): TStringUtil;
    constructor Create(AValue: string);
    function Value : String;
    function Cut(ALength: Integer): TStringUtil;
    function Replace(AOldStr, ANewStr: String): TStringUtil;
  end;

  function S(AString : string) : TStringUtil;

implementation

constructor TStringUtil.Create(AValue: string);
begin
  FValue := AValue;
end;

function TStringUtil.LPAD(ACaracter : String; ALength : Integer; AAlign : TAlignment) : TStringUtil;
begin
  Result :=  Self;

  if Length(FValue) > ALength then
    FValue := S(FValue).Cut(ALength).Value;

  if AAlign = alRight then
    FValue := S(ACaracter).RepeatString(ALength - Length(FValue)).Value + FValue
  else
    FValue := FValue + S(ACaracter).RepeatString(ALength - Length(FValue)).Value;
end;

function TStringUtil.Cut(ALength : Integer) : TStringUtil;
begin
  FValue := Copy(FValue, 1, ALength);
  Result := Self;
end;

function TStringUtil.Replace(AOldStr, ANewStr : String) : TStringUtil;
begin
  FValue := StringReplace(FValue, AOldStr, ANewStr, [rfReplaceAll, rfIgnoreCase]);
  Result := Self;
end;

function TStringUtil.RepeatString(ATimes : Integer) : TStringUtil;
var
  I: Integer;
  Aux : String;
begin
  for I := 1 to ATimes do
    Aux := Aux + FValue;

  FValue := Aux;
  Result := Self;
end;

function S(AString: string): TStringUtil;
begin
  Result := TStringUtil.Create(AString);
end;

function TStringUtil.Value: String;
begin
   Result := FValue;
end;

end.
