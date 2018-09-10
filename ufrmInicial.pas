unit ufrmInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmInicial = class(TForm)
    lytLogo: TLayout;
    lytSubTituloLogo: TLayout;
    lytLoginFacebookBottom: TLayout;
    lytOu: TLayout;
    lytCadastrarTelefoneOuEmail: TLayout;
    lytJaTemConta: TLayout;
    lytLoginFacebookGeral: TLayout;
    recLogiFacebook: TRectangle;
    lblSubTituloLogo: TLabel;
    lblLoginFacebook: TLabel;
    lblOu: TLabel;
    lineEsquerda: TLine;
    lineDireita: TLine;
    lytEsquerdaOu: TLayout;
    lytDireitaOu: TLayout;
    lytCentroOU: TLayout;
    lblCadastrarTelefoneEmail: TLabel;
    lblJaTemConta: TLabel;
    lineJaTemContaTopo: TLine;
    imgLogoInstagram: TImage;
    pthLogoFacebookSVG: TPath;
    lblLinkLogin: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

{$R *.fmx}

end.
