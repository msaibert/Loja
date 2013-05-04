unit ZqueryValidation;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TOperator = (opEqual, opLess, opLessOrEqual, opGreater, opGreaterOrEqual, opLike, opStarstWith, opEndsWith, opBlank);
  TAction = (acError, acWarning);

type
  IValidation = interface(IInterface)
  ['{522D20CA-5B5F-449E-BA8E-5618CC455D67}']
    function GetAction: TAction;
    function GetExpected: Variant;
    function GetField: String;
    function GetMessage: String;
    function GetNegate: Boolean;
    function GetOperator: TOperator;
    function GetFieldValue : Variant;
    procedure SetFieldValue(const Value : Variant);
    procedure SetAction(const Value: TAction);
    procedure SetExpected(const Value: Variant);
    procedure SetField(const Value: String);
    procedure SetMessage(const Value: String);
    procedure SetNegate(const Value: Boolean);
    procedure SetOperator(const Value: TOperator);
    function Valid: Boolean;
    property Action: TAction read GetAction write SetAction;
    property Expected: Variant read GetExpected write SetExpected;
    property Field: String read GetField write SetField;
    property Message: String read GetMessage write SetMessage;
    property Negate: Boolean read GetNegate write SetNegate;
    property Operator: TOperator read GetOperator write SetOperator;
    property FieldValue : Variant read GetFieldValue write SetFieldValue;
  end;

  TValidation = class(TInterfacedObject, IValidation)
    private
      FField : String;
      FOperator : TOperator;
      FExpected : Variant;
      FMessage : String;
      FAction : TAction;
      FNegate: Boolean;
      FFieldValue : Variant;
      function GetAction: TAction;
      function GetExpected: Variant;
      function GetField: String;
      function GetMessage: String;
      function GetNegate: Boolean;
      function GetOperator: TOperator;
      function GetFieldValue : Variant;
      procedure SetFieldValue(const Value : Variant);
      procedure SetAction(const Value: TAction);
      procedure SetExpected(const Value: Variant);
      procedure SetField(const Value: String);
      procedure SetMessage(const Value: String);
      procedure SetNegate(const Value: Boolean);
      procedure SetOperator(const Value: TOperator);
    public
      function Valid : Boolean;
      property Action: TAction read GetAction write SetAction;
      property Expected: Variant read GetExpected write SetExpected;
      property Field: String read GetField write SetField;
      property Message: String read GetMessage write SetMessage;
      property Negate: Boolean read GetNegate write SetNegate;
      property Operator: TOperator read GetOperator write SetOperator;
      property FieldValue : Variant read GetFieldValue write SetFieldValue;
  end;

type
  TZqueryValidation = class(TZQuery)
  private
    FValidations: IInterfaceList;
    function GetValidations: IInterfaceList;
    procedure SetValidations(const Value: IInterfaceList);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent); override;
    property Validations: IInterfaceList read GetValidations write SetValidations;
    procedure AddValidation(AField : String; AOperator : TOperator; AExpected : Variant; AMessage : String; AAction : TAction = acError; ANegate : Boolean = False);
    function isValid(AShowErrors : Boolean = True) : Boolean;
    procedure DoBeforePost; override;
    procedure DoAfterEdit; override;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

uses Variants, frValidation;

procedure Register;
begin
  RegisterComponents('Samples', [TZqueryValidation]);
end;

function TValidation.GetAction: TAction;
begin
  Result := FAction;
end;

function TValidation.GetExpected: Variant;
begin
  Result := FExpected;
end;

function TValidation.GetField: String;
begin
  Result := FField;
end;

function TValidation.GetMessage: String;
begin
  Result := FMessage;
end;

function TValidation.GetNegate: Boolean;
begin
  Result := FNegate;
end;

function TValidation.GetOperator: TOperator;
begin
  Result := FOperator;
end;

procedure TValidation.SetAction(const Value: TAction);
begin
  FAction := Value;
