program ProjectLab4;

uses
  Vcl.Forms,
  Unit6 in 'Unit6.pas' {Form6},
  Unit16 in 'Unit16.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
