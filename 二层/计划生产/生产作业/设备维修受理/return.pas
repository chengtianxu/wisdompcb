unit return;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_Return = class(TForm)
    Label1: TLabel;
    btnEnter: TButton;
    btnCancel: TButton;
    Memo1: TMemo;
    procedure btnCancelClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Return: TForm_Return;

implementation

{$R *.dfm}

procedure TForm_Return.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Return.btnEnterClick(Sender: TObject);
begin
  if Trim(Memo1.Lines.Text)='' then
  begin
    ShowMessage(''+self.Caption+'不能为空，请输入'+self.Caption+'');
    Memo1.SetFocus;
    Exit;
  end;
  ModalResult:=mrOk;
end;
procedure TForm_Return.FormShow(Sender: TObject);
begin
  Memo1.SetFocus;
end;

end.
