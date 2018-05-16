unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, UnitType,
  Unit2, UnitOperations;

type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    NTask: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    NExit: TMenuItem;
    NFileName: TMenuItem;
    NRandom: TMenuItem;
    NTextFile: TMenuItem;
    NFile: TMenuItem;
    NFound: TMenuItem;
    NPerestanovka: TMenuItem;
    OpenDialogType: TOpenDialog;
    OpenDialogText: TOpenDialog;
    EditName: TEdit;
    Label1: TLabel;
    EditCount: TEdit;
    EditElem: TEdit;
    EditPos: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox: TListBox;
    EditK: TEdit;
    Label5: TLabel;
    N131: TMenuItem;
    N261: TMenuItem;
    NRandom13: TMenuItem;
    NRandom26: TMenuItem;
    N133: TMenuItem;
    N263: TMenuItem;
    NSearch13: TMenuItem;
    NSearch26: TMenuItem;
    NSwap13: TMenuItem;
    NSwap26: TMenuItem;
    NFileContent13: TMenuItem;
    NFileContent26: TMenuItem;
    procedure NExitClick(Sender: TObject);
    procedure NFileNameClick(Sender: TObject);
    procedure EditNameChange(Sender: TObject);

    procedure NSwap13Click(Sender: TObject);
    procedure NSwap26Click(Sender: TObject);

    procedure NTextRealFileClick(Sender: TObject);
    procedure NTextIntFileClick(Sender: TObject);

    procedure NTask13Click(Sender: TObject);
    procedure NTask26Click(Sender: TObject);

    procedure NSearch13Click(Sender: TObject);
    procedure NSearch26Click(Sender: TObject);

    procedure NRandom13Click(Sender: TObject);
    procedure NRandom26Click(Sender: TObject);

    procedure NFileContent13Click(Sender: TObject);
    procedure NFileContent26Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// <Создать из текстового файла>
procedure TForm1.NTextIntFileClick(Sender: TObject);
var
  f: TintFile;
  Text: TextFile;
  x: integer;
