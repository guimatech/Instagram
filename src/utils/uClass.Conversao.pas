unit uClass.Conversao;

interface

uses
  FMX.Graphics, System.Classes, Soap.EncdDecd, System.SysUtils, System.NetEncoding;

type
  TConversao = class
    class function Base64FromBitmap(const poBitmap: TBitmap): string;
    class function BitmapFromBase64(const poBase64: string): TBitmap;
  end;

implementation

{ TConversao }

class function TConversao.Base64FromBitmap(const poBitmap: TBitmap): string;
var
  oInput: TBytesStream;
  oOutput: TStringStream;
begin
  oInput := TBytesStream.Create;
  try
    poBitmap.SaveToStream(oInput);
    oInput.Position := 0;
    oOutput := TStringStream.Create('', TEncoding.ASCII);

    try
      Soap.EncdDecd.EncodeStream(oInput, oOutput);
      Result := oOutput.DataString;
    finally
      oOutput.Free;
    end;
  finally
    oInput.Free;
  end;
end;

class function TConversao.BitmapFromBase64(const poBase64: string): TBitmap;
var
  oInput: TStringStream;
  oOutput: TBytesStream;
begin
  oInput := TStringStream.Create(poBase64, TEncoding.ASCII);
  try
    oOutput := TBytesStream.Create;
    try
      Soap.EncdDecd.EncodeStream(oInput, oOutput);
      oOutput.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(oOutput);
      except
        Result.Free;
        raise;
      end;
    finally
      oOutput.Free;
    end;
  finally
    oInput.Free;
  end;
end;

end.

