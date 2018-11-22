unit MainPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, //cxPCdxBarPopupMenu,
  dxSkinsdxBarPainter, Menus, ppEndUsr, ppBands, ppPrnabl, ppClass,
  ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  DBClient, cds, Provider, ADODB, dxBar, cxClasses, ImgList, ActnList,
  Grids, DBGridEh, ToolWin, ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls,
  dxStatusBar, cxContainer, cxEdit, cxSpinEdit, cxDBEdit, Mask, DBCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, DBCtrlsEh, Buttons,StrUtils,
  RzEdit, RzDBEdit, RzDBBnEd, DBButtonEdit,DateUtils;

type
  TMainPlan_f = class(TSingleDataSet_f)
    cdsMainFASSET_CODE: TStringField;
    cdsMainFASSET_NAME: TStringField;
    cdsMainLOCATION: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cdsMainMainCycl: TStringField;
    cdsMainD417_ptr: TIntegerField;
    cdsMainrkey: TAutoIncField;
    cdsMainD804_ptr: TIntegerField;
    cdsMainPlanMainDate: TDateTimeField;
    cdsMainMainDate: TDateTimeField;
    cdsMainStatus: TSmallintField;
    cdsMainMaintMan: TWideStringField;
    cdsMainttype: TSmallintField;
    cdsMainDEPT_CODE: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edt_FASSET_CODE: TDBEdit;
    edt_LOCATION: TDBEdit;
    edt_DEPT_CODE: TDBEdit;
    edt_DEPT_NAME: TDBEdit;
    edt_MainCycl: TDBEdit;
    edt_Status: TDBEdit;
    edt_MaintMan: TDBEdit;
    edt_Acceptan: TDBEdit;
    edt_MainMeth: TDBMemo;
    dtedt_PlanMainDate: TDBDateTimeEditEh;
    dtedt_EndMainDate: TDBDateTimeEditEh;
    edt_ChecAcce: TDBMemo;
    edt_Item: TDBMemo;
    edt_AcceEval: TDBMemo;
    Label16: TLabel;
    edt_ttype: TDBComboBox;
    edt_FASSET_NAME: TDBMemo;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    bt_Find: TSpeedButton;
    GroupBox3: TGroupBox;
    Filter_Label: TLabel;
    Filter_Edit: TEdit;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    cdsMainMainExecStat: TStringField;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    cds832: TClientDataSet;
    cds832RKEY: TIntegerField;
    cds832MainExecStat: TStringField;
    cdsMainEndMainDate: TDateTimeField;
    Label19: TLabel;
    dtedt_BeginMainDate: TDBDateTimeEditEh;
    Button9: TButton;
    Button3: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    cds0034: TClientDataSet;
    cds0034DEPT_CODE: TStringField;
    cds0034DEPT_NAME: TStringField;
    cdsAddMonthPlan: TClientDataSet;
    cdsMainAcceptan_ptr: TIntegerField;
    cdsMainRemark: TWideStringField;
    cds005: TClientDataSet;
    cds005AcceCode: TStringField;
    cds005AcceName: TStringField;
    cds005DEPT_NAME: TStringField;
    cds005PHONE: TStringField;
    cds005rkey: TIntegerField;
    cdsMainAcceCode: TStringField;
    Label20: TLabel;
    edt_AcceCode: TDBButtonEdit;
    cdsMainItem: TStringField;
    cdsMainMainMeth: TStringField;
    cdsMainChecAcce: TStringField;
    cdsMainAcceEval: TWideStringField;
    cdsMainAcceptan: TStringField;
    cdsMainMainTime: TBCDField;
    Label21: TLabel;
    edt_MainTime: TDBEdit;
    cdsAddMainPlan: TClientDataSet;
    cdsAddMainPlanselected: TBooleanField;
    cdsAddMainPlanPlanMainDate: TDateTimeField;
    cdsAddMainPlanrkey: TAutoIncField;
    cdsAddMainPlanD417_ptr: TIntegerField;
    cdsAddMainPlannumber: TSmallintField;
    cdsAddMainPlanMainCycl: TStringField;
    cdsAddMainPland417_ptr_1: TAutoIncField;
    cdsAddMainPlanFASSET_CODE: TStringField;
    cdsAddMainPlanFASSET_NAME: TStringField;
    cdsAddMainPlanLOCATION: TStringField;
    cdsAddMainPlanDEPT_CODE: TStringField;
    cdsAddMainPlanDEPT_NAME: TStringField;
    cdsAddMainPlanMainPhone: TStringField;
    cdsAddMainPlanAcceptan: TStringField;
    cdsAddMainPlanAcceptan_ptr: TIntegerField;
    cdsAddMainPlanItem: TStringField;
    cdsAddMainPlanMainMeth: TStringField;
    cdsAddMainPlanChecAcce: TStringField;
    cdsAddMainPlandefauMan: TStringField;
    DataSource1: TDataSource;
    dspAddMainPlan: TDataSetProvider;
    dtAddMainPlan: TADODataSet;
    dtAddMainPlanselected: TBooleanField;
    dtAddMainPlanPlanMainDate: TDateTimeField;
    dtAddMainPlanrkey: TAutoIncField;
    dtAddMainPlanD417_ptr: TIntegerField;
    dtAddMainPlannumber: TWordField;
    dtAddMainPlanMainCycl: TStringField;
    dtAddMainPlanItem: TStringField;
    dtAddMainPlanMainMeth: TStringField;
    dtAddMainPlanChecAcce: TStringField;
    dtAddMainPlandefauMan: TStringField;
    dtAddMainPlanMainPhone: TStringField;
    dtAddMainPlanAcceptan: TStringField;
    dtAddMainPlanAcceptan_ptr: TIntegerField;
    dtAddMainPland417_ptr_1: TAutoIncField;
    dtAddMainPlanFASSET_CODE: TStringField;
    dtAddMainPlanFASSET_NAME: TStringField;
    dtAddMainPlanLOCATION: TStringField;
    dtAddMainPlanDEPT_CODE: TStringField;
    dtAddMainPlanDEPT_NAME: TStringField;
    cdsAddMonthPlan1: TClientDataSet;
    dtMainFASSET_CODE: TStringField;
    dtMainFASSET_NAME: TStringField;
    dtMainLOCATION: TStringField;
    dtMainDEPT_CODE: TStringField;
    dtMainDEPT_NAME: TStringField;
    dtMainMainCycl: TStringField;
    dtMainItem: TStringField;
    dtMainMainMeth: TStringField;
    dtMainChecAcce: TStringField;
    dtMainD417_ptr: TIntegerField;
    dtMainMainExecStat: TStringField;
    dtMainAcceptan: TStringField;
    dtMainAcceCode: TStringField;
    dtMainrkey: TAutoIncField;
    dtMainD804_ptr: TIntegerField;
    dtMainPlanMainDate: TDateTimeField;
    dtMainbeginMainDate: TDateTimeField;
    dtMainEndMainDate: TDateTimeField;
    dtMainStatus: TWordField;
    dtMainMaintMan: TWideStringField;
    dtMainAcceptan_ptr: TIntegerField;
    dtMainttype: TWordField;
    dtMainAcceEval: TWideStringField;
    dtMainRemark: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsMainttypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsMainttypeSetText(Sender: TField; const Text: String);
    procedure cdsMainStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure bt_FindClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure Filter_EditChange(Sender: TObject);
    procedure cdsMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure cdsMainStatusChange(Sender: TField);
    procedure Button9Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cdsMainAcceCodeChange(Sender: TField);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    FilterFieldName:string;
   // strStatusValue:string;
    Curr_Date:TDateTime;
    procedure SetFilterComponent(Column: TColumnEh);
    procedure SetToolbarButtonStatus(Flag:Boolean);override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainPlan_f: TMainPlan_f;

