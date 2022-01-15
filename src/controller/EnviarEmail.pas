unit EnviarEmail;

interface

uses
  System.Classes,
  System.SysUtils,
  IdSMTP,
  IdMessage,
  IdIOHandler,
  IdSSLOpenSSL,
  IdExplicitTLSClientServerBase,
  IdAttachmentFile;

type
  TEnviarEmail = class
  private
    FidMessage: TIdMessage;
    FidSMTP: TIdSMTP;
    FidSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    procedure Configurar(
      const oUsuario: string;
      const aSenha: string;
      const oServidor: string;
      const aPorta: integer);
    procedure Enviar(
      const Destinatarios: TStringList;
      const Assunto: string;
      const Mensagem: string;
      const Anexos: TStringList);

    constructor Create; overload;
    constructor Create(
      const oUsuario: string;
      const aSenha: string;
      const oServidor: string;
      const aPorta: integer); overload;

    destructor Destroy; override;
  end;

implementation

{ TEnviarEmail }

procedure TEnviarEmail.Configurar(const oUsuario, aSenha, oServidor: string; const aPorta: integer);
begin
  FidSMTP.IOHandler :=  FidSSLIOHandlerSocketOpenSSL;
  FidSMTP.AuthType  :=  TIdSMTPAuthenticationType.satDefault;
  FidSMTP.Host  :=  oServidor;
  FidSMTP.Port  :=  aPorta;
  FidSMTP.Username  :=  oUsuario;
  FidSMTP.Password  :=  aSenha;
  FidSMTP.UseTLS  :=  TIdUseTLS.utUseImplicitTLS;

  FidSSLIOHandlerSocketOpenSSL.Destination  :=  oServidor + ':' + aPorta.ToString;
  FidSSLIOHandlerSocketOpenSSL.Host :=  oServidor;
  FidSSLIOHandlerSocketOpenSSL.Port :=  aPorta;
  FidSSLIOHandlerSocketOpenSSL.SSLOptions.Mode := sslmClient;
  FidSSLIOHandlerSocketOpenSSL.SSLOptions.VerifyDepth := 0;
  FidSSLIOHandlerSocketOpenSSL.SSLOptions.VerifyMode := [];
  FidSSLIOHandlerSocketOpenSSL.SSLOptions.Method  :=  sslvSSLv23;
end;

constructor TEnviarEmail.Create;
begin
  FidMessage  :=  TIdMessage.Create(nil);
  FidSMTP := TIdSMTP.Create(nil);
  FidSSLIOHandlerSocketOpenSSL :=  TIdSSLIOHandlerSocketOpenSSL.Create(nil);
end;

constructor TEnviarEmail.Create(const oUsuario, aSenha, oServidor: string; const aPorta: integer);
begin
  Create;
  Configurar(oUsuario, aSenha, oServidor, aPorta);
end;

destructor TEnviarEmail.Destroy;
begin
  FidMessage.Free;
  FidSMTP.Free;
  FidSSLIOHandlerSocketOpenSSL.Free;
  inherited;
end;

procedure TEnviarEmail.Enviar(const Destinatarios: TStringList; const Assunto, Mensagem: string; const Anexos: TStringList);
var
  i: integer;
begin
  FidMessage.From.Text := FidSMTP.Username;
  FidMessage.Subject := Assunto;
  FidMessage.ReplyTo.EMailAddresses := FIdMessage.From.Address;

  for i := 0 to Destinatarios.Count - 1 do
    FidMessage.Recipients.Add.Text  :=  Destinatarios.Strings[i];

  for i := 0 to Anexos.Count - 1 do
    TIdAttachmentFile.Create(FidMessage.MessageParts, Anexos.Strings[i]);

  FidMessage.Body.Text  :=  Mensagem;

  FidSMTP.Connect;
  try
    if (FidSMTP.Authenticate) then
      FidSMTP.Send(FidMessage);
  finally
    FidSMTP.Disconnect;
  end;
end;

end.
