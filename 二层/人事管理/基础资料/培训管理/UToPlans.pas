unit UToPlans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ADODB, Grids, DBGridEh, StdCtrls, ComCtrls, Buttons,
  ExtCtrls;

type
  TfrmToPlans = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn_Save: TBitBtn;
    btn_exit: TBitBtn;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl2: TLabel;
    lbl5: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl_CName: TLabel;
    lbl4: TLabel;
    edt_remark: TEdit;
    BDate: TDateTimePicker;
    cbb_TType: TComboBox;
    edt_tc: TEdit;
    EDate: TDateTimePicker;
    eh1: TDBGridEh;
    qry_tp: TADOQuery;
    atncfld_tprkey: TAutoIncField;
    intgrfld_tpTtype: TIntegerField;
    intgrfld_tpEmployeeID: TIntegerField;
    dtmfld_tpBDate: TDateTimeField;
    dtmfld_tpEDate: TDateTimeField;
    strngfld_tpremark: TStringField;
    qry_tpIsFinished: TBooleanField;
    intgrfld_tpTC_ptr: TIntegerField;
    intgrfld_tpDeptID: TIntegerField;
    intgrfld_tpPostID: TIntegerField;
    qrytemp: TADOQuery;
    pm1: TPopupMenu;
    mni_add: TMenuItem;
    mni_Del: TMenuItem;
    ds_emp: TDataSource;
    qry_emp: TADOQuery;
    atncfld_emprkey: TAutoIncField;
    intgrfld_empTC_ptr: TIntegerField;
    intgrfld_empTtype: TIntegerField;
    intgrfld_empEmployeeID: TIntegerField;
    dtmfld_empBDate: TDateTimeField;
    dtmfld_empEDate: TDateTimeField;
    strngfld_empremark: TStringField;
    qry_empIsFinished: TBooleanField;
    intgrfld_empDeptID: TIntegerField;
    intgrfld_empPostID: TIntegerField;
    wdstrngfld_empemployeecode: TWideStringField;
    wdstrngfld_empchinesename: TWideStringField;
    procedure btn_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mni_DelClick(Sender: TObject);
    procedure mni_addClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmToPlans: TfrmToPlans;

implementation
   uses UDM,USelEmp,common,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TfrmToPlans.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmToPlans.FormShow(Sender: TObject);
var
  Lsql:string;
begin
 if not qry_tp.Active then qry_tp.Open;

  if not qry_emp.Active then qry_emp.Open;

  Lsql:='select rkey,item  from datadetail where dictid=20 ';
  Dm.OpenQry(DM.qry_temp,Lsql);
  if not dm.qry_temp.IsEmpty  then
  begin
   cbb_TType.Items.Clear;
   while not dm.qry_temp.eof do
   begin
   cbb_TType.Items.AddObject(dm.qry_temp.fieldByName('item').AsString, Tobject(dm.qry_temp.fieldbyname('rkey').asinteger));
   DM.qry_temp.Next;
   end;
  cbb_TType.ItemIndex:=cbb_TType.Items.IndexOf('普通');
  end;

  BDate.date:= IncMonth(Now,-3);
  EDate.date:= Now;


end;

procedure TfrmToPlans.mni_DelClick(Sender: TObject);
begin
if  qry_emp.IsEmpty then Exit;
qry_emp.Delete;
end;

procedure TfrmToPlans.mni_addClick(Sender: TObject);
var
  LFrm:TfrmSelEmp;
  Lsql,Str:string;
begin
  LFrm:=TfrmSelEmp.Create(self);
  try
   if not LFrm.qry1.Active  then  LFrm.qry1.open;

   if not qry_emp.IsEmpty then
   begin
     str:='';
     qry_emp.first;
     while not  qry_emp.Eof do
     begin
     str:=str+ 'employeeid<>'+ qry_emp.fieldbyname('tc_ptr').asstring+' and ';
     qry_emp.Next ;
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
   qry_emp.Append;
   qry_emp.FieldByName('employeeID').Value:=Lfrm.qry1.FieldByName('rkey').Value;
   qry_emp.FieldByName('employeecode').Value:=Lfrm.qry1.FieldByName('employeecode').Value;
   qry_emp.FieldByName('chineseName').Value:=Lfrm.qry1.FieldByName('chineseName').Value;
   qry_emp.FieldByName('deptID').Value:=Lfrm.qry1.FieldByName('DepartMentID').Value;
   qry_emp.FieldByName('PostID').Value:=Lfrm.qry1.FieldByName('position').Value;
   qry_emp.Post;

   LFrm.qry1.next;
   end;
   end;

  finally
    Lfrm.free;
  end;
end;

procedure TfrmToPlans.btn_SaveClick(Sender: TObject);
var
  Lsql:string;
begin
     if qry_emp.IsEmpty  then
     begin
     ShowMessage('请选择员工。');
     exit;
     end;

     if trim(cbb_TType.text)=''  then
     begin
     ShowMessage('请选择培训类型。');
     exit;
     end;

   if not qry_tp.Active then qry_tp.Open;

   qry_emp.First;
   while not qry_emp.Eof do
   begin
    qry_tp.Append;
    qry_tp.fieldbyname('tc_ptr').value:=edt_tc.tag;
    qry_tp.fieldbyname('DeptID').value:=qry_emp.fieldbyname('DeptID').value;
    qry_tp.fieldbyname('PostID').value:=qry_emp.fieldbyname('PostID').value;
    qry_tp.fieldbyname('employeeid').value:=qry_emp.fieldbyname('EmployeeID').value;
    qry_tp.FieldByName('BDate').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',BDate.Date));
    qry_tp.FieldByName('EDate').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',EDate.Date));
    qry_tp.FieldByName('ttype').Value:= Integer(cbb_ttype.Items.Objects[cbb_ttype.itemindex]);
    qry_tp.FieldByName('remark').Value:=Trim(edt_remark.Text);
    qry_tp.FieldByName('IsFinished').Value:=0;
    qry_tp.Post;
    qry_emp.next;
   end;

  try
  dm.con.BeginTrans;
  qry_tp.UpdateBatch(arall);
  dm.con.CommitTrans;
  showmessage('生成成功！');
  modalresult:=mrok;
   Except  on e:Exception do
   begin
   dm.con.RollbackTrans;
   end
  end;
end;

end.
