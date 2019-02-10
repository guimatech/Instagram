unit helper.listView.TimeLine;

interface

uses
  System.UITypes, model.Post, FMX.Objects, FMX.ListView, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, model.Formatacao, ufrmStyle, System.SysUtils, FMX.Utils, System.Classes;

type
  TTimeLine = class helper for TListView
  strict private
    procedure AddNomeUsuario(const psNomeUsuario: string);
    procedure AddLocalizacao(const psLocalizacao: string);
    procedure AddQuantidadeCurtidas(const pnQuantidadeCurtidas: Integer);
    procedure AddDescricaoPost(const psDescricaoPost: string);
  private
    class var FoItem: TListViewItem;
    procedure AddTexto(const psNomeItem, psTexto: string; const poFormatacao: TFormatacao);
    procedure AddImagem(const psNomeItem: string; const poImagemIcone: TImage);
  public
    procedure AddPost(const poItemLista: TPost);
  end;

const
  nTAMANHO_PADRAO_LETRA = 11;

implementation

{ TTimeLine }

uses
  uClass.Conversao;

procedure TTimeLine.AddPost(const poItemLista: TPost);
begin
   FoItem := Items.Add;

  // Icone do usuário...

  AddNomeUsuario(poItemLista.sNomeUsuario);
  AddLocalizacao(poItemLista.sLocalizacao);

  // Icone de opcoes...
  AddImagem('Image4', frmStyle.imgIconeOpcoes);

  // Foto...

  // Icone curtir...
  AddImagem('Image6', frmStyle.imgIconeFavorito);

  // Icone comentários...
  AddImagem('Image7', frmStyle.imgIconeComentario);

  // Icone mensagens...
  AddImagem('Image8', frmStyle.imgIconeMensagem);

  // Icone salvar...
  AddImagem('Image8', frmStyle.imgIconeMarcadorVazio);

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
    AddTexto('Text10', sQuantidadeCurtidas, oFormatacao);
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
    AddTexto('Text2', psLocalizacao, oFormatacao);
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
    AddTexto('Text1', psNomeUsuario, oFormatacao);
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
    AddTexto('Text11', psDescricaoPost, oFormatacao);
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

procedure TTimeLine.AddImagem(const psNomeItem: string; const poImagemIcone: TImage);
var
  oImagem: TListItemImage;
begin
  oImagem := TListItemImage(FoItem.Objects.FindDrawable(psNomeItem));
  oImagem.Bitmap := poImagemIcone.Bitmap;
end;

end.

