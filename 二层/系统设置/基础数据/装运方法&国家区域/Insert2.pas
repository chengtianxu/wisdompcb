unit Insert2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,DB, Mask, DBCtrls;

type
  TForm_Insert2 = class(TForm)
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    edit:Boolean;
  public
    { Public declarations }
  end;

var
  Form_Insert2: TForm_Insert2;

implementation

uses dmo;

{$R *.dfm}
procedure TForm_Insert2.FormCreate(Sender: TObject);
begin
  edit:=False;
end;


procedure TForm_Insert2.btnSaveClick(Sender: TObject);
begin
  if Trim(Self.DBEdit1.Text)='' then
  begin
    ShowMessage('请输入国家代码');
    self.DBEdit1.SetFocus;
    Exit;
  end
  else
    if Trim(Self.DBEdit2.Text)='' then
    begin
      ShowMessage('请输入国家名称');
      Self.DBEdit2.SetFocus;
      Exit;
    end;
  if dmo.DM.ds250.State=dsEdit then
  begin
    dmo.DM.ds250.Post;
    ModalResult:=mrOk;
  end
  else
  begin
    dmo.DM.ds250.Post;
    dmo.DM.ds250.Append;
    DBEdit1.Text:='';
    DBEdit2.Text:='';
    Self.DBEdit1.SetFocus;
  end;
end;

procedure TForm_Insert2.btnCancelClick(Sender: TObject);
var smg:Integer;
begin
  smg:=0;
  if dmo.DM.ds250.State=dsInsert then
  begin
    dmo.DM.ds250.Cancel;
    ModalResult:=mrCancel;
  end
  else
  begin
    if (dmo.DM.ds250.Modified) or (edit) then
       smg:=MessageDlg('数据已被修改，是否保存数据？',mtConfirmation,[mbYes,mbno],0);
  end;
  if smg=7 then
  begin
    dmo.DM.ds250.Cancel;
    ModalResult:=mrCancel;
  end
  else
  begin
    if smg=6 then
    begin
      btnSaveClick(sender);
    end
    else
      dmo.DM.ds250.Cancel;
      ModalResult:=mrCancel;
  end;
end;

procedure TForm_Insert2.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  edit:=True;
end;

procedure TForm_Insert2.FormActivate(Sender: TObject);
begin
  if (dmo.DM.ds250.State=dsEdit) or (dmo.DM.ds250.State=dsInsert) then
    DBEdit1.SetFocus;
end;

procedure TForm_Insert2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmo.DM.ds250.Cancel;
end;

end.
