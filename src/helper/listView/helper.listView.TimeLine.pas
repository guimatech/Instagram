unit helper.listView.TimeLine;

interface

uses
  System.UITypes, model.Post, FMX.Objects, FMX.ListView, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, model.Formatacao, ufrmStyle, System.SysUtils, FMX.Utils,
  System.Classes, FMX.Graphics;

type
  TTimeLine = class helper for TListView
  strict private
    procedure AddNomeUsuario(const psNomeUsuario: string);
    procedure AddLocalizacao(const psLocalizacao: string);
    procedure AddQuantidadeCurtidas(const pnQuantidadeCurtidas: Integer);
    procedure AddDescricaoPost(const psDescricaoPost: string);
  private
    class var
      FoItem: TListViewItem;
    procedure AddTexto(const psNomeItem, psTexto: string; const poFormatacao: TFormatacao);
    procedure AddImagem(const psNomeItem: string; const poImagem: TBitmap); overload;
    procedure AddImagem(const psNomeItem: string; const psBase64: string); overload;
    procedure AddImagem(const psNomeItem: string; const poImagem: TImage); overload;
    procedure DoUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
  public
    procedure RedimencionarConteudoAutomaticamente;
    procedure AddPost(const poItemLista: TPost);
  end;

const
  nTAMANHO_PADRAO_LETRA = 11;
  sNOME_USUARIO = 'Text1';
  sTEXTO_LOCALIZACAO = 'Text2';
  sFOTO_USUARIO = 'Image3';
  sICONE_OPCOES = 'Image4';
  sFOTO = 'Image5';
  sICONE_CURTIR = 'Image6';
  sICONE_COMENTARIOS = 'Image7';
  sICONE_MENSAGENS = 'Image8';
  sICONE_SALVAR = 'Image9';
  sTEXTO_QUANTIDADE_CURTIDAS = 'Text10';
  sTEXTO_DESCRICAO = 'Text11';

implementation

{ TTimeLine }

uses
  uClass.Conversao, uClass.Network;

procedure TTimeLine.AddPost(const poItemLista: TPost);
begin
  FoItem := Items.Add;

  AddNomeUsuario(poItemLista.sNomeUsuario);
  AddLocalizacao(poItemLista.sLocalizacao);

  AddImagem(sFOTO_USUARIO, TNetwork.PegarImagemPorURL(poItemLista.sIconeUsuario64));
  AddImagem(sICONE_OPCOES, frmStyle.imgIconeOpcoes);
  AddImagem(sFOTO, TNetwork.PegarImagemPorURL(poItemLista.sFoto64));
  AddImagem(sICONE_CURTIR, frmStyle.imgIconeFavorito);
  AddImagem(sICONE_COMENTARIOS, frmStyle.imgIconeComentario);
  AddImagem(sICONE_MENSAGENS, frmStyle.imgIconeMensagem);
  AddImagem(sICONE_SALVAR, frmStyle.imgIconeMarcadorVazio);

  AddQuantidadeCurtidas(poItemLista.nQuantidadeCurtida);
  AddDescricaoPost(poItemLista.sDescricao);
end;

procedure TTimeLine.AddQuantidadeCurtidas(const pnQuantidadeCurtidas: Integer);
var
  sQuantidadeCurtidas: string;
  oFormatacao: TFormatacao;
begin
  oFormatacao := TFormatacao.Create(nTAMANHO_PADRAO_LETRA);
  try
    case pnQuantidadeCurtidas of
      0:
        sQuantidadeCurtidas := 'Nenhuma curtida';
      1:
        sQuantidadeCurtidas := 'Curtido por 1 pessoa';
    else
      sQuantidadeCurtidas := 'Curtido por ' + pnQuantidadeCurtidas.ToString + ' pessoas';
    end;
    AddTexto(sTEXTO_QUANTIDADE_CURTIDAS, sQuantidadeCurtidas, oFormatacao);
  finally
    FreeAndNil(oFormatacao);
  end;
end;

procedure TTimeLine.AddLocalizacao(const psLocalizacao: string);
var
  oFormatacao: TFormatacao;
