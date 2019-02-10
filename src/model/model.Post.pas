unit model.Post;

interface

type
  TPost = class
  private
    FsFoto64: string;
    FsDescricao: string;
    FsLocalizacao: string;
    FsIconeUsuario64: string;
    FnQuantidadeCurtida: Integer;
    FsNomeUsuario: string;
    procedure SetnQuantidadeCurtida(const Value: Integer);
    procedure SetsDescricao(const Value: string);
    procedure SetsFoto64(const Value: string);
    procedure SetsIconeUsuario64(const Value: string);
    procedure SetsLocalizacao(const Value: string);
    procedure SetsNomeUsuario(const Value: string);
  published
    property sIconeUsuario64: string read FsIconeUsuario64 write SetsIconeUsuario64;
    property sNomeUsuario: string read FsNomeUsuario write SetsNomeUsuario;
    property sLocalizacao: string read FsLocalizacao write SetsLocalizacao;
    property sFoto64: string read FsFoto64 write SetsFoto64;
    property sDescricao: string read FsDescricao write SetsDescricao;
    property nQuantidadeCurtida: Integer read FnQuantidadeCurtida write SetnQuantidadeCurtida;
  end;

implementation

{ TPost }

procedure TPost.SetnQuantidadeCurtida(const Value: Integer);
begin
  FnQuantidadeCurtida := Value;
end;

procedure TPost.SetsDescricao(const Value: string);
begin
  FsDescricao := Value;
end;

procedure TPost.SetsFoto64(const Value: string);
begin
  FsFoto64 := Value;
end;

procedure TPost.SetsIconeUsuario64(const Value: string);
begin
  FsIconeUsuario64 := Value;
end;

procedure TPost.SetsLocalizacao(const Value: string);
begin
  FsLocalizacao := Value;
end;

procedure TPost.SetsNomeUsuario(const Value: string);
begin
  FsNomeUsuario := Value;
end;

end.

