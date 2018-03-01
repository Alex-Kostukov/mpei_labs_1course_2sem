program ProjectLab1_2;

uses
  Vcl.Forms,
  Unit1_2 in 'Unit1_2.pas' {Form1},
  Unit3 in 'Unit3.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
