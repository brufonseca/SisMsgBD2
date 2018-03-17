program Project1;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {TELAPrincipal},
  UEdicao in 'UEdicao.pas' {TELAEdicao},
  USobre in 'USobre.pas' {TELASobre},
  SQLite3 in '..\..\APP\SQLite3.pas',
  SQLiteTable3 in '..\..\APP\SQLiteTable3.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTELAPrincipal, TELAPrincipal);
  Application.CreateForm(TTELASobre, TELASobre);
  Application.CreateForm(TTELAEdicao, TELAEdicao);
  Application.Run;
end.
