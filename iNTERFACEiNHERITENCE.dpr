program iNTERFACEiNHERITENCE;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.View in 'Main.View.pas' {Form1},
  API.Interfaces in 'API\API.Interfaces.pas',
  API.Types in 'API\API.Types.pas',
  API.Model in 'API\API.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
