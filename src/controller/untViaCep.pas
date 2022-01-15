unit untViaCep;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON,
  REST.Json,
  REST.Types,
  REST.Client,
  untCadastro;

type
  TViaCep = class(TObject)
  private
    FRESTClient: TRESTClient;
    FRestRequest: TRESTRequest;
    FRestResponse: TRESTResponse;
    procedure doCreate;
    procedure doConfig;
  protected
    function ConsultarCepInt(const aCep: string): TConsultaCep;
  public
    class function ConsultarCep(const aCep: string): TConsultaCep;

    constructor Create;
    destructor Destroy; override;
  end;

const
  BaseUrl = 'https://viacep.com.br/ws/';

implementation

{ TViaCep }

class function TViaCep.ConsultarCep(const aCep: string): TConsultaCep;
var
  ViaCep: TViaCep;
  Numero: Integer;
begin
  ViaCep  :=  TViaCep.Create;
  Result  :=  TConsultaCep.Create;
  try
    if TryStrToInt(aCep, Numero) then
      Result  :=  ViaCep.ConsultarCepInt(aCep)
    else
      raise Exception.Create('CEP inválido');
  finally
    ViaCep.Free;
  end;
end;

function TViaCep.ConsultarCepInt(const aCep: string): TConsultaCep;
var
  JsonViaCep: TJSONObject;
begin
  Result  :=  TConsultaCep.Create;
  try
    doConfig;
    FRESTClient.BaseURL :=  FRESTClient.BaseURL + '/' + aCep + '/json';
    FRestRequest.Execute;
    JsonViaCep  :=  TJSONObject.ParseJSONValue(FRestResponse.JSONText) as TJSONObject;

    if (JsonViaCep.Get('erro') <> nil) then
      raise Exception.Create('CEP inválido')
    else
    begin
      Result.Cep  :=  JsonViaCep.Get('cep').JsonValue.Value;
      Result.Logradouro  :=  JsonViaCep.Get('logradouro').JsonValue.Value;
      Result.Complemento  :=  JsonViaCep.Get('complemento').JsonValue.Value;
      Result.Bairro  :=  JsonViaCep.Get('bairro').JsonValue.Value;
      Result.Localidade  :=  JsonViaCep.Get('localidade').JsonValue.Value;
      Result.UF  :=  JsonViaCep.Get('uf').JsonValue.Value;
    end;
  except
    on e: Exception do
      raise Exception.Create('Ocorreu o seguinte erro: ' + e.Message);
  end;
end;

constructor TViaCep.Create;
begin
  doCreate;
end;

destructor TViaCep.Destroy;
begin
  FRestResponse.Free;
  FRestRequest.Free;
  FRESTClient.Free;
  inherited;
end;

procedure TViaCep.doConfig;
begin
  FRestRequest.Client :=  FRESTClient;
  FRestRequest.Response :=  FRestResponse;
  FRestRequest.Method :=  rmGET;
  FRESTClient.BaseURL :=  BaseUrl;
end;

procedure TViaCep.doCreate;
begin
  FRESTClient :=  TRESTClient.Create(nil);
  FRestRequest  :=  TRESTRequest.Create(nil);
  FRestResponse :=  TRESTResponse.Create(nil);
end;

end.
