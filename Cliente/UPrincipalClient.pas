unit UPrincipalClient;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,Data.FireDACJSONReflect,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView,
  FMX.Edit, Data.Bind.GenData, Data.Bind.ObjectScope,Data.DB,
  FMX.Ani, FMX.Objects, FMX.Layouts, FMX.Effects, System.Actions, FMX.ActnList, FMX.ComboEdit,
  MultiDetailAppearanceU;

type
  TFprincipal = class(TForm)
    ActionList1: TActionList;
    Act_WishDetails: TAction;
    Act_ReturnWishList: TAction;
    Act_ReturnHome: TAction;
    Layout_Content: TLayout;
    Layout1: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    Layout2: TLayout;
    ButtonLoadWish: TRectangle;
    Label8: TLabel;
    ShadowEffect5: TShadowEffect;
    Layout_Header: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Line2: TLine;
    RectangleTOPO: TRectangle;
    Button2: TButton;
    Label3: TLabel;
    ShadowEffect7: TShadowEffect;
    Layout_Services: TLayout;
    HorzScrollBox1: THorzScrollBox;
    RectangleP0ES: TRectangle;
    Label10: TLabel;
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    RectangleCP01: TRectangle;
    Label12: TLabel;
    Image3: TImage;
    ShadowEffect3: TShadowEffect;
    ScrollBar1: TScrollBar;
    RectangleSETUP: TRectangle;
    Label13: TLabel;
    Image4: TImage;
    ShadowEffect4: TShadowEffect;
    HorzScrollBox2: THorzScrollBox;
    Label15: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    DetailsProduct: TRectangle;
    Header3: TRectangle;
    Button3: TButton;
    Label17: TLabel;
    ShadowEffect8: TShadowEffect;
    FloatAnimation2: TFloatAnimation;
    ListProduct: TRectangle;
    HeaderWishlist: TRectangle;
    Button1: TButton;
    Label2: TLabel;
    FloatAnimation1: TFloatAnimation;
    RoundRect1: TRoundRect;
    Edit1: TEdit;
    Line1: TLine;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    ListViewP0ES: TListView;
    RectangleCLI: TRectangle;
    Label1: TLabel;
    Image5: TImage;
    ShadowEffect6: TShadowEffect;
    RectangleTRP: TRectangle;
    Label18: TLabel;
    Image6: TImage;
    ShadowEffect9: TShadowEffect;
    RectangleLINE: TRectangle;
    ListClient: TRectangle;
    Rectangle2: TRectangle;
    Button4: TButton;
    RoundRect2: TRoundRect;
    EditCLI: TEdit;
    Line3: TLine;
    Rectangle3: TRectangle;
    Label11: TLabel;
    FloatAnimation3: TFloatAnimation;
    ListViewCLI: TListView;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RectangleP0ESTap(Sender: TObject; const Point: TPointF);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure RectangleCLITap(Sender: TObject; const Point: TPointF);
    procedure ButtonLoadWishClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RectangleCLIClick(Sender: TObject);
  private
    { Private declarations }
    //SCLIENTES
    procedure ApagarListaClientes;
    procedure GetListaClients;
    procedure PreencheListaClients(Id,Apelido, RzSocial, Telefone : string;
                                       Chave: Integer; lst_CLI: TListView);

//  PRODUTOS
    procedure ApagarListaProdutos;
    procedure GetListaProdutos;
    procedure GetProcuraProdutos;
    procedure SomaTotalEstoque;
    procedure PreencheListaProdutos(Id,Produto, Codigofabrica, Qtde: String;
                                       Chave: Integer; lst: TListView);

  public
    { Public declarations }
  end;

var
  Fprincipal: TFprincipal;

implementation

{$R *.fmx}

uses ClientModuleUnit1;

procedure TFprincipal.RectangleCLIClick(Sender: TObject);
begin
  GetListaClients;
end;

procedure TFprincipal.RectangleCLITap(Sender: TObject; const Point: TPointF);
begin
//  GetListaClients;
end;

procedure TFprincipal.RectangleP0ESTap(Sender: TObject; const Point: TPointF);
begin
  GetListaProdutos;
end;

procedure TFprincipal.ApagarListaClientes;
var
I: Integer;
begin
  for I := 0 to ListViewCLI.Items.Count - 1 do
  begin
    ListViewCLI.Items.Clear;
  end;
end;

procedure TFprincipal.ApagarListaProdutos;
var
I: Integer;
begin
  for I := 0 to ListViewP0ES.Items.Count - 1 do
  begin
    ListViewP0ES.Items.Clear;
  end;
end;

procedure TFprincipal.GetListaClients;
var
  LDataSetList: TFDJSONDataSets;
begin
  EditCLI.Text:= '';
  try
    ClientModule1.FDMemCLI.Close;
    LDataSetList := ClientModule1.ServerMethods1Client.GetListaClientes;
    ClientModule1.FDMemCLI.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    ClientModule1.FDMemCLI.Open;
  Except
  end;
  ApagarListaClientes;
  ClientModule1.FDMemCLI.Active := True;
  ClientModule1.FDMemCLI.First;

  if not ClientModule1.FDMemCLI.IsEmpty then
  begin
    ClientModule1.FDMemCLI.First;
    repeat
      PreencheListaClients(
      FloatToStr(ClientModule1.FDMemCLIID.AsInteger),
      ClientModule1.FDMemCLIAPELIDO.AsString,
      ClientModule1.FDMemCLIRZSOCIAL.AsString,
      ClientModule1.FDMemCLITELEFONE.AsString, 0, ListViewCLI);
      ClientModule1.FDMemCLI.Next;
    until ClientModule1.FDMemCLI.eof;
  end;
  ListClient.Visible := True;
