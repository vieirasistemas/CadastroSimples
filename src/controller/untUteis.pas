unit untUteis;

interface

uses
  untCadastro;

  function CadastroSimplesToXML(const oCadastroSimples: TCadastroSimples): string;

implementation

function TagValor(const aTag: string; const oValor: string): string;
begin
  Result  :=  '<'+ aTag +'>' + oValor + '</'+ aTag +'>'
end;

function CadastroSimplesToXML(const oCadastroSimples: TCadastroSimples): string;
begin
  Result  :=  '<TCadastroSimples>' + sLineBreak +
                TagValor('Nome', oCadastroSimples.Nome) + sLineBreak +
                TagValor('Identidade', oCadastroSimples.Identidade) + sLineBreak +
                TagValor('CPF', oCadastroSimples.CPF) + sLineBreak +
                TagValor('Telefone', oCadastroSimples.Telefone) + sLineBreak +
                TagValor('Email', oCadastroSimples.Email) + sLineBreak +
                TagValor('Cep', oCadastroSimples.Cep) + sLineBreak +
                TagValor('Logradouro', oCadastroSimples.Logradouro) + sLineBreak +
                TagValor('Numero', oCadastroSimples.Numero) + sLineBreak +
                TagValor('Complemento', oCadastroSimples.Complemento) + sLineBreak +
                TagValor('Bairro', oCadastroSimples.Bairro) + sLineBreak +
                TagValor('Cidade', oCadastroSimples.Cidade) + sLineBreak +
                TagValor('Estado', oCadastroSimples.Estado) + sLineBreak +
                TagValor('Pais', oCadastroSimples.Pais) + sLineBreak +
              '</TCadastroSimples>';
end;

end.
