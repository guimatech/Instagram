unit ufrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Layouts, ufrmBase, System.Actions, FMX.ActnList, FMX.Gestures;

type
  TfrmPrincipal = class(TfrmBase)
    stylbk1: TStyleBook;
    tbcPrincipal: TTabControl;
    tabCamera: TTabItem;
    tabTimeline: TTabItem;
    tabMensagem: TTabItem;
    lytAbas: TLayout;
    lytAbaHome: TLayout;
    imgAbaHome: TImage;
    lyt1: TLayout;
    img1: TImage;
    lyt2: TLayout;
    img2: TImage;
    lyt3: TLayout;
    img3: TImage;
    lytBusca: TLayout;
    imgBusca: TImage;
    recToolbar: TRectangle;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    gstManager1: TGestureManager;
    lst1: TActionList;
    actChangeTabLeft: TChangeTabAction;
    actChangeTabRigth: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure actChangeTabLeftUpdate(Sender: TObject);
    procedure actChangeTabRigthUpdate(Sender: TObject);
  private
    class function instanceClass: TComponentClass; override;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.actChangeTabLeftUpdate(Sender: TObject);
begin
  if tbcPrincipal.ActiveTab = tabMensagem then
  begin
    actChangeTabLeft.Tab := nil;
    exit();
  end;

  if tbcPrincipal.ActiveTab = tabCamera then
  begin
    actChangeTabLeft.Tab := tabTimeline;
  end
  else if tbcPrincipal.ActiveTab = tabTimeline then
  begin
    actChangeTabLeft.Tab := tabMensagem;
  end;
end;

procedure TfrmPrincipal.actChangeTabRigthUpdate(Sender: TObject);
begin
  if tbcPrincipal.ActiveTab = tabCamera then
  begin
    actChangeTabRigth.Tab := nil;
    exit();
  end;

  if tbcPrincipal.ActiveTab = tabMensagem then
  begin
    actChangeTabRigth.Tab := tabTimeline;
  end
  else if tbcPrincipal.ActiveTab = tabTimeline then
  begin
    actChangeTabRigth.Tab := tabCamera;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tbcPrincipal.TabPosition := TTabPosition.None;
  tbcPrincipal.ActiveTab := tabTimeline;
end;

class function TfrmPrincipal.instanceClass: TComponentClass;
begin
  result := TfrmPrincipal;
end;

end.