end;

procedure TFprincipal.GetListaProdutos;
var
  LDataSetList: TFDJSONDataSets;
begin
  Edit1.Text := '';
  try
    with ClientModule1.FDMemP0ES do
    begin
      Close;
      LDataSetList := ClientModule1.ServerMethods1Client.GetListaProdutos;
      AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
      Open;
    end;
  except
  end;
  ApagarListaProdutos;
  with ClientModule1.FDMemP0ES do
  begin
    Active := True;
    First;

    if not IsEmpty then
    begin
      First;
      repeat
        PreencheListaProdutos(
        FieldByName('ID')           .AsInteger.ToString,
        FieldByName('PRODUTO')      .AsString,
        FieldByName('CODIGOFABRICA').AsString,
        FieldByName('QTDDISPONIVEL').AsFloat.ToString,
        0,ListViewP0ES);
        Next;
      until eof;
    end;
  end;
  ListProduct.Visible := True;
end;

procedure TFprincipal.PreencheListaClients(Id, Apelido, RzSocial, Telefone: string;
                                           Chave: Integer; lst_CLI: TListView);
var
  Item: TListViewItem;
begin
  Item := lst_CLI.Items.Add;

  Item.Text := Id + ' - ' + Apelido;
  Item.Data[MultiDetailAppearanceU.TMultiDetailAppearanceNames.Detail1] := RzSocial;
  Item.Data[MultiDetailAppearanceU.TMultiDetailAppearanceNames.Detail2] := Telefone;
  lst_CLI.ItemAppearanceObjects.ItemObjects.Text.Font.Size := 13.1;
  lst_CLI.ItemAppearanceObjects.ItemObjects.Text.TextColor := $FF4F565D;
  lst_CLI.ItemAppearanceObjects.ItemObjects.Detail.Font.Size := 13.2;
end;

procedure TFprincipal.PreencheListaProdutos(Id, Produto, Codigofabrica, Qtde: String;
                                            Chave: Integer; lst: TListView);
var
  Item: TListViewItem;
begin
  Item := lst.Items.Add;

  Item.Text := Id + ' - ' + Produto;
  Item.Data[MultiDetailAppearanceU.TMultiDetailAppearanceNames.Detail1] := Codigofabrica;
  Item.Data[MultiDetailAppearanceU.TMultiDetailAppearanceNames.Detail2] := 'Qtd: ' + Qtde + ' Ltrs';
  lst.ItemAppearanceObjects.ItemObjects.Text.Font.Size := 13.1;
  lst.ItemAppearanceObjects.ItemObjects.Text.TextColor := $FF4F565D;
  lst.ItemAppearanceObjects.ItemObjects.Detail.Font.Size := 13.2;
end;

procedure TFprincipal.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkHardwareBack) then
  begin
    Key := 0;
  end
  else
    Key := 0;
end;

procedure TFprincipal.FormShow(Sender: TObject);
begin
  ListProduct.Visible := False;
  SomaTotalEstoque;
end;
{----------------------------------------------------------------------}

procedure TFprincipal.Button1Click(Sender: TObject);
begin
  ListProduct.Visible := False;
end;

procedure TFprincipal.Button4Click(Sender: TObject);
begin
  ListClient.Visible := False;
end;

procedure TFprincipal.ButtonLoadWishClick(Sender: TObject);
begin
  try
    GetListaProdutos;
  except
    MessageDlg('Verifique sua conexão com a internet!',
      System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbOK], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
      end);
  end;
end;

{----------------------------------------------------------------------}
procedure TFprincipal.Edit1Change(Sender: TObject);
begin
  GetProcuraProdutos;
  ApagarListaProdutos;
  ClientModule1.FDMemP0ES.Active := True;
  ClientModule1.FDMemP0ES.First;

  if not ClientModule1.FDMemP0ES.IsEmpty then
  begin
    ClientModule1.FDMemP0ES.First;
    repeat
      PreencheListaProdutos(
        FloatToStr(ClientModule1.FDMemP0ESID.AsInteger),
        ClientModule1.FDMemP0ESPRODUTO.AsString,
        ClientModule1.FDMemP0ESCODIGOFABRICA.AsString,
        FloatToStr(ClientModule1.FDMemP0ESQTDDISPONIVEL.AsFloat), 0, ListViewP0ES);
        ClientModule1.FDMemP0ES.Next;
    until ClientModule1.FDMemP0ES.eof;
  end;
end;

procedure TFprincipal.SomaTotalEstoque;
var
  LDataSetList: TFDJSONDataSets;
begin
  try
    ClientModule1.FDMemSumTOTALP0ES.Close;
    LDataSetList := ClientModule1.ServerMethods1Client.GetSomaTotalProdutos;
    ClientModule1.FDMemSumTOTALP0ES.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    ClientModule1.FDMemSumTOTALP0ES.Open;
  Except
  end;
end;

procedure TFprincipal.GetProcuraProdutos;
var
  LDataSetList: TFDJSONDataSets;
begin
  try
    ClientModule1.FDMemP0ES.Close;
    LDataSetList := ClientModule1.ServerMethods1Client.GetPesquisaProdutos(Edit1.Text);
    ClientModule1.FDMemP0ES.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    ClientModule1.FDMemP0ES.Open;
  Except
  end;
  PreencheListaProdutos(
    FloatToStr(ClientModule1.FDMemP0ESID.AsInteger),
    ClientModule1.FDMemP0ESPRODUTO.AsString,
    ClientModule1.FDMemP0ESCODIGOFABRICA.AsString,
    FloatToStr(ClientModule1.FDMemP0ESQTDDISPONIVEL.AsFloat), 0, ListViewP0ES);
end;

end.