begin
  OpenDialogText.InitialDir := GetCurrentDir;
  if OpenDialogText.Execute then
  begin
    try
      AssignFile(Text, OpenDialogText.FileName);
      Reset(Text);
    except
      Application.MessageBox('Невозможно открыть указанный текстовый файл ',
        'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
    AssignFile(f, EditName.Text);
    Rewrite(f);
    seek(f, 0);
    while not eof(Text) do
    begin
      read(Text, x);
      if (x >= -15) and (x <= 25) then
        write(f, x);
    end;
  end;
end;

procedure TForm1.NTextRealFileClick(Sender: TObject);
var
  f: TrealFile;
  Text: TextFile;
  x: real;
begin
  OpenDialogText.InitialDir := GetCurrentDir;
  if OpenDialogText.Execute then
  begin
    try
      AssignFile(Text, OpenDialogText.FileName);
      Reset(Text);
    except
      Application.MessageBox('Невозможно открыть указанный текстовый файл ',
        'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
    AssignFile(f, EditName.Text);
    Rewrite(f);
    seek(f, 0);
    while not eof(Text) do
    begin
      read(Text, x);
      if (x >= -99.9) and (x <= 99.9) then
        write(f, x);
    end;
  end;
end;
// ---------------------------------------------------

// -------------------<Содержимое>-------------------
procedure TForm1.NFileContent13Click(Sender: TObject);
var
  f: TintFile;
  i, n: integer;
  x: integer;
begin
  try
    AssignFile(f, EditName.Text);
    Reset(f);
  except
    Application.MessageBox(PWideChar('Невозможно открыть файл ''' +
      EditName.Text + '''  для чтения'), 'Ошибка', MB_OK or MB_ICONWARNING);
    Exit;
  end;
  ListBox.Clear;
  seek(f, 0);
  while not eof(f) do
  begin
    read(f, x);
    if (x >= -15) and (x <= 25) then
      ListBox.Items.Add(FloatToStr(x));
  end;
  CloseFile(f);
  EditCount.Text := inttostr(ListBox.count);
end;

procedure TForm1.NFileContent26Click(Sender: TObject);
var
  f: TrealFile;
  i, n: integer;
  x: real;
begin
  try
    AssignFile(f, EditName.Text);
    Reset(f);
  except
    Application.MessageBox(PWideChar('Невозможно открыть файл ''' +
      EditName.Text + '''  для чтения'), 'Ошибка', MB_OK or MB_ICONWARNING);
    Exit;
  end;
  ListBox.Clear;
  seek(f, 0);
  while not eof(f) do
  begin
    read(f, x);
    if (x >= -99.9) and (x <= 99.9) then
      ListBox.Items.Add(FloatToStr(x));
  end;
  CloseFile(f);
  EditCount.Text := inttostr(ListBox.count);
end;
// --------------------------------------------------

// ----------<Создать случайным образом>------------
procedure TForm1.NRandom13Click(Sender: TObject);
var
  t: TintFile;
  i: integer;
  a: integer;
begin
  if DialogForm.ShowModal = mrCancel then
    Exit;
  AssignFile(t, EditName.Text);
  Rewrite(t);
  for i := 1 to strtoint(DialogForm.EditCount.Text) do
  begin
    randomize;
    a := random(40) - 15;
    write(t, a);
  end;
  CloseFile(t);
end;

procedure TForm1.NRandom26Click(Sender: TObject);
var
  t: TrealFile;
  i: integer;
  r: real;
begin
  if DialogForm.ShowModal = mrCancel then
    Exit;
  AssignFile(t, EditName.Text);
  Rewrite(t);
  for i := 1 to strtoint(DialogForm.EditCount.Text) do
  begin
    randomize;
    r := (random * 199.8 - 99.9);
    write(t, r);
  end;
  CloseFile(t);
end;
// -----------------------------------------------

// -------------<Поиск элемента>------------------
procedure TForm1.NSearch13Click(Sender: TObject);
var
  f: TintFile;
  inum: ty_Inum;
begin
  try
    AssignFile(f, EditName.Text);
    Reset(f);
  except
    Application.MessageBox(PWideChar('Невозможно открыть файл ''' +
      EditName.Text + '''  для чтения'), 'Ошибка', MB_OK or MB_ICONWARNING);
    Exit;
  end;
  if FileSize(f) = 0 then
    Application.MessageBox(PWideChar('Файл пуст'), 'Ошибка',
      MB_OK or MB_ICONWARNING);
  inum := FindNum13(f);
  if inum.position <> -1 then
  begin
    EditElem.Text := inttostr(inum.value);
    EditPos.Text := inttostr(inum.position);
  end
  else
  begin
    EditPos.Text := 'Not found';
    EditElem.Text := 'Not found';
  end;
  CloseFile(f);
end;

procedure TForm1.NSearch26Click(Sender: TObject);
var
  f: TrealFile;
  counter: integer;
  rnum: ty_Rnum;
  a: real;
begin
  try
    AssignFile(f, EditName.Text);
    Reset(f);
  except
    Application.MessageBox(PWideChar('Невозможно открыть файл ''' +
      EditName.Text + '''  для чтения'), 'Ошибка', MB_OK or MB_ICONWARNING);
    Exit;
  end;
  if FileSize(f) = 0 then
    Application.MessageBox(PWideChar('Файл пуст'), 'Ошибка',
      MB_OK or MB_ICONWARNING);
  rnum := FindNum26(f);
  if rnum.position <> -1 then
  begin
    EditElem.Text := FloatToStr(rnum.value);
    EditPos.Text := FloatToStr(rnum.position);
  end
  else
  begin
    EditPos.Text := 'Not found';
    EditElem.Text := 'Not found';
  end;
  CloseFile(f);
end;
// -----------------------------------------------

// ------<Условие задачи>-------------------------
procedure TForm1.NTask13Click(Sender: TObject);
begin
  Application.MessageBox
    ('Создать типизированный файл целых чисел в диапазоне от -15 до +25. Последний нечётный элемент поставить в начало файла',
    'Условие', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.NTask26Click(Sender: TObject);
begin
  Application.MessageBox
    ('Создать типизированный файл вещественных чисел в диапазоне от -99,9 до +99,9. Последний элемент, попадающий в диапазон -50,6..+71,2 поставить после k-го элемента',
    'Условие', MB_OK or MB_ICONINFORMATION);
end;
// -----------------------------------------------

// -----<Задать имя>--------
procedure TForm1.NFileNameClick(Sender: TObject);
var
  f: TintFile;
begin
  OpenDialogType.InitialDir := GetCurrentDir;
  if OpenDialogType.Execute then
    EditName.Text := OpenDialogType.FileName;
end;

// <Перестановка элемента>
procedure TForm1.NSwap13Click(Sender: TObject);
var
  f: TintFile;
  inum: ty_Inum;
begin
  try
    AssignFile(f, EditName.Text);
    Reset(f);
  except
    Application.MessageBox(PWideChar('Невозможно открыть файл ''' +
      EditName.Text + '''  для чтения'), 'Ошибка', MB_OK or MB_ICONWARNING);
    Exit;
  end;
  if FileSize(f) = 0 then
    Application.MessageBox(PWideChar('Файл пуст'), 'Ошибка',
      MB_OK or MB_ICONWARNING);
  inum := FindNum13(f);
  if inum.position = -1 then
    Application.MessageBox(PWideChar('Нет элемента для перемещения'), 'Ошибка',
      MB_OK or MB_ICONWARNING);
  // k := strtoint(EditK.Text);
  Swap13(f, inum);
  CloseFile(f);
  Application.MessageBox(PWideChar('Элемент успешно перемещён'), 'Перестановка',
    MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.NSwap26Click(Sender: TObject);
var
  f: TrealFile;
  k: integer;
  rnum: ty_Rnum;
begin
  try
    AssignFile(f, EditName.Text);
    Reset(f);
  except
    Application.MessageBox(PWideChar('Невозможно открыть файл ''' +
      EditName.Text + '''  для чтения'), 'Ошибка', MB_OK or MB_ICONWARNING);
    Exit;
  end;
  if FileSize(f) = 0 then
    Application.MessageBox(PWideChar('Файл пуст'), 'Ошибка',
      MB_OK or MB_ICONWARNING);
  rnum := FindNum26(f);
  if rnum.position = -1 then
    Application.MessageBox(PWideChar('Нет элемента для перемещения'), 'Ошибка',
      MB_OK or MB_ICONWARNING);
  k := strtoint(EditK.Text);
  Swap26(f, rnum, k);
  Application.MessageBox(PWideChar('Элемент успешно перемещён'), 'Перестановка',
    MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.EditNameChange(Sender: TObject);
begin
  if EditName.Text <> '' then
  begin
    NRandom.Enabled := True;
    NTextFile.Enabled := True;
    NFile.Enabled := True;
  end
  else
  begin
    NRandom.Enabled := false;
    NTextFile.Enabled := false;
    NFile.Enabled := false;
  end;

end;

procedure TForm1.NExitClick(Sender: TObject);
begin
  close;
end;

end.
