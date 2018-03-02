unit Unit5;

// Intellectual property provided by Alexey Kostukov, group A-13-17.
// All rights should reserved, but weren't so you can use it for free.
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Unit8;

type
  TForm5 = class(TForm)
    EditInputString: TLabeledEdit;
    EditInputSymbol: TLabeledEdit;
    ButtonVariant13: TButton;
    ButtonVariant26: TButton;
    Label1: TLabel;
    EditResult: TEdit;
    ButtonSolve: TButton;
    EditLength: TLabeledEdit;
    procedure EditInputSymbolChange(Sender: TObject);
    procedure CheckInput(Sender: TObject);
    procedure EditInputStringChange(Sender: TObject);
    procedure EditLengthChange(Sender: TObject);
    procedure ButtonSolveClick(Sender: TObject);
    procedure ButtonVariant13Click(Sender: TObject);
    procedure ButtonVariant26Click(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.ButtonVariant13Click(Sender: TObject);
var
  d: string;
begin
  d := EditInputString.Text;

  DeleteAllOccurencesOfSpace(d);
  DeleteWordsVariant13(d);
  DeleteAllOccurencesOfSpace(d);

  EditResult.Text := d;
end;

procedure TForm5.ButtonVariant26Click(Sender: TObject);
var
  d: string;
  n: integer;
begin
  d := EditInputString.Text;
  n := StrToInt(EditLength.Text);

  DeleteAllOccurencesOfSpace(d);
  DeleteWordsVariant26(n, d);
  DeleteAllOccurencesOfSpace(d);

  EditResult.Text := d;
end;

procedure TForm5.CheckInput(Sender: TObject);
begin
  ButtonSolve.Enabled := (EditInputSymbol.Text <> '') and
    (EditInputString.Text <> '');
  ButtonVariant13.Enabled := (EditInputString.Text <> '');
  ButtonVariant26.Enabled := (EditInputString.Text <> '') and
    (EditLength.Text <> '');
end;

procedure TForm5.ButtonSolveClick(Sender: TObject);
var
  d: string;
  c: char;
begin
  d := EditInputString.Text;
  c := EditInputSymbol.Text[1];

  DeleteAllOccurencesOfSpace(d);
  DeleteUndueWords(c, d);
  DeleteAllOccurencesOfSpace(d);

  EditResult.Text := d;
end;

procedure TForm5.EditInputStringChange(Sender: TObject);
begin
  CheckInput(Sender);
end;

procedure TForm5.EditInputSymbolChange(Sender: TObject);
begin
  CheckInput(Sender);
end;

procedure TForm5.EditLengthChange(Sender: TObject);
begin
  CheckInput(Sender);
end;

procedure TForm5.FormResize(Sender: TObject);
begin
  EditInputString.Width := Width - 65;
  EditInputSymbol.Width := Width - 65;
  EditLength.Left := Width - 245;
  EditResult.Width := Width - 65;

  ButtonVariant13.Width := Width - 290;
  ButtonVariant26.Width := Width - 290;

  ButtonSolve.Width := Width - 65;
end;

end.
