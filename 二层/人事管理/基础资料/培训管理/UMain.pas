unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, Menus, DB, ADODB,IdFTP,
  ComCtrls,DateUtils,ShellAPI;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    eh_Tclass: TDBGridEh;
    btn_export1: TBitBtn;
    btn_qry1: TBitBtn;
    edt_value: TEdit;
    lbl_field: TLabel;
    eh_file: TDBGridEh;
    pm1: TPopupMenu;
    mni_add: TMenuItem;
    mni_edit: TMenuItem;
    mni_Del: TMenuItem;
    mni_check: TMenuItem;
    mni_import: TMenuItem;
    mni_signIn: TMenuItem;
    ds_TC: TDataSource;
    ds_TCFile: TDataSource;
    qry_tc: TADOQuery;
    qry_TCFile: TADOQuery;
    btn_refresh: TBitBtn;
    pnl5: TPanel;
    pgc1: TPageControl;
    pnl6: TPanel;
    ts1: TTabSheet;
    btnExit: TBitBtn;
    ts2: TTabSheet;
    ts3: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    lbl_field2: TLabel;
    btn_export2: TBitBtn;
    btn_qry2: TBitBtn;
    edt_value2: TEdit;
    btn_refresh2: TBitBtn;
    Panel3: TPanel;
    eh2_detail: TDBGridEh;
    pm2: TPopupMenu;
    mni_add2: TMenuItem;
    mni_edit2: TMenuItem;
    mni_check2: TMenuItem;
    mni_del2: TMenuItem;
    mni_import2: TMenuItem;
    ds_TC2: TDataSource;
    qry_TC2: TADOQuery;
    qrytemp: TADOQuery;
    Panel5: TPanel;
    Panel6: TPanel;
    lbl_field3: TLabel;
    btn_refresh3: TBitBtn;
    btn_export3: TBitBtn;
    btn_qry3: TBitBtn;
    edt_value3: TEdit;
    Panel7: TPanel;
    eh_main3: TDBGridEh;
    ds_main3: TDataSource;
    qry_main3: TADOQuery;
    pm3: TPopupMenu;
    mni_add3: TMenuItem;
    mni_edit3: TMenuItem;
    mni_check3: TMenuItem;
    mni_del3: TMenuItem;
    mni_import3: TMenuItem;
    mni_ToPlan: TMenuItem;
    ts4: TTabSheet;
    pnl7: TPanel;
    ts6: TTabSheet;
    pnl8: TPanel;
    ts7: TTabSheet;
    lbl_field5: TLabel;
    edt_emp: TEdit;
    ds5: TDataSource;
    ds6: TDataSource;
    ds7: TDataSource;
    mni_GetPlans: TMenuItem;
    qrytemp2: TADOQuery;
    mni_ToDTainPlan: TMenuItem;
    mni_Signe: TMenuItem;
    eh4: TDBGridEh;
    btn_refresh4: TBitBtn;
    btn_export4: TBitBtn;
    btn_qry4: TBitBtn;
    pm4: TPopupMenu;
    mni2: TMenuItem;
    mni3: TMenuItem;
    mni4: TMenuItem;
    mni_Tsigne: TMenuItem;
    mni_TMonthPlan: TMenuItem;
    pnl11: TPanel;
    pgc2: TPageControl;
    ts8: TTabSheet;
    btn_SelDept: TBitBtn;
    lbl5: TLabel;
    edt_Dept: TEdit;
    btn2: TBitBtn;
    lbl6: TLabel;
    edt_post: TEdit;
    btn_SelPost: TBitBtn;
    lbl7: TLabel;
    edt_tc: TEdit;
    btn_selDTC: TBitBtn;
    lbl8: TLabel;
    BDate: TDateTimePicker;
    lbl9: TLabel;
    EDate: TDateTimePicker;
    lbl10: TLabel;
    edt_teacher: TEdit;
    ts9: TTabSheet;
    ts10: TTabSheet;
    eh7: TDBGridEh;
    btn_qry5: TBitBtn;
    btn_export567: TBitBtn;
    lbl_Ename: TLabel;
    eh6: TDBGridEh;
    eh5: TDBGridEh;
    sp5: TADOStoredProc;
    sp6: TADOStoredProc;
    sp7: TADOStoredProc;
    ds66: TDataSource;
    qry66: TADOQuery;
    pnl9: TPanel;
    lbl4: TLabel;
    btn1: TBitBtn;
    btn_qry6: TBitBtn;
    edt_Ecode: TEdit;
    eh66: TDBGridEh;
    eh66_Detail: TDBGridEh;
    ds66_file: TDataSource;
    qry66_file: TADOQuery;
    pmFile: TPopupMenu;
    mnistudy: TMenuItem;
    lbl_field4: TLabel;
    edt_value4: TEdit;
    ts5: TTabSheet;
    pnl10: TPanel;
    pnl12: TPanel;
    btn_refresh5: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    lbl_field55: TLabel;
    edt_value5: TEdit;
    ds_TrainRecord: TDataSource;
    qry_TrainRecord: TADOQuery;
    mni_Sigin: TMenuItem;
    eh55: TDBGridEh;
    pm5: TPopupMenu;
    mni1: TMenuItem;
    mni5: TMenuItem;
    mni6: TMenuItem;
    mni7: TMenuItem;
    mni8: TMenuItem;
    mniimport4: TMenuItem;
    pm71: TPopupMenu;
    mniEXam: TMenuItem;
    mniImportPaper: TMenuItem;
    mniPaperDetail: TMenuItem;
    pm1_2: TPopupMenu;
    mniLook: TMenuItem;
    procedure eh_TclassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure btn_export1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btn_qry1Click(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure mni_addClick(Sender: TObject);
    procedure mni_editClick(Sender: TObject);
    procedure mni_checkClick(Sender: TObject);
    procedure mni_DelClick(Sender: TObject);
    procedure qry_tcAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure mni_importClick(Sender: TObject);
    procedure eh_TclassTitleClick(Column: TColumnEh);
    procedure mni_signInClick(Sender: TObject);
    procedure edt_value2Change(Sender: TObject);
    procedure btn_refresh2Click(Sender: TObject);
    procedure btn_export2Click(Sender: TObject);
    procedure mni_add2Click(Sender: TObject);
    procedure mni_edit2Click(Sender: TObject);
    procedure mni_check2Click(Sender: TObject);
    procedure mni_del2Click(Sender: TObject);
    procedure mni_import2Click(Sender: TObject);
    procedure eh_main3TitleClick(Column: TColumnEh);
    procedure edt_value3Change(Sender: TObject);
    procedure mni_add3Click(Sender: TObject);
    procedure mni_edit3Click(Sender: TObject);
    procedure mni_check3Click(Sender: TObject);
    procedure mni_del3Click(Sender: TObject);
    procedure mni_import3Click(Sender: TObject);
    procedure btn_qry3Click(Sender: TObject);
    procedure eh_main3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mni_ToPlanClick(Sender: TObject);
    procedure btn_export3Click(Sender: TObject);
    procedure btn_qry2Click(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure mni_GetPlansClick(Sender: TObject);
    procedure eh2_detailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh2_detailTitleClick(Column: TColumnEh);
    procedure mni_ToDTainPlanClick(Sender: TObject);
    procedure mni_SigneClick(Sender: TObject);
    procedure mni_TsigneClick(Sender: TObject);
    procedure mni_TMonthPlanClick(Sender: TObject);
    procedure mni2Click(Sender: TObject);
    procedure btn_export4Click(Sender: TObject);
    procedure btn_export567Click(Sender: TObject);
    procedure btn_selDTCClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn_SelPostClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_qry5Click(Sender: TObject);
    procedure eh6DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn_qry6Click(Sender: TObject);
    procedure qry66AfterScroll(DataSet: TDataSet);
    procedure edt_EcodeExit(Sender: TObject);
    procedure mnistudyClick(Sender: TObject);
    procedure eh4TitleClick(Column: TColumnEh);
    procedure edt_value4Change(Sender: TObject);
    procedure btn_refresh4Click(Sender: TObject);
    procedure btn_refresh3Click(Sender: TObject);
    procedure mni_SiginClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure eh55KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_refresh5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure eh55TitleClick(Column: TColumnEh);
    procedure edt_EcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh66KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mniimport4Click(Sender: TObject);
    procedure mni3Click(Sender: TObject);
    procedure mni8Click(Sender: TObject);
    procedure mniEXamClick(Sender: TObject);
    procedure mniImportPaperClick(Sender: TObject);
    procedure mniPaperDetailClick(Sender: TObject);
    procedure eh66_DetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mniLookClick(Sender: TObject);
    procedure mni7Click(Sender: TObject);
  private
    { Private declarations }
     PreColumn,PreColumn3,PreColumn2,PreColumn4,PreColumn5: TColumnEh;
     FieldName1,FieldName2,FieldName3,FieldName4,FieldName5:string;
     FMSql,FMSql2,FMsql3,FMsql5:string;
     Fttype:string ; //培训类型为普通培训的rkey
     procedure GetData;
     procedure GetData2;
     procedure GetData3;
     procedure GetData5;

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
     uses uDM, Uqry,common,Uedit,Uedit2,UImport,UImport2,UImport5,USigne,Uedit3,Uedit4,uqry2,uqry3,UImport3,UToPlans,USelNewEmp ,
     Pick_Item_Single,ConstVar,uqry5,UImport4,UExam,UImport22,UPaperDetail;
{$R *.dfm}

procedure TfrmMain.eh_TclassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(qry_tc.SQL.Text);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  Lsql:string;
begin
    pgc1.ActivePageIndex:=6;
    pgc2.ActivePageIndex:=1;

    preColumn:=eh_tclass.columns[0];
    PreColumn.Title.Color:=clRed;
    FieldName1:=PreColumn.FieldName;

    PreColumn2:=eh2_detail.columns[0];
    PreColumn2.Title.Color:=clRed;
    FieldName2:=PreColumn2.FieldName;

    PreColumn3:=eh_main3.columns[0];
    PreColumn3.Title.Color:=clRed;
    FieldName3:=PreColumn3.FieldName;


    PreColumn4:=eh4.columns[0];
    PreColumn4.Title.Color:=clRed;
    FieldName4:=PreColumn4.FieldName;

    PreColumn5:=eh55.columns[0];
    PreColumn5.Title.Color:=clRed;
    FieldName5:=PreColumn5.FieldName;



    FMSql:=qry_tc.SQL.Text;
    FMsql2:=qry_tc2.sql.text;
    FMsql3:=qry_main3.sql.text;
    FMsql5:= qry_TrainRecord.SQL.Text;

    BDate.Date:= IncMonth(Now,-1);
    EDate.Date:= Now ;

    GetData;
    GetData2;
    GetData3;
    GetData5;
     //取培训类型为普通的RKEY：
    Lsql:='select rkey from datadetail where dictid=20 and item=''普通'' ' ;
    dm.OpenQry(dm.qry_temp,Lsql);
    Fttype:='';
    if not dm.qry_temp.IsEmpty  then
    Fttype:=dm.qry_temp.fieldbyname('rkey').asstring;

    BDate.date:=StartOftheYear(now);
    EDate.date:=EndOftheYear(now) ;
end;

procedure TfrmMain.edt_valueChange(Sender: TObject);
begin
   qry_tc.Filtered:=false;
  if qry_tc.FieldByName(FieldName1).FieldKind = fkCalculated then  exit;
  if qry_tc.FieldByName(FieldName1).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_tc.FieldByName(FieldName1).DataType in  [ftString, ftWideString]  then
        qry_tc.Filter:=FieldName1 + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_tc.FieldByName(FieldName1).DataType in  [ftSmallint, ftInteger]  then
        qry_tc.Filter:= FieldName1+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_tc.Filter:='';
  end;
  qry_tc.Filtered:=true;
end;

procedure TfrmMain.btn_export1Click(Sender: TObject);
begin
  if qry_tc.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(eh_Tclass,'培训课程明细');
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
close;
end;

procedure TfrmMain.btn_qry1Click(Sender: TObject);
var
Qrystr: string;
i:Integer;
Lfrm: Tfrmqry;
begin
  qrystr:='';
  try
   frmQry:=TFrmQry.create(nil);
   if FrmQry.ShowModal=mrok then
   begin
     for i:=0  to FrmQry.sg1.RowCount-2 do
     begin
      qrystr:=qrystr+ frmqry.sg1.Cells[2,i]
     end;
     qry_tc.SQL.Text:= FMSql+qrystr;
     try

      dm.OpenQry(qry_tc,qry_tc.SQL.Text);
      except on e: exception do
      begin
      ShowMessage('错误：' +e.Message);
      exit;
      end;
     end;
    end;
  finally
   frmqry.free;
  end;
end;

procedure TfrmMain.btn_refreshClick(Sender: TObject);
begin
  GetData;
end;

procedure TfrmMain.mni_addClick(Sender: TObject);
var
  Lfrm:TfrmEdit;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  LFrm:=Tfrmedit.create(self);
  try
   Lfrm.FEditType:=1;
   Lfrm.GetData(-1);
   Lfrm.pnl3.Enabled:=true;
   Lfrm.edt_CCOde.Enabled:=True;
   if Lfrm.ShowModal=mrok then
   begin
    qry_tc.close;
    qry_tc.Open;
    qry_tc.Last;
   end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_editClick(Sender: TObject);
var
  Lfrm:TfrmEdit;
  Frkey: integer;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_tc.IsEmpty  then exit;

  LFrm:=Tfrmedit.create(self);
  try
   Lfrm.FEditType:=2;
   frkey:=qry_tc.fieldbyname('rkey').AsInteger;
   Lfrm.GetData(qry_tc.fieldbyname('rkey').AsInteger);
   Lfrm.pnl3.Enabled:=true;
   Lfrm.edt_CCOde.Enabled:=false;
   if LFrm.ShowModal=mrok then
    begin
    GetData;
    qry_tc.Locate('rkey',Frkey,[]);
    end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_checkClick(Sender: TObject);
var
  Lfrm:TfrmEdit;
begin
  LFrm:=Tfrmedit.create(self);
  try
   Lfrm.FEditType:=3 ;
   Lfrm.GetData(qry_tc.fieldbyname('rkey').AsInteger);
   Lfrm.pnl3.Enabled:=false;
   Lfrm.edt_CCOde.Enabled:=false;
   LFrm.showmodal;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_DelClick(Sender: TObject);
var
  Lsql:string;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_tc.IsEmpty  then Exit;

  if Application.Messagebox('确认要删除吗！', '提示',mb_Iconinformation+MB_OKCANCEL) = mrCancel then exit;

  Lsql:='delete from   TrainClass where rkey='+qry_tc.fieldbyname('rkey').asstring+' ';
  dm.execsql(DM.qry_temp,Lsql);

  btn_refreshClick(sender);
end;

procedure TfrmMain.GetData;
begin
    qry_tc.close;
    qry_tc.Open;
end;

procedure TfrmMain.qry_tcAfterScroll(DataSet: TDataSet);
begin
 //if qry_tc.IsEmpty  then exit;
   qry_TCFile.Close;
   qry_TCFile.Parameters[0].value:=qry_tc.FieldValues['rkey'];
   qry_TCFile.Open;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

 vprev:='4';
 common.rkey73:='3023';
 common.user_ptr:='3301' ;

  if not App_init_2(DM.con) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

   self.Caption:=application.Title;
end;

procedure TfrmMain.mni_importClick(Sender: TObject);
var
  LFrm:TfrmImport;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  
  LFrm:=TfrmImport.Create(self);
  try
   Lfrm.ShowModal;

  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.eh_TclassTitleClick(Column: TColumnEh);
begin
  if qry_TC.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_TC.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_TC.Sort:=Column.FieldName+' DESC';
  end;

  if qry_TC.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (FieldName1 <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    FieldName1 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ; 
  end else
    edt_value.SetFocus;
end;

procedure TfrmMain.mni_signInClick(Sender: TObject);
var
  Lfrm:Tfrmsigne;
begin
  if (strtoint(vprev)=1) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_tc.IsEmpty then Exit;

  LFrm:=Tfrmsigne.create(self);
  try
   LFrm.edt_ccode.Text:=qry_tc.fieldbyname('ccode').asstring;
   LFrm.edt_cname.Text:=qry_tc.fieldbyname('cname').asstring;
   LFrm.edt_THours.Text:=qry_tc.fieldbyname('THours').asstring;
   Lfrm.BDate.Date:=common.getsystem_date(dm.qry_temp,1);
   LFrm.Edate.Date:=LFrm.BDate.date;
   Lfrm.BTime.Date:=common.getsystem_date(dm.qry_temp,0);
   Lfrm.ETime.Date:= Lfrm.BTime.Date;
   Lfrm.Ftc_ptr:=qry_tc.fieldbyname('rkey').asinteger;
   Lfrm.ShowModal;

  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.GetData2;
begin
    qry_tc2.close;
    qry_tc2.Open;
end;

procedure TfrmMain.edt_value2Change(Sender: TObject);
begin
   qry_tc2.Filtered:=false;
  if qry_tc2.FieldByName(FieldName2).FieldKind = fkCalculated then  exit;
  if qry_tc2.FieldByName(FieldName2).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value2.text) <> '' then
    begin
      if qry_tc2.FieldByName(FieldName2).DataType in  [ftString, ftWideString]  then
        qry_tc2.Filter:=FieldName2 + ' like ''%' + trim(edt_value2.text) + '%'' ' //+ statussql
      else if qry_tc2.FieldByName(FieldName2).DataType in  [ftSmallint, ftInteger]  then
        qry_tc2.Filter:=  FieldName2+' >= ' + inttostr(strtointdef(edt_value2.text,0));//+ statussql;
    end else
       qry_tc2.Filter:='';
  end;
  qry_tc2.Filtered:=true;
end;

procedure TfrmMain.btn_refresh2Click(Sender: TObject);
begin
GetData2;
end;

procedure TfrmMain.btn_export2Click(Sender: TObject);
begin
  if qry_tc2.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(eh2_detail,'部门职务培训课程明细');
end;

procedure TfrmMain.mni_add2Click(Sender: TObject);
var
  Lfrm:TfrmEdit2;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  LFrm:=TfrmEdit2.create(self);
  try
   Lfrm.FEditType:=1;
   Lfrm.GetData(-1);
   Lfrm.pnl3.Enabled:=true;
   if Lfrm.ShowModal=mrok then
   begin
    GetData2;
    qry_tc2.Last;
   end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_edit2Click(Sender: TObject);
var
  Lfrm:TfrmEdit2;
  Frkey:integer;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_tc2.IsEmpty  then exit;

  LFrm:=TfrmEdit2.create(self);
  try
   Lfrm.FEditType:=2;
   Frkey:=qry_tc2.fieldbyname('m_ptr').AsInteger;
   Lfrm.GetData(qry_tc2.fieldbyname('m_ptr').AsInteger);
   Lfrm.pnl3.Enabled:=true;
   if LFrm.ShowModal=mrok then
    begin
    GetData2;
    qry_tc2.Locate('m_ptr',Frkey,[]);
    end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_check2Click(Sender: TObject);
var
  Lfrm:TfrmEdit2;
begin
  LFrm:=Tfrmedit2.create(self);
  try
   Lfrm.FEditType:=3 ;
   Lfrm.GetData(qry_tc2.fieldbyname('m_ptr').AsInteger);
   Lfrm.pnl3.Enabled:=false;
   LFrm.showmodal;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_del2Click(Sender: TObject);
var
  Lsql:string;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_tc2.IsEmpty  then Exit;
   if Application.Messagebox('确认要删除吗！', '提示',mb_Iconinformation+MB_OKCANCEL) = mrCancel then exit;
  Lsql:='delete from   DeptPostTrainClass_main where rkey='+qry_tc2.fieldbyname('m_ptr').asstring+' ';
  dm.execsql(DM.qry_temp,Lsql);
  getdata2;
end;

procedure TfrmMain.mni_import2Click(Sender: TObject);
var
  LFrm:TfrmImport2;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  LFrm:=TfrmImport2.Create(self);
  try
   if  Lfrm.ShowModal=mrok then
   btn_refresh2Click(btn_refresh5);
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.GetData3;
var
  Lsql:string ;
begin
  Lsql:=FMSql3 +' and left(a.Pmonth,4)='''+formatdatetime('yyyy',now)+'''  '  ;
  dm.OpenQry(qry_main3,Lsql) ;
end;

procedure TfrmMain.eh_main3TitleClick(Column: TColumnEh);
begin
 if qry_main3.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_main3.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_main3.Sort:=Column.FieldName+' DESC';
  end;

  if qry_main3.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (FieldName3 <> column.FieldName) then
  begin
    lbl_field3.Caption := column.Title.Caption ;
    FieldName3 := column.FieldName ;
    edt_value3.SetFocus;
    PreColumn3.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn3 := column ;
  end else
    edt_value3.SetFocus;
end;

procedure TfrmMain.edt_value3Change(Sender: TObject);
begin
   qry_main3.Filtered:=false;
  if qry_main3.FieldByName(FieldName3).FieldKind = fkCalculated then  exit;
  if qry_main3.FieldByName(FieldName3).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value3.text) <> '' then
    begin
      if qry_main3.FieldByName(FieldName3).DataType in  [ftString, ftWideString]  then
        qry_main3.Filter:=FieldName3 + ' like ''%' + trim(edt_value3.text) + '%'' ' //+ statussql
      else if qry_main3.FieldByName(FieldName3).DataType in  [ftSmallint, ftInteger]  then
        qry_main3.Filter:= FieldName3+' >= ' + inttostr(strtointdef(edt_value3.text,0));//+ statussql;
    end else
       qry_main3.Filter:='';
  end;
  qry_main3.Filtered:=true;
end;

procedure TfrmMain.mni_add3Click(Sender: TObject);
var
  Lfrm:TfrmEdit3;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  LFrm:=Tfrmedit3.create(self);
  try
   Lfrm.FEditType:=1;
   Lfrm.GetData('-1');
   Lfrm.pnl3.Enabled:=true;
   if Lfrm.ShowModal=mrok then
   begin
     GetData3;
   end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_edit3Click(Sender: TObject);
var
  Lfrm:TfrmEdit3;
  Frkey:integer;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_main3.IsEmpty  then exit;
  
  LFrm:=Tfrmedit3.create(self);
  try
   Lfrm.FEditType:=2;
   Frkey:=qry_main3.fieldbyname('rkey').asinteger;
   Lfrm.GetData(qry_main3.fieldbyname('rkey').asstring);

    LFrm.edt_PMonth.Text:=qry_main3.fieldbyname('Pmonth').asstring;
    LFrm.Pdate.date:=qry_main3.fieldbyname('Pdate').AsDateTime;
    LFrm.BDate.date:=qry_main3.fieldbyname('Bdate').AsDateTime;
    LFrm.EDate.date:=qry_main3.fieldbyname('EDate').AsDateTime;
    LFrm.BTime.date:=qry_main3.fieldbyname('BTime').AsDateTime;
    LFrm.ETime.date:=qry_main3.fieldbyname('ETime').AsDateTime;
    LFrm.edt_TTeacher.text:= qry_main3.fieldbyname('teacher').asstring;
    LFrm.edt_TPlace.text:=  qry_main3.fieldbyname('Place').asstring;
    LFrm.edt_THOurs.text:= qry_main3.fieldbyname('THours').value;
    LFrm.edt_remark.text:=  qry_main3.fieldbyname('remark').asstring;
    LFrm.cbb_TType.ItemIndex:= LFrm.cbb_TType.Items.IndexOfObject(TObject(qry_main3.Fieldbyname('Ttype').AsInteger));


   Lfrm.pnl3.Enabled:=true;
   if Lfrm.ShowModal=mrok then
    begin
    GetData3;
    qry_main3.Locate('rkey',Frkey,[]);
    end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_check3Click(Sender: TObject);
var
  Lfrm:TfrmEdit3;
begin


  LFrm:=Tfrmedit3.create(self);
  try
   Lfrm.FEditType:=3;
   Lfrm.GetData(qry_main3.fieldbyname('rkey').asstring);
   
    LFrm.edt_PMonth.Text:=qry_main3.fieldbyname('Pmonth').asstring;
    LFrm.Pdate.date:=qry_main3.fieldbyname('Pdate').AsDateTime;
    LFrm.BDate.date:=qry_main3.fieldbyname('Bdate').AsDateTime;
    LFrm.EDate.date:=qry_main3.fieldbyname('EDate').AsDateTime;
    LFrm.BTime.date:=qry_main3.fieldbyname('BTime').AsDateTime;
    LFrm.ETime.date:=qry_main3.fieldbyname('ETime').AsDateTime;
    LFrm.edt_TTeacher.text:= qry_main3.fieldbyname('teacher').asstring;
    LFrm.edt_TPlace.text:=  qry_main3.fieldbyname('Place').asstring;
    LFrm.edt_THOurs.text:= qry_main3.fieldbyname('THours').value;
    LFrm.edt_remark.text:=  qry_main3.fieldbyname('remark').asstring;
    LFrm.cbb_TType.ItemIndex:= LFrm.cbb_TType.Items.IndexOfObject(TObject(qry_main3.Fieldbyname('Ttype').AsInteger));
   
   Lfrm.pnl3.Enabled:=false;
   Lfrm.ShowModal;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_del3Click(Sender: TObject);
var
  Lsql:string;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
   if qry_main3.IsEmpty then exit;
  if Application.Messagebox('确认要删除吗！', '提示',mb_Iconinformation+MB_OKCANCEL) = mrCancel then exit;
   LSql:='delete from trainPlan where rkey='+qry_main3.fieldbyname('rkey').AsString;
   dm.execsql(dm.qry_temp,Lsql);
   GetData3;
end;

procedure TfrmMain.mni_import3Click(Sender: TObject);
var
  LFrm:TfrmImport3;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  
  LFrm:=TfrmImport3.Create(self);
  try
   Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.btn_qry3Click(Sender: TObject);
var
Lfrm: TfrmQry3;
Sqlstr,Lsql:string;
i:integer;
begin
  Lfrm:=TfrmQry3.Create(self);

  try
    if Lfrm.ShowModal=mrok then
    begin
    Sqlstr:='';
    for i:=1 to Lfrm.SGrid1.RowCount-2 do
      if Lfrm.SGrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Lfrm.SGrid1.Cells[2,i];
    BDate.Date:=Lfrm.DateTimePicker1.Date;
    EDate.Date:=Lfrm.DateTimePicker2.Date;
    Lsql:=FMSql3+Sqlstr ;//+' and left(a.Pmonth,4)='''+formatdatetime('yyyy',now)+'''  '  ;
    dm.OpenQry(qry_main3,Lsql);
    end;
  finally
    Lfrm.Free;
  end
end;

procedure TfrmMain.eh_main3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(qry_main3.SQL.Text);
end;

procedure TfrmMain.mni_ToPlanClick(Sender: TObject);
var
  Lfrm:TfrmToPLans;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  LFrm:=TfrmToPLans.create(self);
  try
   Lfrm.edt_tc.text:=qry_tc.fieldbyname('ccode').asstring;
   LFrm.edt_tc.tag:=qry_tc.fieldbyname('rkey').asinteger;
   LFrm.lbl_cName.caption:=qry_tc.fieldbyname('cname').asstring;
   if Lfrm.ShowModal=mrok then
   begin
    qry_tc.close;
    qry_tc.Open;
   end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.btn_export3Click(Sender: TObject);
begin
  if qry_main3.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(eh_main3,'培训计划');
end;

procedure TfrmMain.btn_qry2Click(Sender: TObject);
var
Qrystr: string;
i:Integer;
Lfrm: TFrmQry2;
begin
qrystr:='';
  try
   Lfrm:=TFrmQry2.create(self);
   if Lfrm.ShowModal=mrok then
   begin
     for i:=0  to Lfrm.sg1.RowCount-2 do
     begin
      qrystr:=qrystr+ Lfrm.sg1.Cells[2,i]
     end;
     qry_tc2.SQL.Text:= FMSql2+qrystr;
     try

      dm.OpenQry(qry_tc2,FMSql2+qrystr);
      except on e: exception do
      begin
      ShowMessage('错误：' +e.Message);
      exit;
      end;
     end;
    end;
  finally
   Lfrm.free;
  end;
end;

procedure TfrmMain.pgc1Change(Sender: TObject);
begin
  if (pgc1.ActivePageIndex<6) and (strtoint(vprev)=1) then  //1权限只有查看权限
  begin
  showmessage('您没有权限查看！');
  exit;
  end;

  if (pgc1.ActivePageIndex<5) and (strtoint(vprev)<=2) then  //2权限部门主管可以查看
  begin
  showmessage('您没有权限查看！');
  exit;
  end;
end;

procedure TfrmMain.mni_GetPlansClick(Sender: TObject);
var
  Lfrm:TfrmSelNewEmp;
  Lsql,str,ttype:string;
  BDate,EDate:TDateTime;
  PDays:integer;
begin
//  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
//  begin
//    showmessage('对不起您只有该程序的只读权限');
//    exit;
//  end;
//
//  LFrm:=TfrmSelNewEmp.create(self);
//
// try
//   if not LFrm.qry1.Active  then  LFrm.qry1.open;
//
//   if LFrm.ShowModal=mrok  then
//   begin
//   try
//     dm.con.BeginTrans;
//     
//     LFrm.qry1.Filtered:=false;
//     LFrm.qry1.Filter:='  isSelected=1' ;;
//     LFrm.qry1.Filtered:=true;
//
//     LFrm.qry1.first;
//     while not LFrm.qry1.eof do
//     begin
//       Lsql:='  select a.DeptID,a.PostID, c.*,d.item  '+
//        ' from  DeptPostTrainClass_main a'+
//        ' inner join DeptPostTrainClass_detail b on a.rkey=b.m_ptr'+
//        ' inner join trainclass c on b.tc_ptr=c.rkey'+
//        ' inner join datadetail d on c.ctype2=d.rkey'+
//        ' where d.dictid=1 and a.DeptID='+Lfrm.qry1.FieldByName('DepartmentiD').asstring+'  and  a.PostID='+Lfrm.qry1.FieldByName('Station').asstring+' ';
//       dm.OpenQry(qrytemp,Lsql);
//       if qrytemp.IsEmpty then
//       begin
//       ShowMessage('没有员工:'+Lfrm.qry1.FieldByName('employeecode').asstring+'对应的部门和岗位的培训课程请先录入！');
//       exit;
//       end;
//
//       if PDays>0  then
//       begin
//        Bdate:= Lfrm.qry1.FieldByName('ondutytime').asdatetime;
//        EDate:= Lfrm.qry1.FieldByName('ondutytime').asdatetime+pdays;
//       end
//       else
//       begin
//        Bdate:= 0;
//        EDate:= 0;
//       end;
//
//      qrytemp.First;
//      while not qrytemp.Eof do
//      begin
//       if  qrytemp.FieldByName('item').asstring='入职培训' then
//        PDays:=30
//       else  if  qrytemp.FieldByName('item').asstring='岗前培训' then
//       PDays:=90
//       else
//       Pdays:=0;
//
//      Lsql:='insert into trainplan(employeeid,ttype, tc_ptr,deptID, PostID,Bdate,Edate,Isfinished,remark) values('+
//             ' '+LFrm.qry1.fieldbyname('rkey').asstring+','+dm.qry_temp.fieldbyname('rkey').asstring+','+qrytemp.fieldbyname('rkey').asstring+', '+
//              ' '+qrytemp.fieldbyname('DeptID').asstring+','+qrytemp.fieldbyname('PostID').asstring+','''+datetostr(BDate)+''','''+datetostr(EDate)+''',0,''手动批量生成'' )';
//       dm.execsql(qrytemp2,Lsql);
//      qrytemp.Next;
//      end;
//
//       LSql:='update employeemsg set isPlan=1 where rkey='+LFrm.qry1.fieldbyname('rkey').asstring+' ' ;
//       dm.execsql(qrytemp2,Lsql);
//       LFrm.qry1.next;
//     end;
//
//     ShowMessage('生成成功！');
//     dm.con.CommitTrans;
//     except on e:Exception do
//     begin
//      ShowMessage('错误');
//      dm.con.RollbackTrans;
//     end;
//     end;
//    end;
// finally
//    Lfrm.free;
// end;

end;

procedure TfrmMain.eh2_detailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(qry_tc2.SQL.Text);
end;

procedure TfrmMain.eh2_detailTitleClick(Column: TColumnEh);
begin
 if qry_tc2.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_tc2.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_tc2.Sort:=Column.FieldName+' DESC';
  end;

  if qry_tc2.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (FieldName2 <> column.FieldName) then
  begin
    lbl_field2.Caption := column.Title.Caption ;
    FieldName2 := column.FieldName ;
    edt_value2.SetFocus;
    PreColumn2.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
  end else
    edt_value2.SetFocus;
end;

procedure TfrmMain.mni_ToDTainPlanClick(Sender: TObject);
var
  Pmonth,Lsql:string;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_TC2.IsEmpty then Exit;
  PMonth:=InputBox('请输入月份','月份如：2017-01',FormatDateTime('yyyy-MM',incmonth(now,1)));

  if InputQuery('请输入月份','2017-01',PMonth)=true then
  begin
  Lsql:='insert into trainPlan(tc_ptr,ttype,DeptID,Pmonth,Isfinished) values('+
     ' '+qry_tc2.fieldbyname('tc_ptr').asstring+','+Fttype+','+qry_tc2.fieldbyname('DeptID').asstring+','''+Pmonth+''',0 '+
     ')';
  dm.execsql(dm.qry_temp,Lsql);   
  showmessage('生成成功！');
  end;
end;

procedure TfrmMain.mni_SigneClick(Sender: TObject);
var
  Lfrm:Tfrmsigne;
begin
  if (strtoint(vprev)=1) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_main3.IsEmpty then Exit;

  if qry_main3.fieldbyname('BDate').Asstring<'2000-01-01' then
  begin
  ShowMessage('请先录入培训时间段等资料！');
  Exit;
  end;

  LFrm:=Tfrmsigne.create(self);
  try
   LFrm.edt_ccode.Text:=qry_main3.fieldbyname('ccode').asstring;
   LFrm.edt_cname.Text:=qry_main3.fieldbyname('cname').asstring;
   LFrm.edt_THours.Text:=qry_main3.fieldbyname('THours').asstring;
   Lfrm.BDate.Date:=qry_main3.fieldbyname('BDate').AsDateTime;
   LFrm.Edate.Date:=qry_main3.fieldbyname('Edate').AsDateTime ;
   Lfrm.BTime.Date:=qry_main3.fieldbyname('BTime').AsDateTime;
   Lfrm.ETime.Date:=qry_main3.fieldbyname('ETime').AsDateTime ;

   Lfrm.Ftc_ptr:=qry_main3.fieldbyname('tc_ptr').asinteger;

     Lfrm.btn_begin.Visible:=false;
     Lfrm.BDate.Enabled:=false;
     Lfrm.EDate.Enabled:=false;
     Lfrm.BTime.Enabled:=false;
     LFrm.Etime.Enabled:=false;
     Lfrm.edt_TTeacher.Enabled:=false;
     Lfrm.edt_TPlace.Enabled:=false;
     Lfrm.edt_THOurs.Enabled:=false;



   Lfrm.ShowModal;

  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_TsigneClick(Sender: TObject);
var
  Lfrm:Tfrmsigne;
begin

//  if  (strtoint(vprev)<>4) then
//  begin
//    showmessage('对不起您只有该程序的只读权限');
//    exit;
//  end;

  if qry_main3.IsEmpty then Exit;

  if qry_main3.fieldbyname('BDate').Asstring<'2000-01-01' then
  begin
  ShowMessage('请先录入培训时间段等资料才能签到！');
  Exit;
  end;

  LFrm:=Tfrmsigne.create(self);
  try
   LFrm.edt_ccode.Text:=qry_main3.fieldbyname('ccode').asstring;
   LFrm.edt_cname.Text:=qry_main3.fieldbyname('cname').asstring;
   LFrm.edt_THours.Text:=qry_main3.fieldbyname('THours').asstring;
   Lfrm.BDate.Date:=qry_main3.fieldbyname('BDate').AsDateTime;
   LFrm.Edate.Date:=qry_main3.fieldbyname('Edate').AsDateTime ;
   Lfrm.BTime.Date:=qry_main3.fieldbyname('BTime').AsDateTime;
   Lfrm.ETime.Date:=qry_main3.fieldbyname('ETime').AsDateTime ;
   LFrm.edt_TTeacher.text:= qry_main3.fieldbyname('teacher').asstring ;
   Lfrm.edt_TPlace.text := qry_main3.fieldbyname('place').asstring ;
   Lfrm.edt_THOurs.text:= qry_main3.fieldbyname('thours').asstring ;
   
   Lfrm.Ftc_ptr:=qry_main3.fieldbyname('tc_ptr').asinteger;

   Lfrm.btn_begin.Visible:=false;
   Lfrm.BDate.Enabled:=false;
   Lfrm.EDate.Enabled:=false;
   Lfrm.BTime.Enabled:=false;
   LFrm.Etime.Enabled:=false;
   Lfrm.edt_TTeacher.Enabled:=false;
   Lfrm.edt_TPlace.Enabled:=false;
   Lfrm.edt_THOurs.Enabled:=false;
   Lfrm.ShowModal;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni_TMonthPlanClick(Sender: TObject);
var
  Lfrm:TfrmEdit3;
  Frkey:integer;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  LFrm:=Tfrmedit3.create(self);
  try
   Lfrm.FEditType:=2;
   Frkey:=qry_main3.fieldbyname('rkey').asinteger;
   Lfrm.GetData(qry_main3.fieldbyname('rkey').asstring);
   Lfrm.pnl3.Enabled:=true;
   if Lfrm.ShowModal=mrok then
    begin
    GetData3;
    qry_main3.Locate('rkey',Frkey,[]);
    end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni2Click(Sender: TObject);
var
  Lfrm:TfrmEdit4;
  Frkey:integer;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_main3.IsEmpty  then exit;

  LFrm:=TfrmEdit4.create(self);
  try
   Lfrm.FEditType:=2;
   Frkey:=qry_main3.fieldbyname('rkey').asinteger;
   Lfrm.GetData(qry_main3.fieldbyname('rkey').asstring);
   Lfrm.pnl3.Enabled:=true;
   if Lfrm.ShowModal=mrok then
    begin
    GetData3;
    qry_main3.Locate('rkey',Frkey,[]);
    end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.btn_export4Click(Sender: TObject);
begin
  if qry_main3.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(eh4,'月度培训计划');
end;

procedure TfrmMain.btn_export567Click(Sender: TObject);
begin
   if (pgc2.ActivePageIndex= 0) and  (not sp5.IsEmpty) then
   common.Export_dbGridEH_to_Excel(eh5,'讲师培训计划')
   else  if (pgc2.ActivePageIndex= 1) and (not sp6.IsEmpty) then
   common.Export_dbGridEH_to_Excel(eh6,'部门培训计划')
   else  if (pgc2.ActivePageIndex= 2) and (not sp7.IsEmpty)then
   common.Export_dbGridEH_to_Excel(eh7,'个人培训计划')
end;

procedure TfrmMain.btn_selDTCClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'ccode/课程编号/120,cname/课程名/120';
    InputVar.Sqlstr := 'select rkey,ccode,cname from   trainclass ';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.con ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_tc.Text:= frmPick_Item_Single.adsPick.fieldbyname('ccode').AsString;
      edt_tc.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmMain.btn2Click(Sender: TObject);
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
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmMain.btn_SelPostClick(Sender: TObject);
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

procedure TfrmMain.btn_SelDeptClick(Sender: TObject);
 var
 inputRec:PdlgInput;
begin
    frmPick_item_single:= TfrmPick_item_single.Create(nil);
    inputRec.fields:= 'employeecode/工号/80,chineseName/姓名/100';
    inputrec.sqlstr:='select  rkey, employeeCode,chineseName  from employeemsg where  status<>2';
    inputrec.keyField:='rKey' ;
    inputrec.ADoConn:=dm.con;
    try
    frmPick_item_single.InitForm_New(inputrec);
    if frmPick_item_single.ShowModal =mrok then
    begin
     edt_emp.text:= frmPick_item_single.adsPick.fieldbyname('employeeCode').asstring;
    // edt_emp.Tag:= frmpick_item_single.adsPick.fieldByName('rkey').asinteger
     lbl_Ename.Caption:= frmPick_item_single.adsPick.fieldbyname('chineseName').asstring;
    end;
    finally
      frmpick_item_single.Free;
   end;

end;

procedure TfrmMain.btn_qry5Click(Sender: TObject);
var
  DeptID, PostID,tc_ptr:integer;
  BMonth,EMonth,teacher,ecode:string;
begin
   if Trim(edt_Dept.Text)<>'' then Deptid:=edt_Dept.Tag else DeptID:=0;
   if Trim(edt_post.Text)<>'' then PostID:=edt_post.Tag else postid:=0;
   if Trim(edt_tc.Text)<>''  then tc_ptr:=edt_tc.Tag else tc_ptr:=0;

   Bmonth:=FormatDateTime('yyyy-MM',BDate.Date);
   Emonth:=FormatDateTime('yyyy-MM',EDate.Date);

   if trim(edt_teacher.text)<>''  then
    teacher:=trim(edt_teacher.text)
   else teacher:='';
   if trim(edt_emp.text)<>''  then
    ecode:=trim(edt_emp.text)
    else ecode:='0';

   if pgc2.ActivePageIndex=0 then   //讲师报告：
   begin
    sp5.Close;
    sp5.Parameters.ParamByName('@Bmonth').Value:= Bmonth;
    sp5.Parameters.ParamByName('@Emonth').Value:=EMonth;
    sp5.Parameters.ParamByName('@tc_ptr').Value:= tc_ptr;
    sp5.Parameters.ParamByName('@teacher').Value:= teacher;
    sp5.open;
   end
   else  if pgc2.ActivePageIndex=1 then   //部门报告
   begin
    sp6.Close;
    sp6.Parameters.ParamByName('@Bmonth').Value:= Bmonth;
    sp6.Parameters.ParamByName('@Emonth').Value:=EMonth;
    sp6.Parameters.ParamByName('@tc_ptr').Value:= tc_ptr;
    sp6.Parameters.ParamByName('@DeptID').Value:= DeptID;
    sp6.open ;
   end
   else  if pgc2.ActivePageIndex=2 then   //个人报告
   begin
    sp7.Close;
    sp7.Parameters.ParamByName('@Bmonth').Value:= Bmonth ;
    sp7.Parameters.ParamByName('@Emonth').Value:=Emonth ;
    sp7.Parameters.ParamByName('@tc_ptr').Value:= tc_ptr;
    sp7.Parameters.ParamByName('@DeptID').Value:= DeptID;
    sp7.Parameters.ParamByName('@PostID').Value:= PostID;
    sp7.Parameters.ParamByName('@ECode').Value:= ECode;
    sp7.open  ;
   end
end;

procedure TfrmMain.eh6DblClick(Sender: TObject);
begin
  if  sp6.IsEmpty then Exit;

  pgc2.ActivePageIndex:=2;

  sp7.Close;
  sp7.Parameters.ParamByName('@Bmonth').Value:= FormatDateTime('yyyy-MM',BDate.Date);
  sp7.Parameters.ParamByName('@Emonth').Value:=FormatDateTime('yyyy-MM',EDate.Date);
  sp7.Parameters.ParamByName('@tc_ptr').Value:= sp6.Fieldbyname('tc_ptr').AsInteger;
  sp7.Parameters.ParamByName('@DeptID').Value:= sp6.Fieldbyname('DeptID').AsInteger;
  sp7.Parameters.ParamByName('@PostID').Value:= 0;
  sp7.Parameters.ParamByName('@ECode').Value:= '0';
  sp7.open

end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
if qry66.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(eh66,'个人培训明细');
end;

procedure TfrmMain.btn_qry6Click(Sender: TObject);
begin
   if Trim(edt_Ecode.text)='' then
   begin
   ShowMessage('请先录入工号再查询！');
   exit;
   end;
   qry66.Close;
   qry66.Parameters[0].Value:=Trim(edt_Ecode.text);
   qry66.Parameters[1].Value:=Trim(edt_Ecode.text);
   qry66.open;
end;

procedure TfrmMain.qry66AfterScroll(DataSet: TDataSet);
begin
  if qry66.IsEmpty then Exit;
  qry66_file.Close;
  qry66_file.Parameters[0].Value:=qry66.fieldbyName('tc_ptr').AsInteger;
  qry66_file.Open;
end;

procedure TfrmMain.edt_EcodeExit(Sender: TObject);
begin
if Trim(edt_Ecode.Text)=''  then exit;
btn_qry6Click(sender);
end;

procedure TfrmMain.mnistudyClick(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName,FDFIleName:string;
  LSaveDlg: TSaveDialog;
  Lsql:string;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LFtp:= TIdFTP.Create(nil);
  try
      Lsql:= 'SELECT FileName,Ftp_FileName FROM Tier3_CustomerFiles WHERE IDKey = ' + QuotedStr(qry66_file.fieldbyname('FtpIDKey').AsString);
     dm.OpenQry(qrytemp,Lsql);

    if not qrytemp.IsEmpty then
    begin
      LFileName:= qrytemp.Fields[0].AsString;
      LFtpName:= qrytemp.Fields[1].AsString;
      LSaveDlg.FileName:= LFileName;
//      if LSaveDlg.Execute then
//      begin
          Lsql:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                  ' from tier3_ftplist where rkey = ' + qry66_file.fieldbyname('Ftp_ptr').AsString;
         dm.OpenQry(qrytemp,Lsql);
          if not qrytemp.IsEmpty then
          begin
            LFtp.Host := qrytemp.Fields[1].AsString;
            LFtp.Username := qrytemp.Fields[2].AsString;
            LFtp.Password := qrytemp.Fields[3].AsString;
            LFtpDir := Trim(qrytemp.Fields[4].AsString);
          end;

        try
          if not LFtp.Connected then LFtp.Connect(True,10000);
          if LFTp.Connected then
          begin
            FDFIleName:=ExtractFilePath(Application.Exename)+LFileName;
            LFTp.Get(LFtpDir+LFtpName,FDFIleName,True);         //LSaveDlg.FileName
            if FileExists(FDFIleName) then
             shellexecute(handle, 'open', PChar(FDFIleName), nil, nil, SW_SHOWNORMAL);
          end;
        except
          ShowMessage('FTP链接失败,下载失败');
          Exit;
        end;
     // end;
    end
    else
    begin
      ShowMessage('此文件还没有上传到FTP，请先保存后再下载！');
      exit;
    end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LFTp.Free;
  end;

end;

procedure TfrmMain.eh4TitleClick(Column: TColumnEh);
begin
if qry_main3.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_main3.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_main3.Sort:=Column.FieldName+' DESC';
  end;

  if qry_main3.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (FieldName4<> column.FieldName) then
  begin
    lbl_field4.Caption := column.Title.Caption ;
    FieldName4 := column.FieldName ;
    edt_value4.SetFocus;
    PreColumn4.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn4 := column ;
  end else
    edt_value4.SetFocus;
end;

procedure TfrmMain.edt_value4Change(Sender: TObject);
begin
   qry_TrainRecord.Filtered:=false;
  if qry_TrainRecord.FieldByName(FieldName5).FieldKind = fkCalculated then  exit;
  if qry_TrainRecord.FieldByName(FieldName5).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value5.text) <> '' then
    begin
      if qry_TrainRecord.FieldByName(FieldName5).DataType in  [ftString, ftWideString]  then
        qry_TrainRecord.Filter:=FieldName5 + ' like ''%' + trim(edt_value5.text) + '%'' ' //+ statussql
      else if qry_TrainRecord.FieldByName(FieldName5).DataType in  [ftSmallint, ftInteger]  then
        qry_TrainRecord.Filter:= FieldName5+' >= ' + inttostr(strtointdef(edt_value5.text,0));//+ statussql;
    end else
       qry_TrainRecord.Filter:='';
  end;
  qry_TrainRecord.Filtered:=true;
end;

procedure TfrmMain.btn_refresh4Click(Sender: TObject);
begin
GetData3;
end;

procedure TfrmMain.btn_refresh3Click(Sender: TObject);
begin
GetData3;
end;

procedure TfrmMain.mni_SiginClick(Sender: TObject);
var
  Lfrm:Tfrmsigne;
begin

  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_tc2.IsEmpty then Exit;

//  if qry_tc2.fieldbyname('BDate').Asstring<'2000-01-01' then
//  begin
//  ShowMessage('请先录入培训时间段等资料才能签到！');
//  Exit;
//  end;

  LFrm:=Tfrmsigne.create(self);
  try
   LFrm.edt_ccode.Text:=qry_tc2.fieldbyname('ccode').asstring;
   LFrm.edt_cname.Text:=qry_tc2.fieldbyname('cname').asstring;
   //LFrm.edt_THours.Text:=qry_main3.fieldbyname('THours').asstring;
   Lfrm.BDate.Date:=now;
   LFrm.Edate.Date:=now ;
   Lfrm.BTime.Date:=now;
   Lfrm.ETime.Date:=now;
//   LFrm.edt_TTeacher.text:= qry_main3.fieldbyname('teacher').asstring ;
//   Lfrm.edt_TPlace.text := qry_main3.fieldbyname('place').asstring ;
   Lfrm.edt_THOurs.text:= '60' ;
   
   Lfrm.Ftc_ptr:=qry_TC2.fieldbyname('tc_ptr').asinteger;

//     Lfrm.btn_begin.Visible:=false;
//     Lfrm.BDate.Enabled:=false;
//     Lfrm.EDate.Enabled:=false;
//     Lfrm.BTime.Enabled:=false;
//     LFrm.Etime.Enabled:=false;
//     Lfrm.edt_TTeacher.Enabled:=false;
//     Lfrm.edt_TPlace.Enabled:=false;
//     Lfrm.edt_THOurs.Enabled:=false;
   Lfrm.ShowModal;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.GetData5;
begin
 // qry_TrainRecord.
  qry_TrainRecord.Close;
  qry_TrainRecord.SQL.Text:=FMsql5+ ' and startdate>='''+formatdatetime('yyyy-MM-dd',IncMonth(getsystem_date(qrytemp,1),-1))+''' and startdate<='''+formatdatetime('yyyy-MM-dd',getsystem_date(qrytemp,1))+'''  and (train_status=0 or train_status=1) and train_feels=0 ';
 //showmessage(qry_TrainRecord.SQL.Text);
  //qry_TrainRecord.Parameters.ParamByName('dtpk1').Value:=IncMonth(getsystem_date(qrytemp,1),-1);
  //qry_TrainRecord.Parameters.ParamByName('dtpk2').Value:=getsystem_date(qrytemp,1);
  qry_TrainRecord.Open;
end;

procedure TfrmMain.btn5Click(Sender: TObject);
var
Qrystr: string;
i:Integer;
Lfrm: Tfrmqry5;
begin
qrystr:='';
 Lfrm:=TFrmQry5.create(self);
  try
  if Lfrm.showmodal=mryes then
   begin
     for i:=0  to Lfrm.sgCondition.RowCount-2 do
     begin
      qrystr:=qrystr+ Lfrm.sgCondition.Cells[2,i]
     end;
     qrystr:=qrystr+' and startdate>='''+formatdatetime('yyyy-MM-dd',Lfrm.dtpkqueryStart.date)+''' and  startdate<= '''+formatdatetime('yyyy-MM-dd',Lfrm.dtpkqureyEnd.date)+''' ' ;

    // qry_trainrecord.SQL.Text:= FMSql5+qrystr;
    // showmessage(FMSql5+qrystr);
     try

      dm.OpenQry(qry_trainrecord,FMSql5+qrystr);
      except on e: exception do
      begin
      ShowMessage('错误：' +e.Message);
      exit;
      end;
     end;
    end;
  finally
   Lfrm.free;
  end;
end;

procedure TfrmMain.eh55KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(qry_trainrecord.SQL.Text);
end;

procedure TfrmMain.btn_refresh5Click(Sender: TObject);
begin
 GetData5;
end;

procedure TfrmMain.btn4Click(Sender: TObject);
begin
  if qry_TrainRecord.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(eh55,'培训记录');
end;

procedure TfrmMain.eh55TitleClick(Column: TColumnEh);
begin
if qry_TrainRecord.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_TrainRecord.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_TrainRecord.Sort:=Column.FieldName+' DESC';
  end;

  if qry_TrainRecord.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (FieldName5 <> column.FieldName) then
  begin
    lbl_field55.Caption := column.Title.Caption ;
    FieldName5 := column.FieldName ;
    edt_value5.SetFocus;
    PreColumn5.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn3 := column ;
  end else
    edt_value5.SetFocus;
end;

procedure TfrmMain.edt_EcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key<>13 then    exit;
 btn_qry6Click(sender);
end;

procedure TfrmMain.eh66KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(qry66.SQL.Text);
end;

procedure TfrmMain.mniimport4Click(Sender: TObject);
var
  LFrm:TfrmImport4;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  
  LFrm:=TfrmImport4.Create(self);
  try
   Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.mni3Click(Sender: TObject);
var
  Lfrm:TfrmEdit4;
  Frkey:integer;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_main3.IsEmpty  then exit;

  LFrm:=TfrmEdit4.create(self);
  try
   Lfrm.FEditType:=3;
   Frkey:=qry_main3.fieldbyname('rkey').asinteger;
   Lfrm.GetData(qry_main3.fieldbyname('rkey').asstring);
   Lfrm.pnl3.Enabled:=false;
   if Lfrm.ShowModal=mrok then
    begin
    GetData3;
    qry_main3.Locate('rkey',Frkey,[]);
    end;
  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mni8Click(Sender: TObject);
var
  LFrm:TfrmImport5;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  LFrm:=TfrmImport5.Create(self);
  try
   if  Lfrm.ShowModal=mrok then
   btn_refresh5Click(btn_refresh5);
  finally
    Lfrm.Free;
  end;

end;

procedure TfrmMain.mniEXamClick(Sender: TObject);
var
  Lfrm:TfrmExam;
  Lsql,Lresult,Ltype,LFileName: string;
begin
   //判断学习课件是否已关闭
//   if not qry66_file.IsEmpty then
//   begin
//   qry66_file.First;
//   while  not qry66_file.Eof do
//   begin
//     LFileName:= ExtractFilePath(Application.ExeName)+qry66_file.fieldbyname('filename').asstring;
//     //ShowMessage(LFileName);
//    //showmessage(IntToStr(FileOpen(LFileName, fmShareExclusive))+'_'+qry66_file.fieldbyname('filename').asstring);
//   if FileOpen(LFileName,fmShareExclusive) < 0 then
//    begin
//      showmessage('test');
//    ShowMessage('有学习课程还未关闭,请关闭后再考试！');
//    Exit;
//    end;
//   qry66_file.Next;
//   end;
//   end;

//  if qry66.FieldByName('Score').asstring<>''  then
//  begin
//  ShowMessage('已考试过不能重复考试！');
//  Exit;
//  end;

  if qry66.FieldByName('result').asstring='合格'  then
  begin
  ShowMessage('已考试过不能重复考试！');
  Exit;
  end;

  LFrm:=TfrmExam.create(self);
  try
  lFrm.qry1.Close;
  Lfrm.qry1.Parameters[0].value:=qry66.fieldbyname('tc_ptr').value;
  Lfrm.qry1.Open;
  LFrm.qry1.first;
  if LFrm.qry1.IsEmpty  then
  begin
  ShowMessage('该课程暂未定义考题！');
  exit;
  end;

   if Lfrm.ShowModal=mrok then
  begin
    if Lfrm.FAScore>=60  then
     Lresult:='合格'
    else LResult:='不合格';

     //取培训类型为普通的RKEY：
    Lsql:='select rkey from datadetail where dictid=20 and item=''普通'' ' ;
    dm.OpenQry(dm.qry_temp,Lsql);
    LType:='';
    if not dm.qry_temp.IsEmpty  then
    LType:=dm.qry_temp.fieldbyname('rkey').asstring;

   if  qry66.FieldByName('score').asstring='' then
   begin
   Lsql:=' insert into Employee_Train(employeeid,employeecode,Train_NO,Train_topics,Train_content,startdate,starttime,enddate,endtime,'+
          'Teacher,Train_place,Train_status,train_feels,Train_time,oprator_ptr,oprate_time,tc_ptr,DeptID,PostID,type_ptr,ctype,TType,EType,Train_grade,Train_result) '+
          ' values('+qry66.fieldbyname('rkey').AsString+','''+trim(edt_Ecode.Text)+''','''+formatdatetime('yyyyMMddhhmm',BDate.Date)+trim(edt_Ecode.Text)+''','''+qry66.fieldbyname('cname').AsString+''','''+qry66.fieldbyname('CName').AsString+''', '+
          ' '''+formatdatetime('yyyy-MM-dd',common.getsystem_date(dm.qry_temp,0))+''',''08:00:00'','''+formatdatetime('yyyy-MM-dd',common.getsystem_date(dm.qry_temp,0))+''', '+
          ' ''10:00:00'',''在线考试'','+
          ' ''在线考试'',1,0,120,'+common.user_ptr+', '+
          ' '''+formatdatetime('yyyy-MM-dd hh:mm:ss',common.getsystem_date(dm.qry_temp,0))+''','+qry66.fieldbyname('tc_ptr').AsString+', '+
          ' '+qry66.fieldbyname('departmentid').AsString+','+qry66.fieldbyname('position').AsString+','+LType+', '+
          ' '+qry66.fieldbyname('ctype_2').AsString+',2,3,'+floattostr(Lfrm.FAScore)+','''+LResult+''')' ;
   //showmessage(Lsql);
   dm.execsql(DM.qry_temp,Lsql);
   end
   else
   begin
     Lsql:='update  Employee_Train set Train_grade='+floattostr(Lfrm.FAScore)+',Train_result='''+LResult+''' '  +
     ' where rkey='+qry66.fieldbyname('rkeyT').AsString+' ';
     dm.execsql(DM.qry_temp,Lsql);
   end;
   btn_qry6Click(btn_qry6);
  end;

  finally
  Lfrm.free;
  end;
end;

procedure TfrmMain.mniImportPaperClick(Sender: TObject);
var
  Lfrm:TfrmImport22;
  Lsql:string;
begin
   if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
   // Lsql:='select * From paperMain where  tc_ptr='+qry_tc.fieldbyname('rkey').AsString+' ';
   // dm.OpenQry(dm.qry_temp,Lsql);
//    if Not dm.qry_temp.IsEmpty   then
//    begin
//    if MessageDlg('该课程已有导入试卷，需要重新导入吗？'+#13#10+'重新导入的话已有的试题会更新，没有的会导入。',mtConfirmation, [mbYes, mbNo], 0) = mrno then
//    Exit;
//    end;
  LFrm:=TfrmImport22.Create(self);
  try
  Lfrm.ShowModal;
  finally
  Lfrm.Free;
  end;
end;

procedure TfrmMain.mniPaperDetailClick(Sender: TObject);
var
  Lfrm: TfrmPaPerDetail;
begin
  LFrm:=TfrmPaPerDetail.create(self);
  try
  lFrm.qry1.Close;
  Lfrm.qry1.Parameters[0].value:=qry_tc.fieldbyname('rkey').value;
  Lfrm.qry1.Open;
  Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;  
end;

procedure TfrmMain.eh66_DetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(qry66_file.SQL.Text);
end;

procedure TfrmMain.mniLookClick(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName,FDFIleName:string;
  LSaveDlg: TSaveDialog;
  Lsql:string;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LFtp:= TIdFTP.Create(nil);
  try
      Lsql:= 'SELECT FileName,Ftp_FileName FROM Tier3_CustomerFiles WHERE IDKey = ' + QuotedStr(qry_TCFile.fieldbyname('FtpIDKey').AsString);
     dm.OpenQry(qrytemp,Lsql);

    if not qrytemp.IsEmpty then
    begin
      LFileName:= qrytemp.Fields[0].AsString;
      LFtpName:= qrytemp.Fields[1].AsString;
      LSaveDlg.FileName:= LFileName;
//      if LSaveDlg.Execute then
//      begin
          Lsql:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                  ' from tier3_ftplist where rkey = ' + qry_TCFile.fieldbyname('Ftp_ptr').AsString;
         dm.OpenQry(qrytemp,Lsql);
          if not qrytemp.IsEmpty then
          begin
            LFtp.Host := qrytemp.Fields[1].AsString;
            LFtp.Username := qrytemp.Fields[2].AsString;
            LFtp.Password := qrytemp.Fields[3].AsString;
            LFtpDir := Trim(qrytemp.Fields[4].AsString);
          end;

        try
          if not LFtp.Connected then LFtp.Connect(True,10000);
          if LFTp.Connected then
          begin
            FDFIleName:=ExtractFilePath(Application.Exename)+LFileName;
            LFTp.Get(LFtpDir+LFtpName,FDFIleName,True);         //LSaveDlg.FileName
            if FileExists(FDFIleName) then
             shellexecute(handle, 'open', PChar(FDFIleName), nil, nil, SW_SHOWNORMAL);
          end;
        except
          ShowMessage('FTP链接失败,下载失败');
          Exit;
        end;
     // end;
    end
    else
    begin
      ShowMessage('此文件还没有上传到FTP，请先保存后再下载！');
      exit;
    end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LFTp.Free;
  end;
end;

procedure TfrmMain.mni7Click(Sender: TObject);
var
  Lsql:string;
begin
  if  (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  if qry_tc.IsEmpty  then Exit;

  if Application.Messagebox('确认要删除吗！', '提示',mb_Iconinformation+MB_OKCANCEL) = mrCancel then exit;

  Lsql:='delete from   Employee_Train where rkey='+qry_TrainRecord.fieldbyname('rkey').asstring+' ';
  dm.execsql(DM.qry_temp,Lsql);

  btn_refresh5Click(sender);
end;

end.




