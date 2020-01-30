unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Datasnap.DSClientRest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
    FDMemP0ES: TFDMemTable;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMemP0ESPRODUTO: TStringField;
    FDMemP0ESID: TIntegerField;
    FDMemP0ESCODIGOFABRICA: TStringField;
    FDMemSumTOTALP0ES: TFDMemTable;
    FDMemSumTOTALP0ESTOTAL: TFloatField;
    FDMemCLI: TFDMemTable;
    FDMemCLIID: TIntegerField;
    FDMemCLIAPELIDO: TStringField;
    FDMemCLIRZSOCIAL: TStringField;
    FDMemP0ESQTDDISPONIVEL: TFloatField;
    FDMemCLITELEFONE: TStringField;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    function GetServerMethods1Client: TServerMethods1Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TClientModule1.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TServerMethods1Client.Create(DSRestConnection1, FInstanceOwner);
  Result := FServerMethods1Client;
end;

end.
