unit ufrmInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmInicial = class(TForm)
    lytLogo: TLayout;
    lytLoginFacebookBottom: TLayout;
    lytOu: TLayout;
    lytCadastrarTelefoneOuEmail: TLayout;
    lytJaTemConta: TLayout;
    lytLoginFacebookGeral: TLayout;
    recLogiFacebook: TRectangle;
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
    pthLogoFacebookSVG: TPath;
    lblLinkLogin: TLabel;
    recRodape: TRectangle;
    imgLogoInstagram: TImage;
    lblSubTituloLogo: TLabel;
    lytJaTemContaCentro: TLayout;
    procedure lblCadastrarTelefoneEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

uses
  ufrmLogin;

{$R *.fmx}

procedure TfrmInicial.lblCadastrarTelefoneEmailClick(Sender: TObject);
begin
  if not Assigned(frmLogin) then
    Application.CreateForm(TfrmLogin, frmLogin);

  frmLogin.Show;
end;

end.
