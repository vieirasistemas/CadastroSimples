program CadastroSimples;

uses
  Vcl.Forms,
  untMain in 'src\view\untMain.pas' {Form1},
  untCadastro in 'src\model\untCadastro.pas',
  untViaCep in 'src\controller\untViaCep.pas',
  untUteis in 'src\controller\untUteis.pas',
  EnviarEmail in 'src\controller\EnviarEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
