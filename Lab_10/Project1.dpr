program Project1;

uses
  Vcl.Forms,
  UnitProgram in 'UnitProgram.pas' {Form1},
  UnitSort in 'UnitSort.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
