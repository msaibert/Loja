unit uMathUtil;

interface

function Min(AValue, BValue : Double) : Double;
function Max(AValue, BValue : Double) : Double;

implementation

function Min(AValue, BValue : Double) : Double;
begin
  Result := AValue;
  if AValue > BValue then
    Result := BValue;
end;

function Max(AValue, BValue : Double) : Double;
begin
  Result := AValue;
  if AValue < BValue then
    Result := BValue;
end;

end.
