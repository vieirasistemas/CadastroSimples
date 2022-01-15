unit untMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Mask,
  Vcl.ExtCtrls,
  IdSMTP,
  IdMessage,
  IdSSLOpenSSL,
  IdAttachmentFile,
  untCadastro;

type
  TForm1 = class(TForm)
    btnovo: TBitBtn;
    pnlPrincipal: TPanel;
    Label26: TLabel;
    Label36: TLabel;
    Label45: TLabel;
    Label31: TLabel;
    Label43: TLabel;
    Label30: TLabel;
    Label39: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ednome: TEdit;
    mecpf: TMaskEdit;
    edrg: TEdit;
    mefone1: TMaskEdit;
    Edemail: TEdit;
    mecep: TMaskEdit;
    EdEndereco: TEdit;
    EdBairro: TEdit;
    EdCidade: TEdit;
    ednr: TEdit;
    edcomplemento: TEdit;
    edestado: TEdit;
    edpais: TEdit;
    btgravar: TBitBtn;
    btbuscar: TBitBtn;
    procedure btbuscarClick(Sender: TObject);
    procedure btnovoClick(Sender: TObject);
    procedure EdEnderecoChange(Sender: TObject);
    procedure edcomplementoChange(Sender: TObject);
    procedure EdBairroChange(Sender: TObject);
    procedure EdCidadeChange(Sender: TObject);
    procedure edestadoChange(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure mecepChange(Sender: TObject);
    procedure ednomeChange(Sender: TObject);
    procedure edpaisChange(Sender: TObject);
    procedure edrgChange(Sender: TObject);
    procedure mecpfChange(Sender: TObject);
    procedure mefone1Change(Sender: TObject);
    procedure EdemailChange(Sender: TObject);
    procedure ednrChange(Sender: TObject);
    procedure mecepExit(Sender: TObject);
  private
    FCadastroSimples: TCadastroSimples;
    procedure LimparDados;
    procedure ModoEdicao(const Sim: boolean = false);
  public
    function  ValidateFields: boolean;
  end;

var
  Form1: TForm1;

implementation

uses
  untViaCep, untUteis, EnviarEmail;

{$R *.dfm}

function TForm1.ValidateFields: boolean;
var
  i: integer;
  mascara: string;
  procedure Validado(const oComponente: TCustomEdit);
  begin
    ShowMessage('O campo ' + (oComponente as TCustomEdit).HelpKeyword + ' é de preenchimento obrigatório.');
    (oComponente as TCustomEdit).SetFocus;
  end;
begin
  Result  :=  True;

  for i := 0 to ComponentCount - 1 do
    if ((Components[i] is TMaskEdit) and ((Components[i] as TMaskEdit).Tag = 0)) then
      try
        mascara :=  TMaskEdit(Components[i]).EditMask;
        TMaskEdit(Components[i]).EditMask :=  '';
        if (Trim(TMaskEdit(Components[i]).Text) = '') then
        begin
          Result  :=  False;
          Validado(TMaskEdit(Components[i]));
          Break;
        end;
      finally
        TMaskEdit(Components[i]).EditMask :=  mascara;
      end
    else
    if Components[i] is TCustomEdit then
      if ((Components[i] as TCustomEdit).Tag = 0) and (Trim((Components[i] as TCustomEdit).Text) = '') then
      begin
        Result  :=  False;
        Validado(TCustomEdit(Components[i]));
        Break;
      end;
end;

procedure TForm1.btbuscarClick(Sender: TObject);
var
  ConsultaCep: TConsultaCep;
begin
  ConsultaCep :=  TViaCep.ConsultarCep(mecep.Text);
  try
    if ConsultaCep.Cep <> '' then
    begin
      EdEndereco.Text :=  ConsultaCep.Logradouro;
      edcomplemento.Text :=  ConsultaCep.Complemento;
      EdBairro.Text :=  ConsultaCep.Bairro;
      EdCidade.Text :=  ConsultaCep.Localidade;
      edestado.Text :=  ConsultaCep.UF;
    end;
  finally
    ConsultaCep.Free;
  end;
end;

procedure TForm1.btgravarClick(Sender: TObject);
var
  EnviarEmail: TEnviarEmail;
  Destinatarios, Anexos: TStringList;
  i: integer;
  stXml, stDestinatarios: TStringList;
  corpo_e:string;
begin
  if not ValidateFields then
     exit
  else
  begin
    stXml  :=  TStringList.Create;
    stDestinatarios  :=  TStringList.Create;
    EnviarEmail :=  TEnviarEmail.Create('vieirateste2022@gmail.com', 'Vieirateste2022*#', 'smtp.gmail.com', 465);
    Destinatarios :=  TStringList.Create;
    Anexos :=  TStringList.Create;
    try
      corpo_e :=  'Nome:' + FCadastroSimples.Nome + sLineBreak +
                  'RG:'+ FcadastroSimples.Identidade + sLineBreak +
                  'CPF:'+ FcadastroSimples.CPF + sLineBreak +
                  'Telefone:'+ FcadastroSimples.Telefone + sLineBreak +
                  'E-mail:'+ FcadastroSimples.Email + sLineBreak +
                  'CEP:'+ FcadastroSimples.Cep + sLineBreak +
                  'Logradouro:'+ FcadastroSimples.Logradouro + sLineBreak +
                  'Numero:'+ FcadastroSimples.Numero + sLineBreak +
                  'Complemento:'+ FcadastroSimples.Complemento + sLineBreak +
                  'Bairro:'+ FcadastroSimples.Bairro + sLineBreak +
                  'Cidade:'+ FcadastroSimples.Cidade + sLineBreak +
                  'Estado:'+ FcadastroSimples.Estado + sLineBreak +
                  'País:'+ FcadastroSimples.Pais;
      stXml.Add(CadastroSimplesToXML(FCadastroSimples));
      stXml.SaveToFile(ExtractFilePath(ParamStr(0)) + 'cadastrosimples.xml', TEncoding.UTF8);
      stXml.Clear;

      stDestinatarios.StrictDelimiter :=  true;
      stDestinatarios.Delimiter :=  ';';
      stDestinatarios.DelimitedText :=  StringReplace(FCadastroSimples.Email, ' ', '', [rfReplaceAll]);
      stDestinatarios.DelimitedText :=  StringReplace(stDestinatarios.DelimitedText, ',', ';', [rfReplaceAll]);

      for i := 0 to stDestinatarios.Count - 1 do
        Destinatarios.Add(stDestinatarios.Strings[i]);

      Anexos.Add(ExtractFilePath(ParamStr(0)) + 'cadastrosimples.xml');
      EnviarEmail.Enviar(Destinatarios, 'Cadastro realizado', corpo_e, Anexos);

      LimparDados;
      ModoEdicao();
    finally
      stXml.Free;
      stDestinatarios.Free;
      EnviarEmail.Free;
      Destinatarios.Free;
      Anexos.Free;
      FCadastroSimples.Free;
    end;
  end;
end;

procedure TForm1.btnovoClick(Sender: TObject);
begin
  FCadastroSimples  :=  TCadastroSimples.Create;
  LimparDados;
  ModoEdicao(True);
  pnlPrincipal.Enabled  :=  true;
  ednome.SetFocus;
end;

procedure TForm1.EdBairroChange(Sender: TObject);
begin
  FCadastroSimples.Bairro :=  EdBairro.Text;
end;

procedure TForm1.EdCidadeChange(Sender: TObject);
begin
  FCadastroSimples.Cidade :=  EdCidade.Text;
end;

procedure TForm1.edcomplementoChange(Sender: TObject);
begin
  FCadastroSimples.Complemento :=  edcomplemento.Text;
end;

procedure TForm1.EdemailChange(Sender: TObject);
begin
  FCadastroSimples.Email :=  Edemail.Text;
end;

procedure TForm1.EdEnderecoChange(Sender: TObject);
begin
  FCadastroSimples.Logradouro :=  EdEndereco.Text;
end;

procedure TForm1.edestadoChange(Sender: TObject);
begin
  FCadastroSimples.Estado :=  EdEstado.Text;
end;

procedure TForm1.ednomeChange(Sender: TObject);
begin
  FCadastroSimples.Nome :=  ednome.Text;
end;

procedure TForm1.ednrChange(Sender: TObject);
begin
  FCadastroSimples.Numero :=  ednr.Text;
end;

procedure TForm1.edpaisChange(Sender: TObject);
begin
  FCadastroSimples.Pais :=  edPais.Text;
end;

procedure TForm1.edrgChange(Sender: TObject);
begin
  FCadastroSimples.Identidade :=  edrg.Text;
end;

procedure TForm1.LimparDados;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TCustomEdit then
      (Components[i] as TCustomEdit).Clear;
end;

procedure TForm1.mecepChange(Sender: TObject);
begin
  FCadastroSimples.Cep  :=  mecep.Text;
end;

procedure TForm1.mecepExit(Sender: TObject);
begin
  if mecep.Text<>'' then
     btbuscar.Click;
end;

procedure TForm1.mecpfChange(Sender: TObject);
begin
  FCadastroSimples.CPF :=  mecpf.Text;
end;

procedure TForm1.mefone1Change(Sender: TObject);
begin
  FCadastroSimples.Telefone :=  mefone1.Text;
end;

procedure TForm1.ModoEdicao(const Sim: boolean);
begin
  pnlPrincipal.Enabled  :=  Sim;
end;

end.
