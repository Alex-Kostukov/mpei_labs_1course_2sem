unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ComCtrls;

//type
//  matrix = array[0..2] of array of integer[0..2]; end;

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
    procedure FormCreate(Sender: TObject);
    procedure EditNChange(Sender: TObject);
    procedure EditMChange(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.EditMChange(Sender: TObject);
var
  i: integer;
begin
  StringGridMatrix.RowCount := UpDownM.Position + 1;
  for i := 1 to UpDownM.Position do
    StringGridMatrix.Cells[0, i] := IntToStr(i);
  StringGridResult.RowCount := UpDownM.Position + 1;
  for i := 1 to UpDownM.Position do
    StringGridResult.Cells[0, i] := IntToStr(i);
end;

procedure TForm10.EditNChange(Sender: TObject);
var
  i: integer;
begin
  StringGridMatrix.ColCount := UpDownN.Position + 1;
  for i := 1 to UpDownN.Position do
    StringGridMatrix.Cells[i, 0] := IntToStr(i);
end;

procedure TForm10.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to 3 do
  begin
    StringGridMatrix.Cells[i, 0] := IntToStr(i);
    StringGridMatrix.Cells[0, i] := IntToStr(i);
    StringGridResult.Cells[0, i] := IntToStr(i);
  end;
  StringGridResult.Cells[1, 0] := 'Кол-во 0';
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
      Exit;
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
      Exit;
    end;
    EditM.Text := IntToStr(m);
    EditN.Text := IntToStr(n);
    for i := 0 to m - 1 do
      for j := 0 to n - 1 do
        StringGridMatrix.Cells[j + 1, i + 1] := FloatToStr(a[i, j]);
    for i := 0 to m - 1 do
      StringGridResult.Cells[1, i + 1] := '';
    EditK.Text := '';
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
    Exit;
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
      Exit;
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

end.
