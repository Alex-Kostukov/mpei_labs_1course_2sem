program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {FormOneDirectionList},
  Unit3 in 'Unit3.pas' {FormTwoDirectionsList},
  OneDirectionList in 'OneDirectionList.pas',
  TwoDirectionList in 'TwoDirectionList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormOneDirectionList, FormOneDirectionList);
  Application.CreateForm(TFormTwoDirectionsList, FormTwoDirectionsList);
  Application.Run;
end.
