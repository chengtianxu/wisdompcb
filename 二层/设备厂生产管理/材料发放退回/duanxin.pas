unit duanxin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB;

type
  TForm_duanxin = class(TForm)
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    ads21: TADODataSet;
    DataSource1: TDataSource;
    ads21USER_LOGIN_NAME: TStringField;
    ads21USER_FULL_NAME: TStringField;
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_duanxin: TForm_duanxin;

implementation

uses damo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm_duanxin.DBGridEh1EditButtonClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  user_login:string;
begin

try
 frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
 InputVar.Fields := 'USER_LOGIN_NAME/用户代码/160,USER_FULL_NAME/用户名称/250';
 InputVar.Sqlstr := 'select USER_FULL_NAME,USER_LOGIN_NAME from data0073 '+
                    'where USER_GROUP_FLAG=1 and ACTIVE_FLAG=0 '+
                    'order by USER_LOGIN_NAME';
 InputVar.AdoConn := DM.ADOConnection1 ;
 frmPick_Item_Single.InitForm_New(InputVar)  ;
if frmPick_Item_Single.ShowModal=mrok then
 begin
  self.ads21.Edit;
  self.ads21USER_LOGIN_NAME.Value:=
    frmPick_Item_Single.adsPick.FieldValues['USER_LOGIN_NAME'];
  self.ads21.Post;
  user_login:=self.ads21USER_LOGIN_NAME.Value;
  self.ads21.Close;
  self.ads21.Open;
  self.ads21.Locate('USER_LOGIN_NAME',user_login,[]);
 end;
finally
 frmPick_Item_Single.adsPick.Close;
 frmPick_Item_Single.Free ;
end;

end;

procedure TForm_duanxin.FormActivate(Sender: TObject);
begin
self.ads21.Open;
end;

procedure TForm_duanxin.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (key=46) and (ssCtrl in shift) then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='delete data0021 where USER_LOGIN_NAME='
              +quotedstr(self.ads21USER_LOGIN_NAME.Value);
    ExecSQL;
    self.ads21.Close;
    self.ads21.Open;
   end;
 end;
if (key=46) and (ssCtrl in shift) then abort;


 if (chr(key)='V') and (ssalt in shift) then
  ShowMessage( TADODataSet(DBGridEh1.DataSource.DataSet).CommandText);



end;

end.
