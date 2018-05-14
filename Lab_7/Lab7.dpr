program Lab7;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnitType in 'UnitType.pas',
  UnitFunc in 'UnitFunc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Рекурсия';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
