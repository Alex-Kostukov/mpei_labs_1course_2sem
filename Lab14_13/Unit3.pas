unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormDialogNodes = class(TForm)
    EditLeft: TEdit;
    EditRight: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDialogNodes: TFormDialogNodes;

implementation

{$R *.dfm}

procedure TFormDialogNodes.Button1Click(Sender: TObject);
begin
  if not ((StrToInt( EditLeft.Text)>=-15) and (StrToInt( EditLeft.Text)<=25))then
    begin
      Application.MessageBox('Должен быть введён символ из диапазон от -15..25','Ошибка',MB_OK);
      EditLeft.Text := '';
    end;
  if not ((StrToInt( EditRight.Text)>=-15) and (StrToInt( EditRight.Text)<=25)) then
    begin
      Application.MessageBox('Должен быть введён символ из диапазон от -15..25','Ошибка',MB_OK);
      EditRight.Text := '';
    end;
end;

end.
