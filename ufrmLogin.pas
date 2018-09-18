unit ufrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl, System.Actions,
  FMX.ActnList, FMX.Edit, FMX.MediaLibrary.Actions, FMX.StdActns, FGX.ActionSheet;

type
  TfrmLogin = class(TForm)
    tbcLogin: TTabControl;
    tabCadastro1: TTabItem;
    tabCadastro2: TTabItem;
    tabFotoPerfil: TTabItem;
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
    lblJaTemConta: TLabel;
    lblLinkLogin: TLabel;
    lineJaTemContaTopo: TLine;
    recTopo: TRectangle;
    lytLogo: TLayout;
    imgLogoInstagram: TImage;
    lblSubTituloLogo: TLabel;
    lstAcoes: TActionList;
    actMudaAba: TChangeTabAction;
    lytAbasTelefoneEmail: TLayout;
    lytEditTelefone: TLayout;
    lytEditTelefoneCentro: TLayout;
    recEditTelefone: TRectangle;
    lytAvancar: TLayout;
    lytAvancarCentro: TLayout;
    recAvancar: TRectangle;
    lblBR55: TLabel;
    lineEditTelefone: TLine;
    edtTelefone: TEdit;
    lytTelefoneEmailCentro: TLayout;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lineTelefone: TLine;
    lineEmail: TLine;
    tbcEditTelefoneEmail: TTabControl;
    tabEditTelefone: TTabItem;
    tabEditEmail: TTabItem;
    lytEditEmail: TLayout;
    lytEditEmailCentro: TLayout;
    recEditEmail: TRectangle;
    edtEmail: TEdit;
    lblEditEmail: TLabel;
    tbcTextoSMS: TTabControl;
    tabComTextoSMS: TTabItem;
    tabSemTextoSMS: TTabItem;
    lblReceberAtualizacaoSMS: TLabel;
    lytFotoPerfil: TLayout;
    lytFinalizar: TLayout;
    lytFinalizarCentro: TLayout;
    recFinalizar: TRectangle;
    lblFinalizar: TLabel;
    circleFoto: TCircle;
    btnAvancar: TSpeedButton;
    actFotoLibrary: TTakePhotoFromLibraryAction;
    actFotoCamera: TTakePhotoFromCameraAction;
    fgactFoto: TfgActionSheet;
    StyleBook1: TStyleBook;
    procedure lblCadastrarTelefoneEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbcLoginChange(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure lblEmailClick(Sender: TObject);
    procedure lblTelefoneClick(Sender: TObject);
    procedure circleFotoClick(Sender: TObject);
    procedure actFotoLibraryDidFinishTaking(Image: TBitmap);
  private
    procedure mudaParaAba(pAba: TTabItem);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses
  System.UIConsts, uClass.Validacao;

procedure TfrmLogin.actFotoLibraryDidFinishTaking(Image: TBitmap);
begin
  circleFoto.Fill.Bitmap.Bitmap := Image;
end;

procedure TfrmLogin.btnAvancarClick(Sender: TObject);
begin
  if (tbcEditTelefoneEmail.ActiveTab = tabEditTelefone) and (edtTelefone.Text.IsEmpty) then
  begin
    mudaParaAba(tabEditEmail);
    mudaParaAba(tabSemTextoSMS);

    lblTelefone.FontColor := claGray;
    lineTelefone.Stroke.Color := claGray;

    lblEmail.FontColor := claBlack;
    lineEmail.Stroke.Color := claBlack;
  end;

  if TValida.telefoneValido(edtTelefone.Text) or TValida.emailValido(edtEmail.Text) then
  begin
    mudaParaAba(tabFotoPerfil);
  end;
end;

procedure TfrmLogin.circleFotoClick(Sender: TObject);
begin
  fgactFoto.Show;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  tbcLogin.TabPosition := TTabPosition.None;
  tbcLogin.TabIndex := 0;
end;

procedure TfrmLogin.lblCadastrarTelefoneEmailClick(Sender: TObject);
begin
  mudaParaAba(tabCadastro2);
end;

procedure TfrmLogin.lblEmailClick(Sender: TObject);
begin
  lblTelefone.FontColor := claGray;
  lineTelefone.Stroke.Color := claGray;

  lblEmail.FontColor := claBlack;
  lineEmail.Stroke.Color := claBlack;

  mudaParaAba(tabEditEmail);
  mudaParaAba(tabSemTextoSMS);
end;

procedure TfrmLogin.lblTelefoneClick(Sender: TObject);
begin
  lblTelefone.FontColor := claBlack;
  lineTelefone.Stroke.Color := claBlack;

  lblEmail.FontColor := claGray;
  lineEmail.Stroke.Color := claGray;

  mudaParaAba(tabEditTelefone);
  mudaParaAba(tabComTextoSMS);
end;

procedure TfrmLogin.mudaParaAba(pAba: TTabItem);
begin
  actMudaAba.Tab := pAba;
  actMudaAba.ExecuteTarget(nil);
end;

procedure TfrmLogin.tbcLoginChange(Sender: TObject);
begin
  lytRodape.Visible := tbcLogin.ActiveTab <> tabLogin;
end;

end.

