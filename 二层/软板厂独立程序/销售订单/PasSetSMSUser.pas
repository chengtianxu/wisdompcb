unit PasSetSMSUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons;

type
  TfrmSetSMSUser = class(TForm)
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    ADODataSet1USER_LOGIN_NAME: TStringField;
    ADODataSet1USER_FULL_NAME: TStringField;
    ADODataSet1DEPT_NAME: TStringField;
    ADODataSet1RKEY: TAutoIncField;
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetSMSUser: TfrmSetSMSUser;

implementation

uses damo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmSetSMSUser.DBGridEh1EditButtonClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  user_login:string;
begin
  if (DBGridEh1.SelectedIndex=0) then
  begin
    try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
      InputVar.Fields := 'USER_LOGIN_NAME/用户代码/120,USER_FULL_NAME/用户名称/120,DEPT_NAME/部门/150';
      InputVar.Sqlstr := 'select Data0073.USER_LOGIN_NAME,Data0073.USER_FULL_NAME,Data0034.DEPT_NAME,Data0073.RKEY'
                        +' from Data0073 left join Data0005 on Data0073.EMPLOYEE_PTR=Data0005.RKEY'
                        +' left join Data0034 on Data0005.EMPLOYEE_ID=Data0034.RKEY where Data0073.USER_GROUP_FLAG=1 and Data0073.ACTIVE_FLAG=0 and Data0034.TTYPE=4';
      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single.InitForm_New(InputVar)  ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
       with dm.aqTmp do
       begin
        close;
        sql.Text:='insert into rb001 values('+quotedstr(frmPick_Item_Single.adsPick.FieldByName('Rkey').AsString)+')';
        ExecSQL;
        user_login:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
        ADODataSet1.Close;
        ADODataSet1.Open;
       end;
       ADODataSet1.Locate('Rkey',user_login,[]);
      end;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
    end;
  end;
end;

procedure TfrmSetSMSUser.FormShow(Sender: TObject);
begin
  ADODataSet1.Open;
end;

procedure TfrmSetSMSUser.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=46) and (ssCtrl in shift) then
 begin
  with dm.aqTmp do
   begin
    close;
    sql.Text:='delete from rb001 where Rkey73='+ADODataSet1RKEY.AsString;
    ExecSQL;
    ADODataSet1.Close;
    ADODataSet1.Open;
   end;
 end;
if (key=46) and (ssCtrl in shift) then abort;
end;

end.
