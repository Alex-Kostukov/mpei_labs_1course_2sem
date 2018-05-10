unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDialogForm = class(TForm)
    EditCount: TEdit;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    procedure EditCountChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DialogForm: TDialogForm;

implementation

{$R *.dfm}

procedure TDialogForm.EditCountChange(Sender: TObject);
var
  count: integer;
begin
  try
    count := StrToInt(EditCount.Text);
    if count > 0 then
      ButtonOK.Enabled := true
    else
      ButtonOK.Enabled := false;
  except
    ButtonOK.Enabled := false;
  end;
end;

end.
