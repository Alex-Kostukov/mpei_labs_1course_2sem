unit UnitProgram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.ExtCtrls, UnitSort;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    EditNumber_of_elements: TEdit;
    UpDown: TUpDown;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    MainMenu: TMainMenu;
    NData: TMenuItem;
    NLoadData: TMenuItem;
    NSaveData: TMenuItem;
    NSort: TMenuItem;
    NExit: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StringGridData: TStringGrid;
    StringGridChange: TStringGrid;
    StringGridChoose: TStringGrid;
    StringGridInclude: TStringGrid;
    StringGridQuickSort: TStringGrid;
    RadioGroupType: TRadioGroup;
    LabelTimeOfChanging: TLabel;
    LabelTimeOfChoosing: TLabel;
    LabelTimeOfIncluding: TLabel;
    LabelTimeOfQuickSort: TLabel;
    procedure NExitClick(Sender: TObject);
    procedure NSortClick(Sender: TObject);
    procedure EditNumber_of_elementsChange(Sender: TObject);
    procedure NLoadDataClick(Sender: TObject);
    procedure NSaveDataClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.EditNumber_of_elementsChange(Sender: TObject);
var
  i: integer;
begin
    StringGridData.ColCount := UpDown.Position;
    StringGridChange.ColCount := UpDown.Position;
    StringGridChoose.ColCount := UpDown.Position;
    StringGridInclude.ColCount := UpDown.Position;
    StringGridQuickSort.ColCount := UpDown.Position;
  for i := 0 to UpDown.Position do
   begin
     StringGridData.Cells[i, 0] := IntToStr(i+1);
     StringGridChange.Cells[i, 0] := IntToStr(i+1);
     StringGridChoose.Cells[i, 0] := IntToStr(i+1);
     StringGridInclude.Cells[i, 0] := IntToStr(i+1);
     StringGridQuickSort.Cells[i, 0] := IntToStr(i+1);
   end;
end;

procedure TForm1.NExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.NLoadDataClick(Sender: TObject);
 var
  f: TextFile;
  i,n:integer;
  index:integer;
  data:string;
begin
 OpenDialog.InitialDir := GetCurrentDir;
  if OpenDialog.Execute then
  begin
    try
      AssignFile(f, OpenDialog.FileName);
      reset(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для чтения', 'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end;

 readln(f, index);
 if index=0 then
   RadioGroupType.ItemIndex:=0
 else if index=1 then
   RadioGroupType.ItemIndex:=1;
 readln(f, n);
 UpDown.Position:=n;
 for i := 1 to n do
  begin
   readln(f, data);
   StringGridData.Cells[i-1,1]:=data
  end;
 for i:=0 to n-1 do // чистим поля
  begin
      StringGridChange.Cells[i,1]:='';
      StringGridChoose.Cells[i,1]:='';
      StringGridInclude.Cells[i,1]:='';
      StringGridQuickSort.Cells[i,1]:='';
  end;

  LabelTimeOfChanging.Caption := '';
  LabelTimeOfChoosing.Caption := '';
  LabelTimeOfIncluding.Caption := '';
  LabelTimeOfQuickSort.Caption := '';

 CloseFile(f);
end;

procedure TForm1.NSaveDataClick(Sender: TObject); //Сохраняем исходные данные
 var
  f:TextFile;
  i,n:integer;
  data:string;
begin
 SaveDialog.InitialDir := GetCurrentDir;
  if SaveDialog.Execute then
  begin
    try
      AssignFile(f, SaveDialog.FileName);
      rewrite(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для записи', 'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end;
  n:=UpDown.Position;
 Writeln(f, RadioGroupType.ItemIndex);
 writeln(f, n);
 for i := 1 to n do
 begin
   data:=StringGridData.Cells[i,1];
   writeln(f, data);
 end;
CloseFile(f);
end;

procedure TForm1.NSortClick(Sender: TObject);
var
  x, y: array of Variant;
  n: integer;
  t, i: integer;
  t1, t2: TDateTime;

begin
  try
    if RadioGroupType.ItemIndex = 0 then
      t := varInteger
    else
      t := varString;
    n := UpDown.Position;
    SetLength(x, n);
    for i := 0 to n - 1 do
      x[i] := VarAsType(StringGridData.Cells[i, 1], t);
  except
    Application.MessageBox('Введите элементы исходного массива', 'Ошибка', MB_OK or MB_ICONWARNING);
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    y := Copy(x);
  except
    ShowMessage('Введите элементы верно');
    exit;
  end;
  t1 := Time();
  SortByChanging(y, n);//обменом
  t2 := Time();
  for i := 0 to n - 1 do
    StringGridChange.Cells[i, 1] := y[i];
  LabelTimeOfChanging.Caption := FormatDateTime('h.nn.ss:zzz', t2 - t1);

  y := Copy(x);
  t1 := Time();
  SortByChoosing(y, n);//выбором
  t2 := Time();
  for i := 0 to n - 1 do
    StringGridChoose.Cells[i, 1] := y[i];
  LabelTimeOfChoosing.Caption := FormatDateTime('h.nn.ss:zzz', t2 - t1);

  y := Copy(x);
  t1 := Time();
  SortByIncluding(y, n);//включением
  t2 := Time();
  for i := 0 to n - 1 do
    StringGridInclude.Cells[i, 1] := y[i];
  LabelTimeOfIncluding.Caption := FormatDateTime('h.nn.ss:zzz', t2 - t1);

  y := Copy(x);
  t1 := Time();
  QuickSort(y, 0, n - 1);//быстрая
  t2 := Time();
  for i := 0 to n - 1 do
    StringGridQuickSort.Cells[i, 1] := y[i];
  LabelTimeOfQuickSort.Caption := FormatDateTime('h.nn.ss:zzz', t2 - t1);

  Screen.Cursor := crDefault;
end;

end.
