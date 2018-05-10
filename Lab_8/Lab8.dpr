program Lab8;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnitType in 'UnitType.pas',
  Unit2 in 'Unit2.pas' {DialogForm},
  UnitOperations in 'UnitOperations.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Типизированный файл';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDialogForm, DialogForm);
  Application.Run;
end.
