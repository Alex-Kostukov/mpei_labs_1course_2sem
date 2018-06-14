unit UnitForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids, UnitSort;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditInputTextFile: TEdit;
    EditOutputTextFile: TEdit;
    OpenDialog: TOpenDialog;
    MainMenu: TMainMenu;
    NCondition: TMenuItem;
    NFile: TMenuItem;
    NSort: TMenuItem;
    NExit: TMenuItem;
    NChooseInputFile: TMenuItem;
    NOutputTextFileClick: TMenuItem;
    NSortDirect: TMenuItem;
    NSortNatural: TMenuItem;
    StringGridResults: TStringGrid;
    GroupBox: TGroupBox;
    procedure NExitClick(Sender: TObject);
    procedure NConditionClick(Sender: TObject);
    procedure NChooseInputFileClick(Sender: TObject);
    procedure NOutputTextFileClickClick(Sender: TObject);
    procedure NSortDirectClick(Sender: TObject);
    procedure NSortNaturalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sgRows:integer;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGridResults.Cells[0, 0]:= 'Имя файла';
  StringGridResults.Cells[1, 0]:= 'Прямое слияние';
  StringGridResults.Cells[2, 0]:= 'Естественное слияние';
  NSortDirect.Enabled:=false;
  NSortNatural.Enabled:=false;
end;

procedure TForm1.NChooseInputFileClick(Sender: TObject);
begin
  OpenDialog.InitialDir := GetCurrentDir;
  OpenDialog.Options := [ofFileMustExist];
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    begin
      EditInputTextFile.Text := OpenDialog.FileName;
      sgRows := sgRows + 1;
      StringGridResults.RowCount := sgRows + 1;
      StringGridResults.Cells[0, sgRows] := ExtractFileName (EditInputTextFile.Text);;
      EditOutputTextFile.Text := EditInputTextFile.Text+'-out.txt';//OutputFileName(OpenDialog.FileName);
    end;
  NSortDirect.Enabled:=true;
  NSortNatural.Enabled:=true;
end;

procedure TForm1.NConditionClick(Sender: TObject);
begin
 Application.MessageBox('Реализовать сортировку текстового файла методами прямого слияния и естественного слияния',
                         'Внешняя сортировка', MB_OK or MB_ICONQUESTION);
end;

procedure TForm1.NExitClick(Sender: TObject);
begin
 Close;
end;

procedure TForm1.NOutputTextFileClickClick(Sender: TObject);
begin
   OpenDialog.InitialDir := GetCurrentDir;
  OpenDialog.Options := [];
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    EditOutputTextFile.Text := OpenDialog.FileName;
end;

procedure TForm1.NSortDirectClick(Sender: TObject);
  var
   time1, time2: TDateTime;
begin
  Screen.Cursor := crHourGlass;
  time1 := Time();
  SortByDirectMerge(EditInputTextFile.Text, EditOutputTextFile.Text);
  time2 := Time();
  StringGridResults.Cells[1, StringGridResults.RowCount-1]:=FormatDateTime('h.nn.ss:zzz', time2 - time1);

  Application.MessageBox('Файл отсортирован',
                         'Внешняя сортировка', MB_OK or MB_ICONINFORMATION);
  Screen.Cursor := crDefault;
end;

procedure TForm1.NSortNaturalClick(Sender: TObject);
  var
   time1, time2: TDateTime;
begin
  Screen.Cursor := crHourGlass;
  time1 := Time();
  SortByNaturalMerge(EditInputTextFile.Text, EditOutputTextFile.Text);
  time2 := Time();
  StringGridResults.Cells[2, StringGridResults.RowCount-1]:=FormatDateTime('h.nn.ss:zzz', time2 - time1);
  Application.MessageBox('Файл отсортирован',
                         'Внешняя сортировка', MB_OK or MB_ICONINFORMATION);
  Screen.Cursor := crDefault;
end;

end.
