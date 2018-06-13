unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.Menus,unit2,unit3,unit4;

type
  structures = (Stack,Queue,Deck);
  TForm1 = class(TForm)
    GroupBoxStack: TGroupBox;
    Label1: TLabel;
    ListBoxStack: TListBox;
    EditElemStack: TEdit;
    ButtonAddStack: TButton;
    ButtonDeleteElemStack: TButton;
    ButtonDeleteListStack: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    MainMenu: TMainMenu;
    MCondition: TMenuItem;
    MChoose: TMenuItem;
    MStack: TMenuItem;
    MQueue: TMenuItem;
    MDeck: TMenuItem;
    MSaveNLoad: TMenuItem;
    MSave: TMenuItem;
    MLoad: TMenuItem;
    MQuest: TMenuItem;
    MExit: TMenuItem;
    GroupBoxDeck: TGroupBox;
    Label3: TLabel;
    ListBoxDeck2: TListBox;
    EditElemDeck: TEdit;
    ButtonAddBeginDeck: TButton;
    ButtonAddEndDeck: TButton;
    ButtonDeleteBeginDeck: TButton;
    ButtonDeleteEndDeck: TButton;
    ButtonDeleteListDeck: TButton;
    ListBoxDeck1: TListBox;
    GroupBoxQueue: TGroupBox;
    Label2: TLabel;
    ListBoxQueue: TListBox;
    EditElemQueue: TEdit;
    ButtonAddQueue: TButton;
    ButtonDeleteElemQueue: TButton;
    ButtonDeleteListQueue: TButton;
    procedure ButtonAddBeginDeckClick(Sender: TObject);
    procedure ButtonAddEndDeckClick(Sender: TObject);
    procedure ButtonAddQueueClick(Sender: TObject);
    procedure ButtonAddStackClick(Sender: TObject);
    procedure ButtonDeleteBeginDeckClick(Sender: TObject);
    procedure ButtonDeleteElemQueueClick(Sender: TObject);
    procedure ButtonDeleteElemStackClick(Sender: TObject);
    procedure ButtonDeleteEndDeckClick(Sender: TObject);
    procedure ButtonDeleteListDeckClick(Sender: TObject);
    procedure ButtonDeleteListQueueClick(Sender: TObject);
    procedure ButtonDeleteListStackClick(Sender: TObject);
    procedure EditElemDeckChange(Sender: TObject);
    procedure EditElemQueueChange(Sender: TObject);
    procedure EditElemStackChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MConditionClick(Sender: TObject);
    procedure MDeckClick(Sender: TObject);
    procedure MExitClick(Sender: TObject);
    procedure MLoadClick(Sender: TObject);
    procedure MQuestClick(Sender: TObject);
    procedure MQueueClick(Sender: TObject);
    procedure MSaveClick(Sender: TObject);
    procedure MStackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  InUse: structures;
  st : tstack;
  qu : tqueue;
  de : tdeck;

implementation

{$R *.dfm}

procedure ShowListStack(const st:tstack; var listbox:tlistbox);
var i:integer;
begin
  ListBox.Clear;
  i := 0;
  while i<>st.k do
  begin
    ListBox.Items.Add(inttostr(st.mas[i]));
    i := i+1;
  end;
end;

procedure inputstack(var st:tstack; var f:textfile);
var i:integer;
begin
  i := 0;
  while not(eof(f)) do
  begin
    st.k := i+1;
    SetLength(st.mas,st.k);
    readln(f,st.mas[i]);
    i := i+1;
  end;
end;

procedure outputstack(const st:tstack; var f:textfile);
var i:integer;
begin
  for i := 0 to (st.k-1) do
    writeln(f,st.mas[i]);
end;

procedure ShowListQueue(const qu:tqueue; var listbox:tlistbox);
var i:integer;
begin
  ListBox.Clear;
  i := 0;
  while i<>qu.k do
  begin
    ListBox.Items.Add(inttostr(qu.mas[i]));
    i := i+1;
  end;
end;

procedure inputqueue(var qu:tqueue; var f:textfile);
var i:integer;
begin
  i := 0;
  while not(eof(f)) do
  begin
    qu.k := i+1;
    SetLength(qu.mas,qu.k);
    readln(f,qu.mas[i]);
    i := i+1;
  end;
end;

procedure outputqueue(const qu:tqueue; var f:textfile);
var i:integer;
begin
  for i := 0 to (qu.k-1) do
    writeln(f,qu.mas[i]);
end;

procedure ShowListDeck1(const de:tdeck; var listbox:tlistbox);
var i:integer;
begin
  ListBox.Clear;
  i := 0;
  while i<>de.k do
  begin
    ListBox.Items.Add(inttostr(de.mas[i]));
    i := i+1;
  end;
end;

procedure ShowListDeck2(const de:tdeck; var listbox:tlistbox);
var i:integer;
begin
  ListBox.Clear;
  i := de.k-1;
  while i<>-1 do
  begin
    ListBox.Items.Add(inttostr(de.mas[i]));
    i := i-1;
  end;