implementation

uses DM_f, PublicFile, MainPlan1, formSelectMultiItem, LogWriteform;

{$R *.dfm}

procedure TMainPlan_f.SetToolbarButtonStatus(Flag: Boolean);
begin
  with cdsMain   do
  begin
    dxBarManager.LockUpdate:=True;

    tblAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);
    actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);

    if cdsMainStatus.AsInteger in [1] then
    begin
      if (StrToInt(vprev)in [2,4]) then
      begin
        DghMain.FieldColumns['MaintMan'].ReadOnly:=false;
        DghMain.FieldColumns['Acceptan'].ReadOnly:=false;
        DghMain.FieldColumns['ttype'].ReadOnly:=false;
        DghMain.FieldColumns['AcceEval'].ReadOnly:=false;
        ControlsSetReadOnly([edt_MaintMan,edt_AcceCode,edt_ttype,edt_AcceEval],false);
      end;
      if (StrToInt(vprev)in [4]) then     //只有权限码=4时，才能修改计划保养日期、保养日期
      begin
        DghMain.FieldColumns['PlanMainDate'].ReadOnly:=false;
        DghMain.FieldColumns['BeginMainDate'].ReadOnly:=false;
        DghMain.FieldColumns['EndMainDate'].ReadOnly:=false;
        ControlsSetReadOnly([dtedt_PlanMainDate,dtedt_BeginMainDate,dtedt_EndMainDate],false);
      end;
    end
    else
    begin
      DghMain.FieldColumns['MaintMan'].ReadOnly:=true;
      DghMain.FieldColumns['Acceptan'].ReadOnly:=true;
      DghMain.FieldColumns['ttype'].ReadOnly:=true;
      DghMain.FieldColumns['AcceEval'].ReadOnly:=true;
      DghMain.FieldColumns['PlanMainDate'].ReadOnly:=true;
      DghMain.FieldColumns['BeginMainDate'].ReadOnly:=true;
      DghMain.FieldColumns['EndMainDate'].ReadOnly:=true;
      ControlsSetReadOnly([edt_MaintMan,edt_AcceCode,edt_ttype,edt_AcceEval]);
      ControlsSetReadOnly([dtedt_PlanMainDate,dtedt_BeginMainDate,dtedt_EndMainDate]);
    end;

    if ((State  in [dsEdit,dsInsert])or(ChangeCount>0))  then
      begin
        tblSave.Enabled:=True and(StrToInt(vprev)in [2,4]);
        actSave.Enabled:=True and(StrToInt(vprev)in [2,4]);
        tblCancel.Enabled:=True;
        actCancel.Enabled:=True;
        tblfind.Enabled:=False;
        actFind.Enabled:= False;
        tblRefresh.Enabled:=False;
        actRefresh .Enabled:= False;
        tblExport.Enabled:=False;
        actExport.Enabled:=False; //导出
        tblExit.Enabled:=False;   //退出
        tblPrint.Enabled:= False;      //打印
        tblDesign.Enabled:=False ;      //报表设计
        tblFilter.Enabled:= False;
        tblReject.Enabled:=False ;   //反提交
        tblExpand.Enabled:=False ;   //提交
        tblConfirm.Enabled:=False;   //审核
        tblUConfirm.Enabled:=False;  //反审核
      end
    else
      begin
        tblSave.Enabled:=False;
        actSave.Enabled:=False;
        tblCancel.Enabled:=False;
        actCancel.Enabled:=False;
        tblfind.Enabled:= True;
        actFind.Enabled:= True;
        tblRefresh .Enabled:=True;
        actRefresh .Enabled:=True;
        tblExport.Enabled:=True  and(StrToInt(vprev)in [2,4]);
        actExport.Enabled:=True  and(StrToInt(vprev)in [2,4]);
        tblExit.Enabled:=True;
        tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,4]);      //打印
        tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;      //报表设计
        tblFilter.Enabled:= True;
        tblReject.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //反提交
        tblExpand.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //提交
        tblConfirm.Enabled:=True  and (StrToInt(vprev)in [2,4]);   //审核
        tblUConfirm.Enabled:=True and (StrToInt(vprev)in [2,4]);  //反审核
      end ;
  end;

  with cdsMain do
  begin
    if Eof  then
    begin
    tblNext.Enabled:=False ;
    tblLast.Enabled:=False ;
    end
    else
    begin
    tblNext.Enabled:=True ;
    tblLast.Enabled:=True ;
    end;

    if  Bof  then
    begin
    tblPrior.Enabled:=False     ;
    tblFirst.Enabled:=False     ;
    end
    else
    begin
    tblPrior.Enabled:=True     ;
    tblFirst.Enabled:=True     ;
    end;
  end;

  if tblExit.Enabled then
     actClose.ImageIndex:=102
  else
     actClose.ImageIndex:=107;

  if tblAdd.Enabled then
     actAdd.ImageIndex:=3
  else
     actAdd.ImageIndex:=58;

  if tblEdit.Enabled then
     actEdit.ImageIndex:=4
  else
     actEdit.ImageIndex:=62;

  if tblSave.Enabled then
     actSave.ImageIndex:=137
  else
     actSave.ImageIndex:=60; // 60

  if tblCancel.Enabled then
     actCancel.ImageIndex:=5
  else
     actCancel.ImageIndex:=55;

  if tblDelete.Enabled then
     actDelete.ImageIndex:=6
  else
     actDelete.ImageIndex:=57;

  if tblFind.Enabled then
     actFind.ImageIndex:=17
  else
     actFind.ImageIndex:=64;

  if tblRefresh.Enabled then
     actRefresh.ImageIndex:=103
  else
     actRefresh.ImageIndex:=106;

  if tblFirst.Enabled then
     actFirst.ImageIndex:=99
  else
     actFirst.ImageIndex:=96;

  if tblPrior.Enabled then
     actPrior.ImageIndex:=95
  else
     actPrior.ImageIndex:=94;

  if tblNext.Enabled then
     actNext.ImageIndex:=100
  else
     actNext.ImageIndex:=101;

  if tblLast.Enabled then
     actlast.ImageIndex:=97
  else
     actLast.ImageIndex:=98;

  if tblDesign.Enabled then
     actDesign.ImageIndex:=127
  else
     actDesign.ImageIndex:=132;

  if tblExpand.Enabled then
     actExpand.ImageIndex:=131
  else
     actExpand.ImageIndex:=135;


  if tblReject.Enabled then
     actReject.ImageIndex:=130
  else
     actReject.ImageIndex:=136;

  if tblPrint.Enabled then
     actPrint.ImageIndex:=19
  else
     actPrint.ImageIndex:=66;

  if tblExport.Enabled then   //导出EXCEL按钮
     actExport.ImageIndex:=119
  else
     actExport.ImageIndex:=120;

  if tblCancelFilter.Enabled then
     actCancelFilter.ImageIndex:= 128
  else
     actCancelFilter.ImageIndex:=133;

  if tblFilter.Enabled then
     actFilter.ImageIndex:=    129
  else
     actFilter.ImageIndex:= 134;

  if tblConfirm.Enabled then
     actConfirm.ImageIndex:=114
  else
     actConfirm.ImageIndex:= 116; //actUConfirm

  if tblUConfirm.Enabled then
     actUConfirm.ImageIndex:=115
  else
     actUConfirm.ImageIndex:= 117;

  dxBarManager.LockUpdate:=False;
