program Lab9;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  Types in 'Types.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