end;

procedure TValidation.SetExpected(const Value: Variant);
begin
  FExpected := Value;
end;

procedure TValidation.SetField(const Value: String);
begin
  FField := Value;
end;

procedure TValidation.SetMessage(const Value: String);
begin
  FMessage := Value;
end;

procedure TValidation.SetNegate(const Value: Boolean);
begin
  FNegate := Value;
end;

procedure TValidation.SetOperator(const Value: TOperator);
begin
  FOperator := Value;
end;

procedure TValidation.SetFieldValue(const Value: Variant);
begin
  FFieldValue := Value;
end;

function TValidation.GetFieldValue;
begin
  Result := FFieldValue;
end;

{ TValidation }

function TValidation.Valid: Boolean;
begin
   case FOperator of
     opEqual          : Result := FieldValue =  Expected;
     opLess           : Result := FieldValue <  Expected;
     opLessOrEqual    : Result := FieldValue <= Expected;
     opGreater        : Result := FieldValue >  Expected;
     opGreaterOrEqual : Result := FieldValue >= Expected;
     opLike           : Result := Pos(VarToStr(Expected), VarToStr(FieldValue)) > -1;
     opStarstWith     : Result := Pos(VarToStr(Expected), VarToStr(FieldValue)) = 0;
     opBlank          : Result := (FieldValue =  Null) or (VarToStrDef(FieldValue, '') = '');
   end;
   if Negate then
     Result := not Result;
end;

procedure TZqueryValidation.AddValidation(AField: String;
  AOperator: TOperator; AExpected: Variant; AMessage: String; AAction: TAction;
  ANegate: Boolean);
var
  AValidation : IValidation;
begin
  AValidation := TValidation.Create;
  AValidation.Field := AField;
  AValidation.Operator := AOperator;
  AValidation.Expected := AExpected;
  AValidation.Message := AMessage;
  AValidation.Action := AAction;
  AValidation.Negate := ANegate;
  Validations.Add(AValidation);
end;

constructor TZqueryValidation.Create(AOwner: TComponent);
begin
  inherited;
  Validations := TInterfaceList.Create;
end;

procedure TZqueryValidation.DoBeforePost;
begin
  inherited;
  Self.isValid(True);
end;

procedure TZqueryValidation.DoAfterEdit;
begin
  inherited;
  Self.isValid(True);
end;

function TZqueryValidation.GetValidations: IInterfaceList;
begin
  Result := FValidations;
end;

function TZqueryValidation.isValid(AShowErrors: Boolean): Boolean;
var
  i, LErros, LWarnings : Integer;
  LMessageErrors, LMessageWarnings : String;
  LFormValidation : TFormValidation;
  LValidation : IValidation;
begin
  try
    Result := True;
    LFormValidation := TFormValidation.Create(nil);
    for i := 0 to Validations.Count-1 do
    begin
      LValidation := (Validations[i] as IValidation);
      LValidation.FieldValue := Self.FieldByName(LValidation.Field).Value;
      if not LValidation.Valid then
      begin
        if LValidation.Action = acError then
        begin
          Inc(LErros);
          LFormValidation.AddError(LValidation.Message);
        end
        else
        begin
          Inc(LWarnings);
          LFormValidation.AddWarning(LValidation.Message);
        end;
      end;
    end;

    LFormValidation.pnErros.Visible := LErros > 0;
    LFormValidation.gdErros.Visible := LErros > 0;
    LFormValidation.pnWarnings.Visible := LWarnings > 0;
    LFormValidation.gdWarnings.Visible := LWarnings > 0;


    if (LErros > 0) or (LWarnings > 0 ) then
      LFormValidation.ShowModal;

    if LErros > 0 then
    begin
      Result := False;
      Abort;
    end;
  finally
    LFormValidation.Free;
  end;
end;

procedure TZqueryValidation.SetValidations(const Value: IInterfaceList);
begin
  FValidations := Value;
end;

end.