end;

procedure TMainPlan_f.FormCreate(Sender: TObject);
begin
  IsLog:=True;
  if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ;  {}

 {   dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  UserRKEY :=2522 ;// 2012
  EmplRKEY:=2995;
  vprev:='4';   }
  inherited;

  SetEmployeeInfo(dtRead,dxStatusBar1);
  SetFilterComponent(DghMain.FieldColumns['FASSET_CODE']);
  ControlsSetReadOnly([edt_FASSET_CODE,edt_FASSET_NAME,edt_LOCATION,edt_DEPT_CODE,
    edt_DEPT_NAME,edt_MainCycl,dtedt_PlanMainDate,dtedt_BeginMainDate,dtedt_EndMainDate,
    edt_MainTime,edt_Item,edt_MainMeth,edt_ChecAcce,
    edt_Status,edt_MaintMan,edt_Acceptan,edt_AcceCode,edt_ttype,edt_AcceEval]);
    
  Curr_Date:=GetDataBaseDate(cdsRead,2) ;
  DateTimePicker1.Date:=Curr_Date;
  DateTimePicker2.Date:=Curr_Date+7;
  bt_FindClick(nil);

  FindDisplayFields:=varArrayOf(['FASSET_CODE','FASSET_NAME','LOCATION','DEPT_CODE',
  'DEPT_NAME','MainExecStat','MainCycl','PlanMainDate','BeginMainDate','EndMainDate','Item',
  'MainMeth','ChecAcce','MaintMan','Acceptan','ttype','AcceEval']);

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=dghMain;
    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_ListDataSet           :=cds005;
    L_DropdownColumn        :='AcceCode';
    L_ListDataSetFilterField:='AcceCode';
    L_ListResultField       :='AcceCode';
    L_GetValueField         :='AcceCode';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;


  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo:='MainExecStat/状态/120';
    L_FindDataSet           :=cds832;
    L_DropdownColumn        :='MainExecStat';
    L_ListDataSetFilterField:='MainExecStat';
    L_ListResultField       :='MainExecStat';
    L_GetValueField         :='MainExecStat';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo:='DEPT_CODE/部门代码/100,DEPT_NAME/部门名称/120';
    L_FindDataSet           :=cds0034;
    L_DropdownColumn        :='DEPT_CODE';
    L_ListDataSetFilterField:='DEPT_CODE';
    L_ListResultField       :='DEPT_CODE';
    L_GetValueField         :='DEPT_CODE';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  if DghMain.FieldColumns['FASSET_NAME']<>nil then
  DghMain.FrozenCols:= DghMain.FieldColumns['FASSET_NAME'].Index+1;
  cds832.Open;  
