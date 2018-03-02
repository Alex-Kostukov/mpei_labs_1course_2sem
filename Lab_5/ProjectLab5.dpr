program ProjectLab5;

uses
  Vcl.Forms,
  Unit7 in 'Unit7.pas',
  Unit9 in 'Unit9.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
