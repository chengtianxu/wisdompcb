unit PasDispatchSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TFrmDispatchSMS = class(TForm)
    ads59: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    ads59USER_LOGIN_NAME: TStringField;
    ads59d34_Ptr: TIntegerField;
    ads59DEPT_CODE: TStringField;
    ads59DEPT_NAME: TStringField;
    ads59USER_FULL_NAME: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Ado59: TADOQuery;
    Ado59USER_LOGIN_NAME: TStringField;
    Ado59d34_Ptr: TIntegerField;
    Label2: TLabel;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDispatchSMS: TFrmDispatchSMS;

implementation
uses common,Pick_Item_Single,ConstVar, pasOnlineQuery, PasDM;

{$R *.dfm}

procedure TFrmDispatchSMS.FormActivate(Sender: TObject);
begin
  ads59.Open;
  Ado59.Open;
end;

procedure TFrmDispatchSMS.N1Click(Sender: TObject);
var tmpAdo:TADOQuery;
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not ads59.IsEmpty) then
  begin
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=DM.ADOConnection1;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='delete data0059 where USER_LOGIN_NAME='+quotedstr(self.ads59USER_LOGIN_NAME.Value)+' and d34_Ptr='+ads59d34_Ptr.AsString;
      tmpAdo.ExecSQL;
      self.ads59.Close;
      self.ads59.Open;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
      tmpAdo:=nil;
    end;
  end;
end;

procedure TFrmDispatchSMS.DBGridEh1EditButtonClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  user_login:string;
begin
  if (Trim(Edit3.Text)<>'') then
  begin
    ShowMsg('新增请选清空查询框！',1);
    Exit;
  end;
  if (DBGridEh1.SelectedIndex=2) then
  begin
     if (self.Ads59d34_Ptr.AsString='') then
     begin
       ShowMsg('请先选择工序！',1);
       Exit;
     end;
    try
     frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
     InputVar.Fields := 'USER_LOGIN_NAME/用户代码/160,USER_FULL_NAME/用户名称/250';
     InputVar.Sqlstr :='select USER_FULL_NAME,USER_LOGIN_NAME from data0073 '+
                      'where USER_GROUP_FLAG=1 and ACTIVE_FLAG=0 '+
                      'order by USER_LOGIN_NAME';
     InputVar.AdoConn := DM.ADOConnection1 ;
     frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      ads59.Edit;
      ads59USER_LOGIN_NAME.Value:=frmPick_Item_Single.adsPick.FieldValues['USER_LOGIN_NAME'];
      ads59.Post;
      Ado59.Edit;
      Ado59USER_LOGIN_NAME.Value:=frmPick_Item_Single.adsPick.FieldValues['USER_LOGIN_NAME'];
      Ado59.Post;
      Ado59.UpdateBatch();
      user_login:=self.ads59USER_LOGIN_NAME.Value;
      ads59.Close;
      ads59.Open;
      ads59.Locate('USER_LOGIN_NAME',user_login,[]);
     end;
    finally
     frmPick_Item_Single.adsPick.Close;
     frmPick_Item_Single.Free ;
    end;
  end else
  if (DBGridEh1.SelectedIndex=0) then
  begin
    try
     frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
     InputVar.Fields := 'DEPT_CODE/工序代码/160,DEPT_NAME/工序名称/250';
     InputVar.Sqlstr := 'select Rkey,DEPT_CODE,DEPT_NAME from dbo.data0034 where TType=1 order by DEPT_CODE';
     InputVar.AdoConn := DM.ADOConnection1 ;
     frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      ads59.Append;
      Ads59d34_Ptr.Value:=frmPick_Item_Single.adsPick.FieldValues['Rkey'];
      ads59DEPT_CODE.Value:=frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
      ads59DEPT_NAME.Value:=frmPick_Item_Single.adsPick.FieldValues['DEPT_NAME'];
      ads59.Post;
      Ado59.Append;
      Ado59d34_Ptr.Value:=frmPick_Item_Single.adsPick.FieldValues['Rkey'];
      Ado59.Post;
     end;
    finally
     frmPick_Item_Single.adsPick.Close;
     frmPick_Item_Single.Free ;
    end;
  end;
end;

procedure TFrmDispatchSMS.Edit3Change(Sender: TObject);
begin
  if Trim(Edit3.Text)<>'' then
    ads59.Filter:='DEPT_CODE like '''+ Trim(Edit3.Text)+'%'''
  else
    ads59.Filter:='';
end;

procedure TFrmDispatchSMS.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDispatchSMS.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

end.
