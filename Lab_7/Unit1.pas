unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.ComCtrls,
  Vcl.StdCtrls, UnitType, UnitFunc;

type
  TForm1 = class(TFORM)
    MainMenu: TMainMenu;
    NTask: TMenuItem;
    N2: TMenuItem;
    NLoad: TMenuItem;
    NSave: TMenuItem;
    N5: TMenuItem;
    NExit: TMenuItem;
    Label1: TLabel;
    EditN: TEdit;
    UpDownN: TUpDown;
    EditRange1: TEdit;
    Label2: TLabel;
    StringGridMassiv: TStringGrid;
    Label4: TLabel;
    EditOne: TEdit;
    Label5: TLabel;
    EditTwo: TEdit;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    EditRange2: TEdit;
    N131: TMenuItem;
    N261: TMenuItem;
    Label3: TLabel;
    EditThree: TEdit;
    EditFour: TEdit;
    Label6: TLabel;
    procedure ExitClick(Sender: TObject);
    procedure EditNChange(Sender: TObject);
    // procedure NTwoClick(Sender: TObject);
    procedure ClickSolve13_1(a: TMas; n: integer; range: ty_range);
    procedure ClickSolve26_1(a: TMas; n: integer; range: ty_range);
    procedure Task13Click(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure Solve(Sender: TObject);
    procedure Task26Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure InputMassive(var n: integer; var a: TMas);
var
  i: integer;
begin
  n := Form1.UpDownN.Position;
  SetLength(a, n);
  for i := 0 to n - 1 do
    a[i] := StrToInt(Form1.StringGridMassiv.Cells[i + 1, 1]);
end;

procedure TForm1.EditNChange(Sender: TObject);
var
  i: integer;
begin
  StringGridMassiv.ColCount := UpDownN.Position + 1;
  for i := 1 to UpDownN.Position do
    StringGridMassiv.Cells[i, 0] := IntToStr(i);
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.LoadClick(Sender: TObject);
var
  a: TMas;
  n: integer;
  f: TextFile;
  i: integer;
begin
  OpenDialog.InitialDir := GetCurrentDir;
  if OpenDialog.Execute then
  begin
    try
      AssignFile(f, OpenDialog.FileName);
      reset(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для чтения',
        'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
    try
      readln(f, n);
      SetLength(a, n);
      for i := 0 to n - 1 do
        read(f, a[i]);
      CloseFile(f);
    except
      Application.MessageBox('Файл содержит неверные данные', 'Ошибка',
        MB_OK or MB_ICONWARNING);
      CloseFile(f);
      Exit;
    end;
    EditN.Text := IntToStr(n);
    for i := 0 to n - 1 do
      StringGridMassiv.Cells[i + 1, 1] := FloatToStr(a[i]);
  end;
end;

procedure TForm1.Task26Click(Sender: TObject);
var
  s, s1, s2: string;
begin
  s := 'Разработать две рекурсивные функции для обработки одномерного динамического массива. В первой функции реализовать линейную рекурсию, во второй – каскадную.';
  s1 := '1.  Проверить, что в одномерном массиве нет элементов, не попадающих в заданный диапазон.';
  s2 := '2.  Для заданного одномерного массива a из n элементов найти сумму элементов массива, для которых выполняется условие sqrt(abs(a[i])) < i.';
  Application.MessageBox(PChar(s + #13#10 + s1 + #13#10 + s2), 'Условие',
    MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.ClickSolve13_1(a: TMas; n: integer; range: ty_range);
var
  res: boolean;
begin

  res := CheckingTask13(a, 0, n, range);
  if res then
    EditOne.Text := 'True'
  else
    EditOne.Text := 'False';

end;

procedure TForm1.SaveClick(Sender: TObject);
var
  a: TMas;
  n: integer;
  f: TextFile;
  i: integer;
begin
  try
    n := UpDownN.Position;
    SetLength(a, n);
    for i := 0 to n - 1 do
      a[i] := StrToInt(StringGridMassiv.Cells[i + 1, 1]);
  except
    Application.MessageBox('Введите элементы исходного массива', 'Ошибка',
      MB_OK or MB_ICONWARNING);
    Exit;
  end;
  SaveDialog.InitialDir := GetCurrentDir;
  if SaveDialog.Execute then
  begin
    try
      AssignFile(f, SaveDialog.FileName);
      rewrite(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для записи',
        'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
    writeln(f, n);
    for i := 0 to n - 1 do
      write(f, a[i]:8, ' ');
    CloseFile(f);
  end;
end;

procedure TForm1.Task13Click(Sender: TObject);
var
  s, s1, s2: string;
begin
  s := 'Разработать две рекурсивные функции для обработки одномерного динамического массива. В первой функции реализовать линейную рекурсию, во второй – каскадную.';
  s1 := '1.  Проверить, что в одномерном массиве есть хотя бы один элемент, модуль которого попадает в заданный диапазон.';
  s2 := '2.  Для заданного одномерного массива d из n элементов найти количество элементов массива, для которых выполняется условие di > i.';
  Application.MessageBox(PChar(s + #13#10 + s1 + #13#10 + s2), 'Условие',
    MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.Solve(Sender: TObject);
var
  a: TMas;
  s: integer;
  n: integer;
  range: ty_range;
begin

  InputMassive(n, a);

  try
    range.value1 := StrToInt(EditRange1.Text);
    range.value2 := StrToInt(EditRange2.Text);
    if range.value1 > range.value2 then
    begin
      ShowMessage('Конечное значение диапазона должно быть больше начального');
      EditRange1.SetFocus;
    end;
  except
    ShowMessage('Введите заданное число');
    EditRange1.SetFocus;
    Exit;
  end;
  ClickSolve13_1(a, n, range);
  EditTwo.Text := IntToStr(SolveTask13_2(a, 0, n - 1));
  ClickSolve26_1(a, n, range);
  EditFour.Text := IntToStr(SolveTask26_2(a, 0, n - 1));
end;

procedure TForm1.ClickSolve26_1(a: TMas; n: integer; range: ty_range);
var
  res: boolean;
begin

  res := CheckingTask26(a, 0, n, range);
  if res then
    EditThree.Text := 'True'
  else
    EditThree.Text := 'False';
end;
// procedure TForm1.NTwoClick(Sender: TObject);
// var
// a: TMas;
// s: integer;
// n: integer;
// x: integer;
// begin
// InputMassiv(n, a);
//
// x := StrToInt(EditK.Text);
//
// s := Sum(a, 0, n - 1, x);
// EditTwo.Text := IntToStr(s);
// end;

end.
