unit ufrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, System.Actions, FMX.ActnList;

type
  TfrmLogin = class(TForm)
    tbcLogin: TTabControl;
    tabCadastro1: TTabItem;
    tabCadastro2: TTabItem;
    tabCadastro3: TTabItem;
    tabLogin: TTabItem;
    lytCadastro1: TLayout;
    lytCadastrarTelefoneOuEmail: TLayout;
    lblCadastrarTelefoneEmail: TLabel;
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
    lytRodape: TLayout;
    lytJaTemConta: TLayout;
    recRodape: TRectangle;
    lblJaTemConta: TLabel;
    lblLinkLogin: TLabel;
    lineJaTemContaTopo: TLine;
    recTopo: TRectangle;
    lytLogo: TLayout;
    imgLogoInstagram: TImage;
    lblSubTituloLogo: TLabel;
    lstAcoes: TActionList;
    actMudaAba: TChangeTabAction;
    procedure lblCadastrarTelefoneEmailClick(Sender: TObject);
  private
    procedure mudaAba(pAba: TTabItem);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

procedure TfrmLogin.lblCadastrarTelefoneEmailClick(Sender: TObject);
begin
  mudaAba(tabCadastro2);
end;

procedure TfrmLogin.mudaAba(pAba: TTabItem);
begin
  actMudaAba.Tab := pAba;
  actMudaAba.ExecuteTarget(nil);
end;

end.
