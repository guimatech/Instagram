unit ufrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Layouts, ufrmBase, System.Actions, FMX.ActnList, FMX.Gestures,
  FMX.ListView, System.Generics.Collections, model.Post, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, helper.listView.TimeLine, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, System.JSON, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Data.DBXJSON, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

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
    procedure lvTimeLineItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    function PegarPosts: TObjectList<TPost>;
    function PegarURLAPI(psGetDetails: string): string;
    function PegarURLImagem(psNomeImagem: string): string;
    function TratarJSON(const psJSON: string): string;
    procedure ListarPosts;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uClass.Network, ufrmStyle, System.Threading;

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
  lvTimeLine.RedimencionarConteudoAutomaticamente;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  ListarPosts;
end;

procedure TfrmPrincipal.ListarPosts;
var
  oPost: TPost;
  oListaPosts: TObjectList<TPost>;
begin
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

procedure TfrmPrincipal.lvTimeLineItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  inherited;
  if TListView(Sender).Selected = nil then
  begin
    Exit;
  end;

  if not(ItemObject is TListItemImage) then
  begin
    Exit;
  end;

  if TListItemImage(ItemObject).Name = sICONE_CURTIR then
  begin
    if TListItemImage(ItemObject).TagFloat = 0 then
    begin
      TListItemImage(ItemObject).Bitmap := frmStyle.imgIconeFavoritoClicado.Bitmap;
      TListItemImage(ItemObject).TagFloat := 1;
    end
    else
    begin
      TListItemImage(ItemObject).Bitmap := frmStyle.imgIconeFavorito.Bitmap;
      TListItemImage(ItemObject).TagFloat := 0;
    end;
  end;
end;

function TfrmPrincipal.PegarPosts: TObjectList<TPost>;
var
  oPost: TPost;
  sJSON: string;
  oListaPosts: TJSONArray;
  I: Integer;
  lStream: TStringStream;
begin
  Result := TObjectList<TPost>.Create;

  sJSON := TNetwork.PegarStringPorURL(PegarURLAPI('/movie/popular'));

  try
    oListaPosts := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(TratarJSON
      (sJSON)), 0) as TJSONArray;

    for I := 0 to oListaPosts.Size - 1 do
    begin
      oPost := TPost.Create;
      oPost.sIconeUsuario64 := PegarURLImagem(oListaPosts.Get(I).GetValue<string>('poster_path'));
      oPost.sNomeUsuario := oListaPosts.Get(I).GetValue<string>('title');
      oPost.sLocalizacao := oListaPosts.Get(I).GetValue<string>('release_date');
      oPost.sFoto64 := PegarURLImagem(oListaPosts.Get(I).GetValue<string>('backdrop_path'));
      oPost.sDescricao := oListaPosts.Get(I).GetValue<string>('overview');
      oPost.nQuantidadeCurtida := oListaPosts.Get(I).GetValue<Integer>('vote_count');
      Result.Add(oPost);
    end;
  finally
    FreeAndNil(oListaPosts);
  end;
end;

function TfrmPrincipal.PegarURLAPI(psGetDetails: string): string;
const
  sCAMINHO_BASE_API = 'https://api.themoviedb.org/3';
  sAPI_KEY = '042ffd425ac3c6d84b4f30a57fc2bb2e';
begin
  Result := sCAMINHO_BASE_API + psGetDetails + '?api_key=' + sAPI_KEY;
end;

function TfrmPrincipal.PegarURLImagem(psNomeImagem: string): string;
const
  sCAMINHO_BASE_IMAGEM = 'https://image.tmdb.org/t/p/w500';
begin
  Result := sCAMINHO_BASE_IMAGEM + psNomeImagem;
end;

function TfrmPrincipal.TratarJSON(const psJSON: string): string;
var
  sJSONTratado: string;
  nInicioCorte, nFimCorte: Integer;
begin
  nInicioCorte := Pos('[', psJSON);
  nFimCorte := psJSON.Length - (Pos('[', psJSON));
  sJSONTratado := Copy(psJSON, nInicioCorte, nFimCorte);
  Result := sJSONTratado;
end;

end.

