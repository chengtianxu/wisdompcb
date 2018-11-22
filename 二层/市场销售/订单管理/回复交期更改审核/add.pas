unit add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TFrm_add = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_add: TFrm_add;

implementation

uses dmo;

{$R *.dfm}

procedure TFrm_add.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_add.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_add.Button1Enter(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('完工日期不能为空');
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(DBEdit2.Text)='' then
  begin
    ShowMessage('完工数量不能为空');
    DBEdit2.SetFocus;
    Exit;
  end;
end;

end.
