unit ufrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Layouts, ufrmBase, System.Actions, FMX.ActnList, FMX.Gestures,
  FMX.ListView,
  System.Generics.Collections, model.Post, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, helper.listView.TimeLine;

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
    lytAbaPerfil: TLayout;
    imgAbaPerfil: TImage;
    lytAbaFavoritos: TLayout;
    imgAbaFavoritos: TImage;
    lytAbaFoto: TLayout;
    imgAbaFoto: TImage;
    lytAbaBusca: TLayout;
    imgAbaBusca: TImage;
    recToolbar: TRectangle;
    img4: TImage;
    imgIrParaCamera: TImage;
    imgIrParaChat: TImage;
    gstManager1: TGestureManager;
    lst1: TActionList;
    actChangeTabLeft: TChangeTabAction;
    actChangeTabRigth: TChangeTabAction;
    lvTimeLine: TListView;
    procedure FormCreate(Sender: TObject);
    procedure actChangeTabLeftUpdate(Sender: TObject);
    procedure actChangeTabRigthUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function PegarPosts: TObjectList<TPost>;
  protected
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
    Exit();
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
    Exit();
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

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  oPost: TPost;
  oListaPosts: TObjectList<TPost>;
begin
  inherited;
  oListaPosts := PegarPosts;

  try
    for oPost in oListaPosts do
    begin
      lvTimeLine.AddPost(oPost);
    end;
  finally
    FreeAndNil(oListaPosts);
  end;
end;

class function TfrmPrincipal.instanceClass: TComponentClass;
begin
  result := TfrmPrincipal;
end;

function TfrmPrincipal.PegarPosts: TObjectList<TPost>;
var
  oPost: TPost;
begin
  Result := TObjectList<TPost>.Create;

  oPost := TPost.Create;
  oPost.sIconeUsuario64 := '';
  oPost.sNomeUsuario := 'Lucas Guimarães';
  oPost.sLocalizacao := 'Florianóplis';
  oPost.sFoto64 := '';
  oPost.sDescricao := 'Convite para meus amigos...';
  oPost.nQuantidadeCurtida := 37;
  Result.Add(oPost);

  oPost := TPost.Create;
  oPost.sIconeUsuario64 := '';
  oPost.sNomeUsuario := 'Lucas Guimarães';
  oPost.sLocalizacao := 'Florianóplis';
  oPost.sFoto64 := '';
  oPost.sDescricao := 'Vida de programador...';
  oPost.nQuantidadeCurtida := 1;
  Result.Add(oPost);

  oPost := TPost.Create;
  oPost.sIconeUsuario64 := '';
  oPost.sNomeUsuario := 'Lucas Guimarães';
  oPost.sLocalizacao := 'Florianóplis';
  oPost.sFoto64 := '';
  oPost.sDescricao := 'Acessem o blog';
  oPost.nQuantidadeCurtida := 0;
  Result.Add(oPost);
end;

end.

