program prjInstagram;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmStyle in 'src\assets\ufrmStyle.pas',
  helper.listView.TimeLine in 'src\helper\listView\helper.listView.TimeLine.pas',
  model.Formatacao in 'src\model\model.Formatacao.pas',
  model.Post in 'src\model\model.Post.pas',
  uClass.Conversao in 'src\utils\uClass.Conversao.pas',
  uClass.Validacao in 'src\utils\uClass.Validacao.pas',
  ufrmBase in 'src\view\ufrmBase.pas' {frmBase},
  ufrmInicial in 'src\view\ufrmInicial.pas' {frmInicial},
  ufrmLogin in 'src\view\ufrmLogin.pas' {frmLogin},
  ufrmPrincipal in 'src\view\ufrmPrincipal.pas' {frmPrincipal},
  uClass.Network in 'src\utils\uClass.Network.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.CreateForm(TfrmStyle, frmStyle);
  Application.Run;
end.