end;

procedure TMainPlan_f.cdsMainttypeGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if   Sender.Value=1 then
    Text:= '优'
  else
  if   Sender.Value=2 then
    Text:= '良'
  else
  if   Sender.Value=3 then
    Text:= '一般'
  else
  if   Sender.Value=4 then
    Text:= '差'     ; 
end;

procedure TMainPlan_f.cdsMainttypeSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if Text= '优'   then
     Sender.Value:=1
  else
  if Text= '良'  then
     Sender.Value:=2
  else
  if Text= '一般'  then
     Sender.Value:=3
  else
  if Text= '差'   then
     Sender.Value:=4    ;
end;

procedure TMainPlan_f.cdsMainStatusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if   Sender.Value=1 then
    Text:= '待执行'
  else
  if   Sender.Value=2 then
    Text:= '执行中'
  else
  if   Sender.Value=3 then
    Text:= '待验收'
  else
  if   Sender.Value=4 then
    Text:= '已验收'     ;
end;

procedure TMainPlan_f.bt_FindClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cdsMain.Close;
    cdsMain.CommandText:=cdsMain.F_SQLSelectFrom+#13
      +'where Cast(convert(varchar(10),data0810.[PlanMainDate],120)as smalldatetime) BETWEEN ' +#13
      +QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+#13
      +cdsMain.F_SQLOrderBy  ;
    cdsMain.Open;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainPlan_f.CheckBox1Click(Sender: TObject);
var
  strStatusValue:string;
begin
  inherited;
  cdsMain.Filtered:=False;
  cdsMain.Filter := '';
  strStatusValue:='';

  if CheckBox4.Checked and  CheckBox1.Checked and CheckBox2.Checked and CheckBox3.Checked and CheckBox5.Checked and CheckBox6.Checked then
    Exit;                               //如果记录的6种状态都要查询的话，退出。因为该查询条件根本不需要存在，查询速度会更快。
    //1待执行
  if CheckBox1.Checked then
    strStatusValue:='1,';
     //3执行中
  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'3,';
      //4待验收
  if CheckBox3.Checked then
    strStatusValue:=strStatusValue+'4,';
      //2已验收
  if CheckBox4.Checked then
    strStatusValue:=strStatusValue+'2,';
    //5已通知
  if CheckBox5.Checked then
    strStatusValue:=strStatusValue+'5,';
    //6已暂停
  if CheckBox6.Checked then
    strStatusValue:=strStatusValue+'6,';

  if  strStatusValue<>'' then
  begin                            //    去掉后面的一个","
    strStatusValue:='Status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')';
    cdsMain.Filter:=strStatusValue;
    cdsMain.Filtered:=True;
  end;  
end;

procedure TMainPlan_f.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  SetFilterComponent(Column)  ;
end;

procedure TMainPlan_f.SetFilterComponent(Column: TColumnEh);
begin
  if Column.Field.DataType in[ftString,ftWideString] then
  begin
    Filter_Label.Caption:=Column.Field.DisplayLabel;
    Filter_Label.Left:=5;
    Filter_Edit.Left:=10+ Filter_Label.Width;
    if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
    begin
     Filter_Edit.Text:='';
     FilterFieldName:= Column.Field.FieldName;
    end;
  end;
end;

