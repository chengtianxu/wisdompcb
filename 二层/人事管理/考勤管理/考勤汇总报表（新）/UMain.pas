unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ppDB, ppDBPipe, ppEndUsr, ppCtrls, ppBands, ppClass,
  ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, StdCtrls,
  ComCtrls, Buttons, Grids, DBGridEh, ExtCtrls, DB, ADODB, DBGrids,DateUtils,ConstVar;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    StaticText1: TStaticText;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine2: TppLine;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppLine36: TppLine;
    ppLine47: TppLine;
    ppLine49: TppLine;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppLine45: TppLine;
    ppDBText6: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine1: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine34: TppLine;
    ppLabel7: TppLabel;
    ppLine35: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine37: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine44: TppLine;
    ppLine46: TppLine;
    ppLabel34: TppLabel;
    ppLine48: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel22: TppLabel;
    ppLine17: TppLine;
    ppLine33: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine50: TppLine;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppLine55: TppLine;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    ppDesigner1: TppDesigner;
    ppDBPipeline1: TppDBPipeline;
    pm_sel: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    qry_sel: TADOQuery;
    ds_sel: TDataSource;
    qry_selrkey: TAutoIncField;
    qry_selemployeecode: TWideStringField;
    qry_seldepartmentname: TWideStringField;
    qry_selchinesename: TWideStringField;
    qry_selondutytime: TDateTimeField;
    qry_seloutdutytime: TDateTimeField;
    qry_selaccountname: TWideStringField;
    qry_selposition_item: TWideStringField;
    qry_result: TADOQuery;
    Panel4: TPanel;
    Panel8: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    lbl_allCount: TLabel;
    edt_empCode: TEdit;
    Panel7: TPanel;
    dg_all: TDBGridEh;
    Panel6: TPanel;
    Label10: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    dtp_t: TDateTimePicker;
    dtp_f: TDateTimePicker;
    btn_AddAll: TButton;
    btn_AddOne: TButton;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    ds_result: TDataSource;
    btn_qry: TButton;
    btn_set: TButton;
    cb_out: TCheckBox;
    Label6: TLabel;
    lbl_selCount: TLabel;
    Panel3: TPanel;
    dgh_togather: TDBGridEh;
    qry_All: TADOQuery;
    ds_all: TDataSource;
    qry_resultDSDesigner: TWideStringField;
    qry_resultDSDesigner2: TWideStringField;
    qry_resultDSDesigner3: TWideStringField;
    qry_resultDSDesigner4: TWideStringField;
    qry_resultDSDesigner5: TWideStringField;
    qry_resultDSDesigner1: TFloatField;
    qry_resultDSDesigner22: TFloatField;
    qry_resultDSDesigner32: TFloatField;
    qry_resultDSDesigner42: TFloatField;
    qry_resultDSDesigner52: TFloatField;
    qry_resultDSDesigner6: TFloatField;
    qry_resultDSDesigner7: TFloatField;
    qry_resultDSDesigner8: TFloatField;
    qry_resultDSDesigner9: TFloatField;
    qry_resultDSDesigner10: TFloatField;
    qry_resultDSDesigner11: TFloatField;
    qry_resultDSDesigner12: TFloatField;
    qry_resultDSDesigner13: TFloatField;
    qry_resultDSDesigner14: TFloatField;
    qry_resultDSDesigner15: TFloatField;
    qry_resultDSDesigner16: TFloatField;
    qry_resultDSDesigner17: TFloatField;
    qry_resultDSDesigner18: TFloatField;
    qry_resultDSDesigner19: TFloatField;
    qry_resultDSDesigner20: TFloatField;
    qry_resultDSDesigner21: TFloatField;
    qry_resultDSDesigner222: TFloatField;
    qry_resultDSDesigner23: TFloatField;
    qry_resultDSDesigner24: TFloatField;
    qry_resultDSDesigner25: TFloatField;
    qry_resultDSDesigner26: TFloatField;
    qry_resultDSDesigner27: TFloatField;
    qry_resultDSDesigner28: TFloatField;
    qry_resultDSDesigner29: TFloatField;
    qry_resultDSDesigner30: TFloatField;
    qry_resultDSDesigner31: TFloatField;
    qry_resultDSDesigner33: TBCDField;
    qry_resultDSDesigner34: TFloatField;
    qry_resultDSDesigner35: TBCDField;
    qry_resultDSDesigner36: TFloatField;
    qry_resultDSDesigner37: TBCDField;
    qry_resultDSDesigner38: TFloatField;
    qry_resultDSDesigner39: TFloatField;
    qry_resultDSDesigner40: TFloatField;
    qry_resultDSDesigner41: TFloatField;
    qry_resultDSDesigner43: TFloatField;
    qry_resultDSDesigner44: TFloatField;
    qry_resultDSDesigner45: TFloatField;
    qry_resultDSDesigner46: TFloatField;
    qry_resultDSDesigner47: TFloatField;
    qry_resultDSDesigner48: TIntegerField;
    qry_resultDSDesigner49: TFloatField;
    qry_resultDSDesigner50: TFloatField;
    qry_resultDSDesigner51: TFloatField;
    lbl_RCount: TLabel;
    qry_getEmp: TADOQuery;
    btn_qry1: TBitBtn;
    qry_resultField: TFloatField;
    qry_resultDSDesigner53: TFloatField;
    qry_resultDSDesigner54: TFloatField;
    qry_resultDSDesigner55: TBCDField;
    btn_AllQiut: TButton;
    dtmfld_resultDSDesigner56: TDateTimeField;
    qry_resultDSDesigner56: TIntegerField;
    qry_resultDSDesigner57: TFloatField;
    btn1: TButton;
    qry_resultDSDesigner58: TBCDField;
    pnl1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_AddOneClick(Sender: TObject);
    procedure btn_AddAllClick(Sender: TObject);
    procedure edt_empCodeChange(Sender: TObject);
    procedure btn_setClick(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dgh_togatherTitleClick(Column: TColumnEh);
    procedure dg_allTitleClick(Column: TColumnEh);
    procedure dgh_togatherKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_qry1Click(Sender: TObject);
    procedure dtp_tChange(Sender: TObject);
    procedure dtp_fChange(Sender: TObject);
    procedure btn_AllQiutClick(Sender: TObject);
    procedure dtp_fExit(Sender: TObject);
    procedure dtp_tExit(Sender: TObject);
    procedure dg_allKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
  
  private
    { Private declarations }
    field_name:  string;
    precolumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
          uses UDM, common,Pick_Item_Single;
{$R *.dfm}

procedure TFrmMain.FormShow(Sender: TObject);
var
  s,s1:string;
begin
//

dtp_f.date:=StartOfTheMonth(now);
dtp_t.date:=endOfTheMonth(now);

btn_qry1.Visible:=false;
Label1.caption:='员工工号';

 s:= FormatDateTime('yyyy-MM-dd',dtp_f.Date);
 s1:= FormatDateTime('yyyy-MM-dd',dtp_t.date);


try
 with qry_All do
 begin
 //Parameters[0].Value:= s;//dtp_f.date;
 Parameters[0].Value:= strtoint(rkey73);
 Parameters[1].Value:=s;// dtp_f.date;
 Parameters[2].Value:=s1;// dtp_t.date;

  Open;
 end;
  //showmessage(qry_All.sql.text);
   lbl_allCount.Caption:= IntToStr(qry_All.RecordCount);

  if not qry_sel.Active then qry_sel.open;


 //
 field_name:=dg_all.Columns[0].FieldName;
 precolumn := dg_all.Columns[0];
  dg_all.Columns[0].title.color:=clred;




 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

  // B账需要隐藏的：
   if Pos('_hreicc',common.db_ptr)>0 then
   begin
     btn_set.Visible:=False;
    dgh_togather.Columns[37].Title.Caption:='总出勤天';
    dgh_togather.Columns[38].Visible:=false;//Title:='正班天小时';
    dgh_togather.Columns[39].Visible:=false;
    dgh_togather.Columns[42].Visible:=false;
    dgh_togather.Columns[43].Title.Caption:='正班天小时';   //分析后正班天
    dgh_togather.Columns[44].Title.Caption:='周末天';    //分析后的周末天
    dgh_togather.Columns[45].Visible:=false;
    dgh_togather.Columns[46].Visible:=false;
   // dgh_togather.Columns[46].Visible:=false;
    dgh_togather.Columns[49].Visible:=false;
    dgh_togather.Columns[50].Visible:=false;
    dgh_togather.Columns[52].Visible:=false;
    dgh_togather.Columns[53].Visible:=false;
    dgh_togather.Columns[55].Visible:=false;
    dgh_togather.Columns[56].Visible:=false;
    dgh_togather.Columns[60].Visible:=false;
    dgh_togather.Columns[61].Visible:=false;
     dgh_togather.Columns[40].Visible:=true;
   end
   else dgh_togather.Columns[40].Visible:=false;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin

    user_ptr:='3262';
  vprev:='4';
  rkey73:='2787';

  if not app_init_2(DM.con1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;

  
  self.Caption:=application.Title;



end;

procedure TFrmMain.btn_AddOneClick(Sender: TObject);
var  empcode:string;
i ,flag: integer;
begin
//

if qry_All.IsEmpty then exit;

    flag:=0;
   empcode:= qry_All.fieldbyname('employeecode').asstring;
  qry_sel.first;
   while not qry_sel.eof do
   begin
    if empcode=qry_sel.fieldbyname('employeecode').asstring then
    begin
    flag:=1;
    break;
    end;
    qry_sel.next;
   end;


  with qry_sel do
  begin
   if flag<>1 then
   begin
   Append;
   FieldByName('employeecode').Value :=empcode;
   FieldByName('chineseName').Value := qry_All.fieldbyname('chineseName').asstring;
   FieldByName('departmentName').Value := qry_All.fieldbyname('departmentName').asstring;
   FieldByName('accountname').Value := qry_All.fieldbyname('accountname').asstring;
   Post;
  end;
  end;

//  qry_all.filtered:=false;
// if qry_all.Filter='' then
// qry_all.Filter:= 'employeecode<>'''+empcode+''''
//else
// qry_all.Filter:= qry_all.Filter+' and  employeecode<>'''+empcode+''' ';
// 
// qry_all.filtered:=true;

 lbl_selCount.Caption:= inttostr(qry_sel.recordcount);
   lbl_allCount.Caption:= inttostr(qry_all.recordcount);

end;

procedure TFrmMain.btn_AddAllClick(Sender: TObject);
var empcode:string;
flag,i:integer;
begin
if qry_All.IsEmpty then exit;

qry_All.First;
//qry_sel.edit;
qry_All.DisableControls;
while not qry_All.Eof do
begin
   empcode:= qry_All.fieldbyname('employeecode').asstring ;

   flag:=0;
  qry_sel.first;
   qry_sel.DisableControls;
   while not qry_sel.eof do
   begin
    if empcode=qry_sel.fieldbyname('employeecode').asstring then
    begin
    flag:=1;
    break;
    end;
    qry_sel.next;
   end;
   qry_sel.EnableControls;


  if flag<>1  then
  begin
  with qry_sel do
  begin
   Append;
   FieldByName('employeecode').Value :=empcode ;
   FieldByName('chineseName').Value := qry_All.fieldbyname('chineseName').asstring;
   FieldByName('departmentName').Value := qry_All.fieldbyname('departmentName').asstring;
   FieldByName('accountname').Value := qry_All.fieldbyname('accountname').asstring;
   Post;
  end;
  end;
//   if qry_all.Filter='' then
//    qry_all.Filter:= '   employeecode<> '''+empcode+''' '
//   else
// qry_all.Filter:= qry_all.Filter+' and  employeecode<> '''+empcode+''' ';

qry_All.next;
end;
qry_all.EnableControls;
 //qry_all.filtered:=true;

  lbl_selCount.Caption:= inttostr(qry_sel.recordcount);
    lbl_allCount.Caption:= inttostr(qry_all.recordcount);

end;

procedure TFrmMain.edt_empCodeChange(Sender: TObject);
begin

 // if qry_All.IsEmpty  then Exit;
  qry_All.Filtered:=False;

    if Trim(edt_empCode.Text)='' then
    
    else
    begin
    qry_All.Filter:=field_name+' like ''%'+trim(edt_empCode.Text)+'%''' ;
    qry_All.Filtered:=true;
    end ;


    
  lbl_selCount.Caption := inttostr(qry_All.RecordCount);
end;

procedure TFrmMain.btn_setClick(Sender: TObject);
var
  k: Integer;
  EmpCode,ssql:string;
  n: Integer;
  btime,etime:TDateTime;
begin

 if qry_sel.IsEmpty  then
   begin
    showmessage('请选择员工');
    exit;
   end;
  StaticText1.Caption := '程序运行中,请稍后...';
   Application.ProcessMessages;
   n := qry_sel.RecordCount;
  
  progressbar1.Visible := true;

  try
    btime:=now;
    if not dm.con1.InTransaction then  dm.con1.BeginTrans;
    qry_sel.first;
    qry_sel.DisableControls;
  if qry_sel.FieldByName('employeecode').AsString <>'' then
   begin
   while not qry_sel.eof do
    begin
    EmpCode:=qry_sel.FieldByName('employeecode').AsString;
    ssql :=' exec hrsp_workhours_mark  '''+ EmpCode + ''' , '''+FormatDateTime('yyyy-MM',dtp_t.Date)+''' ';
    dm.ExecSql(dm.qrytemp,ssql);
    progressbar1.Position := Trunc(100*k/n);
    application.ProcessMessages;
    qry_sel.next;
    end;
    qry_sel.EnableControls;
   end; 
   dm.con1.CommitTrans;
   progressbar1.Visible := false ;
   StaticText1.Caption := '标识处理完毕';
   etime:=now;
  // showmessage('标识处理完毕,用时：'+inttostr(MinutesBetween(btime,etime))+'分');
   Application.ProcessMessages;

  except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   dm.con1.RollbackTrans;
   exit;
   end;
 end;

end;

procedure TFrmMain.btn_qryClick(Sender: TObject);
var
  i: Integer;
  EmpCode,ssql:string;
 flag,n: Integer;
 btime,etime:TDateTime;
begin

 if qry_sel.IsEmpty  then
   begin
    showmessage('请选择员工');
    exit;
   end;
  StaticText1.Caption := '程序运行中,请稍后...';
   Application.ProcessMessages;


    if cb_out.Checked then
     flag:=1
     else
     flag:=0;


  progressbar1.Visible := true;

  try
    btime:=now;
       if not dm.con1.InTransaction then  dm.con1.BeginTrans;
    //添加选中工号到临时表中

   qry_getEmp.ExecSQL;
   qry_sel.First;
   qry_sel.DisableControls;
  while not qry_sel.Eof do
  begin
    EmpCode:= qry_sel.fieldbyName('employeecode').asstring;
   ssql:=' insert into  #temp_employeecode select '''+EmpCode+'''  ' ;
   dm.ExecSql(DM.qrytemp,ssql);
   qry_sel.Next;
  end;
  qry_sel.EnableControls;
    progressbar1.Position :=30;

  ssql :=' exec GetEmpOnOffData  '''+FormatDateTime('yyyy-MM-dd',dtp_f.Date)+ ''' ,'+
            ' '''+FormatDateTime('yyyy-MM-dd',dtp_t.Date)+''' , '+inttostr(flag)+' ';

    if (Pos('_hr',common.db_ptr)>0) or (Pos('_HR',common.db_ptr)>0) then
    ssql:=' exec GetEmpOnOffData_HR  '''+FormatDateTime('yyyy-MM-dd',dtp_f.Date)+ ''' ,'+
            ' '''+FormatDateTime('yyyy-MM-dd',dtp_t.Date)+''' , '+inttostr(flag)+' ';


    dm.OpenQry(qry_result,ssql);

    progressbar1.Position :=100 ;
    application.ProcessMessages;



   dm.con1.CommitTrans;
   progressbar1.Visible := false ;
   StaticText1.Caption := '查询处理完毕';
    etime:=now;
  // showmessage('查询完毕,用时：'+inttostr(MinutesBetween(btime,etime))+'分');
   Application.ProcessMessages;
   lbl_rcount.caption:= inttostr(qry_result.recordcount);
  except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   dm.con1.RollbackTrans;
   exit;
   end;
 end;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
common.Export_dbGridEH_to_Excel(dgh_togather,'考勤汇总报表');
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
close;
end;

//删一行
procedure TFrmMain.N1Click(Sender: TObject);
var EmpCode ,ssql,s:string;
begin
if qry_sel.IsEmpty then exit;
 EmpCode :=qry_sel.fieldbyname('employeecode').asstring;
qry_sel.Delete;
//qry_sel.edit;
//qry_sel.Post;
lbl_selCount.Caption:= inttostr(qry_sel.recordcount);


end;

//全删
procedure TFrmMain.N2Click(Sender: TObject);
var i : string;
begin

if qry_sel.IsEmpty then  exit;
qry_sel.First;
while not qry_sel.Eof do
begin
 // k:=qry_sel.fieldbyname('employeecode').asstring;
qry_sel.Delete;

end;


  lbl_selCount.Caption:= inttostr(qry_sel.recordcount);
  qry_All.Filtered:=false;


end;

procedure TFrmMain.dgh_togatherTitleClick(Column: TColumnEh);
begin
   if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    qry_result.Sort:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    qry_result.Sort:=Column.FieldName;
  end;
  
end;

procedure TFrmMain.dg_allTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    qry_All.sort:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    qry_All.sort:=Column.FieldName;
  end;
   edt_empCode.Visible:=true;
  if Column.Tag<>1 then
  begin
    if preColumn.FieldName<>Column.FieldName then
    begin
    Label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;

    end;
  end;

  if (Column.Title.Caption='员工工号') or (Column.Title.Caption='员工姓名')  or (Column.Title.Caption='账套')  then
  begin

    edt_empCode.Text:='';
    edt_empCode.SetFocus;
    btn_qry1.Visible := false;
  end;
  
  if Column.Title.Caption='部门' then
  begin
    btn_qry1.Visible := true;
    edt_empCode.Visible:=true;
  end;

  if (Column.Title.Caption='入职日期') or (Column.Title.Caption='离职日期') then
  begin
    lbl_allCount.Visible:=False;
    edt_empCode.Visible:=False;
    btn_qry1.Visible := false;
   // ComboBox1.Visible:=False;
  end;
end;

procedure TFrmMain.dgh_togatherKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(qry_result.sql.text + #13
   +' rkey73'+ common.rkey73
   +#13+'startdate1 :'+ Formatdatetime('YYYY-MM-DD',dtp_f.Date)
   +#13+'startdate2 :'+ Formatdatetime('YYYY-MM-DD',dtp_f.Date)
   +#13+'enddate3:'+ Formatdatetime('YYYY-MM-DD',dtp_t.Date));
end;

procedure TFrmMain.btn_qry1Click(Sender: TObject);
var
InputVar: PDlgInput ;
begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'departmentname/部门/400';
    InputVar.Sqlstr :=
    'select rkey,departmentname,departmentcode from datadepartment where departmentname not like '+#39+'%停用%'+#39;
    try
        inputvar.KeyField :='rkey';
        InputVar.AdoConn := dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar);
        if frmPick_Item_Single.ShowModal=mrok then
        begin
            edt_empCode.Text := trim(frmPick_Item_Single.adsPick.FieldValues['departmentname']);
            edt_empCode.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
          //  edt_empCodeChange(sender);
        end;
    finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
    end;
end;

procedure TFrmMain.dtp_tChange(Sender: TObject);
begin
// with qry_All do
// begin
//   close;
// Parameters[0].Value:= dtp_f.date;
// Parameters[1].Value:= dtp_f.date;
// Parameters[2].Value:= dtp_t.date;
// Parameters[3].Value:= strtoint(rkey73);
//  Open;
// end;
//  //showmessage(qry_All.sql.text);
//   lbl_allCount.Caption:= IntToStr(qry_All.RecordCount);

end;

procedure TFrmMain.dtp_fChange(Sender: TObject);
//var
  // t:Tdatetime;
begin

// with qry_All do
// begin
//   close;
// Parameters[0].Value:=dtp_f.Date; //StrToDate(FormatDateTime('yyyy-mm-dd',dtp_f.Date));
// Parameters[1].Value:=dtp_f.Date;//StrToDate(FormatDateTime('yyyy-mm-dd',dtp_f.Date));
// Parameters[2].Value:= dtp_t.Date;//StrToDate(FormatDateTime('yyyy-mm-dd',dtp_t.Date));
// //t:= dtp_t.date;
// Parameters[3].Value:= strtoint(rkey73);
//  Open;
// end;
//  //showmessage(qry_All.sql.text+datetostr(dtp_f.date));
//   lbl_allCount.Caption:= IntToStr(qry_All.RecordCount);


end;

procedure TFrmMain.btn_AllQiutClick(Sender: TObject);
var empcode:string;
flag,i:integer;
begin
if qry_All.IsEmpty then exit;

qry_All.First;
//qry_sel.edit;
qry_All.DisableControls;

while not qry_All.Eof do
begin
   empcode:= qry_All.fieldbyname('employeecode').asstring ;

   flag:=0;
  qry_sel.first;
   qry_sel.DisableControls;
   while not qry_sel.eof do
   begin
    if empcode=qry_sel.fieldbyname('employeecode').asstring then
    begin
    flag:=1;
    break;
    end;
    qry_sel.next;
   end;
   qry_sel.EnableControls;


  if (flag<>1) and (qry_All.fieldbyname('outdutytime').value<>null) then
  begin
  with qry_sel do
  begin
   Append;
   FieldByName('employeecode').Value :=empcode ;
   FieldByName('chineseName').Value := qry_All.fieldbyname('chineseName').asstring;
   FieldByName('departmentName').Value := qry_All.fieldbyname('departmentName').asstring;
   FieldByName('accountname').Value := qry_All.fieldbyname('accountname').asstring;
   Post;
  end;
  end;
//   if qry_all.Filter='' then
//    qry_all.Filter:= '   employeecode<> '''+empcode+''' '
//   else
// qry_all.Filter:= qry_all.Filter+' and  employeecode<> '''+empcode+''' ';

qry_All.next;
end;
qry_all.EnableControls;
 //qry_all.filtered:=true;

  lbl_selCount.Caption:= inttostr(qry_sel.recordcount);
  lbl_allCount.Caption:= inttostr(qry_all.recordcount);
end;

procedure TFrmMain.dtp_fExit(Sender: TObject);
begin
 with qry_All do
 begin
   close;
 // Parameters[0].Value:= FormatDateTime('yyyy-MM-dd',dtp_f.DateTime);
 Parameters[0].Value:= strtoint(rkey73);
 Parameters[1].Value:= FormatDateTime('yyyy-MM-dd',dtp_f.DateTime);
 Parameters[2].Value:= FormatDateTime('yyyy-MM-dd',dtp_t.DateTime);
  Open;
 end;
  //showmessage(qry_All.sql.text+datetostr(dtp_f.date));
   lbl_allCount.Caption:= IntToStr(qry_All.RecordCount);
end;

procedure TFrmMain.dtp_tExit(Sender: TObject);
begin
 with qry_All do
 begin
   close;
 //Parameters[0].Value:= FormatDateTime('yyyy-MM-dd',dtp_f.DateTime);
 Parameters[0].Value:= strtoint(rkey73);
 Parameters[1].Value:= FormatDateTime('yyyy-MM-dd',dtp_f.DateTime);
 Parameters[2].Value:= FormatDateTime('yyyy-MM-dd',dtp_t.DateTime);
  Open;
 end;
  //showmessage(qry_All.sql.text);
   lbl_allCount.Caption:= IntToStr(qry_All.RecordCount);
end;

procedure TFrmMain.dg_allKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
    showmessage(qry_All.SQL.Text);
end;

procedure TFrmMain.btn1Click(Sender: TObject);
begin
common.Export_dbGridEH_to_Excel(dg_all,'考勤人员');
end;

end.
