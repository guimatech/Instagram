program prjInstagram;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmInicial in 'ufrmInicial.pas' {frmInicial},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  uClass.Validacao in 'uClass.Validacao.pas',
  ufrmBase in 'ufrmBase.pas' {frmBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.