procedure TMainPlan_f.Filter_EditChange(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if trim(Filter_Edit.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TMainPlan_f.cdsMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if Trim(Filter_Edit.Text) <>'' then
  Accept:=AnsiContainsText(DataSet.FieldByName(FilterFieldName).AsString,Filter_Edit.Text ) ;
end;

procedure TMainPlan_f.Button5Click(Sender: TObject);
function  ExecBeforeCheck():Boolean;
  var
    strMsg:string;
    i:Integer;
  begin
    Result:=True;
    with cdsMain do
    if   DghMain.SelectedRows.Count   >   1   then
    begin
      try
        F_IsBatchOperating :=True;
        DisableControls;
        Screen.Cursor := crHourGlass;
        for   i:=0 to  DghMain.SelectedRows.Count   -   1   do
        begin
          GotoBookmark(pointer(DghMain.SelectedRows.Items[i]));
          if (FieldByName('MaintMan').IsNull)or(FieldByName('MaintMan').AsString='') then
            strMsg:=strMsg+'选择的第'+IntToStr(i+1)+'行，字段：“'
            +FieldByName('MaintMan').DisplayLabel+'”的值不能为空！！！'+#13 ;

          if FieldByName('Status').AsInteger<> 1 then
            strMsg:=strMsg+'选择的第'+IntToStr(i+1)+'行，字段：“'
            +FieldByName('Status').DisplayLabel+'”不是待执行！！！'+#13 ;
        end;

      finally
        F_IsBatchOperating :=False;
        EnableControls;
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      if (FieldByName('MaintMan').IsNull)or(FieldByName('MaintMan').AsString='') then
        strMsg:=strMsg+'字段：“'
            +FieldByName('MaintMan').DisplayLabel+'”的值不能为空！！！'+#13 ;

      if FieldByName('Status').AsInteger<> 1 then
        strMsg:=strMsg+'字段：“'
        +FieldByName('Status').DisplayLabel+'”不是待执行！！！'+#13 ;
    end;
    if strMsg<>'' then
    begin
      MsgError(Copy(strMsg,0,Length(strMsg)-1));
      Result:=False;
    end;
  end;
var
  i:integer;
  TempTable:string;
  IsSenderMsg:Boolean;
begin
  inherited;
  IsSenderMsg:=True;
  if ExecBeforeCheck then
  if (cdsMain.Active)and(not cdsMain.IsEmpty ) then
  begin
    if messagebox(Self.Handle,'你确定要通知相关人员进行保养吗？','询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;

    TempTable:='##PhoneMsg'+IntToStr(UserRKEY);   //临时名和登陆用户指针关联，即使不同的用户同时操作，也不会相互影响。

    if cdsMain.State in [dsEdit,dsInsert] then
      cdsMain.Post;

    with   DghMain.DataSource.DataSet as TClientDataSet  do
    if   DghMain.SelectedRows.Count   >   1   then  //如果用户选择的行数大于1，即多行。
      begin
        try
          try
            cdsMain.F_IsBatchOperating :=True;
            cdsMain.DisableControls;
            Screen.Cursor := crHourGlass;
            DM.ADOConnection1.BeginTrans;
            with cdsRead do
            begin
              Close;                                              //临时表已经存在，就将其删除并重新创建
              CommandText:='if Exists(select * from tempdb.dbo.sysobjects  where name= '+QuotedStr(TempTable)+' and type= ''U'') '
                        +' drop table '+TempTable+' create table  '+TempTable+' (Phone varchar(15),FASSET_ptr int,Msg varchar(1000)) '
                        +' Create CLUSTERED INDEX INDEX'+TempTable+' ON '+TempTable+' ([Phone],[FASSET_ptr])';
              Execute;
            end;

            if messagebox(Self.Handle,'需要手机短信通知保养人对该设备要进行保养吗？','询问',MB_yesno+MB_iconquestion)= idNo then
            IsSenderMsg:=False;

            for   i:=   DghMain.SelectedRows.Count   -   1   downto   0   do
            begin
              GotoBookmark(pointer(DghMain.SelectedRows.Items[i]));
              Edit;
              FieldByName('status').Value:=5;                  //将状态改为“已通知”
              Post;

              if   IsSenderMsg=True then
              with cdsRead do
              begin
                Close;
                CommandText:=                     //将和该设备编号对应部门的对就信息接收人的记录插入临时表中
                 'insert into '+TempTable+'(FASSET_ptr,Phone,Msg)'
                +#13+'select distinct data0417.rkey,data0804.MainPhone Phone,data0015.ABBR_NAME+'' 部门：''+DEPT_NAME+'' 设备代码：''+FASSET_CODE+''，设备名称：''+FASSET_NAME+''，预计'' '
                //'select data0804.MainPhone Phone,data0015.ABBR_NAME+'' 部门：''+DEPT_NAME+'' 设备代码：''+FASSET_CODE+''，设备名称：''+FASSET_NAME+''，预计'' '
                +#13+' +CONVERT(varchar(100),data0810.PlanMainDate, 23)+''进行保养。''as msg  '
                +#13+'from data0810 '
                +#13+'join data0804 on data0810.d804_ptr=data0804.rkey '
                +#13+'join data0417 on data0804.d417_ptr=data0417.rkey '
                +#13+'join data0034 on data0417.Dept_Ptr=data0034.rkey '
                +#13+'join data0015 on data0417.warehouse_ptr=data0015.rkey  '
                +#13+'where (not data0804.MainPhone is null)and(data0804.MainPhone <> '''' ) and data0810.rkey=  '+cdsMainrkey.AsString;
                Execute;
              end;
            end;
            if ApplyUpdates(0)<>0 then
              DM.ADOConnection1.RollbackTrans;
            DM.ADOConnection1.CommitTrans;
          finally
            cdsMain.F_IsBatchOperating :=False;
            cdsMain.EnableControls;
            Screen.Cursor := crDefault;
          end;
          with cdsRead do
          begin
            Close;
            CommandText:='SELECT distinct  Phone,Msg FROM '+TempTable;
            Open;
            if IsEmpty=False then
            if   IsSenderMsg=True then
            while not Eof do
            begin
              DM.cdsRead1.CommandText:=  'insert [172.18.9.10].[WzSmsCenter].dbo.[tblsms_outbox]'+//'insert ['+vSUPLFEDSHIP+'].'+vSUPLFEDMAT+'.dbo.'+vSUPLFEDMISC+
                        '(phonenumber,messagecontent,sendername,companyid) '+
                        'values ('+quotedstr(FieldByName('Phone').AsString)+','+quotedstr(FieldByName('Msg').AsString)+','+quotedstr(UserName)+',9)';
              DM.cdsRead1.Execute;
              Next;
            end;
          end;
        except
          on e:Exception do
          begin
            if  DM.ADOConnection1.InTransaction then
            DM.ADOConnection1.RollbackTrans;
            cdsMain.Cancel;
            cdsMain.Refresh;
            MsgError('通知失败！'+#13#10+e.Message);
          end;
        end;
      end
    else
      begin
        try
          try
            Screen.Cursor := crHourGlass;
            DM.ADOConnection1.BeginTrans;
            Edit;
            FieldByName('Status').Value:=5;                  //将状态改为“已通知 ”
            Post;
            if ApplyUpdates(0) = 0 then
              DM.ADOConnection1.CommitTrans
            else
              DM.ADOConnection1.RollbackTrans;
          finally
            Screen.Cursor := crDefault;
          end;

          if messagebox(Self.Handle,'需要手机短信通知保养人对该设备要进行保养吗？','询问',MB_yesno+MB_iconquestion)= idYes then
          with cdsRead do
          begin
            Close;
            CommandText:=                     //将和该设备编号对应部门的对就信息接收人的记录插入临时表中
            'select data0804.MainPhone Phone,data0015.ABBR_NAME+'' 部门：''+DEPT_NAME+'' 设备代码：''+FASSET_CODE+''，设备名称：''+FASSET_NAME+''，预计'' '
              +'+ CONVERT(varchar(100),data0810.PlanMainDate, 23)+''进行保养。''as msg  '
              +#13+'from data0810 '
              +#13+'join data0804 on data0810.d804_ptr=data0804.rkey '
              +#13+'join data0417 on data0804.d417_ptr=data0417.rkey '
              +#13+'join data0034 on data0417.Dept_Ptr=data0034.rkey '
              +#13+'join data0015 on data0417.warehouse_ptr=data0015.rkey  '
              +#13+'where (not data0804.MainPhone is null)and(data0804.MainPhone <> '''' ) and data0810.rkey=  '+cdsMainrkey.AsString;
            Open;

            while not Eof do
            begin
              DM.cdsRead1.CommandText:='insert [172.18.9.10].[WzSmsCenter].dbo.[tblsms_outbox]'//'insert ['+vSUPLFEDSHIP+'].'+vSUPLFEDMAT+'.dbo.'+vSUPLFEDMISC

                        +'(phonenumber,messagecontent,sendername,companyid) '
                        +#13+'values ('+quotedstr(FieldByName('Phone').AsString)+','
                           +quotedstr(FieldByName('Msg').AsString)+','+quotedstr(UserName)+',9)';
              DM.cdsRead1.Execute;
              Next;
            end;
          end;
        except
          on e:Exception do
          begin
            if  DM.ADOConnection1.InTransaction then
              DM.ADOConnection1.RollbackTrans;    
            cdsMain.Cancel;
            cdsMain.Refresh;
            MsgError('通知失败！'+#13#10+e.Message);
          end;
        end;
      end;
    SetButtonStatus;
    dsMainStateChange(dsMain);
  end;

end;

procedure TMainPlan_f.Button3Click(Sender: TObject);
  function  ExecBeforeCheck():Boolean;
  var
    strMsg:string;
    i:Integer;
  begin
    Result:=True;
    with cdsMain do
    if   DghMain.SelectedRows.Count   >   1   then
    begin
      try
        F_IsBatchOperating :=True;
        DisableControls;
        Screen.Cursor := crHourGlass;
        for   i:=0 to  DghMain.SelectedRows.Count   -   1   do
        begin
          GotoBookmark(pointer(DghMain.SelectedRows.Items[i]));
          if (FieldByName('MaintMan').IsNull)or(FieldByName('MaintMan').AsString='') then
            strMsg:=strMsg+'明细表第'+IntToStr(i+1)+'行，字段：“'
            +cdsMain.FieldByName('MaintMan').DisplayLabel+'”的值不能为空！！！'+#13 ;
        end;

      finally
        F_IsBatchOperating :=False;
        EnableControls;
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      if (FieldByName('MaintMan').IsNull)or(FieldByName('MaintMan').AsString='') then
        strMsg:=strMsg+'明细表第'+IntToStr(RecNo)+'行，字段：“'
            +cdsMain.FieldByName('MaintMan').DisplayLabel+'”的值不能为空！！！'+#13 ;
    end;
    if strMsg<>'' then
    begin
      MsgError(Copy(strMsg,0,Length(strMsg)-1));
      Result:=False;
    end;
  end;
var
  i:Integer;
  Curr_date:TDateTime;
begin
  inherited;
  with   cdsMain  do
  if (Active)and(not IsEmpty ) then
  if ExecBeforeCheck  then
  begin         
    if messagebox(Self.Handle,'你确定要提交验收吗？','询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;
    if State in [dsEdit,dsInsert] then
      Post;

    if   DghMain.SelectedRows.Count   >   1   then  //如果用户选择的行数大于1，即多行。
      begin
        Curr_date:=GetDataBaseDate(cdsRead,1);
        try
          try
            F_IsBatchOperating :=True;
            DisableControls;
            Screen.Cursor := crHourGlass;
            DM.ADOConnection1.BeginTrans;
            for   i:=   DghMain.SelectedRows.Count   -   1   downto   0   do
            begin
              GotoBookmark(pointer(DghMain.SelectedRows.Items[i]));
              Edit;
              FieldByName('Status').Value:=3;                  //将状态改为“”
              if (FieldByName('MainDate').IsNull)then
                FieldByName('MainDate').Value:= Curr_date;
              Post;
              if ApplyUpdates(0)<>0 then
                DM.ADOConnection1.RollbackTrans;
            end;
            DM.ADOConnection1.CommitTrans;
          finally
            F_IsBatchOperating :=False;
            EnableControls;
            Screen.Cursor := crDefault;
          end;
        except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            Cancel;
            Refresh;
            MsgError('通知失败！'+#13#10+e.Message);
          end;
        end;
      end
    else
      begin
        try
          try
            Screen.Cursor := crHourGlass;
            DM.ADOConnection1.BeginTrans;
            Edit;
            FieldByName('Status').Value:=3;                  //将状态改为“已通知 ”
            if (FieldByName('MainDate').IsNull)then
                FieldByName('MainDate').Value:= GetDataBaseDate(cdsRead,1);
            Post;
            if ApplyUpdates(0)<>0 then
              DM.ADOConnection1.RollbackTrans;

            DM.ADOConnection1.CommitTrans;
          finally
            Screen.Cursor := crDefault;
          end;
        except
          on e:Exception do
          begin
            if DM.ADOConnection1.InTransaction then
              DM.ADOConnection1.RollbackTrans;
            Cancel;
            Refresh;
            MsgError('通知失败！'+#13#10+e.Message);
          end;
        end;
      end;
    SetButtonStatus;
    dsMainStateChange(dsMain);
  end;

end;

procedure TMainPlan_f.Button8Click(Sender: TObject);
begin
  inherited;
  try
    MainPlan1_f:= TMainPlan1_f.Create(Application);
    MainPlan1_f.ShowModal;
  finally
    MainPlan1_f.Free;
    actRefreshExecute(nil);
  end;
end;

procedure TMainPlan_f.cdsMainStatusChange(Sender: TField);
begin
  inherited;
  with cds832 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      cdsMain.FieldByName('MainExecStat').Value:=null;
    end
    else
    begin
      if Locate('rkey',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainMainExecStat.Value := FieldByName('MainExecStat').Value ;
        end
      else
        begin
        cdsMain.FieldByName('MainExecStat').Value:=null;
        end;
    end;
  end;
end;

procedure TMainPlan_f.Button9Click(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  with   cdsMain  do
  if (Active)and(not IsEmpty ) then
  begin         
    if messagebox(Self.Handle,'你确定要开始保养吗？','询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;
    if State in [dsEdit,dsInsert] then
      Post;

    if   DghMain.SelectedRows.Count   >   1   then  //如果用户选择的行数大于1，即多行。
      begin
        Curr_date:=GetDataBaseDate(cdsRead,1);
        try
          try
            F_IsBatchOperating :=True;
            DisableControls;
            Screen.Cursor := crHourGlass;
            DM.ADOConnection1.BeginTrans;
            for   i:=   DghMain.SelectedRows.Count   -   1   downto   0   do
            begin
              GotoBookmark(pointer(DghMain.SelectedRows.Items[i]));
              Edit;
              FieldByName('Status').Value:=3;                  //将状态改为“”
              if (FieldByName('MainDate').IsNull)then
                FieldByName('MainDate').Value:= Curr_date;
              Post;
              if ApplyUpdates(0)<>0 then
                DM.ADOConnection1.RollbackTrans;
            end;
            DM.ADOConnection1.CommitTrans;
          finally
            F_IsBatchOperating :=False;
            EnableControls;
            Screen.Cursor := crDefault;
          end;
        except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            Cancel;
            Refresh;
            MsgError('通知失败！'+#13#10+e.Message);
          end;
        end;
      end
    else
      begin
        try
          try
            Screen.Cursor := crHourGlass;
            DM.ADOConnection1.BeginTrans;
            Edit;
            FieldByName('Status').Value:=3;                  //将状态改为“已通知 ”
            if (FieldByName('MainDate').IsNull)then
                FieldByName('MainDate').Value:= GetDataBaseDate(cdsRead,1);
            Post;
            if ApplyUpdates(0)<>0 then
              DM.ADOConnection1.RollbackTrans;

            DM.ADOConnection1.CommitTrans;
          finally
            Screen.Cursor := crDefault;
          end;
        except
          on e:Exception do
          begin
            if DM.ADOConnection1.InTransaction then
              DM.ADOConnection1.RollbackTrans;
            Cancel;
            Refresh;
            MsgError('通知失败！'+#13#10+e.Message);
          end;
        end;
      end;
    SetButtonStatus;
    dsMainStateChange(dsMain);
  end;
end;

procedure TMainPlan_f.Button2Click(Sender: TObject);
begin
  inherited;
  with cdsAddMainPlan do
  begin
    if  ShowfrmSelectMultiItem(Self,cdsAddMainPlan,'FASSET_NAME') then //  ShowModal=mrOK
    begin
      try
        try
          cdsMain.F_IsBatchOperating:=True;
          Screen.Cursor := crHourGlass;
         // DisableControls;
          cdsMain.DisableControls;
          First;
          while not Eof do
          begin
            if FieldByName('selected').AsBoolean=True then
            begin
              cdsMain.Append;
              cdsMain.FieldByName('FASSET_CODE').Value   :=FieldByName('FASSET_CODE').Value;
              cdsMain.FieldByName('FASSET_NAME').Value   :=FieldByName('FASSET_NAME').Value;
              cdsMain.FieldByName('LOCATION').Value      :=FieldByName('LOCATION').Value;
              cdsMain.FieldByName('DEPT_CODE').Value     :=FieldByName('DEPT_CODE').Value;
              cdsMain.FieldByName('DEPT_NAME').Value     :=FieldByName('DEPT_NAME').Value;
              cdsMain.FieldByName('MainCycl').Value      :=FieldByName('MainCycl').Value;
              cdsMain.FieldByName('Item').Value          :=FieldByName('Item').Value;
              cdsMain.FieldByName('MainMeth').Value      :=FieldByName('MainMeth').Value;
              cdsMain.FieldByName('ChecAcce').Value      :=FieldByName('ChecAcce').Value;
              cdsMain.FieldByName('MainExecStat').Value  :='待执行';
              cdsMain.FieldByName('PlanMainDate').Value  :=FieldByName('PlanMainDate').Value;
              cdsMain.FieldByName('D804_ptr').Value      :=FieldByName('rkey').Value;
              cdsMain.FieldByName('Status').Value        :=1;
              cdsMain.FieldByName('MaintMan').Value      :=FieldByName('defauMan').Value;
              cdsMain.FieldByName('Acceptan_ptr').Value  :=FieldByName('Acceptan_ptr').Value;
              cdsMain.Post;
            end;
            Next;
          end;
          cdsMain.ApplyUpdates(0);
        except
          on e:Exception do
          begin
            MsgError('添加失败的原因：'+E.message);
          end;
        end;
      finally
        cdsMain.F_IsBatchOperating:=False;
      //  EnableControls;
        cdsMain.EnableControls;
        Screen.Cursor := crDefault;
      end;
      actRefreshExecute(nil);
    end;
    Close;
  end;
end;

procedure TMainPlan_f.Button4Click(Sender: TObject);
var
  AddMonth:Integer;
  str_AddMonth :string;
begin
  inherited;
  AddMonth:=0;
  while AddMonth=0 do
  begin
    if InputQuery('输入新建保养计划的月份','',str_AddMonth)=False then
    Exit;
    if  str_AddMonth<>''then
    if IsInt(str_AddMonth) then
    begin
      if  (StrToInt(str_AddMonth) in [1..12]) then
        AddMonth:= StrToInt(str_AddMonth)
      else
        MsgError('不是有效的月份！！！');
    end
    else
    MsgError('不是有效的月份！！！');
  end  ;
  cdsAddMonthPlan1.Close;
  cdsAddMonthPlan1.Params.ParamByName('AddMonth').Value := AddMonth;
  cdsAddMonthPlan1.Open;
  MsgInfo('本次共添加了'+cdsAddMonthPlan1.Fields[0].AsString+'行记录。');
  if   cdsAddMonthPlan1.Fields[0].AsInteger>0 then
  bt_FindClick(nil);
end;

procedure TMainPlan_f.cdsMainAcceCodeChange(Sender: TField);
begin
  inherited;
  with cds005 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      cdsMain.FieldByName('Acceptan_ptr').Value:=null;
      cdsMain.FieldByName('Acceptan').Value:=null;
    end
    else
    begin
      if Locate('AcceCode',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainAcceptan_ptr.Value := FieldByName('rkey').Value ;
        cdsMainAcceptan.Value := FieldByName('AcceName').Value ;
        end
      else
        begin
        Sender.Value:=null;
        cdsMain.FieldByName('Acceptan_ptr').Value:=null;
        cdsMain.FieldByName('Acceptan').Value:=null;
        MsgWarning('输入的雇员代码不存在！');
        end;
    end;
  end;
end;

procedure TMainPlan_f.cdsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  if (FieldByName('EndMainDate').IsNull=False)and (FieldByName('BeginMainDate').IsNull=False)  then
  begin                            
    FieldByName('MainTime').Value:=
    MinutesDiff(FieldByName('EndMainDate').Value,FieldByName('BeginMainDate').Value);
  end;
end;

procedure TMainPlan_f.FormShow(Sender: TObject);
begin
  inherited;
  if IsLog then
  with Data_Info[0] do
  L_LogFields:= VarArrayOf(['PlanMainDate','beginMainDate','EndMainDate',
  'Status', 'MaintMan','AcceCode','Acceptan','ttype','AcceEval','MainExecStat']);
end;

end.
