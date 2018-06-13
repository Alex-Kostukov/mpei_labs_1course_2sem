unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.Menus, Unit2,Unit3,Unit4;

type
  mas = array of integer;
  structures = (Stack, Queue, Deck);
  TForm1 = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    MainMenu: TMainMenu;
    MCondition: TMenuItem;
    MChoose: TMenuItem;
    MStack: TMenuItem;
    MQueue: TMenuItem;
    MSaveNLoad: TMenuItem;
    MSave: TMenuItem;
    MQuest: TMenuItem;
    MDeck: TMenuItem;
    MLoad: TMenuItem;
    MExit: TMenuItem;
    GroupBoxStack: TGroupBox;
    ListBoxStack: TListBox;
    Label1: TLabel;
    EditElemStack: TEdit;
    ButtonAddStack: TButton;
    GroupBoxQueue: TGroupBox;
    Label2: TLabel;
    ListBoxQueue: TListBox;
    EditElemQueue: TEdit;
    ButtonAddQueue: TButton;
    GroupBoxDeck: TGroupBox;
    ButtonDeleteElemQueue: TButton;
    ButtonDeleteListQueue: TButton;
    ButtonDeleteElemStack: TButton;
    ButtonDeleteListStack: TButton;
    ListBoxDeck2: TListBox;
    Label3: TLabel;
    EditElemDeck: TEdit;
    ButtonAddBeginDeck: TButton;
    ButtonAddEndDeck: TButton;
    ButtonDeleteBeginDeck: TButton;
    ButtonDeleteEndDeck: TButton;
    ButtonDeleteListDeck: TButton;
    ListBoxDeck1: TListBox;
    procedure MExitClick(Sender: TObject);
    procedure MConditionClick(Sender: TObject);
    procedure EditElemStackChange(Sender: TObject);
    procedure ButtonAddStackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MQuestClick(Sender: TObject);
    procedure MStackClick(Sender: TObject);
    procedure MQueueClick(Sender: TObject);
    procedure ButtonAddQueueClick(Sender: TObject);
    procedure ButtonDeleteElemQueueClick(Sender: TObject);
    procedure ButtonDeleteListQueueClick(Sender: TObject);
    procedure ButtonDeleteElemStackClick(Sender: TObject);
    procedure ButtonDeleteListStackClick(Sender: TObject);
    procedure EditElemQueueChange(Sender: TObject);
    procedure EditElemDeckChange(Sender: TObject);
    procedure ButtonAddBeginDeckClick(Sender: TObject);
    procedure ButtonAddEndDeckClick(Sender: TObject);
    procedure ButtonDeleteBeginDeckClick(Sender: TObject);
    procedure ButtonDeleteEndDeckClick(Sender: TObject);
    procedure ButtonDeleteListDeckClick(Sender: TObject);
    procedure MDeckClick(Sender: TObject);
    procedure MSaveClick(Sender: TObject);
    procedure MLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  InUse:Structures;
  st : tstack;
  qu : tqueue;
  de1,de2 : tdeck;

implementation

{$R *.dfm}

procedure inputmas(var x:mas; var f:textfile; var k:integer);
var i:integer;
begin
  i := 0;
  while not (eof(f)) do
  begin
    SetLength(x,i+1);
    readln(f,x[i]);
    i := i+1;
  end;
  k := i;
end;

procedure ShowListStack(const st:tstack; listbox:tlistbox);
var k:tstack;
begin
  ListBox.Clear;
  k := st;
  while (k<>nil) do
  begin
    ListBox.Items.Add(inttostr(k^.info));
    k := k^.next;
  end;
end;

procedure inputstack(const x:mas;const k:integer; var st:tstack);
var inform:tinfo;
         i:integer;
begin
  i := k-1;
  while (i<>-1) do
  begin
    inform := x[i];
    AddStack(st,inform);
    i := i-1;
  end;
end;

procedure outputstack(var f:textfile; const st:tstack);
var k:tstack;
begin
  k := st;
  while (k<>nil) do
  begin
    writeln(f,k^.info);
    k := k^.next;
  end;
end;

procedure ShowListQueue(const qu:tqueue; var listbox:tlistbox);
var k:tqueue;
begin
  ListBox.Clear;
  k := qu;
  while (k.head<>nil) do
  begin
    ListBox.Items.Add(inttostr(k.head^.info));
    k.head := k.head^.next;
  end;
end;

procedure inputqueue(const x:mas;const k:integer; var qu:tqueue);
var inform:tinfo;
         i:integer;
begin
  i := 0;
  while (i<>k) do
  begin
    inform := x[i];
    AddQueue(qu,inform);
    i := i+1;
  end;
end;

procedure outputqueue(var f:textfile; const qu:tqueue);
var k:tqueue;
begin
  k := qu;
  while (k.head<>nil) do
  begin
    writeln(f,k.head^.info);
    k.head := k.head^.next;
  end;
end;

procedure ShowListDeck1(const de1,de2:tdeck; var listbox:tlistbox);
var k:tdeck;
begin
  ListBox.Clear;
  k := de1;
  while (k<>nil) do
  begin
    ListBox.Items.Add(inttostr(k^.info));
    k := k^.next;
  end;

