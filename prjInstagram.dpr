program prjInstagram;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmInicial in 'ufrmInicial.pas' {frmInicial};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.