end;

procedure inputdeck(var de:tdeck; var f:textfile);
var i:integer;
begin
  i := 0;
  while not(eof(f)) do
  begin
    de.k := i+1;
    SetLength(de.mas,de.k);
    readln(f,de.mas[i]);
    i := i+1;
  end;
end;

procedure outputdeck(const de:tdeck; var f:textfile);
var i:integer;
begin
  for i := 0 to (de.k-1) do
    writeln(f,de.mas[i]);
end;


//Кнопки


procedure TForm1.ButtonAddBeginDeckClick(Sender: TObject);
var n:tinfo;
begin
  n := strtoint(EditElemDeck.Text);
  AddBeginDeck(de,n);
  ShowListDeck1(de,listboxdeck1);
  ShowListDeck2(de,listboxdeck2);
  EditElemDeck.SetFocus;
end;

procedure TForm1.ButtonAddEndDeckClick(Sender: TObject);
var n:tinfo;
begin
  n := strtoint(EditElemDeck.Text);
  AddEndDeck(de,n);
  ShowListDeck1(de,listboxdeck1);
  ShowListDeck2(de,listboxdeck2);
  EditElemDeck.SetFocus
end;

procedure TForm1.ButtonAddQueueClick(Sender: TObject);
var n:tinfo;
begin
  n := strtoint(EditElemQueue.Text);
  AddQueue(qu,n);
  ShowListQueue(qu,listboxqueue);
  EditElemQueue.SetFocus;
end;

procedure TForm1.ButtonAddStackClick(Sender: TObject);
var n:tinfo;
begin
  n := strtoint(EditElemStack.Text);
  AddStack(st,n);
  ShowListStack(st,listboxstack);
  EditElemStack.SetFocus;
end;

procedure TForm1.ButtonDeleteBeginDeckClick(Sender: TObject);
begin
  if IsEmptyDeck(de) then
    ShowMessage('Дек пустой')
  else
    DeleteElemBeginDeck(de);
  ShowListDeck1(de,listboxdeck1);
  ShowListDeck2(de,listboxdeck2);
  EditElemDeck.SetFocus;
end;

procedure TForm1.ButtonDeleteElemQueueClick(Sender: TObject);
begin
  if IsEmptyQueue(qu) then
    ShowMessage('Очередь пустая')
  else
    DeleteElemQueue(qu);
  ShowListQueue(qu,listboxqueue);
  EditElemQueue.SetFocus;
end;

procedure TForm1.ButtonDeleteElemStackClick(Sender: TObject);
begin
  if IsEmptyStack(st) then
    ShowMessage('Стек пуст')
  else
    DeleteElemStack(st);
  ShowListStack(st,listboxstack);
  EditElemStack.SetFocus;
end;

procedure TForm1.ButtonDeleteEndDeckClick(Sender: TObject);
begin
  if IsEmptyDeck(de) then
    ShowMessage('Дек пустой')
  else
    DeleteElemEndDeck(de);
  ShowListDeck1(de,listboxdeck1);
  ShowListDeck2(de,listboxdeck2);
  EditElemDeck.SetFocus;
end;

procedure TForm1.ButtonDeleteListDeckClick(Sender: TObject);
begin
  if IsEmptyDeck(de) then
    ShowMessage('Дек пустой')
  else
    DeleteListDeck(de);
  ShowListDeck1(de,listboxdeck1);
  ShowListDeck2(de,listboxdeck2);
  EditElemDeck.SetFocus;
end;

procedure TForm1.ButtonDeleteListQueueClick(Sender: TObject);
begin
  if IsEmptyQueue(qu) then
    ShowMessage('Очередь пустая')
  else
    DeleteListQueue(qu);
  ShowListQueue(qu,listboxqueue);
  EditElemQueue.SetFocus;
end;

procedure TForm1.ButtonDeleteListStackClick(Sender: TObject);
begin
  if IsEmptyStack(st) then
    ShowMessage('Стек пуст')
  else
    DeleteListStack(st);
  ShowListStack(st,listboxstack);
  EditElemStack.SetFocus;
end;

procedure TForm1.EditElemDeckChange(Sender: TObject);
begin
  if (strtoint(EditElemDeck.Text)<-20) and (strtoint(EditElemDeck.Text)>50)  then
    EditElemDeck.Text := ''
  else
  begin
    ButtonAddBeginDeck.Enabled := true;
    ButtonAddEndDeck.Enabled := true;
  end;
end;

procedure TForm1.EditElemQueueChange(Sender: TObject);
begin
  if (strtoint(EditElemQueue.Text)<-20) and (strtoint(EditElemQueue.Text)>50)  then
    EditElemQueue.Text := ''
  else
  begin
    ButtonAddQueue.Enabled := true;
  end;
end;

