unit UChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, DBCtrls, Grids, DBGridEh, Mask,
  DBCtrlsEh, ExtCtrls, Buttons, DB, ADODB,common,DateUtils;

type
  TFrmChange = class(TForm)
    pnl1: TPanel;
    lblFieldName: TLabel;
    lb_2: TLabel;
    Label3: TLabel;
    bbt_qry: TBitBtn;
    bbt_refresh: TBitBtn;
    bbt_exit: TBitBtn;
    bbt_report: TBitBtn;
    btn_add: TBitBtn;
    edt_Value: TEdit;
    grb_1: TGroupBox;
    lb_alt: TLabel;
    lb_code: TLabel;
    lb_dept: TLabel;
    lb_posit: TLabel;
    lb_type: TLabel;
    lb_in: TLabel;
    lb_ocode: TLabel;
    lb_odept: TLabel;
    lb_oposit: TLabel;
    lb_otype: TLabel;
    lb_ncode: TLabel;
    lb_ndept: TLabel;
    lb_nposit: TLabel;
    lb_ntype: TLabel;
    lb_oper: TLabel;
    lb_1: TLabel;
    lb_11: TLabel;
    lb_12: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbt_type: TDBEdit;
    dbedtondutytime: TDBEdit;
    dbt_posit: TDBEdit;
    dbt_dept: TDBEdit;
    dbt_code: TDBEdit;
    dbedtalterdate: TDBEdit;
    dbt_otype: TDBEdit;
    dbt_oposit: TDBEdit;
    dbt_odept: TDBEdit;
    dbt_ocode: TDBEdit;
    dbt_manager: TDBEdit;
    dbt_ntype: TDBEdit;
    dbt_nposit: TDBEdit;
    dbt_ndept: TDBEdit;
    dbt_ncode: TDBEdit;
    dbt_rank: TDBEdit;
    dbt_orank: TDBEdit;
    dbt_nrank: TDBEdit;
    DBMemo1: TDBMemo;
    dbedtstarLevel: TDBEdit;
    dbedtorginal_star: TDBEdit;
    dbedtnew_station: TDBEdit;
    StatusBar1: TStatusBar;
    pm_Main: TPopupMenu;
    mni_New: TMenuItem;
    mni_Del: TMenuItem;
    mni_Effective: TMenuItem;
    qry_main: TADOQuery;
    atncfld_inforkey: TAutoIncField;
    intgrfld_infoemployeeid: TIntegerField;
    intgrfld_infotype: TIntegerField;
    intgrfld_inforeason: TIntegerField;
    dtmfld_infoalterdate: TDateTimeField;
    tt: TWideStringField;
    intgrfld_infoorginal_departmentid: TIntegerField;
    intgrfld_infoorginal_position: TIntegerField;
    intgrfld_infoorginal_employ_type: TIntegerField;
    intgrfld_infoorginal_politics_face: TIntegerField;
    intgrfld_infoorginal_education: TIntegerField;
    intgrfld_infoorginal_marriage: TIntegerField;
    intgrfld_infoorginal_rank: TIntegerField;
    wdstrngfld_infonew_employeecode: TWideStringField;
    intgrfld_infonew_departmentid: TIntegerField;
    intgrfld_infonew_position: TIntegerField;
    intgrfld_infonew_employ_type: TIntegerField;
    intgrfld_infonew_politics_face: TIntegerField;
    intgrfld_infonew_education: TIntegerField;
    intgrfld_infonew_marriage: TIntegerField;
    intgrfld_infonew_rank: TIntegerField;
    dtmfld_infooper_date: TDateTimeField;
    intgrfld_infoactive: TIntegerField;
    wdstrngfld_infochinesename: TWideStringField;
    wdstrngfld_infoemployeecode: TWideStringField;
    dtmfld_infoondutytime: TDateTimeField;
    intgrfld_infoemploy_type: TIntegerField;
    intgrfld_infosex: TIntegerField;
    dtmfld_infooutdutytime: TDateTimeField;
    wdstrngfld_inforreason: TWideStringField;
    wdstrngfld_infottype: TWideStringField;
    wdstrngfld_infopposition: TWideStringField;
    intgrfld_infodictid: TIntegerField;
    wdstrngfld_infonposition: TWideStringField;
    wdstrngfld_infooposition: TWideStringField;
    wdstrngfld_infonhtype: TWideStringField;
    wdstrngfld_infoohtype: TWideStringField;
    wdstrngfld_infophtype: TWideStringField;
    wdstrngfld_infodepartmentname: TWideStringField;
    wdstrngfld_infondepartmentname: TWideStringField;
    wdstrngfld_infoodepartmentname: TWideStringField;
    qry_mainsexy: TStringField;
    qry_mainemployee_name: TStringField;
    qry_mainorank: TStringField;
    qry_mainnrank: TStringField;
    qry_mainrank: TStringField;
    qry_mainremark: TWideStringField;
    qry_mainorginal_star: TIntegerField;
    qry_mainnew_star: TIntegerField;
    qry_mainTrain_NO: TStringField;
    qry_mainemployee_train_flag: TBooleanField;
    qry_mainoper_person: TIntegerField;
    qry_mainorginal_ondutytime: TWideStringField;
    qry_mainorginal_outdutytime: TWideStringField;
    qry_mainemployee_train_ptr: TIntegerField;
    qry_mainorginal_accountid: TIntegerField;
    qry_mainnew_accountid: TIntegerField;
    qry_mainstarLevel: TIntegerField;
    ds_Main: TDataSource;
    Panel2: TPanel;
    dbgrdh_change: TDBGridEh;
    intgrfld_mainorginal_station: TIntegerField;
    intgrfld_mainnew_station: TIntegerField;
    wdstrngfld_mainOStation: TWideStringField;
    wdstrngfld_mainnstation: TWideStringField;
    Label1: TLabel;
    dbedt_OStar: TDBEdit;
    Label7: TLabel;
    dbedt_NStar: TDBEdit;
    qry_mainOStar: TWideStringField;
    qry_mainNStar: TWideStringField;
    lbl1: TLabel;
    dbedtOldIsKeyP: TDBEdit;
    lbl2: TLabel;
    dbedtOldKeyPID: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbedtNIsKeyPosition: TDBEdit;
    dbedtnewpositionname: TDBEdit;
    qry_mainOldIsKeyP: TIntegerField;
    qry_mainNewIsKeyP: TIntegerField;
    qry_mainOldKeyPID: TIntegerField;
    qry_mainNewKeyPID: TIntegerField;
    qry_mainOIsKeyPosition: TStringField;
    qry_mainNIsKeyPosition: TStringField;
    qry_mainOldpositionname: TWideStringField;
    qry_mainnewpositionname: TWideStringField;
    Label10: TLabel;
    DBPgrad: TDBEdit;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    qry_mainOldPGrade: TIntegerField;
    qry_mainnewPGrade: TIntegerField;
    qry_mainstrnewPGrade: TWideStringField;
    qry_mainstroldPgrade: TWideStringField;
    procedure bbt_refreshClick(Sender: TObject);
    procedure bbt_exitClick(Sender: TObject);
    procedure bbt_reportClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure mni_NewClick(Sender: TObject);
    procedure edt_ValueChange(Sender: TObject);
    procedure dbgrdh_changeTitleClick(Column: TColumnEh);
    procedure dbgrdh_changeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdh_changeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure mni_DelClick(Sender: TObject);
    procedure mni_EffectiveClick(Sender: TObject);
    procedure bbt_qryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Field_Name: string;
    pre_column: TColumnEh;
    MySql: string;
     function OpenQry(ssql:string):string;
     function execsql(ssql:string):string;

  public
    { Public declarations }
  end;

