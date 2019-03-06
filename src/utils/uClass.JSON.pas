unit uClass.JSON;

interface

uses
  Data.DBXJSON, Data.DBXJSONReflect, System.Generics.Collections, System.JSON;

type
  TJsonUtil = class
  private
    class var
      JSONMarshal: TJSONMarshal;
    class var
      JSONUnMarshal: TJSONUnMarshal;
  public
    class function ObjectToJSON<T: class>(poObject: T): TJSONValue;
    class function JSONToObject<T: class>(poJSON: TJSONValue): T;
    class function ListToJSONArray<T: class>(poList: TList<T>): TJSONArray;
    class function JSONArrayToList<T: class>(poJSONArray: TJSONArray): TList<T>;
  end;

implementation

{ TJsonUtil }

class function TJsonUtil.JSONArrayToList<T>(poJSONArray: TJSONArray): TList<T>;
var
  i: Integer;
begin
  Result := TList<T>.Create;
  for i := 0 to poJSONArray.Size - 1 do
    Result.Add(Self.JSONToObject<T>(poJSONArray.Get(i)));
end;

class function TJsonUtil.JSONToObject<T>(poJSON: TJSONValue): T;
begin
  if poJSON is TJSONNull then
    Exit(nil);
  if not Assigned(JSONUnMarshal) then
    JSONUnMarshal := TJSONUnMarshal.Create;
  Result := T(JSONUnMarshal.UnMarshal(poJSON));
end;

class function TJsonUtil.ListToJSONArray<T>(poList: TList<T>): TJSONArray;
var
  i: Integer;
begin
  Result := TJSONArray.Create;
  for i := 0 to poList.Count - 1 do
    Result.AddElement(Self.ObjectToJSON(poList[i]));
end;

class function TJsonUtil.ObjectToJSON<T>(poObject: T): TJSONValue;
begin
  if Assigned(poObject) then
  begin
    if not Assigned(JSONMarshal) then
      JSONMarshal := TJSONMarshal.Create;
    Result := JSONMarshal.Marshal(poObject);
  end
  else
    Exit(TJSONNull.Create);
end;

end.

