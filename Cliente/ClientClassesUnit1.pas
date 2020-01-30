//
// Created by the DataSnap proxy generator.
// 22/01/2020 10:47:01
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FGetListaProdutosCommand: TDSRestCommand;
    FGetListaProdutosCommand_Cache: TDSRestCommand;
    FGetPesquisaProdutosCommand: TDSRestCommand;
    FGetPesquisaProdutosCommand_Cache: TDSRestCommand;
    FGetSomaTotalProdutosCommand: TDSRestCommand;
    FGetSomaTotalProdutosCommand_Cache: TDSRestCommand;
    FGetListaClientesCommand: TDSRestCommand;
    FGetListaClientesCommand_Cache: TDSRestCommand;
    FPutClientesCommand: TDSRestCommand;
    FPutClientesCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetListaProdutos(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetListaProdutos_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetPesquisaProdutos(TObjectPROD: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetPesquisaProdutos_Cache(TObjectPROD: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetSomaTotalProdutos(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetSomaTotalProdutos_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetListaClientes(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetListaClientes_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PutClientes(TObjectCLI: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PutClientes_Cache(TObjectCLI: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_GetListaProdutos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetListaProdutos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetPesquisaProdutos: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'TObjectPROD'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetPesquisaProdutos_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'TObjectPROD'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetSomaTotalProdutos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetSomaTotalProdutos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetListaClientes: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetListaClientes_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_PutClientes: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'TObjectCLI'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_PutClientes_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'TObjectCLI'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethods1Client.GetListaProdutos(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetListaProdutosCommand = nil then
  begin
    FGetListaProdutosCommand := FConnection.CreateCommand;
    FGetListaProdutosCommand.RequestType := 'GET';
    FGetListaProdutosCommand.Text := 'TServerMethods1.GetListaProdutos';
    FGetListaProdutosCommand.Prepare(TServerMethods1_GetListaProdutos);
  end;
  FGetListaProdutosCommand.Execute(ARequestFilter);
  if not FGetListaProdutosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetListaProdutosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetListaProdutosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetListaProdutosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetListaProdutos_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetListaProdutosCommand_Cache = nil then
  begin
    FGetListaProdutosCommand_Cache := FConnection.CreateCommand;
    FGetListaProdutosCommand_Cache.RequestType := 'GET';
    FGetListaProdutosCommand_Cache.Text := 'TServerMethods1.GetListaProdutos';
    FGetListaProdutosCommand_Cache.Prepare(TServerMethods1_GetListaProdutos_Cache);
  end;
  FGetListaProdutosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetListaProdutosCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.GetPesquisaProdutos(TObjectPROD: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetPesquisaProdutosCommand = nil then
  begin
    FGetPesquisaProdutosCommand := FConnection.CreateCommand;
    FGetPesquisaProdutosCommand.RequestType := 'GET';
    FGetPesquisaProdutosCommand.Text := 'TServerMethods1.GetPesquisaProdutos';
    FGetPesquisaProdutosCommand.Prepare(TServerMethods1_GetPesquisaProdutos);
  end;
  FGetPesquisaProdutosCommand.Parameters[0].Value.SetWideString(TObjectPROD);
  FGetPesquisaProdutosCommand.Execute(ARequestFilter);
  if not FGetPesquisaProdutosCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPesquisaProdutosCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetPesquisaProdutosCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPesquisaProdutosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPesquisaProdutos_Cache(TObjectPROD: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetPesquisaProdutosCommand_Cache = nil then
  begin
    FGetPesquisaProdutosCommand_Cache := FConnection.CreateCommand;
    FGetPesquisaProdutosCommand_Cache.RequestType := 'GET';
    FGetPesquisaProdutosCommand_Cache.Text := 'TServerMethods1.GetPesquisaProdutos';
    FGetPesquisaProdutosCommand_Cache.Prepare(TServerMethods1_GetPesquisaProdutos_Cache);
  end;
  FGetPesquisaProdutosCommand_Cache.Parameters[0].Value.SetWideString(TObjectPROD);
  FGetPesquisaProdutosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetPesquisaProdutosCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.GetSomaTotalProdutos(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetSomaTotalProdutosCommand = nil then
  begin
    FGetSomaTotalProdutosCommand := FConnection.CreateCommand;
    FGetSomaTotalProdutosCommand.RequestType := 'GET';
    FGetSomaTotalProdutosCommand.Text := 'TServerMethods1.GetSomaTotalProdutos';
    FGetSomaTotalProdutosCommand.Prepare(TServerMethods1_GetSomaTotalProdutos);
  end;
  FGetSomaTotalProdutosCommand.Execute(ARequestFilter);
  if not FGetSomaTotalProdutosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetSomaTotalProdutosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetSomaTotalProdutosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetSomaTotalProdutosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetSomaTotalProdutos_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetSomaTotalProdutosCommand_Cache = nil then
  begin
    FGetSomaTotalProdutosCommand_Cache := FConnection.CreateCommand;
    FGetSomaTotalProdutosCommand_Cache.RequestType := 'GET';
    FGetSomaTotalProdutosCommand_Cache.Text := 'TServerMethods1.GetSomaTotalProdutos';
    FGetSomaTotalProdutosCommand_Cache.Prepare(TServerMethods1_GetSomaTotalProdutos_Cache);
  end;
  FGetSomaTotalProdutosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetSomaTotalProdutosCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.GetListaClientes(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetListaClientesCommand = nil then
  begin
    FGetListaClientesCommand := FConnection.CreateCommand;
    FGetListaClientesCommand.RequestType := 'GET';
    FGetListaClientesCommand.Text := 'TServerMethods1.GetListaClientes';
    FGetListaClientesCommand.Prepare(TServerMethods1_GetListaClientes);
  end;
  FGetListaClientesCommand.Execute(ARequestFilter);
  if not FGetListaClientesCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetListaClientesCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetListaClientesCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetListaClientesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetListaClientes_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetListaClientesCommand_Cache = nil then
  begin
    FGetListaClientesCommand_Cache := FConnection.CreateCommand;
    FGetListaClientesCommand_Cache.RequestType := 'GET';
    FGetListaClientesCommand_Cache.Text := 'TServerMethods1.GetListaClientes';
    FGetListaClientesCommand_Cache.Prepare(TServerMethods1_GetListaClientes_Cache);
  end;
  FGetListaClientesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetListaClientesCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.PutClientes(TObjectCLI: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPutClientesCommand = nil then
  begin
    FPutClientesCommand := FConnection.CreateCommand;
    FPutClientesCommand.RequestType := 'GET';
    FPutClientesCommand.Text := 'TServerMethods1.PutClientes';
    FPutClientesCommand.Prepare(TServerMethods1_PutClientes);
  end;
  FPutClientesCommand.Parameters[0].Value.SetWideString(TObjectCLI);
  FPutClientesCommand.Execute(ARequestFilter);
  if not FPutClientesCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPutClientesCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPutClientesCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPutClientesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.PutClientes_Cache(TObjectCLI: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPutClientesCommand_Cache = nil then
  begin
    FPutClientesCommand_Cache := FConnection.CreateCommand;
    FPutClientesCommand_Cache.RequestType := 'GET';
    FPutClientesCommand_Cache.Text := 'TServerMethods1.PutClientes';
    FPutClientesCommand_Cache.Prepare(TServerMethods1_PutClientes_Cache);
  end;
  FPutClientesCommand_Cache.Parameters[0].Value.SetWideString(TObjectCLI);
  FPutClientesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPutClientesCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FGetListaProdutosCommand.DisposeOf;
  FGetListaProdutosCommand_Cache.DisposeOf;
  FGetPesquisaProdutosCommand.DisposeOf;
  FGetPesquisaProdutosCommand_Cache.DisposeOf;
  FGetSomaTotalProdutosCommand.DisposeOf;
  FGetSomaTotalProdutosCommand_Cache.DisposeOf;
  FGetListaClientesCommand.DisposeOf;
  FGetListaClientesCommand_Cache.DisposeOf;
  FPutClientesCommand.DisposeOf;
  FPutClientesCommand_Cache.DisposeOf;
  inherited;
end;

end.

