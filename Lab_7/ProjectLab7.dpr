program ProjectLab7;

uses
  Vcl.Forms,
  Unit12 in 'Unit12.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