procedure TForm1.EditElemStackChange(Sender: TObject);
begin
  if (strtoint(EditElemStack.Text)<-20) and (strtoint(EditElemStack.Text)>50)  then
    EditElemStack.Text := ''
  else
  begin
    ButtonAddStack.Enabled := true;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InUse := Stack;
  GroupBoxStack.Visible := True;
  GroupBoxQueue.Visible := False;
  GroupBoxDeck.Visible := False;
  MStack.Checked := true;
end;

procedure TForm1.MConditionClick(Sender: TObject);
begin
Application.MessageBox('Из стека/очереди удалить эл-ты, попадающие в диапазон [-10..30]'#13#10'Из дека удалить эл-ты, попадающие в диапазон [-10..30], при условии, что они находятся на одинаковом расстоянии от краев дека',
                         'Условие', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.MDeckClick(Sender: TObject);
begin
  if InUse = Deck then
    exit;
  MDeck.Checked := true;
  if InUse = Stack then
  begin
    ListBoxStack.Clear;
    DeleteListStack(st);
    MStack.Checked := false;
    GroupBoxStack.Visible := false;
    GroupBoxDeck.Visible := true;
    InUse := Deck;
  end
  else
  begin
    ListBoxQueue.Clear;
    DeleteListQueue(qu);
    MQueue.Checked := false;
    GroupBoxQueue.Visible := false;
    GroupBoxDeck.Visible := true;
    InUse := Deck;
  end;
end;

procedure TForm1.MExitClick(Sender: TObject);
begin
  Close
end;

procedure TForm1.MLoadClick(Sender: TObject);
var f:textfile;
begin
  OpenDialog.InitialDir := GetCurrentDir;
  if OpenDialog.Execute then
  begin
    try
      AssignFile(f, OpenDialog.FileName);
      Reset(f);
    except
      Application.MessageBox(PWideChar('Невозможно открыть файл для чтения'),
                           'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
    if InUse = deck then
    begin
      inputdeck(de,f);
      ShowListDeck1(de,listboxdeck1);
      ShowListDeck2(de,listboxdeck2);
    end
    else
      if InUse=Stack then
      begin
        inputstack(st,f);
        ShowListStack(st,listboxstack);
      end
      else
      begin
        inputqueue(qu,f);
        ShowlistQueue(qu,listboxqueue);
      end;
      CloseFile(f);
  end;
end;

procedure TForm1.MQuestClick(Sender: TObject);
var fl:boolean;
begin
  fl := true;
  if InUse = Stack then
  begin
    if IsEmptyStack(st) then
      ShowMessage('Стек пуст')
    else
    begin
      while fl do
        QuestStack(st,fl);
      ShowListStack(st,listboxstack);
    end;
  end
  else
    if InUse = Queue then
    begin
      if IsEmptyQueue(qu) then
        ShowMessage('Очередь пуста')
      else
      begin
        while fl do
          QuestQueue(qu,fl);
        ShowListQueue(qu,listboxqueue);
      end;
    end
    else
    begin
      if IsEmptyDeck(de) then
        ShowMessage('Дек пуст')
      else
      begin
        while fl do
          QuestDeck(de,fl);
          ShowListDeck1(de,listboxdeck1);
          ShowListDeck2(de,listboxdeck2);
      end;
    end;

end;

procedure TForm1.MQueueClick(Sender: TObject);
begin
  if Inuse = Queue then
    exit;
  MQueue.Checked := true;
  if InUse = Stack then
  begin
    ListBoxStack.Clear;
    DeleteListStack(st);
    MStack.Checked := false;
    GroupBoxStack.Visible := false;
    GroupBoxQueue.Visible := true;
    InUse := Queue;
  end
  else
  begin
    ListBoxDeck1.Clear;
    ListBoxDeck2.Clear;
    DeleteListDeck(de);
    MDeck.Checked := false;
    GroupBoxDeck.Visible := false;
    GroupBoxQueue.Visible := true;
    InUse := Queue;
  end;
end;

procedure TForm1.MSaveClick(Sender: TObject);
var f:textfile;
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
    if InUse = Stack then
      outputstack(st,f)
    else
      if InUse = Queue then
        outputqueue(qu,f)
      else
        outputdeck(de,f);
    Closefile(f);
  end;
end;

procedure TForm1.MStackClick(Sender: TObject);
begin
  if InUse = Stack then
    exit;
  MStack.Checked := true;
  if InUse = Queue then
  begin
    ListBoxQueue.Clear;
    DeleteListQueue(qu);
    MQueue.Checked := false;
    GroupBoxQueue.Visible := false;
    GroupBoxStack.Visible := true;
    InUse := Stack;
  end
  else
  begin
    ListBoxDeck1.Clear;
    ListBoxDeck2.Clear;
    DeleteListDeck(de);
    MDeck.Checked := false;
    GroupBoxDeck.Visible := false;
    GroupBoxStack.Visible := true;
    InUse := Stack;
  end;
end;

end.