end;

procedure ShowListDeck2(const de1,de2:tdeck; var listbox:tlistbox);
var k:tdeck;
begin
  ListBox.Clear;
  k := de2;
  while (k<>nil) do
  begin
    ListBox.Items.Add(inttostr(k^.info));
    k := k^.prev;
  end;
end;

procedure outputdeck(var f:textfile; const de1,de2:tdeck);
var a:tdeck;
begin
  a := de1;
  while (a<>nil) do
  begin
    writeln(f, a^.info);
    a := a^.next;
  end;
end;

procedure inputdeck(const x:mas; const k:integer; var de1,de2:tdeck);
var    i:integer;
  inform:tinfo;
begin
  i := 0;
  while (i<>k) do
  begin
    inform := x[i];
    AddEndDeck(de1,de2,inform);
    i := i+1;
  end;
end;

// Кнопки

procedure TForm1.ButtonAddBeginDeckClick(Sender: TObject);
var n:tinfo;
begin
  n := strtoint(EditElemDeck.Text);
  AddBeginDeck(de1,de2,n);
  ShowListDeck1(de1,de2,listboxdeck1);
  ShowListDeck2(de1,de2,listboxdeck2);
  EditElemDeck.SetFocus;
end;

procedure TForm1.ButtonAddEndDeckClick(Sender: TObject);
var n:tinfo;
begin
  n := strtoint(EditElemDeck.Text);
  AddEndDeck(de1,de2,n);
  ShowListDeck1(de1,de2,listboxdeck1);
  ShowListDeck2(de1,de2,listboxdeck2);
  EditElemDeck.SetFocus;
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
  if IsEmptyDeck(de1,de2) then
    ShowMessage('Дек пустой')
  else
    DeleteElemBeginDeck(de1,de2);
  ShowListDeck1(de1,de2,listboxdeck1);
  ShowListDeck2(de1,de2,listboxdeck2);
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
  if IsEmptyDeck(de1,de2) then
    ShowMessage('Дек пустой')
  else
    DeleteElemEndDeck(de1,de2);
  ShowListDeck1(de1,de2,listboxdeck1);
  ShowListDeck2(de1,de2,listboxdeck2);
  EditElemDeck.SetFocus;
end;

procedure TForm1.ButtonDeleteListDeckClick(Sender: TObject);
begin
  if IsEmptyDeck(de1,de2) then
    ShowMessage('Дек пустой')
  else
    DeleteListDeck(de1,de2);
  ShowListDeck1(de1,de2,listboxdeck1);
  ShowListDeck2(de1,de2,listboxdeck2);
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
  if (strtoint(EditElemDeck.Text)<-15) and (strtoint(EditElemDeck.Text)>25)  then
    EditElemDeck.Text := ''
  else
  begin
    ButtonAddBeginDeck.Enabled := true;
    ButtonAddEndDeck.Enabled := true;
  end;
end;

procedure TForm1.EditElemQueueChange(Sender: TObject);
begin
  if (strtoint(EditElemQueue.Text)<-15) and (strtoint(EditElemQueue.Text)>25)  then
    EditElemQueue.Text := ''
  else
  begin
    ButtonAddQueue.Enabled := true;
  end;
end;

procedure TForm1.EditElemStackChange(Sender: TObject);
begin
  if (strtoint(EditElemStack.Text)<-15) and (strtoint(EditElemStack.Text)>25)  then
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
Application.MessageBox('Из стека/очереди удалить нечётные элементы'#13#10'Из дека удалить нечётные элементы, при условии, что они находятся на одинаковом расстоянии от краев дека',
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
var x:mas;
    f:textfile;
    k:integer;
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
    inputmas(x,f,k);
    if InUse = deck then
    begin
      inputdeck(x,k,de1,de2);
      ShowListDeck1(de1,de1,listboxdeck1);
      ShowListDeck2(de1,de2,listboxdeck2);
    end
    else
      if InUse=Stack then
      begin
        inputstack(x,k,st);
        ShowListStack(st,listboxstack);
      end
      else
      begin
        inputqueue(x,k,qu);
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
      if IsEmptyDeck(de1,de2) then
        ShowMessage('Дек пуст')
      else
      begin
        while fl do
          QuestDeck(de1,de2,fl);
          ShowListDeck1(de1,de2,listboxdeck1);
          ShowListDeck2(de1,de2,listboxdeck2);
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
    DeleteListDeck(de1,de2);
    MDeck.Checked := false;
    GroupBoxDeck.Visible := false;
    GroupBoxQueue.Visible := true;
    InUse := Queue;
  end;
end;

procedure TForm1.MSaveClick(Sender: TObject);
var f:TextFile;
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
      outputstack(f,st)
    else
      if InUse = Queue then
        outputqueue(f,qu)
      else
        outputdeck(f,de1,de2);
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
    DeleteListDeck(de1,de2);
    MDeck.Checked := false;
    GroupBoxDeck.Visible := false;
    GroupBoxStack.Visible := true;
    InUse := Stack;
  end;
end;

end.
