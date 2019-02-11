unit ufrmInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

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
    btnLoginComFacebook: TSpeedButton;
    procedure lblCadastrarTelefoneEmailClick(Sender: TObject);
    procedure lblLinkLoginClick(Sender: TObject);
    procedure btnLoginComFacebookClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

uses
  ufrmLogin, uClass.Diretorio, IdSSLOpenSSLHeaders;

{$R *.fmx}

procedure TfrmInicial.btnLoginComFacebookClick(Sender: TObject);
begin
  // Login com facebook
end;

procedure TfrmInicial.FormCreate(Sender: TObject);
begin
  IdOpenSSLSetLibPath(TDiretorio.PegarDiretorioDocumentos);
end;

procedure TfrmInicial.lblCadastrarTelefoneEmailClick(Sender: TObject);
begin
  TfrmLogin.Show(frmLogin);
end;

procedure TfrmInicial.lblLinkLoginClick(Sender: TObject);
begin
  TfrmLogin.Show(frmLogin);
  frmLogin.mudaParaAba(frmLogin.tabLogin);
end;

end.

