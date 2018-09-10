unit ufrmInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    lytLogo: TLayout;
    lytSubTituloLogo: TLayout;
    recLogoInstagram: TRectangle;
    lytLoginFacebookBottom: TLayout;
    lytOu: TLayout;
    lytCadastrarTelefoneOuEmail: TLayout;
    lytJaTemConta: TLayout;
    lytLoginFacebookGeral: TLayout;
    btnLoginFacebook: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
