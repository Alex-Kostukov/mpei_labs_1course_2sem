unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Unit2, Unit3,
  Vcl.StdCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList, Vcl.StdActns,
  System.ImageList, Vcl.ImgList;

type
  PNode = ^TTree;
  TTree = record
    info: -15..25;
    left,right: PNode;
  end;
  TForm1 = class(TForm)
    Tree: TTreeView;
    PopupMenu: TPopupMenu;
    NInsert: TMenuItem;
    NDelete: TMenuItem;
    MainMenu: TMainMenu;
    NTask: TMenuItem;
    N4: TMenuItem;
    NSolve: TMenuItem;
    NClose: TMenuItem;
    NLoad: TMenuItem;
    NSave: TMenuItem;
    EditCount: TEdit;
    Label1: TLabel;
    ToolBar: TToolBar;
    ActionList1: TActionList;
    ImageList1: TImageList;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    ToolButtonSave: TToolButton;
    ToolButtonOpen: TToolButton;
    Action1: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolButtonSolve: TToolButton;
    procedure NCloseClick(Sender: TObject);
    procedure NTaskClick(Sender: TObject);
    procedure NInsertClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure NDeleteClick(Sender: TObject);
    procedure NLoadClick(Sender: TObject);
    procedure NSaveClick(Sender: TObject);
    procedure NSolveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  root: PNode;

implementation

{$R *.dfm}

procedure TForm1.NDeleteClick(Sender: TObject);
begin
if Tree.SelectionCount = 1 then
    if Application.MessageBox('Вы уверены, что хотите удалить вершину, её подвершины и соседнюю вершину?',
                              'Бинарное дерево', MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDYES then
    begin
      if Tree.Selected.getPrevSibling <> nil then
        Tree.Selected.getPrevSibling.Delete;
      if Tree.Selected.getNextSibling <> nil then
        Tree.Selected.getNextSibling.Delete;
      Tree.Selected.Delete;
      EditCount.Text := '';
      if Tree.Items.Count = 0 then
      begin
        NSave.Enabled  := false;
        NSolve.Enabled := false;
        ToolButtonSave.Enabled  := false;
        ToolButtonSolve.Enabled := false;
      end;
    end;
end;

procedure TForm1.NInsertClick(Sender: TObject);
begin
  if Tree.Items.Count = 0 then
  begin
    if FormDialogRoot.ShowModal = mrOk then
    begin
      Tree.Items.AddChild(nil, FormDialogRoot.EditRoot.Text);
      NSave.Enabled  := true;
      NSolve.Enabled := true;
      ToolButtonSave.Enabled  := true;
      ToolButtonSolve.Enabled := true;
    end;
  end
  else
    if Tree.SelectionCount = 1 then
    begin
      if Tree.Selected.HasChildren then
      begin
        ShowMessage('Вершина уже имеет поддеревья');
        Exit;
      end;
      if FormDialogNodes.ShowModal = mrOk then
      begin
        Tree.Items.AddChild(Tree.Selected, FormDialogNodes.EditLeft.Text);
        Tree.Items.AddChild(Tree.Selected, FormDialogNodes.EditRight.Text);
        Tree.Selected.Expand(true);
        EditCount.Text := '';
      end;
    end
    else
      ShowMessage('Дерево уже имеет корневую вершину. Выберите вершину для вставки поддерева');
end;

procedure TForm1.NLoadClick(Sender: TObject);
begin
  OpenDialog.InitialDir := GetCurrentDir;
  if OpenDialog.Execute then
  begin
    try
      Tree.LoadFromFile(OpenDialog.FileName);
    except
      Application.MessageBox('Невозможно открыть указанный файл для чтения', 'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end;
end;

procedure TForm1.NSaveClick(Sender: TObject);
begin
  SaveDialog.InitialDir := GetCurrentDir;
  if SaveDialog.Execute then
    begin
    try
      Tree.SaveToFile(SaveDialog.FileName+'.dat');
    except
      Application.MessageBox('Невозможно сохранить', 'Ошибка', MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end;
end;

function Search(root: PNode):integer;
begin
  if root = nil then
    result := 0
  else
    result := Search(root.left)+ord((root.info mod 2 <>0 ))
     + Search(root.right);
end;

procedure AddNodes(tree: TTreeView; node: TTreeNode; root: PNode);
var
  newNode: TTreeNode;
begin
  if root<>nil then
    begin
      newNode := tree.Items.AddChild(node,inttostr(root.info));
      AddNodes(tree,newNode,root.left);
      AddNodes(tree,newNode,root.right);
    end;
end;

procedure CreateFromTree(tree: TTreeNode; var root: PNode);
begin
  new(root);
  root.info := strtoint(tree.Text[1]);
  if tree.HasChildren then
    begin
      CreateFromTree(tree.getFirstChild,root.left);
      CreateFromTree(tree.getLastChild,root.right);
    end
  else
    begin
      root.left := nil;
      root.right := nil;
    end;
end;

procedure Delete(var root: PNode);
begin
  if root<>nil then
    begin
      Delete(root.left);
      Delete(root.right);
      dispose(root);
      root := nil;
    end;
end;

procedure TForm1.NSolveClick(Sender: TObject);
begin
  Delete(root);
  CreateFromTree(Tree.Items.GetFirstNode, root);
  EditCount.Text := IntToStr(Search(root));
end;

procedure TForm1.NCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.NTaskClick(Sender: TObject);
begin
  Application.MessageBox('Создать бинарное дерево из символов в'+
  ' диапазоне от -15 до +25. Найти в дереве количество нечётных элементов',
  'Условие',MB_OK)
end;

procedure TForm1.PopupMenuPopup(Sender: TObject);
begin
  if Tree.Items.Count = 0 then
    NDelete.Visible := false
  else
    NDelete.Visible := true;
end;

end.
