unit ufrmBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TfrmBase = class(TForm)
  private
    { Private declarations }
  protected
    class function instanceClass: TComponentClass; virtual; abstract;
  public
    class procedure show(var Reference); virtual;
  end;

implementation

{$R *.fmx}

{ TfrmBase }

class procedure TfrmBase.show(var Reference);
begin
  if not Assigned(TForm(Reference)) then
    Application.CreateForm(instanceClass, Reference);

  TForm(Reference).Show;
end;

end.

