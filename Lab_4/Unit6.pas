unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.Grids, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls, Unit16;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    StringGridSets: TStringGrid;
    dfwed1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    EditN: TEdit;
    UpDownN: TUpDown;
    SolveHash1: TMenuItem;
    SolveHash2: TMenuItem;
    SolveHash3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SpinEditNChange(Sender: TObject);
    procedure EditNChange(Sender: TObject);
    procedure dfwed1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SolveHash1Click(Sender: TObject);
    procedure showResult(hashedArray: typeStringArray;
      equals, colls, column: integer);
    function getInput(): typeSetArray;
    procedure FormResize(Sender: TObject);
    procedure SolveHash3Click(Sender: TObject);
    procedure SolveHash2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

function TForm6.getInput(): typeSetArray;
var
  i, j: integer;
  resultArray: typeSetArray;
  str: string;
begin
  SetLength(resultArray, StringGridSets.RowCount - 1);
  for i := 0 to StringGridSets.RowCount - 1 do
  begin
    str := StringGridSets.Cells[1, i + 1];
    for j := 1 to Length(str) do
      resultArray[i] := resultArray[i] + [str[j]];
  end;
  getInput := resultArray;
end;

procedure TForm6.dfwed1Click(Sender: TObject);
begin
  Application.MessageBox
    ('Разработать программу для поиска совпадающих множеств с использованием хеширования',
    'Условие', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm6.EditNChange(Sender: TObject);
begin
  StringGridSets.RowCount := UpDownN.Position + 1;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  StringGridSets.ColWidths[0] := 0;
  StringGridSets.ColWidths[1] := trunc(StringGridSets.Width * 0.25);
  StringGridSets.ColWidths[2] := trunc(StringGridSets.Width * 0.25);
  StringGridSets.ColWidths[3] := trunc(StringGridSets.Width * 0.25);
  StringGridSets.ColWidths[4] := trunc(StringGridSets.Width * 0.25);

  StringGridSets.Cells[1, 0] := 'Множество';
  StringGridSets.Cells[2, 0] := 'Хеш 1';
  StringGridSets.Cells[3, 0] := 'Хеш 2';
  StringGridSets.Cells[4, 0] := 'Хеш 3';
end;

procedure TForm6.FormResize(Sender: TObject);
begin
  StringGridSets.Width := Width - 30;
  StringGridSets.ColWidths[1] := trunc(StringGridSets.Width * 0.25);
  StringGridSets.ColWidths[2] := trunc(StringGridSets.Width * 0.25);
  StringGridSets.ColWidths[3] := trunc(StringGridSets.Width * 0.25);
  StringGridSets.ColWidths[4] := trunc(StringGridSets.Width * 0.25);
  StringGridSets.Height := Height - 120;
end;

procedure TForm6.N2Click(Sender: TObject);
var
  s: set of char;
  f: TextFile;
  n, i: integer;
  str: string;
  ch: char;
begin
  OpenDialog1.InitialDir := GetCurrentDir;
  if OpenDialog1.Execute then
  begin
    try
      AssignFile(f, OpenDialog1.FileName);
      Reset(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для чтения',
        'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
    readln(f, n);
    UpDownN.Position := n;
    for i := 1 to n do
    begin
      s := [];
      while not eoln(f) do
      begin
        read(f, ch);
        s := s + [ch];
      end;
      readln(f);
      str := '';
      for ch in s do
        str := str + ch;
      StringGridSets.Cells[1, i] := str;
      StringGridSets.Cells[2, i] := '';
      StringGridSets.Cells[3, i] := '';
      StringGridSets.Cells[4, i] := '';
    end;
    CloseFile(f);
  end;
end;

procedure TForm6.N3Click(Sender: TObject);
var
  s: set of char;
  f: TextFile;
  n, i, j: integer;
  str: string;
  ch: char;
begin
  SaveDialog1.InitialDir := GetCurrentDir;
  if SaveDialog1.Execute then
  begin
    try
      AssignFile(f, SaveDialog1.FileName + '.txt');
      Rewrite(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для записи',
        'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
    n := StringGridSets.RowCount - 1;
    writeln(f, n);
    for i := 1 to n do
    begin
      str := StringGridSets.Cells[1, i];
      s := [];
      for j := 1 to Length(str) do
        s := s + [str[j]];
      for ch in s do
        write(f, ch);
      writeln(f);
    end;
    CloseFile(f);
  end;
end;

procedure TForm6.N5Click(Sender: TObject);
begin
  close;
end;

procedure TForm6.SolveHash1Click(Sender: TObject);
var
  inputArray: typeSetArray;
  hashedArray: typeStringArray;
  equals, colls, i: integer;
begin
  inputArray := getInput();
  SetLength(hashedArray, Length(inputArray));

  for i := 0 to High(inputArray) do
    hashedArray[i] := hash1(inputArray[i]);

  GetAmountOfEqualsAndColls(inputArray, hashedArray, equals, colls);
  showResult(hashedArray, equals, colls, 2);
end;

procedure TForm6.SolveHash2Click(Sender: TObject);
var
  inputArray: typeSetArray;
  hashedArray: typeStringArray;
  equals, colls, i: integer;
begin
  inputArray := getInput();
  SetLength(hashedArray, Length(inputArray));

  for i := 0 to High(inputArray) do
    hashedArray[i] := hash2(inputArray[i], 7);

  GetAmountOfEqualsAndColls(inputArray, hashedArray, equals, colls);
  showResult(hashedArray, equals, colls, 3);
end;

procedure TForm6.SolveHash3Click(Sender: TObject);
var
  inputArray: typeSetArray;
  hashedArray: typeStringArray;
  equals, colls, i: integer;
  ch: char;

begin
  inputArray := getInput();
  SetLength(hashedArray, Length(inputArray));

  for i := 0 to High(inputArray) do
    hashedArray[i] := hash3(inputArray[i], 7);

  GetAmountOfEqualsAndColls(inputArray, hashedArray, equals, colls);
  showResult(hashedArray, equals, colls, 4);

end;

procedure TForm6.SpinEditNChange(Sender: TObject);
begin
  StringGridSets.RowCount := UpDownN.Position + 1;
end;

procedure TForm6.showResult(hashedArray: typeStringArray;
  equals, colls, column: integer);
var
  i: integer;
begin
  for i := 0 to Length(hashedArray) - 1 do
    StringGridSets.Cells[column, i + 1] := hashedArray[i];

  Application.MessageBox(PWideChar(WideString('Количество равенств - ' +
    IntToStr(equals) + #13'Количество коллизий - ' + IntToStr(colls))),
    'Результат', MB_OK or MB_ICONINFORMATION);

end;

end.
