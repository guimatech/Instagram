unit uClass.Network;

interface

uses
  System.Classes, System.SysUtils, IdHTTP, FMX.Graphics, IdSSLOpenSSL;

type
  TNetwork = class
  public
    class function PegarStringPorURL(const psURL: string; const pbSSL: Boolean = True): string;
    class function PegarImagemPorURL(const psURL: string; const pbSSL: Boolean = True): TBitmap;
  end;

implementation

class function TNetwork.PegarStringPorURL(const psURL: string; const pbSSL: Boolean = True): string;
var
  oHTTP: TIdHTTP;
  oStream: TStringStream;
  oSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  oHTTP := TIdHTTP.Create(nil);
  oStream := TStringStream.Create(Result);
  try
//    IdSSL.SSLOptions.Method := sslvSSLv3;
//    IdSSL.SSLOptions.Mode := sslmClient;
    oHTTP.Get(psURL, oStream);
    oStream.Position := 0;
    Result := oStream.ReadString(oStream.Size);
  finally
    FreeAndNil(oHTTP);
    FreeAndNil(oStream);
  end;
end;

class function TNetwork.PegarImagemPorURL(const psURL: string; const pbSSL: Boolean = True): TBitmap;
var
  oBitmap: TBitmap;
  oStream: TMemoryStream;
  oHTTP : TIdHTTP;
begin
  oBitmap := TBitmap.Create;
  oStream := TMemoryStream.Create;
  oHTTP := TIdHTTP.Create(nil);
  try
    oHTTP.Get(psURL, oStream);
    if (oStream.Size > 0) then
    begin
      oStream.Position := 0;
      oBitmap.LoadFromStream(oStream);
      Result := oBitmap;
    end;
  finally
    FreeAndNil(oHTTP);
    FreeAndNil(oStream);
//    FreeAndNil(oBitmap);
  end;
end;

end.