begin
  oFormatacao := TFormatacao.Create(nTAMANHO_PADRAO_LETRA);
  try
    AddTexto(sTEXTO_LOCALIZACAO, psLocalizacao, oFormatacao);
  finally
    FreeAndNil(oFormatacao);
  end;
end;

procedure TTimeLine.AddNomeUsuario(const psNomeUsuario: string);
var
  oFormatacao: TFormatacao;
begin
  oFormatacao := TFormatacao.Create(nTAMANHO_PADRAO_LETRA, [TFontStyle.fsBold]);
  try
    AddTexto(sNOME_USUARIO, psNomeUsuario, oFormatacao);
  finally
    FreeAndNil(oFormatacao);
  end;
end;

procedure TTimeLine.AddDescricaoPost(const psDescricaoPost: string);
var
  oFormatacao: TFormatacao;
begin
  oFormatacao := TFormatacao.Create(nTAMANHO_PADRAO_LETRA, [], True);
  try
    AddTexto(sTEXTO_DESCRICAO, psDescricaoPost, oFormatacao);
  finally
    FreeAndNil(oFormatacao);
  end;
end;

procedure TTimeLine.AddTexto(const psNomeItem, psTexto: string; const poFormatacao: TFormatacao);
var
  oTexto: TListItemText;
begin
  oTexto := TListItemText(FoItem.Objects.FindDrawable(psNomeItem));
  oTexto.Text := psTexto;
  oTexto.Font.Size := poFormatacao.nTamanhoFont;
  oTexto.Font.Style := poFormatacao.aEstilos;
  oTexto.WordWrap := poFormatacao.bWordWrap;
end;

procedure TTimeLine.DoUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
var
  oImg : TListItemImage;
  oTexto: TListItemText;
  nEixoY: integer;
  aIcones: array of string;
  sIcone: string;
begin
  oImg := TListItemImage(AItem.Objects.FindDrawable(sFOTO));
  oImg.Width := Self.Width;
  oImg.Height := Round(oImg.Width/2) + 60;
  nEixoY := Trunc(oImg.PlaceOffset.Y + oImg.Height);

  AItem.Height := nEixoY;

  aIcones := [sICONE_CURTIR, sICONE_COMENTARIOS, sICONE_MENSAGENS, sICONE_SALVAR];

  for sIcone in aIcones do
  begin
    oImg := TListItemImage(AItem.Objects.FindDrawable(sIcone));
    oImg.PlaceOffset.Y := nEixoY;
  end;

  oTexto := TListItemText(FoItem.Objects.FindDrawable(sTEXTO_QUANTIDADE_CURTIDAS));
  oTexto.Width := Self.Width - 7;
  oTexto.PlaceOffset.Y := nEixoY + 22;

  oTexto := TListItemText(FoItem.Objects.FindDrawable(sTEXTO_DESCRICAO));
  oTexto.Width := Self.Width - 7;
  oTexto.PlaceOffset.Y := nEixoY + 62;

  nEixoY := Trunc(oTexto.PlaceOffset.Y + oTexto.Height);

  AItem.Height := Trunc(nEixoY);
end;

procedure TTimeLine.RedimencionarConteudoAutomaticamente;
begin
  OnUpdateObjects := DoUpdateObjects;
  Width := Width + 1;
end;

procedure TTimeLine.AddImagem(const psNomeItem: string; const poImagem: TBitmap);
var
  oImagem: TListItemImage;
begin
  oImagem := TListItemImage(FoItem.Objects.FindDrawable(psNomeItem));
  oImagem.Bitmap := poImagem;
  oImagem.OwnsBitmap := True;
  oImagem.TagFloat := 0;
end;

procedure TTimeLine.AddImagem(const psNomeItem, psBase64: string);
var
  oFoto: TBitmap;
begin
  if psBase64.IsEmpty then
  begin
    Exit;
  end;

  try
    oFoto := TBitmap.Create;
    oFoto := TConversao.BitmapFromBase64(psBase64);
    AddImagem(psNomeItem, oFoto);
  except
  end;
end;

procedure TTimeLine.AddImagem(const psNomeItem: string; const poImagem: TImage);
begin
  AddImagem(psNomeItem, poImagem.Bitmap);
end;

end.

