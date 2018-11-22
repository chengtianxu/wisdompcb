unit Uedit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB, ADODB,IdFTP;

type
  TfrmEdit2 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    eh_file: TDBGridEh;
    btn_Save: TBitBtn;
    btn_exit: TBitBtn;
    pm1: TPopupMenu;
    mni_Sel: TMenuItem;
    NDel: TMenuItem;
    qry_temp: TADOQuery;
    qry_tc: TADOQuery;
    qry_DP: TADOQuery;
    ds_tc: TDataSource;
    qry_tcSave: TADOQuery;
    lbl1: TLabel;
    edt_Dept: TEdit;
    btn_SelDept: TBitBtn;
    lbl2: TLabel;
    edt_post: TEdit;
    btn_SelPost: TBitBtn;
    atncfld_tcrkey: TAutoIncField;
    intgrfld_tcM_ptr: TIntegerField;
    intgrfld_tcTC_ptr: TIntegerField;
    strngfld_tcCCode: TStringField;
    strngfld_tcCname: TStringField;
    atncfld_DPrkey: TAutoIncField;
    intgrfld_DPDeptID: TIntegerField;
    intgrfld_DPPostID: TIntegerField;
    lbl6: TLabel;
    cbb_CType: TComboBox;
    intgrfld_DPCType: TIntegerField;
    procedure mni_SelClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelPostClick(Sender: TObject);
    procedure NDelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
  private
    { Private declarations }
    FIDKey:string;
    function GetIDKey: string;
    function CheckFtpDir(AFtp:TIdFTP;ADir: string): Boolean;
    procedure CreateDir(AFtp: TIdFTP; ADir: string);
  public
    { Public declarations }
    FRkey:integer;
    FEditType:integer;
    procedure GetData(Arkey:integer);
  end;

var
  frmEdit2: TfrmEdit2;

implementation
      uses common,UDM,Pick_Item_Single,ConstVar,SelTClass2;
{$R *.dfm}

procedure TfrmEdit2.CreateDir(AFtp: TIdFTP; ADir: string);
var
  LStrList:TStringList;
  LDir:string;
  i:Integer;
begin
  LDir:='/';
  LStrList:= TStringList.Create;
  try
    LStrList.Delimiter:='/';
    LStrList.DelimitedText:= ADir;
    if AFtp.Connected then
    begin
      for i:=1 to LStrList.Count - 2 do
      begin
        AFtp.ChangeDir(LDir);
        LDir:= LDir + LStrList[i] + '/';
        try
          AFtp.ChangeDir(LDir);
        except
          AFtp.MakeDir(LStrList[i]);
        end;
      end;
    end;
  finally
    LStrList.Free;
  end;
end;

function TfrmEdit2.CheckFtpDir(AFtp:TIdFTP;ADir: string): Boolean;
begin
  Result:= False;
  if AFtp.Connected then
  try
    AFtp.ChangeDir(ADir);
    Result:= True;
  except
    Result:= False;
  end;
end;

function TfrmEdit2.GetIDKey: string;
var
  FGUID:TGUID;
begin
  CreateGUID(FGUID);
  Result:= GUIDToString(FGUID);
end;

procedure TfrmEdit2.GetData(Arkey: integer);
var
  Lsql:string;
begin
   qry_DP.Close;
   qry_DP.Parameters[0].value:=Arkey;
   qry_DP.Open;

   qry_tc.close;
   qry_tc.Parameters[0].Value:=Arkey ;
   qry_tc.Open;

   qry_tcSave.close;
   qry_tcSave.Parameters[0].Value:=Arkey ;
   qry_tcSave.Open;

  if FEditType>1  then
  begin
     Lsql:='select rkey,departmentName from datadepartment where rkey='+qry_DP.Fieldbyname('DeptID').AsString+'';
     dm.OpenQry(qry_temp,Lsql);
     edt_Dept.Text:= qry_temp.Fieldbyname('departmentName').AsString;
     edt_Dept.tag:= qry_DP.Fieldbyname('Deptid').asinteger;

     Lsql:='select rkey,item from dataDetail where dictid=1 and  rkey='+qry_DP.Fieldbyname('Postid').AsString+'';
     dm.OpenQry(qry_temp,Lsql);
     edt_post.Text:= qry_temp.Fieldbyname('item').AsString;
     edt_post.tag:= qry_DP.Fieldbyname('Postid').asinteger;

   cbb_CType.ItemIndex:= qry_DP.Fieldbyname('CType').value  ;

  end;

end;

procedure TfrmEdit2.mni_SelClick(Sender: TObject);
var
  LFrm:TfrmSelTClass2;
  Lsql,Str:string;
