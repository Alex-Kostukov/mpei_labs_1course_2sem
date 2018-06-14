unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, OneDirectionList;

type
  TFormOneDirectionList = class(TForm)
    MainMenuForm: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    ListBoxList: TListBox;
    EditElement: TEdit;
    StaticText1: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    EditFirst: TEdit;
    StaticText2: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ListOutput(var spisok: TList);
  procedure ListInput(var spisok: TList);
var
  FormOneDirectionList: TFormOneDirectionList;

implementation

{$R *.dfm}

uses Unit1;

procedure TFormOneDirectionList.Button1Click(Sender: TObject);
var spisok: TList;
    i: integer;
begin
    ListInput (spisok);
    AddToBegin (spisok, StrToInt(EditElement.text));
    ListOutput (spisok);
end;

procedure ListInput(var spisok: TList);
var i: integer;
begin
  Initialize (spisok);
  for i := 0 to FormOneDirectionList.ListBoxList.Items.Count - 1 do
    begin
      AddToEnd (spisok, StrToInt(FormOneDirectionList.ListBoxList.Items[i]));
    end;

end;
procedure ListOutput(var spisok: TList);
begin

  FormOneDirectionList.ListBoxList.Clear;
  SetToFirst (spisok);
  while not EndReached(spisok) do
    begin
      if (GetCurrent(spisok) >=-15) and (GetCurrent(spisok) <=25) then
        FormOneDirectionList.ListBoxList.Items.Add(IntToStr(GetCurrent(spisok)))
      else
        begin
          Application.MessageBox('Введенный элемент не соответсвует диапазону от -20 до 50!','Ошибка',16);
          exit;
        end;
      GoToNext(spisok);
    end;
end;

procedure TFormOneDirectionList.Button2Click(Sender: TObject);
var spisok : TList;
begin
  ListInput (spisok);
  AddToEnd (spisok, StrToInt(EditElement.text));
  ListOutput (spisok);
end;

procedure TFormOneDirectionList.Button3Click(Sender: TObject);
var spisok : TList;
    info: integer;
begin
    ListInput (spisok);

    SetToFirst(spisok);
    info := StrToInt(EditElement.Text);

     if (info mod 2 <> 0) then
        begin
          AddToBegin(spisok, info);
        end
     else
        begin
          AddToEnd(spisok, info);
        end;

    ListOutput (spisok);
end;

procedure TFormOneDirectionList.Button4Click(Sender: TObject);
var spisok : TList;
begin
  ListInput (spisok);

  SetToFirst (spisok);
  while not EndReached(spisok) do
    begin
       if GetCurrent(spisok) = StrToInt(EditElement.Text) then
          DeleteCurrent(spisok)
       else
          GoToNext(spisok);
    end;

  ListOutput (spisok);
end;

procedure TFormOneDirectionList.Button5Click(Sender: TObject);
var spisok: TList;
begin
   Initialize (spisok);
   ListOutput (spisok);
end;

procedure TFormOneDirectionList.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var spisok: TList;
begin
  Initialize (spisok);
  ListOutput (spisok);
  ListBoxList.Clear;
  EditElement.Text := '';
  EditFirst.Text := '';
  Form1.Show;
end;

procedure TFormOneDirectionList.N1Click(Sender: TObject);
  var s : string;
begin
s := 'Разработать программу для работы с однонаправленным и двунаправленным списками из элементов, попадающих диапазон -15..+25 и упорядоченных следующим образом: сначала нечетные, затем четные. Удалять нечетные элементы.';
Application.MessageBox(PChar(s),
                         'Условие', MB_OK or MB_ICONINFORMATION);
end;

procedure TFormOneDirectionList.N3Click(Sender: TObject);
var
  f:TextFile;
  spisok: TList;
  info: integer;
begin
  Initialize(spisok);
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
    try

      while not eof(f) do
        begin
          readln(f, info);
          if (info >=-15) and (info <=25) then
              AddToEnd(spisok,info)
          else
            begin
              Application.MessageBox('Файл содержит не корректные данные не все числа находяться в необходимом диапазоне.', 'Ошибка', MB_OK or MB_ICONWARNING);
              exit;
            end;


        end;

      CloseFile(f);
    except
      Application.MessageBox('Файл содержит неверные данные', 'Ошибка', MB_OK or MB_ICONWARNING);
      CloseFile(f);
      Exit;
    end;
  end;

  ListOutput(spisok);
end;

procedure TFormOneDirectionList.N4Click(Sender: TObject);
var f: TextFile;
    spisok: TList;
    info: integer;
begin
  SaveDialog.InitialDir := GetCurrentDir;
  ListInput(spisok);
  SetToFirst(spisok);
  if SaveDialog.Execute then
  begin
    try
      AssignFile(f, SaveDialog.FileName);
      rewrite(f);
    except
      Application.MessageBox('Невозможно открыть указанный файл для записи', 'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;

    while not EndReached(spisok) do
      begin
       info := GetCurrent(spisok);
       writeln(f, info);
       GoToNext(spisok);
      end;

    CloseFile(f);
  end;
end;

procedure TFormOneDirectionList.N5Click(Sender: TObject);
var spisok,list: TList;
    info: integer;
begin
  ListInput (spisok);

  SetToFirst (spisok);
  Initialize (list);
  EditFirst.Text := '';
  while not EndReached(spisok) do
    begin
     info := GetCurrent(spisok);

     if (info mod 2 <> 0) then
        begin
          AddToBegin(list, info);
          if EditFirst.Text = '' then
             EditFirst.Text := IntTostr(info);
        end
     else
        begin
          AddToEnd(list, info);
        end;

     GoToNext(spisok);
    end;

   ListOutput (list);
end;

end.