var
  FrmChange: TFrmChange;

implementation
          uses udm, UAdd, UQry;
{$R *.dfm}
function TFrmChange.OpenQry(ssql:string):string;
var
  Errstr:string;
begin
 try
   result:='';
   with dm.qrytemp do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open
   end;
  except on e:exception do
  begin
   Errstr:='错误：'+e.Message;
   ShowMessage(Errstr);
   //exit;
  end;

 end;
   result:=Errstr;
end;

function TFrmChange.execsql(ssql:string):string;
var
  Errstr:string;
begin
 try
   result:='';
   with dm.qrytemp do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   execsql;
   end;
  except on e:exception do
  begin
   Errstr:='错误：'+e.Message;
   ShowMessage(Errstr);
   //exit;
  end;
 end;
 result:=Errstr;
end;



procedure TFrmChange.bbt_refreshClick(Sender: TObject);
var
  BM:pointer;
begin
//
qry_Main.filtered:=false;
  with qry_Main do
  begin
//   BM:= GetBookmark;
//   qry_Main.filtered:=false;
//    qry_Main.requery;
//   GotoBookmark(BM);
   close;
   sql.clear;
   sql.text:=mysql;
   open;
  end;
 qry_Main.Filter:=' active=0 ';
 qry_Main.filtered:=true;
end;

procedure TFrmChange.bbt_exitClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChange.bbt_reportClick(Sender: TObject);
begin
  if ((strtoint(vprev)<>2) and  (strtoint(vprev)<>4) ) then
    begin
    showmessage('没有权限！！');
    exit;
    end;
    if  qry_main.isempty then exit;
      Export_dbGridEH_to_Excel(self.dbgrdh_change,'员工异动信息');
