program ProjectLab6;

uses
  Vcl.Forms,
  Unit10 in 'Unit10.pas' {Form10} ,
  Unit1 in 'Unit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm10, Form10);
  Application.Run;

end.
