unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Menus;
  type
  TStudent = record
    group: string[7];
    name: string[30];
    birthday: string[10];
    sex: (null, male, female);
    physics: integer;
    math: integer;
    informatics: integer;
    stipend: integer;
  end;

type
  TArrayOfStudents = array of TStudent;

type
  TForm1 = class(TForm)
    StringGrid: TStringGrid;
    StringGridResult: TStringGrid;
    EditRowCount: TEdit;
    Label1: TLabel;
    UpDown1: TUpDown;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    NCondition13: TMenuItem;
    NCondition26: TMenuItem;
    N2: TMenuItem;
    NLoad: TMenuItem;
    NSave: TMenuItem;
    N5: TMenuItem;
    NSolve13: TMenuItem;
    NSolve26: TMenuItem;
    N6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure N6Click(Sender: TObject);
    procedure EditRowCountChange(Sender: TObject);
    procedure NSaveClick(Sender: TObject);
    function ReadStudents(): TArrayofStudents;
    procedure NLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NSolve13Click(Sender: TObject);
    procedure NSolve26Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.ReadStudents(): TarrayofStudents;
var
  i: integer;
begin
  SetLength(result, StringGrid.RowCount - 1);
  for i := 1 to StringGrid.RowCount - 1 do
  begin
    result[i - 1].group := StringGrid.Cells[1, i];
    result[i - 1].name := StringGrid.Cells[2, i];
    result[i - 1].birthday := StringGrid.Cells[3, i];
    if StringGrid.Cells[4, i] = 'male' then
      result[i - 1].sex := male
    else if StringGrid.Cells[4, i] = 'female' then
      result[i - 1].sex := female;
    result[i - 1].physics := strtoint(StringGrid.Cells[5, i]);
    result[i - 1].math := strtoint(StringGrid.Cells[6, i]);
    result[i - 1].informatics := strtoint(StringGrid.Cells[7, i]);
    result[i - 1].stipend := strtoint(StringGrid.Cells[8, i]);
  end;
end;

procedure TForm1.EditRowCountChange(Sender: TObject);
var
  i: integer;
begin
  StringGrid.RowCount := UpDown1.Position + 1;
  for i := 1 to UpDown1.Position do
    StringGrid.Cells[0, i] := intToStr(i);
  StringGrid.FixedRows := 1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid.ColWidths[0] := 30;
  StringGrid.ColWidths[3] := 95;
  StringGrid.ColCount := 9;
  StringGrid.Cells[1, 0] := 'Группа';
  StringGrid.Cells[2, 0] := 'ФИО';
  StringGrid.Cells[3, 0] := 'Дата рождения';
  StringGrid.Cells[4, 0] := 'Пол';
  StringGrid.Cells[5, 0] := 'Физика';
  StringGrid.Cells[6, 0] := 'Математика';
  StringGrid.Cells[7, 0] := 'Информатика';
  StringGrid.Cells[8, 0] := 'Стипендия';
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.NLoadClick(Sender: TObject);
var
  f: file of TStudent;
  i: integer;
  student: TStudent;
begin
  OpenDialog1.InitialDir := GetCurrentDir;
  if OpenDialog1.Execute then
    try
      AssignFile(f, OpenDialog1.FileName);
      reset(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для чтения',
        'Ошибка', MB_OK or MB_ICONWARNING);
      exit;
    end;
  EditRowCount.text := intToStr(filesize(f));
  i := 1;
  while not Eof(f) do
  begin
    Read(f, student);
    StringGrid.Cells[1, i] := student.group;
    StringGrid.Cells[2, i] := student.name;
    StringGrid.Cells[3, i] := student.birthday;
    if student.sex = male then
      StringGrid.Cells[4, i] := 'male'
    else if student.sex = female then
      StringGrid.Cells[4, i] := 'female';
    StringGrid.Cells[5, i] := intToStr(student.physics);
    StringGrid.Cells[6, i] := intToStr(student.math);
    StringGrid.Cells[7, i] := intToStr(student.informatics);
    StringGrid.Cells[8, i] := intToStr(student.stipend);
    i := i + 1;
  end;
  CloseFile(f);
end;

procedure TForm1.NSaveClick(Sender: TObject);
var
  lt_students: TarrayofStudents;
  f: file of TStudent;
  i: integer;

begin
  SaveDialog1.InitialDir := GetCurrentDir;
  if SaveDialog1.Execute then
  begin
    try
      AssignFile(f, SaveDialog1.FileName + '.coffee');
      rewrite(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для записи',
        'Ошибка', MB_OK or MB_ICONWARNING);
      exit;
    end;
    lt_students := ReadStudents();
    for i := 0 to High(lt_students) do
      write(f, lt_students[i]);
    CloseFile(f);
  end;
end;

procedure TForm1.NSolve13Click(Sender: TObject);
var
  lt_students: TarrayofStudents;
  i, j: integer;
  counter: integer;
begin
  lt_students := ReadStudents();
  StringGridResult.RowCount := 1;
  StringGridResult.ColWidths[0] := 100;
  StringGridResult.ColWidths[1] := 100;
  StringGridResult.ColCount := 2;
  StringGridResult.Cells[1, 0] := 'ФИО';
  counter := 0;
  j := 0;
  for i := 0 to High(lt_students) do
  begin
    if ((lt_students[i].physics = 2) and (lt_students[i].math = 2)) or
      ((lt_students[i].physics = 2) and (lt_students[i].informatics = 2)) or
      ((lt_students[i].math = 2) and (lt_students[i].informatics = 2)) then
    begin
      StringGridResult.RowCount := StringGridResult.RowCount + 1;
      StringGridResult.Cells[0, j + 1] := intToStr(j + 1);
      StringGridResult.Cells[1, j + 1] := lt_students[i].name;
      j := j + 1;
      if lt_students[i].group = 'A-4-10' then
        counter := counter + 1;
    end;
  end;
  StringGridResult.RowCount := StringGridResult.RowCount + 1;
  StringGridResult.Cells[0, j + 1] := 'Итого из A-4-10';
  StringGridResult.Cells[1, j + 1] := intToStr(counter);

end;

procedure TForm1.NSolve26Click(Sender: TObject);
var
  lt_students: TarrayofStudents;
  i, j: integer;
  s:string;
begin
  lt_students := ReadStudents();
  StringGridResult.RowCount := 1;
  StringGridResult.ColWidths[0] := 100;
  StringGridResult.ColWidths[1] := 100;
  StringGridResult.ColWidths[2] := 100;
  StringGridResult.ColCount := 3;
  StringGridResult.Cells[1, 0] := 'ФИО';
  StringGridResult.Cells[2, 0] := 'Средний балл';
  j := 1;
  for i := 0 to High(lt_students) do
   begin
    if (lt_students[i].sex = male) and (lt_students[i].stipend = 0) then
     StringGridResult.RowCount := StringGridResult.RowCount + 1;
     StringGridResult.Cells[0, j] := intToStr(j);
     StringGridResult.Cells[1, j] := lt_students[i].name;
     str(((lt_students[i].physics + lt_students[i].math + lt_students[i].informatics)/3):5:2, s);
     StringGridResult.Cells[2, j] := s;
     j := j + 1;
   end;

end;

end.