end;

procedure TFrmChange.btn_addClick(Sender: TObject);
var
  rkey: integer;
begin
  try
   frmAdd:=TFrmAdd.create(nil);
     FrmAdd.ShowModal;
   if FrmAdd.ModalResult=mrok then
   begin
      with  qry_main  do
      begin
        rkey:= FrmAdd.qry_Add.fieldbyname('rkey').AsInteger;
        Requery;
        Locate('rkey',rkey,[]);
      end;
   end;

  finally
   frmAdd.free;
  end;
end;

procedure TFrmChange.mni_NewClick(Sender: TObject);
begin
     btn_addClick(sender);
end;

procedure TFrmChange.edt_ValueChange(Sender: TObject);
var
  fstr:string;
begin

  qry_Main.Filtered:=false;
  if qry_Main.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if qry_Main.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_main.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        qry_main.Filter:=' (' +  field_name + ' like ''%' + trim(edt_value.text) + '%'')'
      else if qry_Main.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        qry_Main.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
    end else
       qry_Main.Filter:='';
  end;

  qry_Main.Filtered:=true;

end;

procedure TFrmChange.dbgrdh_changeTitleClick(Column: TColumnEh);
begin

  if qry_main.isempty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_main.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_main.Sort:= Column.FieldName + ' DESC';
  end;


  if qry_Main.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name <> column.FieldName) then
  begin
    lblFieldName.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    Pre_Column.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    Pre_Column := column ; 
  end else
    edt_value.SetFocus;

end;

procedure TFrmChange.dbgrdh_changeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then  //在eh上alt+V
 ShowMessage(qry_main.SQL.Text);

end;

procedure TFrmChange.dbgrdh_changeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  If qry_main.FieldByName('active').Value = 0  then
  Begin
    dbgrdh_change.Canvas.Font.Color := clRed;
    dbgrdh_change.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;
end;

procedure TFrmChange.mni_DelClick(Sender: TObject);
VAR
  SSQL:string ;
