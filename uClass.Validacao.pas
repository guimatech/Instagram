unit uClass.Validacao;

interface

type
  TValida = class
  public
    class function telefoneValido(pTelefone: string): Boolean;
    class function emailValido(pEmail: string): Boolean;
  end;

implementation

uses
  System.SysUtils;

function emailValido(pEmail: string): Boolean;
begin
  Result := not pEmail.IsEmpty;
end;

function telefoneValido(pTelefone: string): Boolean;
begin
  Result := not pTelefone.IsEmpty;
end;

end.

