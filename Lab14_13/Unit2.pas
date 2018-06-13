unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormDialogRoot = class(TForm)
    Button1: TButton;
    EditRoot: TEdit;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDialogRoot: TFormDialogRoot;

implementation

{$R *.dfm}

procedure TFormDialogRoot.Button1Click(Sender: TObject);
begin
  if not ((StrToInt( EditRoot.Text)>=-15)and (StrToInt( EditRoot.Text)<=25 ))then
    begin
      Application.MessageBox('Должен быть введён символ из диапазон от -15..25','Ошибка',MB_OK);
      EditRoot.Text := '';
    end;
end;

end.
