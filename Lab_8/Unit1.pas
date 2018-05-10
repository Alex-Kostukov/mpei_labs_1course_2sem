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
    procedure NExitClick(Sender: TObject);
    procedure NFileNameClick(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure NRandomClick(Sender: TObject);
    procedure NFileClick(Sender: TObject);
    procedure NFoundClick(Sender: TObject);
    procedure NPerestanovkaClick(Sender: TObject);
    procedure NTextFileClick(Sender: TObject);
    procedure NTaskClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.EditNameChange(Sender: TObject);
begin
  if EditName.Text <> '' then
  begin
    NRandom.Enabled := true;
    NTextFile.Enabled := true;
    NFile.Enabled := true;
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
  Close;
end;

procedure TForm1.NFileClick(Sender: TObject);
var
  f: TRealFile;
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
  Seek(f, 0);
  while not eof(f) do
  begin
    read(f, x);
    ListBox.Items.Add(FloatToStr(x));
  end;
  CloseFile(f);

  EditCount.Text := inttostr(ListBox.Count);
end;

procedure TForm1.NFileNameClick(Sender: TObject);
var
  f: TRealFile;
begin
  OpenDialogType.InitialDir := GetCurrentDir;
  if OpenDialogType.Execute then
    EditName.Text := OpenDialogType.FileName;
end;

procedure TForm1.NFoundClick(Sender: TObject);
var
  f: TRealFile;
  a1, a2: integer;
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
  Found(f, a1, a2);
  if a1 = 0 then
    EditPos.Text := 'нет'
  else
    EditPos.Text := inttostr(a1);
  EditElem.Text := inttostr(a2);
  CloseFile(f);
end;

procedure TForm1.NPerestanovkaClick(Sender: TObject);
var
  f: TRealFile;
  k: integer;
  a1, a2: integer;
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
  Found(f, a1, a2);
  if a1 = 0 then
    Application.MessageBox(PWideChar('Нет элемента для перемещения'), 'Ошибка',
      MB_OK or MB_ICONWARNING);
  k := strtoint(EditK.Text);
  Sub(f, k, a1);
  Application.MessageBox(PWideChar('Элемент успешно перемещён'), 'Перестановка',
    MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.NRandomClick(Sender: TObject);
var
  t: TRealFile;
  i: integer;
  r: integer;
begin
  if DialogForm.ShowModal = mrCancel then
    Exit;
  AssignFile(t, EditName.Text);
  Rewrite(t);

  for i := 1 to strtoint(DialogForm.EditCount.Text) do
  begin
    r := random(71) - 20;
    write(t, r);
  end;
  CloseFile(t);
end;

procedure TForm1.NTaskClick(Sender: TObject);
begin
  Application.MessageBox
    ('Создать типизированный файл целых чисел в диапазоне -20..+50. Найти первый элемент, попадающий в диапазон -10..+30. Поставить его после k-го элемента.',
    'Условие', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.NTextFileClick(Sender: TObject);
var
  f: TRealFile;
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
    Seek(f, 0);
    while not eof(Text) do
    begin
      read(Text, x);
      write(f, x);
    end;
  end;
end;

end.
