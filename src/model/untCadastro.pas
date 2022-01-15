unit untCadastro;

interface

type
  TConsultaCep = class(TObject)
  private
    FLogradouro: string;
    FBairro: string;
    FCep: string;
    FLocalidade: string;
    FComplemento: string;
    FUF: string;
    FPais: string;
  public
    property Cep: string read FCep write FCep;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Localidade: string read FLocalidade write FLocalidade;
    property UF: string read FUF write FUF;
    property Pais: string read FPais write FPais;

    constructor Create;
  end;

  TCadastroSimples = class(TObject)
  private
    FLogradouro: string;
    FBairro: string;
    FEmail: string;
    FCPF: string;
    FCep: string;
    FNumero: string;
    FIdentidade: string;
    FComplemento: string;
    FNome: string;
    FCidade: string;
    FPais: string;
    FEstado: string;
    FTelefone: string;
  public
    property Nome: string read FNome write FNome;
    property Identidade: string read FIdentidade write FIdentidade;
    property CPF: string read FCPF write FCPF;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
    property Cep: string read FCep write FCep;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;
    property Pais: string read FPais write FPais;

    constructor Create;
  end;

implementation

{ TCadastroSimples }

constructor TCadastroSimples.Create;
begin
  FLogradouro := '';
  FBairro := '';
  FEmail := '';
  FCPF := '';
  FCep := '';
  FNumero := '';
  FIdentidade := '';
  FComplemento := '';
  FNome := '';
  FCidade := '';
  FPais := '';
  FEstado := '';
  FTelefone := '';
end;

{ TConsultaCep }

constructor TConsultaCep.Create;
begin
  FLogradouro := '';
  FBairro := '';
  FCep := '';
  FUF := '';
  FComplemento := '';
  FLocalidade := '';
  FPais :=  '';
end;

end.