begin
 //

   if qry_main.IsEmpty  then exit;
   
  if (strtoint(vprev)<> 2) and (strtoint(vprev) <>4 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    exit;
  end;

   if qry_main.FieldByName('active').Value=1  then
   begin
    ShowMessage('已生效不能删除！');
    exit;
   end;


 try
  if not  dm.con1.InTransaction  then dm.con1.BeginTrans;
     //sept 1  :更新员工培训记录;
   if not  qry_main.FieldByName('employee_train_ptr').IsNull then  //有培训记录的
    ssql:= ' update   dbo.Employee_Train set ptr_flag=0 where rkey= '+inttostr(qry_mainemployee_train_ptr.value)+'  '
   else  //删掉异动
    ssql:= ' delete from  employee_alteration where rkey= '+inttostr(atncfld_inforkey.value)+'  ';

   if common.ExecSql(dm.qrytemp,ssql)  then
     qry_main.Requery;
  dm.con1.CommitTrans;
 ShowMessage('操作成功！');

 except on e: exception do
 begin
   dm.con1.RollbackTrans;
   ShowMessage('错误：'+e.message);

 end;

 end;

end;

procedure TFrmChange.mni_EffectiveClick(Sender: TObject);
var
  i:integer;
  ssql,err: string;
begin
//
  if qry_main.IsEmpty then exit;

  if (strtoint(vprev)<> 2) and (strtoint(vprev) <>4 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    exit;
  end;

  if qry_main.FieldByName('active').Value=1  then
  begin
   ShowMessage('已生效!');
   exit;
  end; 

 {
 //判断是否需要培训，如是要判断培训资料是否完善：
 if qry_main.fieldByName('employee_train_flag').AsBoolean=true then
 begin
    ssql := ' select train_status from  employee_train  where Train_NO = '''+qry_main.FieldByName('Train_NO').AsString+'''  '+
          ' and employeeid = '+inttostr(qry_main.FieldByName('employeeid').asinteger)+' and Train_status=0 ';
   err:=openqry(ssql);                                    //  employeeid    employee_train_ptr
   if err='' then
   begin
    if not dm.qrytemp.IsEmpty  then
    begin
     ShowMessage('该异动对应的培训信息还没生效，请先生效！');
     exit;
    end;
    end
   end
   else
    begin
    showmessage(err);
    exit;
    end;
 }

 // i:=  qry_main.FieldByName('new_departmentid').value ;
   //如果是部门异动判断部门人数是否超过：
   if (qry_main.FieldByName('orginal_departmentid').Value<>qry_main.FieldByName('new_departmentid').Value ) and (qry_main.FieldByName('new_departmentid').value<>null)  then
   begin
     ssql:= 'select  isnull(departmentcount,0) as departmentcount , convert(numeric(18,0),isnull(departmentration,0)*(1+isnull(max_overproof_percent,0)/100.0)) as MaxN  from  datadepartment where rkey = '+inttostr(qry_main.FieldByName('new_departmentid').Value)+'';


     err:= OpenQry(ssql);
     if err='' then
     begin
      if not dm.qrytemp.IsEmpty then
      begin
      if dm.qrytemp.FieldByName('departmentcount').Value>= dm.qrytemp.FieldByName('MaxN').Value   then
      begin
       ShowMessage('新的部门人数已满！');
       exit;
      end;
      end;
     end
     else
      begin
      showmessage(err);
      exit;
      end;
   end;

  try
    
    if not dm.con1.InTransaction  then dm.con1.BeginTrans;
    //3 更新人事资料： 异动<>复职

    if MessageDlg('异动生效后不能修改确定要生效吗？',mtWarning , [mbOK,mbCancel],1)=mrok then
    begin
    
    if  qry_main.FieldByName('ttype').Value<>'复职'  then
    begin
    ssql:= 'update a  set '+
           'employeecode=isnull(b.new_employeecode, a.employeecode), '+
           'departmentID= isnull(b.new_departmentid,a.departmentid) , '+
           'position=isnull(b.new_position, a.position), '+
           'employ_type=isnull(b.new_employ_type,a.employ_type), '+
           'politics_face=isnull(b.new_politics_face,a.politics_face) , '+
           'education=isnull(b.new_education , a.education), '+
           'marriage=isnull(b.new_marriage,a.marriage) , '+
           'station=isnull(b.new_station,a.station) , '+
           'rank=isnull(b.new_rank, a.rank),  ' +
           'DGrade_Ptr=isnull(b.new_star, a.DGrade_Ptr)  ' +
           ',IsKeyPostiton=isnull(b.NewIsKeyP, a.IsKeyPostiton)  ' +
           ',KeyPID=isnull(b.NewKeyPID, a.KeyPID)  ' +
           ',PGrade=isnull(b.NewPGrade, a.PGrade)  ' +
           ' from  employeemsg a inner join  employee_alteration b on a.rkey =b.employeeid'+
            ' where  b.active=0  and  b.rkey = '+inttostr(qry_main.FieldByName('rkey').asinteger)+' ';
       err:=self.execsql(ssql);
     if err<>''  then
      ShowMessage('出错！'+err);
    end;


      //4: 更新部门人数：
     ssql:='exec dbo.hrsp_update_datadepartment_empcount' ;
        err:=self.execsql(ssql);
       if err<>''  then
         ShowMessage('出错！'+err);


                 //更新状态：
     ssql:='Update employee_alteration set active=1 where rkey='+qry_main.fieldByName('rkey').AsString;
      err:=self.execsql(ssql);
      if err<>''  then
      begin
       ShowMessage('错误:'+err);
      exit;
      end;


    end else exit;


    qry_main.Requery;
    dm.con1.CommitTrans;
    ShowMessage('操作成功！');

   except on e: exception do
   begin
     dm.con1.RollbackTrans;
     ShowMessage('错误：'+e.message);

   end;



   end;

end;


procedure TFrmChange.bbt_qryClick(Sender: TObject);
var
 ssql: string;
begin

   try
   frmQry:=TFrmQry.create(nil);
   if frmQry.ShowModal=mrok then
    begin
     with qry_main do
     begin
      close;
      sql.Clear;
      ssql:=MySql+ FrmQry.QrySql;
      sql.Add(ssql);
      open;
      qry_main.filtered:=false;
     end;

    end;

   finally
    frmQry.free;
    end;
end;

procedure TFrmChange.FormCreate(Sender: TObject);
begin
//    rkey73:='3023';
//   user_ptr := '3301';
//  vprev := '4';



  if not App_Init_2(dm.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

  self.Caption:= Application.Title;

 MySql:= qry_main.SQL.Text;
 if not qry_main.Active  then qry_main.Open;


end;

procedure TFrmChange.FormShow(Sender: TObject);
begin

  Field_Name:=  dbgrdh_change.Columns[0].FieldName;
  pre_column := dbgrdh_change.Columns[0];
  dbgrdh_change.Columns[0].title.color:=clred;

   dbgrdh_change.Columns[0].Title.SortMarker:=smUpEh;
    qry_main.Sort:=Field_Name;


   qry_main.Filtered:=false;
qry_main.Filter:=' active=0';
qry_main.Filtered:=true;



end;

end.
