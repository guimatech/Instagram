unit ufrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmLogin = class(TForm)
    recTopo: TRectangle;
    lytLogo: TLayout;
    imgLogoInstagram: TImage;
    lblSubTituloLogo: TLabel;
    lytLoginFacebookBottom: TLayout;
    lytLoginFacebookGeral: TLayout;
    recLogiFacebook: TRectangle;
    lblLoginFacebook: TLabel;
    pthLogoFacebookSVG: TPath;
    lytOu: TLayout;
    lytCentroOU: TLayout;
    lytDireitaOu: TLayout;
    lineDireita: TLine;
    lytEsquerdaOu: TLayout;
    lineEsquerda: TLine;
    lblOu: TLabel;
    lytCadastrarTelefoneOuEmail: TLayout;
    lblCadastrarTelefoneEmail: TLabel;
    lytRodape: TLayout;
    lytJaTemConta: TLayout;
    recRodape: TRectangle;
    lblJaTemConta: TLabel;
    lblLinkLogin: TLabel;
    lineJaTemContaTopo: TLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

end.
