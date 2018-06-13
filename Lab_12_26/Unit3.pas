unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, TwoDirectionList;

type
  TFormTwoDirectionsList = class(TForm)
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
    MainMenuForm: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    ListBoxList2: TListBox;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ListInput(var spisok: TList);
  procedure ListOutput(var spisok: TList);
var
  FormTwoDirectionsList: TFormTwoDirectionsList;

implementation

{$R *.dfm}

uses Unit1;

procedure TFormTwoDirectionsList.Button1Click(Sender: TObject);
var s : TList;
begin
 ListInput(s);
 AddToBegin(s, StrtoInt(EditElement.text));
 ListOutput(s);
end;

procedure TFormTwoDirectionsList.Button2Click(Sender: TObject);
var spisok : TList;
begin
  ListInput (spisok);
  AddToEnd (spisok, StrToInt(EditElement.text));
  ListOutput (spisok);
end;


procedure TFormTwoDirectionsList.Button3Click(Sender: TObject);
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

procedure TFormTwoDirectionsList.Button4Click(Sender: TObject);
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

procedure TFormTwoDirectionsList.Button5Click(Sender: TObject);
var spisok: TList;
begin
   Initialize (spisok);
   ListOutput (spisok);
end;

procedure TFormTwoDirectionsList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //DeleteList(list);
  ListBoxList.Clear;
  ListBoxList2.Clear;
  EditElement.Text := '';
  EditFirst.Text := '';
  Form1.Show;
end;

procedure TFormTwoDirectionsList.N1Click(Sender: TObject);
var s1, s2 : string;
begin
s1 := '1.  Сортировка Сначала нечетные, потом четные 	';
s2 := '2.  Удалить Нечетный элемент  .';
Application.MessageBox(PChar(s1+#13#10+s2),
                         'Условие', MB_OK or MB_ICONINFORMATION);
end;

procedure TFormTwoDirectionsList.N3Click(Sender: TObject);
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
          if (info >= -20) and (info <= 50) then
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

procedure TFormTwoDirectionsList.N4Click(Sender: TObject);
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

procedure TFormTwoDirectionsList.N5Click(Sender: TObject);
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

procedure TFormTwoDirectionsList.N6Click(Sender: TObject);
begin
Close;
end;

procedure ListInput(var spisok: TList);
var i: integer;
begin
  Initialize (spisok);
   //dToEnd (spisok, 8);
  for i := FormTwoDirectionsList.ListBoxList.Items.Count - 1 downto 0 do
    begin
      AddToBegin (spisok, StrToInt(FormTwoDirectionsList.ListBoxList.Items[i]));
    end;

end;
procedure ListOutput(var spisok: TList);
var s2 : TList;
begin

  s2 := spisok;
  FormTwoDirectionsList.ListBoxList.Clear;
  SetToFirst (spisok);
  while not EndReached(spisok) do
    begin
      if (GetCurrent(spisok) >= -20) and (GetCurrent(spisok) <= 50) then
        FormTwoDirectionsList.ListBoxList.Items.Add(IntToStr(GetCurrent(spisok)))
      else
        begin
          Application.MessageBox('Введенный элемент не соответсвует диапазону от -20 до 50!','Ошибка',16);
          exit;
        end;
      GoToNext(spisok);
    end;

  spisok := s2;
  FormTwoDirectionsList.ListBoxList2.Clear;
  SetToLast (spisok);
  while not EndReached(spisok) do
    begin
      if (GetCurrent(spisok) >= -20) and (GetCurrent(spisok) <= 50) then
        FormTwoDirectionsList.ListBoxList2.Items.Add(IntToStr(GetCurrent(spisok)))
      else
        begin
          Application.MessageBox('Введенный элемент не соответсвует диапазону от -20 до 50!','Ошибка',16);
          exit;
        end;
      GoToPrev(spisok);
    end;

end;
end.
