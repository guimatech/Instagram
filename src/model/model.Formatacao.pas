unit model.Formatacao;

interface

uses
  System.UITypes;

type
  TFormatacao = class
  private
    FaEstilos: TFontStyles;
    FnTamanhoFont: Integer;
    FbWordWrap: Boolean;
    procedure SetEstilos(const Value: TFontStyles);
    procedure SetTamanhoFont(const Value: Integer);
    procedure SetWordWrap(const Value: Boolean);
  published
    property nTamanhoFont: Integer read FnTamanhoFont write SetTamanhoFont default 12;
    property aEstilos: TFontStyles read FaEstilos write SetEstilos default[];
    property bWordWrap: Boolean read FbWordWrap write SetWordWrap default False;
  public
    constructor Create(pnTamanhoFont: Integer = 12; paEstilos: TFontStyles = [];
      pbWordWrap: Boolean = False); overload;
  end;

implementation

{ TFormatacao }

constructor TFormatacao.Create(pnTamanhoFont: Integer; paEstilos: TFontStyles; pbWordWrap: Boolean);
begin
  inherited Create;
  FnTamanhoFont := pnTamanhoFont;
  FaEstilos := paEstilos;
  FbWordWrap := pbWordWrap;
end;

procedure TFormatacao.SetEstilos(const Value: TFontStyles);
begin
  FaEstilos := Value;
end;

procedure TFormatacao.SetTamanhoFont(const Value: Integer);
begin
  FnTamanhoFont := Value;
end;

procedure TFormatacao.SetWordWrap(const Value: Boolean);
begin
  FbWordWrap := Value;
end;

end.

