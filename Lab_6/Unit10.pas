unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ComCtrls, Unit1, Vcl.ExtCtrls;

type
  TForm10 = class(TForm)
    StringGridMatrix: TStringGrid;
    StringGridResult: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditK: TEdit;
    EditN: TEdit;
    EditM: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    UpDownN: TUpDown;
    UpDownM: TUpDown;
    N5: TMenuItem;
    N6: TMenuItem;
    N13: TMenuItem;
    N26: TMenuItem;
    LabeledEditD: TLabeledEdit;
    N131: TMenuItem;
    N261: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N12: TMenuItem;
    N22: TMenuItem;
    procedure EditNChange(Sender: TObject);
    procedure EditMChange(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    function GetInputCol(): matrix;
    function GetInputRow(): matrix;
    procedure Task1_13(Sender: TObject);
    procedure Task2_13(Sender: TObject);
    procedure Task1_26(Sender: TObject);
    procedure Task2_26(Sender: TObject);
    procedure ShowResultK(k: integer);
    procedure ShowResultVector(a: vector);
    procedure ShowResultVar26(a: matrix);
    procedure LabeledEditDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.ShowResultVar26(a: matrix);
var
  i, j: integer;
begin
  StringGridResult.RowCount := length(a) + 1;
  StringGridResult.ColCount := length(a[0]) + 1;
  for i := 0 to High(a) do
  begin
    for j := 0 to High(a[i]) do
    begin
      StringGridResult.Cells[j + 1, 0] := FloatToStr(j + 1);
      StringGridResult.Cells[j + 1, i + 1] := FloatToStr(a[i, j]);
    end;
    StringGridResult.Cells[0, i + 1] := FloatToStr(i + 1);
  end;
end;

procedure TForm10.Task1_26(Sender: TObject);
var
  ArrayA: matrix;
  vectorA: vector;
begin
  ArrayA := GetInputRow();
  SolveVar26Task1(ArrayA);
  ShowResultVar26(ArrayA);
end;

procedure TForm10.Task2_26(Sender: TObject);
var
  inputNum, i: integer;
  inputArray: matrix;
begin
  inputArray := GetInputRow();
  inputNum := StrToInt(LabeledEditD.text);
  for i := high(inputArray) downto 0 do
    if IsRowDivisible(inputArray[i], inputNum) then
    begin
      ShowResultK(i + 1);
      exit;
    end;
  ShowResultK(-1);
end;

procedure TForm10.Task2_13(Sender: TObject);
var
  inputNum: integer;
  inputArray: matrix;
begin
  inputArray := GetInputRow();
  inputNum := StrToInt(LabeledEditD.text);
  ShowResultK(GetNumTask2_13(inputArray, inputNum));
end;

procedure TForm10.ShowResultVector(a: vector);
var
  i: integer;
begin
  StringGridResult.RowCount := length(a) + 1;
  StringGridResult.ColWidths[1] := 130;
  StringGridResult.Cells[1, 0] := 'Произведение';
  StringGridResult.Cells[0, 0] := 'Столбец';
  for i := 0 to High(a) do
  begin
    StringGridResult.Cells[0, i + 1] := FloatToStr(i + 1);
    StringGridResult.Cells[1, i + 1] := FloatToStr(a[i]);
  end;

end;

procedure TForm10.ShowResultK(k: integer);
begin
  EditK.text := intToStr(k);
end;

function TForm10.GetInputRow(): matrix;
var
  i, j: integer;
  resultArray: matrix;
begin
  SetLength(resultArray, StrToInt(EditM.text), StrToInt(EditN.text));
  for i := 0 to high(resultArray) do
    for j := 0 to high(resultArray[i]) do
      if StringGridMatrix.Cells[j + 1, i + 1] <> '' then
        try
          resultArray[i, j] := StrToInt(StringGridMatrix.Cells[j + 1, i + 1]);
        except
          On EConvertError do
            Application.MessageBox
              ('В ячейках матрицы разрешено использовать только числа.',
              'Некорректные заданные значения', MB_OK or MB_ICONWARNING);
        end;
  result := resultArray;
end;

function TForm10.GetInputCol(): matrix;
var
  i, j: integer;
  resultArray: matrix;
begin
  SetLength(resultArray, StrToInt(EditN.text), StrToInt(EditM.text));
  for i := 0 to high(resultArray) do
    for j := 0 to high(resultArray[i]) do
      if StringGridMatrix.Cells[i + 1, j + 1] <> '' then
        try
          resultArray[i, j] := StrToInt(StringGridMatrix.Cells[i + 1, j + 1]);
        except
          On EConvertError do
            Application.MessageBox
              ('В ячейках матрицы разрешено использовать только числа.',
              'Некорректные заданные значения', MB_OK or MB_ICONWARNING);
        end;
  result := resultArray;
end;

procedure TForm10.LabeledEditDChange(Sender: TObject);
begin
  N21.Enabled := (LabeledEditD.text <> '');
  N22.Enabled := (LabeledEditD.text <> '');
end;

procedure TForm10.EditMChange(Sender: TObject);
var
  i: integer;
begin
  StringGridMatrix.RowCount := UpDownM.Position + 1;
  for i := 1 to UpDownM.Position do
    StringGridMatrix.Cells[0, i] := intToStr(i);
end;

procedure TForm10.EditNChange(Sender: TObject);
var
  i: integer;
begin
  StringGridMatrix.ColCount := UpDownN.Position + 1;
  for i := 1 to UpDownN.Position do
    StringGridMatrix.Cells[i, 0] := intToStr(i);
end;

procedure TForm10.FormResize(Sender: TObject);
begin
  StringGridMatrix.Width := Width - 300;
  StringGridResult.Left := Width - 270;

  StringGridMatrix.Height := Height - 200;
  StringGridResult.Height := Height - 200;
  Label3.Top := Height - 100;
  EditK.Top := Height - 100;
end;

procedure TForm10.N13Click(Sender: TObject);
begin
  Application.MessageBox
    ('Задание 1 - Для каждого столбца матрицы вычислить произведение положительных элементов.'
    + #13#13'Задание 2 - Проверить, есть ли в целочисленной матрице хотя бы одна строка, содержащая элемент, кратный заданному числу, и найти её номер.',
    'Задание для варианта 13', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm10.N26Click(Sender: TObject);
begin
  Application.MessageBox
    ('Задание 1 - Положительные элементы матрицы увеличить в 2 раза, а отрицательные – заменить нулём.'
    + #13#13'Задание 2 - Проверить, все ли строки целочисленной матрицы содержат хотя бы один элемент со значением, некратным заданному числу. Если не все, найти номер последней строки, где нет значений, некратных заданному числу.',
    'Задание для варианта 26', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm10.N4Click(Sender: TObject);
begin
  close;
end;

procedure TForm10.N5Click(Sender: TObject);
var
  a: matrix;
  m, n: integer;
  f: TextFile;
  i, j: integer;
begin
  OpenDialog1.InitialDir := GetCurrentDir;
  if OpenDialog1.Execute then
  begin
    try
      AssignFile(f, OpenDialog1.FileName);
      reset(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для чтения',
        'Ошибка', MB_OK or MB_ICONWARNING);
      exit;
    end;
    try
      readln(f, m, n);
      SetLength(a, m, n);
      for i := 0 to m - 1 do
        for j := 0 to n - 1 do
          read(f, a[i, j]);
      CloseFile(f);
    except
      Application.MessageBox('Файл содержит неверные данные', 'Ошибка',
        MB_OK or MB_ICONWARNING);
      CloseFile(f);
      exit;
    end;
    EditM.text := intToStr(m);
    EditN.text := intToStr(n);
    for i := 0 to m - 1 do
      for j := 0 to n - 1 do
        StringGridMatrix.Cells[j + 1, i + 1] := FloatToStr(a[i, j]);
    for i := 0 to m - 1 do
      StringGridResult.Cells[1, i + 1] := '';
    EditK.text := '';
  end;
end;

procedure TForm10.N6Click(Sender: TObject);
var
  a: matrix;
  m, n: integer;
  f: TextFile;
  i, j: integer;
begin
  try
    m := UpDownM.Position;
    n := UpDownN.Position;
    SetLength(a, m, n);
    for i := 0 to m - 1 do
      for j := 0 to n - 1 do
        a[i, j] := StrToFloat(StringGridMatrix.Cells[j + 1, i + 1]);
  except
    Application.MessageBox('Введите элементы исходного массива', 'Ошибка',
      MB_OK or MB_ICONWARNING);
    exit;
  end;
  SaveDialog1.InitialDir := GetCurrentDir;
  if SaveDialog1.Execute then
  begin
    try
      AssignFile(f, SaveDialog1.FileName);
      rewrite(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для записи',
        'Ошибка', MB_OK or MB_ICONWARNING);
      exit;
    end;
    writeln(f, m, ' ', n);
    for i := 0 to m - 1 do
    begin
      for j := 0 to n - 1 do
        write(f, a[i, j], ' ');
      writeln(f);
    end;
    CloseFile(f);
  end;
end;

procedure TForm10.Task1_13(Sender: TObject);
var
  inputArray: matrix;
  vectorA: vector;
begin
  inputArray := GetInputCol();
  vectorA := GetMultiplicationOfColls(inputArray);
  ShowResultVector(vectorA);
end;

end.
