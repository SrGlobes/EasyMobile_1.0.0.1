unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.ADS,
  FireDAC.Phys.ADSDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI,Data.FireDACJSONReflect;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysADSDriverLink1: TFDPhysADSDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQP0ES: TFDQuery;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDQSumTOTALP0ES: TFDQuery;
    FDQSumTOTALP0ESTOTAL: TFloatField;
    FDQP0ESID: TIntegerField;
    FDQP0ESPRODUTO: TStringField;
    FDQP0ESCODIGOFABRICA: TStringField;
    FDQP0ESQTDDISPONIVEL: TFloatField;
    FDQCLI: TFDQuery;
    FDQCLIID: TIntegerField;
    FDQCLIAPELIDO: TStringField;
    FDQCLIRZSOCIAL: TStringField;
    FDQCLITELEFONE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetListaProdutos                         : TFDJSONDataSets;
    function GetPesquisaProdutos(TObjectPROD: String) : TFDJSONDataSets;
    function GetSomaTotalProdutos                     : TFDJSONDataSets;

    function GetListaClientes                         : TFDJSONDataSets;

  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


{ TServerMethods1 }

function TServerMethods1.GetListaClientes: TFDJSONDataSets;
begin
  With FDQCLI do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID, APELIDO, RZSOCIAL,TELEFONE FROM P0CLI ORDER BY ID ASC ');
    Open;
  end;
  FDQCLI.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQCLI);
end;

function TServerMethods1.GetListaProdutos: TFDJSONDataSets;
begin
  With FDQP0ES do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID, PRODUTO, CODIGOFABRICA, QTDDISPONIVEL FROM P0ES ORDER BY ID ASC ');
    Open;
  end;
  FDQP0ES.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQP0ES);
end;

function TServerMethods1.GetPesquisaProdutos(TObjectPROD: String): TFDJSONDataSets;
begin
  With FDQP0ES do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID, PRODUTO, CODIGOFABRICA, QTDDISPONIVEL FROM P0ES WHERE PRODUTO LIKE UPPER ('+ QuotedStr('%' + TObjectPROD + '%') + ')');
     SQL.Add('ORDER BY ID ASC');
    Open;
  end;
  FDQP0ES.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQP0ES);
end;

function TServerMethods1.GetSomaTotalProdutos: TFDJSONDataSets;
begin
  With FDQSumTOTALP0ES do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(TOTAL) AS TOTAL FROM P0ES ');
    Open;
  end;
  FDQSumTOTALP0ES.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQSumTOTALP0ES);
end;

end.