begin
  LFrm:=TfrmSelTClass2.Create(self);
  try
   if not LFrm.qry1.Active  then  LFrm.qry1.open;

   if not qry_tc.IsEmpty then
   begin
     str:='';
     qry_tc.first;
     while not  qry_tc.Eof do
     begin
     str:=str+ 'rkey<>'+ qry_tc.fieldbyname('tc_ptr').asstring+' and ';
     qry_tc.Next ;
     end;
     str:=Copy(str,0,Length(str)-4);
   end;

   LFrm.qry1.Filtered:=false;
   LFrm.qry1.Filter:=str;
   LFrm.qry1.Filtered:=true;

   if LFrm.ShowModal=mrok  then
   begin
   LFrm.qry1.Filtered:=false;
   LFrm.qry1.Filter:='  isSelected=1' ;;
   LFrm.qry1.Filtered:=true;

   LFrm.qry1.first;
   while not LFrm.qry1.eof do
   begin
   qry_tc.Append;
   qry_tc.FieldByName('tc_ptr').Value:=Lfrm.qry1.FieldByName('rkey').Value;
   qry_tc.FieldByName('ccode').Value:=Lfrm.qry1.FieldByName('ccode').Value;
   qry_tc.FieldByName('cName').Value:=Lfrm.qry1.FieldByName('CName').Value;
   qry_tc.Post;

   qry_tcSave.Append;
   qry_tcSave.FieldByName('tc_ptr').Value:=Lfrm.qry1.FieldByName('rkey').Value;
   qry_tcSave.Post;

   LFrm.qry1.next;
   end;
   end;

  finally
    Lfrm.free;
  end;

end;

procedure TfrmEdit2.btn_SelDeptClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'departmentname/部门名称/100,departmentcode/部门号码/100,rkey/部门ID/120,';
    InputVar.Sqlstr :='select * from datadepartment order by 2';
    InputVar.AdoConn := DM.con;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_Dept.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
      edt_Dept.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
      //lb_deptname.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmEdit2.btn_SelPostClick(Sender: TObject);
 var
 inputRec:PdlgInput;
begin
    frmPick_item_single:= TfrmPick_item_single.Create(nil);
    inputRec.fields:= 'item/职务名称/400';
    inputrec.sqlstr:='select  rkey, item   from datadetail where dictid=1 ';
    inputrec.keyField:='rKey' ;
    inputrec.ADoConn:=dm.con;
    try
    frmPick_item_single.InitForm_New(inputrec);
    if frmPick_item_single.ShowModal =mrok then
    begin
     edt_post.text:= frmPick_item_single.adsPick.fieldbyname('item').asstring;
     edt_post.Tag:= frmpick_item_single.adsPick.fieldByName('rkey').asinteger
    end;

    finally
      frmpick_item_single.Free;
   end;
end;



procedure TfrmEdit2.NDelClick(Sender: TObject);
begin
  if qry_tc.IsEmpty then exit;
  qry_tc.Delete;
end;

procedure TfrmEdit2.btn_SaveClick(Sender: TObject);
var
  Lsql:string;
  n:integer;
begin
   if Trim(edt_Dept.text)=''  then
   begin
   ShowMessage('部门不能为空');
   edt_Dept.SetFocus;
   exit;
   end;

   if Trim(edt_post.text)=''  then
   begin
   ShowMessage('职务不能为空');
   edt_post.SetFocus;
   exit;
   end;

   if qry_tc.IsEmpty then
   begin
   ShowMessage('请选择课程！');
   Exit;
   end;

     if FEditType=1  then
     qry_DP.Append
     else  if FEditType=2  then
     qry_DP.Edit;

     qry_DP.FieldByName('Deptid').value:=edt_Dept.tag;
     qry_DP.FieldByName('Postid').value:=edt_Post.tag;
     qry_DP.FieldByName('cType').Value:=cbb_CType.ItemIndex;
     qry_DP.Post;

    try
     dm.con.BeginTrans;
     qry_DP.UpdateBatch(arall);
     n:=qry_DP.fieldbyname('rkey').AsInteger;
     if FEditType=2  then
     begin
     qry_tcSave.First;
     while not qry_tcSave.eof do
     begin
      if not qry_tc.Locate('tc_ptr',qry_tcSave.fieldbyname('tc_ptr').AsInteger,[])  then
      qry_tcSave.Delete
      else
      begin
      qry_tcSave.Edit;
      qry_tcSave.FieldByName('M_ptr').value:=qry_DP.fieldbyname('rkey').AsInteger;
      qry_tcSave.Post;
      qry_tcSave.Next;
      end;
     end;
    end
    else if FEditType=1  then
    begin
        qry_tcSave.First;
     while not qry_tcSave.eof do
     begin
      qry_tcSave.edit;
      qry_tcSave.FieldByName('M_ptr').value:=qry_DP.fieldbyname('rkey').AsInteger;
      qry_tcSave.Post;
      qry_tcSave.Next;
     end;
    end;

     qry_tcSave.UpdateBatch(arall);
     dm.con.CommitTrans;
     self.ModalResult:=mrok ;
   except on e:Exception do
    begin
    ShowMessage('错误 ：'+e.message);
    dm.con.RollbackTrans;
    end;

   end;
end;

procedure TfrmEdit2.btn_exitClick(Sender: TObject);
begin
close;
end;

end.
