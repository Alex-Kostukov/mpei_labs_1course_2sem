unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.Samples.Calendar, Vcl.ComCtrls, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.AppAnalytics, Vcl.Samples.Gauges, Unit3;

type
  func = function(x: real): real;

  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    EditXs: TEdit;
    EditXe: TEdit;
    EditYs: TEdit;
    EditYe: TEdit;
    EditBorderLeft: TEdit;
    EditBorderRight: TEdit;
    EditItN: TEdit;
    EditN: TEdit;
    EditNn: TEdit;
    EditIt: TEdit;
    EditSecN: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroupFunction: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditEPS: TEdit;
    EditFactor: TEdit;
    ButtonGraph: TButton;
    Button2: TButton;
    Button3: TButton;
    Image: TImage;
    EditSec: TEdit;
    procedure ButtonGraphClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

var
  origin, size: TPoint;
  graph: boolean = false;

procedure TForm2.FormResize(Sender: TObject);
begin
  // GroupBoxRoot.Top := Height - 173;
  // GroupBoxResult.Top := Height - 173;
  Image.Width := Width - 32;
  Image.Height := Height - 322;
  origin.x := 30;
  origin.Y := Image.Height - 20;
  size.x := Image.Width - 60;
  size.Y := Image.Height - 40;
  { ���� ������ ��� ���������, ���� ��� ������������ }
  if graph then
    ButtonGraphClick(Sender);
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  x1, x2, e, factor, resX, resN: real;
  f: func;
begin
  x1 := STRTOFLOAT(EditBorderLeft.Text);
  x2 := STRTOFLOAT(EditBorderRight.Text);
  e := STRTOFLOAT(EditEPS.Text);
  factor := STRTOFLOAT(EditFactor.Text);

  Case RadioGroupFunction.ItemIndex of
    0:
      f := f26;
    1:
      f := f5;
    2:
      f := f13;
    3:
      f := f18;
  End;
  SolutionSec(x1, x2, e, f, resX, resN);
  EditSec.Text := resX;
  EditSecN.Text := resN;

  SolutionIt(x1, factor, e, f, resX, resN);
  EditIt.Text := resX;
  EditItN.Text := resN;

  SolutionN(x1, factor, e, f, resX, resN);
  EditN.Text := resX;
  EditNn.Text := resN;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.ButtonGraphClick(Sender: TObject);
var
  xs, xe, ys, ye, x, Y: real;
  f: func;
  hx, hy, i: integer;

begin

  try
    xs := STRTOFLOAT(EditXs.Text);
  except
    ShowMessage('������� ��������� �������� �� ��� X');
    EditXs.SetFocus;
    Exit;
  end;
  try
    xe := STRTOFLOAT(EditXe.Text);
  except
    ShowMessage('������� �������� �������� �� ��� X');
    EditXe.SetFocus;
    Exit;
  end;
  if xs >= xe then
  begin
    ShowMessage('��������� �������� �� ��� X ������ ���� ������ ���������');
    EditXs.SetFocus;
    Exit;
  end;
  try
    ys := STRTOFLOAT(EditYs.Text);
  except
    ShowMessage('������� ��������� �������� �� ��� Y');
    EditYs.SetFocus;
    Exit;
  end;
  try
    ye := STRTOFLOAT(EditYe.Text);
  except
    ShowMessage('������� �������� �������� �� ��� Y');
    EditYe.SetFocus;
    Exit;
  end;
  if ys >= ye then
  begin
    ShowMessage('��������� �������� �� ��� Y ������ ���� ������ ���������');
    EditYs.SetFocus;
    Exit;
  end;
  if RadioGroupFunction.ItemIndex = -1 then
  begin
    ShowMessage('�������� �������');
    RadioGroupFunction.SetFocus;
    Exit;
  end;
  Case RadioGroupFunction.ItemIndex of
    0:
      f := f26;
    1:
      f := f5;
    2:
      f := f13;
    3:
      f := f18;
  End;
  graph := true;
  Image.canvas.Pen.Color := Image.canvas.Brush.Color;
  Image.canvas.Rectangle(0, 0, Image.Width, Image.Height);
  Image.canvas.Pen.Color := clGray;
  Image.canvas.Pen.Style := psDash;
  for i := 1 to 10 do
  begin
    Image.canvas.MoveTo(origin.x + size.x div 10 * i, origin.Y + 5);
    Image.canvas.LineTo(origin.x + size.x div 10 * i, origin.Y - size.Y);
    Image.canvas.MoveTo(origin.x - 5, origin.Y - size.Y div 10 * i);
    Image.canvas.LineTo(origin.x + size.x, origin.Y - size.Y div 10 * i);
  end;
  Image.canvas.Pen.Color := clBlack;
  Image.canvas.Pen.Style := psSolid;
  Image.canvas.MoveTo(origin.x, origin.Y + 5);
  Image.canvas.LineTo(origin.x, origin.Y - size.Y);
  Image.canvas.MoveTo(origin.x - 5, origin.Y);
  Image.canvas.LineTo(origin.x + size.x, origin.Y);
  x := xs;
  Y := ys;
  for i := 0 to 10 do
  begin
    Image.canvas.TextOut(origin.x + size.x div 10 * i - 5, origin.Y + 7,
      FloatToStrF(x, ffFixed, 2, 2));
    Image.canvas.TextOut(origin.x - 27, origin.Y - size.Y div 10 * i - 5,
      FloatToStrF(Y, ffFixed, 2, 2));
    x := x + (xe - xs) / 10;
    Y := Y + (ye - ys) / 10;
  end;
  hx := trunc(size.x / (xe - xs));
  hy := trunc(size.Y / (ys - ye));
  Image.canvas.Pen.Color := clRed;
  Image.canvas.MoveTo(origin.x, trunc(origin.Y + (f(xs) - ys) * hy));
  x := xs + (xe - xs) / 1000;
  for i := 1 to 1000 do
  begin
    Y := f(x);
    Image.canvas.LineTo(trunc(origin.x + (x - xs) * hx),
      trunc(origin.Y + (Y - ys) * hy));
    x := x + (xe - xs) / 1000;
  end;
end;

end.
