program ProjectLab1_3;

uses
  Vcl.Forms,
  Unit1_3 in 'Unit1_3.pas' {Form1},
  Unit4 in 'Unit4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
