unit Frm_note_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, ADODB;

type
  TFrm_note = class(TForm)
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    DS11: TDataSource;
    BitBtn2: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    b:boolean;
  public
    { Public declarations }
  end;

var
  Frm_note: TFrm_note;

implementation
 uses DM_u;
{$R *.dfm}

procedure TFrm_note.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if BitBtn1.Enabled and (trim(DBMemo1.Text)='') and not B then
  begin
    CanClose:=false;
    showmessage('请输入退回原因...');
  end else
    CanClose:=true;
end;

procedure TFrm_note.BitBtn2Click(Sender: TObject);
begin
  B:=true;
end;

end.
