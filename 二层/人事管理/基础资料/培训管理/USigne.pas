unit USigne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSigne = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    edt_ccode: TEdit;
    edt_CName: TEdit;
    BDate: TDateTimePicker;
    BTime: TDateTimePicker;
    edt_TTeacher: TEdit;
    edt_TPlace: TEdit;
    Label15: TLabel;
    Label5: TLabel;
    lbl5: TLabel;
    edt_THOurs: TEdit;
    EDate: TDateTimePicker;
    ETime: TDateTimePicker;
    edt_TCost: TEdit;
    btn_begin: TButton;
    Label2: TLabel;
    cbb_TType: TComboBox;
    pnl3: TPanel;
    lbl1: TLabel;
    edt_emp: TEdit;
    lbl_result: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    lbl8: TLabel;
    cbb_ETYpe: TComboBox;
    cbb_TType2: TComboBox;
    cbb_CType: TComboBox;
    procedure edt_empKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_empExit(Sender: TObject);
    procedure btn_beginClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    Ftc_ptr:integer;
  end;

var
  frmSigne: TfrmSigne;

implementation
  uses UDM,common;
{$R *.dfm}

procedure TfrmSigne.edt_empKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
Lsql:string;
employeeid:integer;
TTYpe:integer;
begin
 if key<>13 then    exit;

 if Trim(edt_emp.Text)='' then exit;

 edt_empExit(sender);

end;

procedure TfrmSigne.FormShow(Sender: TObject);
var
 Lsql:string;
begin
  Lsql:='select rkey , item  from datadetail where dictid=20';
  if  (common.OpenQuery(dm.qry_temp,Lsql)) then
  begin
   dm.qry_temp.First;
   cbb_TType.Items.Clear;
   while  not dm.qry_temp.Eof do
   begin
    self.cbb_TType.Items.AddObject(dm.qry_temp.FieldByName('item').asstring,Tobject(dm.qry_temp.FieldByName('rkey').asinteger));
    dm.qry_temp.next;
   end;
   cbb_TType.ItemIndex:=cbb_TType.Items.IndexOf('普通');
  end;

   pnl2.Enabled:=true;
    btn_begin.Visible:=true;
end;

procedure TfrmSigne.edt_empExit(Sender: TObject);
var
Lsql:string;
employeeid,DeptID,PostID,CTypeID:integer;
 TTYpe:integer;
begin
  // if pnl2.Enabled=True then exit;
  if Trim(edt_emp.Text)='' then exit;

  if btn_begin.Enabled=True then
  begin
  ShowMessage('请先填好上述资料交点击开始签到！');
  Exit;
  end;

  lbl_result.Caption:='.';
 //刷厂牌生成培训记录：
  Lsql:='select rkey,departmentID,position from employeemsg where employeecode='''+trim(edt_emp.Text)+''' and status<>2 ';
  Dm.OpenQry(DM.qry_temp,Lsql);
  if not dm.qry_temp.IsEmpty then
  begin
   TTYpe:=Integer(cbb_TType.Items.Objects[cbb_TType.itemindex]);
   employeeid:=dm.qry_temp.Fieldbyname('rkey').AsInteger;
   DeptID:= dm.qry_temp.Fieldbyname('DepartmentID').AsInteger;
   PostID:= dm.qry_temp.Fieldbyname('position').AsInteger;

  //课程类别： 入职培训还是在岗培训，先从需求里面找 ， 没有就取界面上的
  Lsql:=' select a.ctype  '+
       ' from DeptPostTrainClass_main a '+
       ' inner join  DeptPostTrainClass_detail b on a.rkey=b.m_ptr '+
       ' where  a.Deptid='+inttostr(DeptID)+' and a.PostID='+inttostr(PostID)+'  and b.tc_ptr ='+inttostr(ftc_ptr)+' ';
  Dm.OpenQry(DM.qry_temp,Lsql);
  if not dm.qry_temp.IsEmpty then
  CTypeID:=dm.qry_temp.fieldbyname('ctype').asinteger
  else
  CTypeID:= cbb_CType.ItemIndex ;

   //  查找是否已培训过：
   Lsql:='select rkey from employee_train where employeeid='+inttostr(employeeid)+' and tc_ptr='+inttostr(Ftc_ptr)+' '+
         ' and DeptID='+inttostr(DeptID)+' and postID='+inttostr(PostID)+' and convert(varchar(7),startdate,120)='''+formatdatetime('yyyy-MM',BDate.Date)+''' ';
    Dm.OpenQry(DM.qry_temp,Lsql);
   if not dm.qry_temp.IsEmpty then
   begin
   ShowMessage('对不起，您在现在的部门和职务本月已培训过此课程，不用重复培训！');
   exit;
   end
   else
   begin
   Lsql:=' insert into Employee_Train(employeeid,employeecode,Train_NO,Train_topics,Train_content,startdate,starttime,enddate,endtime,'+
          'Teacher,Train_place,Train_status,train_feels,Train_time,oprator_ptr,oprate_time,tc_ptr,DeptID,PostID,type_ptr,ctype,TType,EType) '+
          ' values('+inttostr(employeeid)+','''+trim(edt_emp.Text)+''','''+formatdatetime('yyyyMMddhhmm',BDate.Date)+trim(edt_emp.Text)+''','''+trim(edt_CName.Text)+''','''+trim(edt_CName.Text)+''', '+
          ' '''+formatdatetime('yyyy-MM-dd',BDate.Date)+''','''+formatdatetime('hh:mm:ss',BTime.Date)+''','''+formatdatetime('yyyy-MM-dd',EDate.Date)+''', '+
          ' '''+formatdatetime('hh:mm:ss',ETime.Date)+''','''+trim(edt_TTeacher.Text)+''','+
          ' '''+trim(edt_TPlace.Text)+''',0,'+trim(edt_Tcost.Text)+','+trim(edt_Thours.Text)+','+common.user_ptr+', '+
          ' '''+formatdatetime('yyyy-MM-dd hh:mm:ss',common.getsystem_date(dm.qry_temp,0))+''','+inttostr(ftc_ptr)+', '+
          ' '+inttostr(DeptID)+','+inttostr(PostID)+','+inttostr(ttype)+', '+
          ' '+inttostr(CTypeID)+','+inttostr(cbb_TType2.ItemIndex)+','+inttostr(cbb_EType.ItemIndex)+')' ;
        //  ShowMessage(Lsql);
   Dm.execsql(DM.qry_temp,Lsql);
   end;
  end
  else
  begin
  ShowMessage('工号不存在！');
  exit;
  end;
  lbl_result.Caption:='签到成功！';
  ShowMessage('签到成功');

 edt_emp.text:='';
 edT_emp.setfocus;


end;

procedure TfrmSigne.btn_beginClick(Sender: TObject);
begin
 btn_begin.enabled:=false;
 pnl2.Enabled:=false;
 edt_emp.SetFocus;
end;

end.
