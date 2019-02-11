unit uClass.Diretorio;

interface

type
  TDiretorio = class
    class function PegarDiretorioDocumentos: string;
  end;
implementation

{ TDir }

uses
  System.IOUtils;

class function TDiretorio.PegarDiretorioDocumentos: string;
begin
  Result := TPath.GetDocumentsPath;
end;

end.
