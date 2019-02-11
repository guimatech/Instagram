unit ufrmStyle;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  ufrmBase, FMX.Objects;

type
  TfrmStyle = class(TfrmBase)
    imgIconeFavoritoClicado: TImage;
    imgIconeMarcadorPreenchido: TImage;
    imgIconeOpcoes: TImage;
    imgIconeMarcadorVazio: TImage;
    imgIconeMensagem: TImage;
    imgIconeComentario: TImage;
    imgIconeFavorito: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStyle: TfrmStyle;

implementation

{$R *.fmx}

end.
