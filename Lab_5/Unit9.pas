unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Unit7;

type
  TForm9 = class(TForm)
    EditString: TLabeledEdit;
    EditSubString: TLabeledEdit;
    CheckBoxRegister: TCheckBox;
    ButtonSearch: TButton;
    EditResult: TEdit;
    Label1: TLabel;
    procedure FormResize(Sender: TObject);
    procedure CheckInput(Sender: TObject);
    procedure EditStringChange(Sender: TObject);
    procedure EditSubStringChange(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.ButtonSearchClick(Sender: TObject);
var
  str, substr: string;
  n: integer;
begin
  str := EditString.Text;
  substr := EditSubString.Text;

  if CheckBoxRegister.Checked then
  begin
    str := LowerCase(str);
    substr := LowerCase(substr);
  end;

  n := Search(str, substr);

  if n <> 0 then
  begin
    EditResult.Text := 'Искомая подстрока ' + '<' + substr +
      '> входит в исходную строку, начиная с символа ' + n.ToString;
    if CheckBoxRegister.Checked then
      EditResult.Text := EditResult.Text +
        ', при использовании регистро-независимого поиска';
  end
  else
    EditResult.Text := 'Искомая подстрока ' + '<' + substr +
      '> не входит в исходную строку';
end;

procedure TForm9.CheckInput(Sender: TObject);
begin
  ButtonSearch.enabled := (EditString.Text <> '') and
    (EditSubString.Text <> '');
end;

procedure TForm9.EditStringChange(Sender: TObject);
begin
  CheckInput(Sender);
end;

procedure TForm9.EditSubStringChange(Sender: TObject);
begin
  CheckInput(Sender);
end;

procedure TForm9.FormResize(Sender: TObject);
begin
  EditString.Width := Width - 55;
  EditSubString.Width := Width - 55;
  EditResult.Width := Width - 55;

  ButtonSearch.Width := Width - 55;
end;

end.
