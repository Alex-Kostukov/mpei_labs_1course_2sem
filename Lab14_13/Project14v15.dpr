program Project14v15;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {FormDialogRoot},
  Unit3 in 'Unit3.pas' {FormDialogNodes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormDialogRoot, FormDialogRoot);
  Application.CreateForm(TFormDialogNodes, FormDialogNodes);
  Application.Run;
end.
