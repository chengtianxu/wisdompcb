unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, StdCtrls,StrUtils, Buttons, ComCtrls,common,
  ExtCtrls, Mask, DBCtrls, ComObj, DBGridEh, ADODB, DB, DBCtrlsEh,DBGridEhImpExp;

type
  Tfm_main = class(TForm)
    pm_change: TPopupMenu;
    n_delete: TMenuItem;
    bbt_qry: TBitBtn;
    bbt_report: TBitBtn;
    bbt_add: TBitBtn;
    bbt_refresh: TBitBtn;
    bbt_exit: TBitBtn;
    N_Effective: TMenuItem;
    label1: TLabel;
    pnl1: TPanel;
    lb_2: TLabel;
    N_New: TMenuItem;
    mniN3: TMenuItem;
    Panel1: TPanel;
    Label3: TLabel;
    DBGridEh1: TDBGridEh;
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
    dbt_type: TDBEdit;
    dbt_in: TDBEdit;
    dbt_posit: TDBEdit;
    dbt_dept: TDBEdit;
    dbt_code: TDBEdit;
    dbt_alt: TDBEdit;
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
    StatusBar1: TStatusBar;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dteBegin: TDBDateTimeEditEh;
    dteEnd: TDBDateTimeEditEh;
    BtFind: TSpeedButton;
    Edit1: TEdit;
    SaveDialog1: TSaveDialog;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure bbt_exitClick(Sender: TObject);
    procedure bbt_addClick(Sender: TObject);
    procedure bbt_qryClick(Sender: TObject);
    procedure pgc_changeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure n_deleteClick(Sender: TObject);
    procedure dg_leaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N_EffectiveClick(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
   // procedure pm_changePopup(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  //  procedure tmr1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_refreshClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtFindClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure bbt_reportClick(Sender: TObject);
    procedure pm_changePopup(Sender: TObject);
  private
    
    FilterFieldName:string;
    { Private declarations }
    blSelect: Boolean;
    BookMark: TBookmarkList;
    CurrNo, OldNo: integer;
    PreColumn: TColumnEh;
    field_name:string;
  public

    { Public declarations }
  end;

var
  fm_main: Tfm_main;
  vEmployee_name :string;
const
    strSQL=
 'SELECT alt.*,Data0005.EMPLOYEE_NAME, msg.chinesename, msg.employeecode, msg.ondutytime, msg.employ_type, '
+#13+' msg.sex, msg.outdutytime,mdet.item AS rank, rdet.item AS rreason, tdet.item AS ttype, pdet.item AS pposition,'
+#13+' tdet.dictid, npdet.item AS nposition, opdet.item AS oposition, nhdet.item AS nhtype,'
+#13+' ohdet.item AS ohtype, hdet.item AS phtype, npdetr.item AS nrank,'
+#13+' opdetr.item AS orank, dept.departmentname, ndept.departmentname AS ndepartmentname, odept.departmentname AS odepartmentname, '
+#13+' (CASE msg.sex WHEN 0 THEN ''女'' WHEN 1 THEN ''男'' ELSE ''其它'' END) AS sexy,Train_NO,msg.starLevel '
+#13+' FROM employee_alteration AS alt LEFT OUTER JOIN '
+#13+' Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN '
+#13+' employeemsg AS msg ON msg.rkey = alt.employeeid LEFT OUTER JOIN '
+#13+' datadetail AS mdet ON mdet.rkey = msg.Rank LEFT OUTER JOIN '
+#13+' datadetail AS rdet ON rdet.rkey = alt.reason JOIN '
+#13+' datadetail AS tdet ON tdet.rkey = alt.type and tdet.dictid=7 LEFT OUTER JOIN'
+#13+' datadetail AS pdet ON pdet.rkey = msg.Position LEFT OUTER JOIN '
+#13+' datadetail AS npdet ON npdet.rkey = alt.new_position LEFT OUTER JOIN '
+#13+' datadetail AS opdet ON opdet.rkey = alt.orginal_position LEFT OUTER JOIN'
+#13+' datadetail AS npdetr ON npdetr.rkey = alt.new_rank LEFT OUTER JOIN '
+#13+' datadetail AS opdetr ON opdetr.rkey = alt.orginal_rank LEFT OUTER JOIN'
+#13+' datadetail AS hdet ON hdet.rkey = msg.employ_type LEFT OUTER JOIN'
+#13+' datadetail AS nhdet ON nhdet.rkey = alt.new_employ_type LEFT OUTER JOIN '
+#13+' datadetail AS ohdet ON ohdet.rkey = alt.orginal_employ_type LEFT OUTER JOIN  '
+#13+' datadepartment AS dept ON dept.rkey = msg.departmentid LEFT OUTER JOIN '
+#13+' datadepartment AS ndept ON ndept.rkey = alt.new_departmentid LEFT OUTER JOIN '
+#13+' datadepartment AS odept ON odept.rkey = alt.orginal_departmentid '
+#13+' left join Employee_Train on Employee_Train.rkey=alt.employee_train_ptr '
;

implementation

uses damo,Madd, Detail, Qry, UpdateLZDate, formFind;

{$R *.dfm}

procedure Tfm_main.bbt_exitClick(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure Tfm_main.bbt_addClick(Sender: TObject);
var
  vRkey:Integer;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
  DM.cds_alt.Close;
  DM.cds_alt.Open;

  fm_madd := tfm_madd.Create(Application);
  if fm_madd.ShowModal = mrok then
  begin
    
    vRkey:=dm.cds_alt.FieldByName('rkey').Value;
    dm.qry_info.Requery; //刷新数据
    dm.qry_info.Locate('rkey',vRkey,[]);
  end;
//  dm.qry_alt.Open;
//  if fm_madd.ShowModal = mrok then
//    dm.qry_alt.UpdateBatch
//  else
//  begin
//    dm.qry_alt.Requery;  //避免引起-1错误
//    dm.qry_alt.CancelBatch;
//  end;

//  dm.qry_alt.Close;
//  dm.qry_info.Requery; //刷新数据
  
  fm_madd.Free;
end;

procedure Tfm_main.bbt_qryClick(Sender: TObject);
//var
//  frmFindOutSQL:AnsiString;
begin
 { frmFindOutSQL:='';
  if VarIsNull(dteBegin.Value) or VarIsNull(dteEnd.Value)then
  begin
    ShowMessage('日期不能为空！！！');
    Exit;
  end;

  if ShowfrmFind(Self,DM.qry_info,frmFindOutSQL,'','employeecode,chinesename,ondutytime,ttype,rreason,orginal_employeecode,'
  +'new_employeecode,odepartmentname,ndepartmentname,oposition,nposition,orank,'
  +'nrank,ohtype,nhtype,alterdate,orginal_star,new_star,Train_NO,oper_date,employee_name,') then
  begin
    with DM.qry_info do
    begin
      Close;
      SQL.Clear;
      SQL.Text:=  strSQL+ #13+'where alterdate>='+QuotedStr(FormatDateTime('yyyy-mm-dd',dteBegin.Value))
      +' and alterdate<='+QuotedStr(FormatDateTime('yyyy-mm-dd',dteEnd.Value));
      IF frmFindOutSQL<>'' then
      SQL.Text:=SQL.Text+' AND '+frmFindOutSQL;

      if RadioGroup1.ItemIndex=0 then
        SQL.Text:=SQL.Text+' and active=0'
      else
      if RadioGroup1.ItemIndex=1 then
        SQL.Text:=SQL.Text+' and active=1 ';
      SQL.Text:=  SQL.Text+'order by  alterdate ';
      Open;
    end;
   cdsMain.Close;
    if  cdsMain.F_SQLWhere='' then
      cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+'where '+frmFindOutSQL
    else
      cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+cdsMain.F_SQLWhere+#13+'and '+frmFindOutSQL ;

    if  cdsMain.F_SQLOrderBy<>'' then
    cdsMain.CommandText:=cdsMain.CommandText+#13+cdsMain.F_SQLOrderBy;

    cdsMain.Open;
  end;       }
  if VarIsNull(dteBegin.Value) or VarIsNull(dteEnd.Value)then
  begin
    ShowMessage('日期不能为空！！！');
    Exit;
  end;

  try
    fm_qry := tfm_qry.Create(Application);
    if fm_qry.ShowModal = mrok then
    begin
      with DM.qry_info do
      begin
        Close;
        SQL.Clear;
{        SQL.Text:=  strSQL+ #13+'where alterdate>='+QuotedStr(FormatDateTime('yyyy-mm-dd',dteBegin.Value))
        +' and alterdate<='+QuotedStr(FormatDateTime('yyyy-mm-dd',dteEnd.Value));
        if RadioGroup1.ItemIndex=0 then
          SQL.Text:=SQL.Text+' and active=0'
        else
        if RadioGroup1.ItemIndex=1 then
          SQL.Text:=SQL.Text+' and active=1'; }
          
        SQL.Text:=  strSQL+#13+'where 1=1 '+qry.sql+#13+'order by  alterdate ';
        //ShowMessage(SQL.Text);
        Open;
      end;
    end;
  finally
    fm_qry.Free;
  end;
end;

procedure Tfm_main.pgc_changeChange(Sender: TObject);
begin
//  with fm_madd do
//  if pgc_change.ActivePageIndex = 0 then damo.base := 'dictid=9'
//  else damo.base := 'dictid=7';
//  dm.qry_info.Filter := damo.base;
//  //CheckBox2Click(CheckBox2);
//  {CheckBox1.Checked := False;
//  CheckBox2.Checked := True; }
//  label1.Caption := '员工工号';
end;

procedure Tfm_main.FormCreate(Sender: TObject);
begin
  //数据连接
 {} if not App_Init(dm.cn_change) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  { 
  user_ptr := '3';
  vprev := '4';
  with dm.cn_change do
  begin
    Close;
    ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
    Open;
  end; }

  with DM.Dt_Temp do
  begin
    Close;
    CommandText:='select data0005.rkey, employee_name from data0005 where data0005.rkey='+user_ptr;
 //   ShowMessage(CommandText);
    Open;
    vEmployee_name:= fieldByName('employee_name').asstring;
    Close;
  end;
  Caption :=application.Title ;
  dteBegin.Value:=Date-30;
  dteEnd  .Value:=Date;
  BtFind.Click;
  FilterFieldName:='employeecode';
end;

procedure Tfm_main.n_deleteClick(Sender: TObject);
begin
    //设置权限
  if (strtoint(vprev) = 1) or (strtoint(vprev) =3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
   //处理
  with dm.qry_Info do
  begin
    if (not isempty) and (messagedlg('你确定要删除该记录吗', mtconfirmation, [mbyes,mbno],1) = mryes) then
    begin
      try
        Screen.Cursor := crHourGlass;
        try
          DM.cn_change.BeginTrans;
          if FieldByName('employee_train_ptr').IsNull=False then     //修改和本行记录相关的培训记录
          begin
            DM.qryTemp.Close;
            DM.qryTemp.SQL.Clear;
            DM.qryTemp.SQL.Text:='update dbo.Employee_Train set ptr_flag=0 where rkey='+FieldByName('employee_train_ptr').AsString;
            //ShowMessage(DM.qryTemp.SQL.Text);
            DM.qryTemp.ExecSQL;
          end;
          DM.qryTemp.Close;
          DM.qryTemp.SQL.Clear;
          DM.qryTemp.SQL.Text:='delete employee_alteration where rkey='+FieldByName('rkey').AsString;
         // ShowMessage(DM.dt_temp.CommandText);
          DM.qryTemp.ExecSQL;
          DM.cn_change.CommitTrans;
        except
          DM.cn_change .RollbackTrans;
        end;
        Close;
        Open;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure Tfm_main.dg_leaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.qry_info.SQL.Text);
end;

procedure Tfm_main.N_EffectiveClick(Sender: TObject);
begin
  ///使该条记录生效，并更新数据库
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
  //检查部门人数是否满员，如果是，则不能做变动
  if  not DM.qry_info.fieldByName('New_departmentid').isnull then
  begin
     with DM.qryTemp do
     begin
       Close;
       SQL.Clear;
       SQL.Text := 'select * from datadepartment where rkey ='+ IntToStr(DM.qry_info.FieldValues['New_departmentid']);
       Open;
       if FieldByName('departmentcount').asInteger >= Round (FieldByName('departmentration').AsInteger * (1 + FieldByName('max_overproof_percent').AsInteger/100)) then
       begin
         showmessage('该部门定额人数已满，不能调动到此部门，请查证！');
         Exit;
       end;
       Close;
     end;
  end;
  //如果需要培训，检查培训的单号是否完成。
  if DM.qry_info.fieldByName('employee_train_flag') .AsBoolean then
  begin
     with DM.qryTemp do
     begin
       Close;
       SQL.Clear;
       SQL.Text := 'select rkey from dbo.Employee_Train '+
              'where employeeid='+QuotedStr(DM.qry_info.fieldByName('employeeid').AsString)
                +' and Train_NO='+QuotedStr(DM.qry_info.fieldByName('Train_NO').AsString)
                +' and Train_status=0';
       Open;
       if IsEmpty=False then
       begin
         showmessage('该培训单：“'+trim(DM.qry_info.fieldByName('Train_NO').AsString)+'”还没有完成！');
         Exit;
       end;
       Close;
     end;
  end;

  if messagedlg('生效后，不可还原，你确定要生效该记录吗？'
    + #13 + '1：更新该员工的异动信息到人事信息中'
    + #13 + '2：重新统计所有部门人数', mtconfirmation, [mbyes,mbno],1) = mrno then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    try
      DM.cn_change.BeginTrans;
        //更新人事信息
        if DM.qry_info.FieldByName('ttype').asString <> '复职' then
        begin
          DM.qryUpdateBD.Close;
          DM.qryUpdateBD.SQL.Clear;
          DM.qryUpdateBD.SQL.Text := Format('update employeemsg set '
            + 'employeecode=isnull(new_employeecode,a.employeecode), '
            + 'departmentid=isnull(new_departmentid,a.departmentid), '
            + 'position=isnull(new_position,a.position), '
            + 'employ_type=isnull(new_employ_type,a.employ_type), '
            + 'politics_face=isnull(new_politics_face,a.politics_face), '
            + 'education=isnull(new_education,a.education), '
            + 'marriage=isnull(new_marriage,a.marriage), '
            + '[starLevel]=isnull(new_star,a.[starLevel]), '
            + '[rank]=isnull(new_rank,a.[rank]) '
            + 'from employeemsg a '
            + 'join employee_alteration b on a.rkey=b.employeeid '
            + 'where b.rkey = ''%s'' '
            + 'and active=0 '
            + 'and b.type in (select rkey from datadetail where dictid=7)', [DM.qry_info.FieldValues['rkey']]);
            DM.qryUpdateBD.ExecSQL;
        end;
        DM.qryTemp.Close;
        DM.qryTemp.SQL.Clear;
        DM.qryTemp.SQL.Text:='Update employee_alteration set active=1 where rkey='+DM.qry_info.FieldByName('rkey').AsString;
        DM.qryTemp.ExecSQL;
        //更新部门人数
        with DM.qryTemp do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'exec dbo.hrsp_update_datadepartment_empcount';
           ExecSQL;
        end;
      DM.cn_change.CommitTrans;
    except
      DM.cn_change.RollbackTrans;
    end;
    DM.qry_info.Requery;
    ShowMessage('该记录生效成功！');
  finally    
    Screen.Cursor := crDefault;
  end;

  if DM.qry_msg.Active then   //如果数据更新后，将qry_msg表关闭，这样下次新增时，总是最新数据。
  DM.qry_msg.Close;
end;

procedure Tfm_main.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

//修改离职日期
procedure Tfm_main.mniN3Click(Sender: TObject);
begin
  {FrmUpdateLZDate := TFrmUpdateLZDate.Create(Application);
  FrmUpdateLZDate.ShowModal;
  FrmUpdateLZDate.Free;   }
end;

procedure Tfm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  If DM.qry_info.FieldByName('active').Value = 0  then
  Begin
    DBGridEh1.Canvas.Font.Color := clRed;
    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;
end;

//
{procedure Tfm_main.tmr1Timer(Sender: TObject);
begin
  with DM.qryTemp do
  begin
    SQL.Clear;
    SQL.Text := 'select count(*) as WSXcount from employee_alteration,datadetail '
     + 'where employee_alteration.type=datadetail.rkey and datadetail.dictid=7 and active=0  ';
    Open;
    lb_WSXCount.caption := '共 '+inttostr(fieldByName('WSXcount').asInteger)+ ' 条';

//    SQL.Clear;
//    SQL.Text := 'select count(*) as SXcount from employee_alteration,datadetail '
//     + 'where employee_alteration.type=datadetail.rkey and datadetail.dictid=7 and active=1  ';
//    Open;
//    //lb_SXCount.caption := '共 '+inttostr(fieldByName('SXcount').asInteger)+ ' 条';
  end;
  //Label3.caption := '当前显示记录共： '+inttostr(dgh_grd1.DataSource.DataSet.recordcount)+ ' 条';
end;   }

procedure Tfm_main.FormShow(Sender: TObject);
begin
 { with DM.qryTemp do
  begin
    SQL.Clear;
    SQL.Text := 'select count(*) as WSXcount from employee_alteration,datadetail '
     + 'where employee_alteration.type=datadetail.rkey and datadetail.dictid=9 and active=0  ';
    Open;
    lb_WSXCount.caption := '共 '+inttostr(fieldByName('WSXcount').asInteger)+ ' 条';

    SQL.Clear;
    SQL.Text := 'select count(*) as SXcount from employee_alteration,datadetail '
     + 'where employee_alteration.type=datadetail.rkey and datadetail.dictid=9 and active=1  ';
    Open;
    lb_SXCount.caption := '共 '+inttostr(fieldByName('SXcount').asInteger)+ ' 条';
  end;  }
end;

procedure Tfm_main.bbt_refreshClick(Sender: TObject);
var
  BM:Pointer;
begin
  with  DM.qry_info  do
  try
    BM:=GetBookmark    ;
    close;
    open;
    GotoBookmark(BM);
  finally
    FreeBookmark(bm);
  end;

end;

procedure Tfm_main.N3Click(Sender: TObject);
begin
  if messagedlg('失效后，不可还原，你确定要失效该记录吗？', mtconfirmation, [mbyes,mbno],1) = mryes then
  begin
    with DM.qryTemp do
    begin
      SQL.clear;
      SQL.Text := 'update Employee_Alteration set active=2 where rkey ='+inttostr(DM.qry_info.fieldValues['rkey']);
      ExecSQL;
    end;
    DM.qry_info.close;
    DM.qry_info.open;
  end;
end;

procedure Tfm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)  ;
  end;

end;

procedure Tfm_main.BtFindClick(Sender: TObject);
begin
  if VarIsNull(dteBegin.Value) or VarIsNull(dteEnd.Value)then
  begin
    ShowMessage('日期不能为空！！！');
    Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    with DM.qry_info do
    begin
      Close;
      SQL.Clear;
      SQL.Text:=  strSQL+ #13+'where alterdate>='+QuotedStr(FormatDateTime('yyyy-mm-dd',dteBegin.Value))
      +' and alterdate<='+QuotedStr(FormatDateTime('yyyy-mm-dd',dteEnd.Value));
      if RadioGroup1.ItemIndex=0 then
        SQL.Text:=SQL.Text+' and active=0'
      else
      if RadioGroup1.ItemIndex=1 then
        SQL.Text:=SQL.Text+' and active=1';
      SQL.Text:=  SQL.Text+'order by  alterdate ';
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  with   Column.Grid as TDBGridEh do
  if (DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftString,ftWideString] )
     then //and (UpperCase(Column.FieldName)<>UpperCase(''))
  begin
    Label1.Caption:= Column.Title.Caption;
    FilterFieldName:= Column.FieldName  ;
    Edit1.Left:=Label1.Width+ Label1.Left+5;
    Edit1.Text:='';
  end;
end;

procedure Tfm_main.Edit1Change(Sender: TObject);
begin
  with dm.qry_info  do
  begin
    Filtered:=False;
    if trim(Edit1.text)<>'' then
      begin
        Filter := FilterFieldName+' like ''%'+trim(edit1.text)+'%'''  ;
        Filtered:=True;
      end
    else
      begin
        dm.qry_info.filter := '';
      end;
  end;
end;

procedure Tfm_main.bbt_reportClick(Sender: TObject);
var
  ExpClass:TDBGridEhExportClass  ;
  Ext:String;
  FFileName:string;
begin
  SaveDialog1.FileName := Self.Caption;
  if SaveDialog1.Execute then
  begin
    case SaveDialog1.FilterIndex of
      1: begin ExpClass := TDBGridEhExportAsXLS;  Ext := 'xls'; end;
      2: begin ExpClass := TDBGridEhExportAsCSV;  Ext := 'csv'; end;
      3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
      4: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
    else
      ExpClass := nil; Ext := '';
    end;

    if ExpClass <> nil then
    begin
      if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
          UpperCase(Ext) then
        FFileName := SaveDialog1.FileName + '.' + Ext;

      if   FileExists(FFileName)   then
      if messagedlg('文件“'+FFileName+'”已经存在,你要覆盖吗?',mtconfirmation,[mbyes,mbno],0)=mrNo then
        Exit;

      SaveDBGridEhToExportFile(ExpClass,DBGridEh1,FFileName,True);    //导出全部数据。
    //　SaveDBGridEhToExportFile(ExpClass,TDBGridEh(ActiveControl),pExpFile,False);  //导出选择数据
    end;
  end;
end;

procedure Tfm_main.pm_changePopup(Sender: TObject);
begin
  with dm.qry_info do
  begin
    if FieldByName('active').Value = 1 then
      begin
        n_delete.Enabled := False;
        N_Effective.Enabled := false;
      end
    else
      begin
        n_delete.Enabled    := (StrToInt(vprev) In [2,4])and(IsEmpty=False) ;
        N_Effective.Enabled := (StrToInt(vprev) In [2,4])and(IsEmpty=False);
      end;
    N_New.Enabled:=StrToInt(vprev) In [2,4];
  //  N_Effective.Enabled:=;
  end;

end;

end.
