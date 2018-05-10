unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.ComCtrls,
  Vcl.StdCtrls, UnitType, UnitFunc;

type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    NTask: TMenuItem;
    N2: TMenuItem;
    NLoad: TMenuItem;
    NSave: TMenuItem;
    N5: TMenuItem;
    NOne: TMenuItem;
    NTwo: TMenuItem;
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
    procedure NExitClick(Sender: TObject);
    procedure EditNChange(Sender: TObject);
    procedure NTwoClick(Sender: TObject);
    procedure NClickSolve13_1(Sender: TObject);
    procedure NTask13Click(Sender: TObject);
    procedure NLoadClick(Sender: TObject);
    procedure NSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure InputMassiv(var n: integer; var a: TMas);
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

procedure TForm1.NExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.NLoadClick(Sender: TObject);
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

procedure TForm1.NClickSolve13_1(Sender: TObject);
var
  a: TMas;
  res: boolean;
  n: integer;
  x: integer;
begin
  InputMassiv(n, a);

  try
    x := StrToInt(EditK.Text);
  except
    ShowMessage('Введите заданное число');
    EditK.SetFocus;
    Exit;
  end;

  res := Checking(a, 0, n - 1, x);
  if res then
    EditOne.Text := 'Есть'
  else
    EditOne.Text := 'Нет';

end;

procedure TForm1.NSaveClick(Sender: TObject);
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

procedure TForm1.NTask13Click(Sender: TObject);
var
  s, s1, s2: string;
begin
  s := 'Разработать две рекурсивные функции для обработки одномерного динамического массива. В первой функции реализовать линейную рекурсию, во второй – каскадную.';
  s1 := '1.  Проверить, что в одномерном массиве есть хотя бы один элемент, модуль которого попадает в заданный диапазон.';
  s2 := '2.  Для заданного одномерного массива d из n элементов найти количество элементов массива, для которых выполняется условие di > i.';
  Application.MessageBox(PChar(s + #13#10 + s1 + #13#10 + s2), 'Условие',
    MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.NTwoClick(Sender: TObject);
var
  a: TMas;
  s: integer;
  n: integer;
  x: integer;
begin
  InputMassiv(n, a);

  x := StrToInt(EditK.Text);

  s := Sum(a, 0, n - 1, x);
  EditTwo.Text := IntToStr(s);
end;

end.
