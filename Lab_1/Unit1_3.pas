unit Unit1_3;

// Intellectual property provided by Alexey Kostukov, group A-13-17.
// All rights should reserved, but weren't so you can use it for free.
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit4;

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
    procedure ShowResult(c: TCharSet);
    procedure ButtonExpression13Click(Sender: TObject);
    procedure ButtonExpression26Click(Sender: TObject);
    function GetElementsFromEdit(EditName: TEdit): TCharSet;
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ShowResult(c: TCharSet);
var
  i: integer;
  str: string;
begin

  for i := 0 to 255 do
    if c[i] = true then
      str := str + chr(i);

  if str <> '' then
    EditResult.Text := str
  else
    EditResult.Text := '<пустое множество>';
end;

function TForm1.GetElementsFromEdit(EditName: TEdit): TCharSet;
var
  a: TCharSet;
  ch: char;
begin
  a := SetArrayFalse(a);
  for ch in EditName.Text do
    AddElementToSet(ch, a);

  GetElementsFromEdit := a;
end;

procedure TForm1.ButtonDifferenceClick(Sender: TObject);
var
  a, b, res: TCharSet;
begin
  a := GetElementsFromEdit(EditSetA);
  b := GetElementsFromEdit(EditSetB);
  res := GetDifferenceElements(a, b);
  ShowResult(res);
end;

procedure TForm1.ButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ButtonExpression13Click(Sender: TObject);
var
  a, b, c, res: TCharSet;
begin
  a := GetElementsFromEdit(EditSetA);
  b := GetElementsFromEdit(EditSetB);
  c := GetElementsFromEdit(EditSetC);
  res := GetDifferenceElements(GetUnionElements(a, c),
    GetDifferenceElements(b, c));
  ShowResult(res);
end;

procedure TForm1.ButtonExpression26Click(Sender: TObject);
var
  a, b, c, res: TCharSet;
begin
  a := GetElementsFromEdit(EditSetA);
  b := GetElementsFromEdit(EditSetB);
  c := GetElementsFromEdit(EditSetC);
  res := GetDifferenceElements(GetIntersectionElements(a, c),
    GetIntersectionElements(b, c));
  ShowResult(res);
end;

procedure TForm1.ButtonIntersectionClick(Sender: TObject);
var
  a, b, res: TCharSet;
begin
  a := GetElementsFromEdit(EditSetA);
  b := GetElementsFromEdit(EditSetB);
  res := GetIntersectionElements(a, b);
  ShowResult(res);
end;

procedure TForm1.ButtonUnionClick(Sender: TObject);
var
  a, b, res: TCharSet;
begin
  a := GetElementsFromEdit(EditSetA);
  b := GetElementsFromEdit(EditSetB);
  res := GetUnionElements(a, b);
  ShowResult(res);
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
