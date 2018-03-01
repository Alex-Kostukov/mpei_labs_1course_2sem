unit Unit1;

// Intellectual property provided by Alexey Kostukov, group A-13-17.
// All rights should reserved, but weren't so you can use it for free.
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    EditSetA: TEdit;
    ButtonUnion: TButton;
    Label2: TLabel;
    EditSetB: TEdit;
    ButtonIntersection: TButton;
    Label3: TLabel;
    EditSetC: TEdit;
    ButtonDifference: TButton;
    Label4: TLabel;
    EditResult: TEdit;
    ButtonExpression13: TButton;
    ButtonExpression26: TButton;
    ButtonExit: TButton;
    procedure ButtonExitClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonUnionClick(Sender: TObject);
    procedure ButtonIntersectionClick(Sender: TObject);
    procedure ButtonDifferenceClick(Sender: TObject);
    procedure ButtonExpression13Click(Sender: TObject);
    procedure ButtonExpression26Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonDifferenceClick(Sender: TObject);
var
  a, b: set of char;
  str: string;
  ch: char;
begin
  a := [];
  b := [];

  for ch in EditSetA.Text do
    a := a + [ch];

  for ch in EditSetB.Text do
    b := b + [ch];

  for ch in (a - b) do
    str := str + ch;

  if str <> '' then
    EditResult.Text := str
  else
    EditResult.Text := '<пустое множество>';
end;

procedure TForm1.ButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ButtonExpression13Click(Sender: TObject);
var
  a, b, c: set of char;
  str: string;
  ch: char;
begin
  a := [];
  b := [];
  c := [];

  for ch in EditSetA.Text do
    a := a + [ch];

  for ch in EditSetB.Text do
    b := b + [ch];

  for ch in EditSetC.Text do
    c := c + [ch];

  for ch in ((a + c) - (b - c)) do
    str := str + ch;

  if str <> '' then
    EditResult.Text := str
  else
    EditResult.Text := '<пустое множество>';
end;

procedure TForm1.ButtonExpression26Click(Sender: TObject);
var
  a, b, c: set of char;
  str: string;
  ch: char;
begin
  a := [];
  b := [];
  c := [];

  for ch in EditSetA.Text do
    a := a + [ch];

  for ch in EditSetB.Text do
    b := b + [ch];

  for ch in EditSetC.Text do
    c := c + [ch];

  for ch in ((a * c) - (b * c)) do
    str := str + ch;

  if str <> '' then
    EditResult.Text := str
  else
    EditResult.Text := '<пустое множество>';
end;

procedure TForm1.ButtonIntersectionClick(Sender: TObject);
var
  a, b: set of char;
  str: string;
  ch: char;
begin
  a := [];
  b := [];

  for ch in EditSetA.Text do
    a := a + [ch];

  for ch in EditSetB.Text do
    b := b + [ch];

  for ch in (a * b) do
    str := str + ch;

  if str <> '' then
    EditResult.Text := str
  else
    EditResult.Text := '<пустое множество>';
end;

procedure TForm1.ButtonUnionClick(Sender: TObject);
var
  a, b: set of char;
  str: string;
  ch: char;
begin
  a := [];
  b := [];

  for ch in EditSetA.Text do
    a := a + [ch];

  for ch in EditSetB.Text do
    b := b + [ch];

  for ch in (a + b) do
    str := str + ch;

  if str <> '' then
    EditResult.Text := str
  else
    EditResult.Text := '<пустое множество>';
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  EditSetA.Width := Width - 390;
  EditSetB.Width := Width - 390;
  EditSetC.Width := Width - 390;
  EditResult.Width := Width - 390;

  ButtonUnion.Left := Width - 225;
  ButtonIntersection.Left := Width - 225;
  ButtonDifference.Left := Width - 225;
  ButtonExpression13.Left := Width - 225;
  ButtonExpression26.Left := Width - 225;
  ButtonExit.Left := Width - 225;
end;

end.
