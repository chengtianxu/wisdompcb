unit BOM_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ppEndUsr, ppBands, ppPrnabl,
  ppClass, ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DBClient, DB, Provider, ADODB, Grids, DBGridEh, ComCtrls,
  StdCtrls, ExtCtrls, RzButton, RzPanel, Mask, RzEdit, RzBtnEdt, Contnrs,
  RzDBEdit, RzDBBnEd, DBButtonEdit,  DBCtrls , MC_unt, cds;
  //Contnrs TObjectList的单元文件
type
  TBOM_frm = class(TMC_frm)
    cdsMainMANU_PART_NUMBER: TStringField;
    cdsMainMANU_PART_DESC: TStringField;
    cdsMainEMPL_CODE: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainAudit_EMPL_CODE: TStringField;
    cdsMainAudit_EMPLOYEE_NAME: TStringField;
    cdsMainRKEY: TAutoIncField;
    cdsMainListNumber: TStringField;
    cdsMainRKEY25: TIntegerField;
    cdsMainHardwareLinkman_PTR: TIntegerField;
    cdsMainVersion: TStringField;
    cdsMainStatus: TSmallintField;
    cdsMainCreateBy_PTR: TIntegerField;
    cdsMainCreateDate: TDateTimeField;
    cdsMainAuditBy_PTR: TIntegerField;
    cdsMainAuditDate: TDateTimeField;
    cdsMainRemark: TStringField;
    cdsChildINV_PART_NUMBER: TStringField;
    cdsChildINV_NAME: TStringField;
    cdsChildANALYSIS_CODE5: TStringField;
    cdsChildANALYSIS_CODE1: TStringField;
    cdsChildRKEY: TAutoIncField;
    cdsChildRKEY800: TIntegerField;
    cdsChildListNumber: TStringField;
    cdsChildType: TSmallintField;
    cdsChildRKEY17: TIntegerField;
    cdsChildQty: TIntegerField;
    cdsChildParam: TStringField;
    cdsChildPosition: TStringField;
    cdsChildRemark: TStringField;
    dtChildINV_PART_NUMBER: TStringField;
    dtChildINV_NAME: TStringField;
    dtChildANALYSIS_CODE5: TStringField;
    dtChildANALYSIS_CODE1: TStringField;
    dtChildRKEY: TAutoIncField;
    dtChildRKEY800: TIntegerField;
    dtChildListNumber: TStringField;
    dtChildType: TWordField;
    dtChildRKEY17: TIntegerField;
    dtChildQty: TIntegerField;
    dtChildParam: TStringField;
    dtChildPosition: TStringField;
    dtChildRemark: TStringField;
    dtMainMANU_PART_NUMBER: TStringField;
    dtMainMANU_PART_DESC: TStringField;
    dtMainEMPL_CODE: TStringField;
    dtMainEMPLOYEE_NAME: TStringField;
    dtMainAudit_EMPL_CODE: TStringField;
    dtMainAudit_EMPLOYEE_NAME: TStringField;
    dtMainRKEY: TAutoIncField;
    dtMainListNumber: TStringField;
    dtMainRKEY25: TIntegerField;
    dtMainHardwareLinkman_PTR: TIntegerField;
    dtMainVersion: TStringField;
    dtMainStatus: TWordField;
    dtMainCreateBy_PTR: TIntegerField;
    dtMainCreateDate: TDateTimeField;
    dtMainAuditBy_PTR: TIntegerField;
    dtMainAuditDate: TDateTimeField;
    dtMainRemark: TStringField;
    dtChildINV_DESCRIPTION: TStringField;
    cdsChildINV_DESCRIPTION: TStringField;
    dtRead_025: TADODataSet;
    dtRead_017: TADODataSet;
    dtRead_005: TADODataSet;
    dtRead_005RKEY: TIntegerField;
    dtRead_005EMPL_CODE: TStringField;
    dtRead_005EMPLOYEE_NAME: TStringField;
    bt_Replace: TButton;
    dtRead_005_1: TADODataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    dtRead_025rkey: TIntegerField;
    dtRead_025MANU_PART_NUMBER: TStringField;
    dtRead_025MANU_PART_DESC: TStringField;
    dtRead_017rkey: TIntegerField;
    dtRead_017INV_PART_NUMBER: TStringField;
    dtRead_017INV_NAME: TStringField;
    dtRead_017INV_DESCRIPTION: TStringField;
    dtRead_017ANALYSIS_CODE5: TStringField;
    dtRead_017ANALYSIS_CODE1: TStringField;
    dtMainLin_EMPL_CODE: TStringField;
    dtMainLin_EMPLOYEE_NAME: TStringField;
    cdsMainLin_EMPL_CODE: TStringField;
    cdsMainLin_EMPLOYEE_NAME: TStringField;
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
    edt_ListNumber: TDBEdit;
    edt_Version: TDBEdit;
    edt_EMPL_CODE: TDBEdit;
    edt_EMPLOYEE_NAME: TDBEdit;
    edt_CreateDate: TDBEdit;
    edt_Audit_EMPL_CODE: TDBEdit;
    edt_Audit_EMPLOYEE_NAME: TDBEdit;
    edt_AuditDate: TDBEdit;
    edt_Status: TDBEdit;
    edt_Remark: TDBMemo;
    edt_MANU_PART_NUMBER: TDBButtonEdit;
    edt_Lin_EMPL_CODE: TDBButtonEdit;
    edt_MANU_PART_DESC: TDBEdit;
    edt_Lin_EMPLOYEE_NAME: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edt_INV_PART_NUMBER: TDBButtonEdit;
    edt_INV_NAME: TDBEdit;
    edt_INV_DESCRIPTION: TDBEdit;
    edt_ANALYSIS_CODE5: TDBEdit;
    edt_ANALYSIS_CODE1: TDBEdit;
    edt_cld_Remark: TDBMemo;
    edt_cld_ListNumber: TDBEdit;
    edt_Type: TDBEdit;
    edt_Qty: TDBEdit;
    edt_Param: TDBEdit;
    edt_Position: TDBEdit;
    bt_Batch: TButton;
    Button5: TButton;
    dtChildFAILURE_RATE: TBCDField;
    cdsChildFAILURE_RATE: TBCDField;
    Label22: TLabel;
    edt_FAILURE_RATE: TDBEdit;
    dtRead_017FAILURE_RATE: TFloatField;
    bt_Submit: TButton;
    bt_Audit: TButton;
    bt_Return: TButton;
    bt_Copy: TButton;
    dtRead_018: TADODataSet;
    procedure FormCreate(Sender: TObject);
    procedure bt_CopyClick(Sender: TObject);
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cdsMainStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsChildTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure bt_AuditClick(Sender: TObject);
    procedure cdsChildNewRecord(DataSet: TDataSet);
    procedure Filter_editChange(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure cdsChildAfterOpen(DataSet: TDataSet);
    procedure cdsChildBeforeClose(DataSet: TDataSet);
    procedure bt_ReplaceClick(Sender: TObject);
    procedure cdsChildListNumberChange(Sender: TField);
    procedure bt_BatchClick(Sender: TObject);
    procedure bt_SubmitClick(Sender: TObject);
    procedure bt_ReturnClick(Sender: TObject);
    procedure cdsChildRKEY17Change(Sender: TField);
    procedure cdsChildBeforeInsert(DataSet: TDataSet);
    procedure cdsMainMANU_PART_NUMBERChange(Sender: TField);
    procedure cdsMainLin_EMPL_CODEChange(Sender: TField);
    procedure cdsChildINV_PART_NUMBERChange(Sender: TField);
  private
    str_Ole_ListNumber:string;
    function  SaveBeforeCheck():Boolean  ;           override;
    procedure Set_ToolbarButtonStatus(Flag: Boolean);override;
    function  Get_New_ListNumber(str:string):string;
//    function New_ListNumber():string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BOM_frm: TBOM_frm;

implementation

uses DM_unt,PublicFile,SelectItem_unt, Input_Edit_unt;

{$R *.dfm}

procedure TBOM_frm.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd'; {}

 {  DM_frm.ADOConnection1.Close;
  DM_frm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  DM_frm.ADOConnection1.Open;
  UserRKEY := 1;  //
  vprev:='4'; }
  inherited;
  IsMC:=False;
  with cdsMain  do
  begin
    F_TableName:='data0800';
    F_AutoIncrField:='rkey';
    F_SQLOrderBy:='order by data0025.MANU_PART_NUMBER,data0800.Version';
  end;
  with cdsChild  do
  begin
    F_TableName:='data0801';
    F_AutoIncrField:='rkey';
    F_SQLSelectFrom:=CommandText;
    F_SQLOrderBy:='order by data0801.ListNumber';
    F_Primarykey:='rkey';
    F_Foreignkey:='RKEY800';
  end;
  cdsMain.Open;
  SetEmployeeInfo(dtRead,StatusBar1);

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120'; // rkey//0,
    L_FindDataSet           :=dtRead_005;
    L_DropdownColumn        :='EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='EMPL_CODE';
    L_SourceField           :=varArrayOf(['createBy_PTR','EMPLOYEE_NAME']);
    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=nil;                      //清空原值，以防打扰本次的信息值
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_FindDataSet           :=dtRead_005;
    L_DropdownColumn        :='Audit_EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='Audit_EMPL_CODE';
    L_SourceField           :=varArrayOf(['AuditBy_PTR','Audit_EMPLOYEE_NAME']);
    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=nil;                      //清空原值，以防打扰本次的信息值
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_FindDataSet           :=dtRead_005;
    L_ListDataSet           :=dtRead_005_1;
    L_DropdownColumn        :='Lin_EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='Lin_EMPL_CODE';
    L_SourceField           :=varArrayOf(['HardwareLinkman_PTR','Lin_EMPLOYEE_NAME']);
    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
    edt_Lin_EMPL_CODE.F_DownListDataSet:=L_ListDataSet;
    edt_Lin_EMPL_CODE.F_DownDataSetFilterField:='EMPL_CODE';
    edt_Lin_EMPL_CODE.F_GetFieldName:='Lin_EMPL_CODE';
    edt_Lin_EMPL_CODE.F_ColsInfo:=L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=nil;                      //清空原值，以防打扰本次的信息值
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='MANU_PART_NUMBER/本厂编号/120,MANU_PART_DESC/客户型号/250';
    L_ListDataSet           :=dtRead_025;
    L_DropdownColumn        :='MANU_PART_NUMBER';
    L_ListDataSetFilterField:='MANU_PART_NUMBER';
    L_ListResultField       :='MANU_PART_NUMBER';
    L_GetValueField         :='MANU_PART_NUMBER';
    L_SourceField           :=varArrayOf(['rkey25','MANU_PART_DESC']);
    L_ResultField           :=varArrayOf(['rkey','MANU_PART_DESC']);
    DropDownInfo_Init(var_DropDown_Info);
    edt_MANU_PART_NUMBER.F_DownListDataSet:=L_ListDataSet;
    edt_MANU_PART_NUMBER.F_ColsInfo:=L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;{ }

  var_DropDown_Info:=nil;                      //清空原值，以防打扰本次的信息值
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsChild;
    L_GridName              :=dghChild;
    L_ColsInfo:='INV_PART_NUMBER/器件编码/120,INV_NAME/实物描述/200,INV_DESCRIPTION/器件描述/200,'
      +'ANALYSIS_CODE5/物件型号/100,ANALYSIS_CODE1/生产厂家/100';
    L_ListDataSet           :=dtRead_017;
    L_DropdownColumn        :='INV_PART_NUMBER';
    L_ListDataSetFilterField:='INV_PART_NUMBER';
    L_ListResultField       :='INV_PART_NUMBER';
    L_GetValueField         :='INV_PART_NUMBER';
    L_SourceField           :=varArrayOf(['INV_NAME','INV_DESCRIPTION','ANALYSIS_CODE5','ANALYSIS_CODE1','FAILURE_RATE','rkey17']);
    L_ResultField           :=varArrayOf(['INV_NAME','INV_DESCRIPTION','ANALYSIS_CODE5','ANALYSIS_CODE1','FAILURE_RATE','rkey']);
    DropDownInfo_Init(var_DropDown_Info);
    edt_INV_PART_NUMBER.F_DownListDataSet:=L_ListDataSet;
    edt_INV_PART_NUMBER.F_ColsInfo:=L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=nil;                      //清空原值，以防打扰本次的信息值
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin                                 //这段代码只是在查找窗口的状态字段添加一个下拉列表
    L_DropdownColumn        :='status';
    L_AddPickList            :=varArrayOf(['制作中','待审核','已审核','已退回']);
    L_PickListResultValues   :=varArrayOf(['1','2','3','4']);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
end;

procedure TBOM_frm.bt_CopyClick(Sender: TObject);
var
  v_ListNumber:string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    v_ListNumber:= cdsMain .FieldByName('ListNumber').Value;
    cdsRead.Close;
    cdsRead.Data:=cdsChild.data  ;    
    cdsMain.Append;
    cdsMain .FieldByName('ListNumber').Value:= v_ListNumber;
    cdsMain.Post;
    cdsMain.F_IsBatchOperating:=True;
    cdsChild.F_IsBatchOperating:=True;
    with  cdsRead do
    begin
      First;
      while not Eof do
      begin
        cdsChild.Append;
        cdsChild .FieldByName('Type').Value:=FieldByName('Type').Value;
        cdsChild .FieldByName('Qty').Value:=FieldByName('Qty').Value;
        cdsChild .FieldByName('Param').Value:=FieldByName('Param').Value;
        cdsChild .FieldByName('Position').Value:=FieldByName('Position').Value;
        cdsChild .FieldByName('INV_PART_NUMBER').Value:=FieldByName('INV_PART_NUMBER').Value;
        cdsChild .FieldByName('ListNumber').Value:=FieldByName('ListNumber').Value;
        cdsChild.Post;
        Next;
      end;
    end;
    cdsRead.Close;
  finally
    cdsMain.F_IsBatchOperating:=False;
    cdsChild.F_IsBatchOperating:=False;
    dsMainStateChange(dsMain);
    Screen.Cursor := crDefault;
  end;
end;

procedure TBOM_frm.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('ListNumber').Value:='3001';
    FieldByName('Status').Value:=1;      //制作中
    FieldByName('CreateDate').Value:=GetDataBaseDate(dtRead);
    FieldByName('CreateBy_PTR').Value:=EmplRKEY;
    FieldByName('EMPL_CODE').Value:=EMPL_CODE;
    FieldByName('EMPLOYEE_NAME').Value:=EmplName;
  end;
end;

procedure TBOM_frm.FormShow(Sender: TObject);
begin
  inherited;
  //不论权限码和状态值，这些表格列和编辑框控件必须是只读
  SetControlsReadOnly([edt_MANU_PART_DESC,edt_EMPL_CODE,edt_EMPLOYEE_NAME,edt_CreateDate,
  edt_Audit_EMPL_CODE,edt_Audit_EMPLOYEE_NAME,edt_AuditDate,edt_Status,edt_Lin_EMPLOYEE_NAME,edt_Type,
  edt_INV_NAME,edt_INV_DESCRIPTION,edt_ANALYSIS_CODE5,edt_ANALYSIS_CODE1]);
  SetColsReadOnly(DghMain,['MANU_PART_DESC','EMPL_CODE','EMPLOYEE_NAME','CreateDate',
  'Audit_EMPL_CODE','Audit_EMPLOYEE_NAME','AuditDate','Status','Lin_EMPLOYEE_NAME']);
  SetColsReadOnly(dghChild,['Type','INV_NAME','INV_DESCRIPTION','ANALYSIS_CODE5','ANALYSIS_CODE1']);

  //动态设置过滤用控件
  Filter_Create(Panel_Bottom);
  Filter_Set(DghMain.FieldColumns['ListNumber']);

  //设置查询字段和默认值
  Find_DisplayFields:=VarArrayOf(['ListNumber','MANU_PART_NUMBER','MANU_PART_DESC',
    'Lin_EMPL_CODE','Lin_EMPLOYEE_NAME','Version', 'Status','EMPL_CODE','EMPLOYEE_NAME',
    'CreateDate','Audit_EMPL_CODE','Audit_EMPLOYEE_NAME','AuditDate', 'Remark']);
  Find_FieldsName      :=VarArrayOf(['MANU_PART_NUMBER','MANU_PART_DESC','EMPL_CODE','EMPLOYEE_NAME',
    'Audit_EMPL_CODE','Audit_EMPLOYEE_NAME','Lin_EMPL_CODE','Lin_EMPLOYEE_NAME', 'Status']);
  Find_QueryFieldsName :=VarArrayOf(['data0025.MANU_PART_NUMBER','data0025.MANU_PART_DESC',
    'data0005.EMPL_CODE','data0005.EMPLOYEE_NAME','Audit_05.EMPL_CODE',
    'Audit_05.EMPLOYEE_NAME','Lin_05.EMPL_CODE','Lin_05.EMPLOYEE_NAME', 'Data0800.Status']);
  Curr_Date:= GetDataBaseDate(dtRead,ADate);
  Find_Def_FieldName  :=VarArrayOf(['CreateDate']);
  Find_Def_Oper       :=VarArrayOf(['>=']);
  Find_Def_FieldValue :=VarArrayOf([DateToStr(Curr_Date-10)]);
  Find_Def_Field2Value:=VarArrayOf(['']);
end;

procedure TBOM_frm.cdsMainStatusGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if Sender.IsNull=False then
  case Sender. Value  of
    1: Text:='制作中';
    2: Text:='待审核';
    3: Text:='已审核';
    4: Text:='已退回';
  end;
end;

procedure TBOM_frm.cdsChildTypeGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if Sender.IsNull=False then
  case Sender. Value of
    0:  Text:='主料';
    1:  Text:='替代料';
  end;
end;

procedure TBOM_frm.bt_AuditClick(Sender: TObject);
begin
  inherited;
  if messagebox(Self.Handle,'你确定要审核吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  with cdsMain do
  begin
    if State  <>dsEdit  then
    Edit ;
    FieldByName('AuditDate').Value:=GetDataBaseDate(dtRead);
    FieldByName('AuditBy_PTR').Value:=EmplRKEY;
    FieldByName('Audit_EMPL_CODE').Value:=EMPL_CODE;
    FieldByName('Audit_EMPLOYEE_NAME').Value:=EmplName;
    FieldByName('Status').Value:=3;
    Post;
    SaveData;
  end;
end;

function TBOM_frm.SaveBeforeCheck():Boolean  ;
var
  strMsg,strSQL,str_Filter,str_Rows:WideString;
  I_Row :Integer;
  cds_Temp_ListNumber, cds_Temp_RKEY17:TClientDataSet;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
    if (FieldByName('ListNumber').AsString='')then
      strMsg:=strMsg+'字段“'+FieldByName('ListNumber').DisplayLabel+'”的值不能为空。'+#13;
    if FieldByName('rkey25').IsNull then //
      strMsg:=strMsg+'字段“'+FieldByName('MANU_PART_NUMBER').DisplayLabel+'”的值不能为空。'+#13;
    if FieldByName('Version').AsString='' then //
      strMsg:=strMsg+'字段“'+FieldByName('Version').DisplayLabel+'”的值不能为空。'+#13;
      
    if (FieldByName('RKEY25').AsString<>'')and(FieldByName('Version').AsString<>'')then
    if (UpdateStatus=usInserted)
         or((UpdateStatus=usModified) and (
         (UpperCase(FieldByName('RKEY25').NewValue)<>UpperCase(FieldByName('RKEY25').OldValue))or
         (UpperCase(FieldByName('Version').NewValue)<>UpperCase(FieldByName('Version').OldValue))
         )
           ) then
    begin
      strSQL:='select * from data0800 where rkey25 = '+QuotedStr(FieldByName('rkey25').NewValue)+
        ' and Version = '+QuotedStr(FieldByName('Version').NewValue);
      if RecordExists(strSQL,DM_frm.cdsRead)then
      begin
        strMsg:=strMsg+'字段“'+FieldByName('MANU_PART_NUMBER').DisplayLabel+'”的值“'+trim(FieldByName('MANU_PART_NUMBER').NewValue)+'”'+#13
                      +'字段“'+FieldByName('Version').DisplayLabel+'”的值“'+trim(FieldByName('Version').NewValue)
                      +'”已经存在！！！'+#13
      end;
    end;
  end;

  if cdsChild.State in [dsEdit ,dsInsert] then     //usModified
  cdsChild.Post;
  if cdsChild.IsEmpty then
    strMsg:=strMsg+'子表格至少要有一行记录！！！'+#13
  else
  begin
    with DM_frm.cdsClone do
    try
      Close;
      CloneCursor(cdsChild,True);
      DM_frm.cdsTemp.Close;
      DM_frm.cdsTemp.CloneCursor(cdsChild,True);
      cds_Temp_ListNumber:=TClientDataSet.Create(Application);
      cds_Temp_ListNumber.Data:=cdsChild.Data;
      cds_Temp_RKEY17:=TClientDataSet.Create(Application);
      cds_Temp_RKEY17.Data:=cdsChild.Data;

      DisableControls ;
      First;
      for I_Row:=0 to RecordCount-1 do
      begin
        if FieldByName('Type').IsNull then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段“'+cdsChild.FieldByName('Type').DisplayLabel+'”的值不能为空。'+#13 ;
        if FieldByName('Qty').IsNull then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段“'+cdsChild.FieldByName('Qty').DisplayLabel+'”的值不能为空。'+#13 ;
        if FieldByName('RKEY17').IsNull then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段“'+cdsChild.FieldByName('INV_PART_NUMBER').DisplayLabel+'”的值不能为空。'+#13
        else
        begin
          //**********材料编码不允许重重//
          with cds_Temp_RKEY17 do
          begin
            Filtered:=False;
            if IsEmpty=False then
            begin
              str_Filter:= 'rkey17 = '+FieldByName('rkey17').AsString;    
              Filter:= str_Filter;
              Filtered:=True;
              if RecordCount > 1 then
              begin
                str_Rows:='';
                DM_frm.cdsTemp.First;
                while not DM_frm.cdsTemp.Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
                begin
                  if DM_frm.cdsTemp.FieldByName('rkey17').AsInteger= FieldByName('rkey17').AsInteger then
                  str_Rows:=str_Rows+IntToStr(DM_frm.cdsTemp.RecNo)+'、';
                  DM_frm.cdsTemp.Next;
                end;
                str_Rows:=Copy(str_Rows,0,Length(str_Rows)-1);//去掉最后一个 '、'号
                strMsg:=strMsg+'明细表'+str_Rows+'行，字段“'
                +cdsChild.FieldByName('INV_PART_NUMBER').DisplayLabel+'”的值“'
                +trim( FieldByName('INV_PART_NUMBER').AsString)+'”已重复。'+#13 ;
              end;
              while not Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
              Delete;
            end;
          end;
          //**********//
        end;

        if FieldByName('ListNumber').AsString='' then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段“'+cdsChild.FieldByName('ListNumber').DisplayLabel+'”的值不能为空。'+#13
        else
        begin
          with cds_Temp_ListNumber do
          begin
            if IsEmpty=False then
            begin
              str_Filter:= 'ListNumber = '+FieldByName('ListNumber').AsString;
              Filtered:=False;
              Filter:= str_Filter;
              Filtered:=True;
              if RecordCount > 1 then
              begin
                str_Rows:='';
                DM_frm.cdsTemp.First;
                while not DM_frm.cdsTemp.Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
                begin
                  if DM_frm.cdsTemp.FieldByName('ListNumber').AsInteger= FieldByName('ListNumber').AsInteger then
                  str_Rows:=str_Rows+IntToStr(DM_frm.cdsTemp.RecNo)+'、';
                  DM_frm.cdsTemp.Next;
                end;
                str_Rows:=Copy(str_Rows,0,Length(str_Rows)-1);//去掉最后一个 '、'号
                strMsg:=strMsg+'明细表'+str_Rows+'行，字段“'
                +cdsChild.FieldByName('ListNumber').DisplayLabel+'”的值“'
                +trim( FieldByName('ListNumber').AsString)+'”已重复。'+#13 ;
              end;
              while not Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
              Delete;
            end;
          end;
        end;
        Next;
      end;
    finally
      EnableControls;
      Close;
      DM_frm.cdsTemp .Close ;
      cds_Temp_ListNumber.Free;
      cds_Temp_RKEY17.Free;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure TBOM_frm.cdsChildNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if str_Ole_ListNumber<>'' then
      FieldByName('ListNumber').Value:=  StrToInt(str_Ole_ListNumber)+1
    else
      FieldByName('ListNumber').Value:= '4001';
    FieldByName('Type').Value:=0;
    FieldByName('qty').Value:=1;
    FieldByName('FAILURE_RATE').Value:=0;

  end;
end;

procedure TBOM_frm.Filter_editChange(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if trim(Filter_edit.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TBOM_frm.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  Filter_Set(Column);
end;

procedure TBOM_frm.cdsChildAfterOpen(DataSet: TDataSet);
var
  OldIndex: string;
begin
  inherited;      //排序
  with dghChild.FieldColumns['ListNumber'] do
  begin
    if  Grid.DataSource.DataSet.Active then
    if  Field<>nil then
    begin
      if ( Field.DataType <> ftBlob)and(Field.FieldKind=fkData) then
      with (Grid.DataSource.DataSet as TClientDataSet) do
      begin
        OldIndex:= cdsChild.IndexName;
        if OldIndex <> '' then
        begin
          IndexName:= '';
          DeleteIndex(OldIndex);
        end;
        AddIndex(Field.FieldName, Field.FieldName, [ixPrimary]);
        Title.SortMarker:= smUpEh;
        IndexName:= Field.FieldName;
      end;
    end;
  end;
end;

procedure TBOM_frm.cdsChildBeforeClose(DataSet: TDataSet);
begin
  inherited;
  if cdsChild.IndexName<>'' then
  cdsChild.DeleteIndex(cdsChild.IndexName);
end;

function TBOM_frm.Get_New_ListNumber(str:string):string;
var
  Max_str:string;
begin
  Max_str:='';
  with DM_frm.cdsClone do
  begin
    CloneCursor(cdsChild ,False);
    First;
    while not Eof do
    begin
      if FieldByName('ListNumber').AsString > str then        //
      if POS(str,FieldByName('ListNumber').AsString )>0 then    //遍历复制cdsChild中的数据，找到有有包含关系的最大值
      begin
        if FieldByName('ListNumber').AsString>Max_str then
        Max_str:= FieldByName('ListNumber').AsString ;
      end;
      Next;
    end;
    Close;
  end;

  if Max_str='' then
    Result:= str+'01'
  else
  begin
    Max_str:=Copy(Max_str,Length(str)+1,2);
    Max_str:=IntToStr(strToInt( Max_str)+1);
    if  Length(Max_str )=1 then
      Max_str:= str+'0'+Max_str
    else
      Max_str:= str+Max_str ;
    Result:= Max_str;
  end;
end;

procedure TBOM_frm.bt_ReplaceClick(Sender: TObject);

var
  str_ListNumber:string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if cdsChild.FieldByName('ListNumber').AsString='' then
    begin
      MsgError(cdsChild.FieldByName('ListNumber').DisplayLabel+'：的值不能为空。');
      Exit;
    end;

    if Show_Item_frm(dtRead_017,'INV_PART_NUMBER','',
      'INV_PART_NUMBER/器件编码/120,INV_NAME/实物描述/200,INV_DESCRIPTION/器件描述/200,ANALYSIS_CODE5/物件型号/100,ANALYSIS_CODE1/生产厂家/100') then
    begin
      str_ListNumber:=   Get_New_ListNumber(cdsChild. FieldByName('ListNumber').Value);
      with cdsChild do
      begin
        Append;
        FieldByName('Qty').Value:=0;
        FieldByName('Type').Value:=1;
        FieldByName('ListNumber').Value:=str_ListNumber;
        FieldByName('INV_PART_NUMBER').Value:= dtRead_017.FieldByName('INV_PART_NUMBER').Value;         
        Post;
      end;
    end;
  finally    
    Screen.Cursor := crDefault;
  end;    
end;

procedure TBOM_frm.cdsChildListNumberChange(Sender: TField);
begin
  inherited;
  if cdsChild.FieldByName('Type').AsInteger=  0 then
  begin
    if Length(Sender.AsString) <>4 then
    begin
      MsgError('如果是主料，必须输入4位有效长。');
      Abort;
    end;
  end
  else
  if cdsChild.FieldByName('Type').AsInteger=  1 then
  begin
    if Length(Sender.AsString) <>6 then
    begin
      MsgError('如果是替代料，必须输入6位有效长。');
      Abort;
    end;
  end ;
end;

procedure TBOM_frm.bt_BatchClick(Sender: TObject);
var
  str_New,str_Old,str_flt:string;
  Input_Edit_frm: TInput_Edit_frm;
begin
  inherited;
  if cdsChild.FieldByName('ListNumber').AsString='' then
  begin
    MsgError(cdsChild.FieldByName('ListNumber').DisplayLabel+'：的值不能为空。');
    Exit;
  end;

  Input_Edit_frm:= TInput_Edit_frm.Create(Application);
  try
    Input_Edit_frm.Caption:='批更新'+CdsChild.FieldByName('ListNumber').DisplayLabel;
    Input_Edit_frm.Label1.Caption:='输入新的'+CdsChild.FieldByName('ListNumber').DisplayLabel;
    with  Input_Edit_frm do
    if ShowModal=mrOk then
    begin
      str_New:= Input_Edit_frm.Edit1.Text;
      if Length (Trim(str_New))<>4 then
      begin
        MsgError('必须输入4位有效长。');
        Exit;
      end;
  
      if  str_New<>'' then
      begin
        with DM_frm.cdsClone do      //输入的新值在原记录中是否存在，如果存在停止下一步
        begin
          Close;
          CloneCursor(cdsChild,true  );
          if FieldByName('rkey').IsNull=False then
          begin
            str_flt:='ListNumber='+QuotedStr(str_New);
            Filtered:=False;
            Filter:=str_flt;
            Filtered:=True;
            if recordCount>0 then
            begin
              MsgError(str_New+'该值已经存在。');
              Exit;
            end
          end ;
        end;
      end;

      with cdsChild do
      try
        DisableControls;
        begin
          str_Old:=FieldByName('ListNumber').AsString;
          if str_Old>str_New   then
          begin
            First;
            while not Eof do
            begin
              if Pos(str_Old,Copy( FieldByName('ListNumber').AsString,0,Length(str_Old)))>0  then //如果该记录的前几个字符和原值相同
              begin
                Edit;
                FieldByName('ListNumber').Value:=str_New+Copy( FieldByName('ListNumber').AsString,Length(str_Old)+1,2);
                Post;
              end;
              Next;
            end;
          end
          else
          begin
            Last;
            while not Bof do
            begin
              if Pos(str_Old,Copy( FieldByName('ListNumber').AsString,0,Length(str_Old)))>0  then //如果该记录的前几个字符和原值相同
              begin
                Edit;
                FieldByName('ListNumber').Value:=str_New+Copy( FieldByName('ListNumber').AsString,Length(str_Old)+1,2);
                Post;
              end;
              Prior;
            end;
          end;

        end;
        Locate('ListNumber', str_New,[]);
      finally
        EnableControls ;
      end;
      dsMainStateChange(dsMain);
    end;
  finally
    Input_Edit_frm.Free;
  end;
end;

procedure TBOM_frm.Set_ToolbarButtonStatus(Flag: Boolean);
begin
  if  NeedSave then
  if (cdsMain.F_IsBatchOperating<>True)
              and(cdsChild.F_IsBatchOperating<>True) then
  begin                        //只有批处理=false 的时候，才执行按钮刷新。
    with   ActiveGridEH.DataSource.DataSet as TClientDataSet do
    begin
      if ActiveGridEH=DghMain then
      begin
        if cdsMain.Active then       
        if (cdsMain.ChangeCount>0)or(cdsMain.State in [dsEdit,dsInsert])    then
        begin
          tblCancel.Enabled:=True;
        end
        else
        begin
          tblCancel.Enabled:=False;
        end;
        tblAdd .Enabled:=(not Flag) and (StrToInt(vprev)in [2,4]);
      end
      else
      if ActiveGridEH=dghChild then
      begin
        if (cdsChild.ChangeCount>0)or(cdsChild.State in [dsEdit,dsInsert])    then
        begin
          tblCancel.Enabled:=True;
        end
        else
        begin
          tblCancel.Enabled:=False;
        end;
        tblAdd .Enabled:=(not Flag) and (StrToInt(vprev)in [2,4])and(cdsMain.FieldByName('Status').AsInteger in [1,4]);
      end;

      if ((cdsMain.State  in [dsEdit,dsInsert])or(cdsMain.ChangeCount>0))
                  or((cdsChild.State  in [dsEdit,dsInsert])or(cdsChild.ChangeCount>0))and(StrToInt(vprev)in [2,4])  then
        begin
          tblSave.Enabled:=True;
          tblfind.Enabled:=False;
          tblRefresh.Enabled:=False;
          tblExport.Enabled:=False;
          tblPrint.Enabled:= False;      //打印
          tblDesign.Enabled:=False ;      //报表设计
          tblFilter.Enabled:= False;
        end
      else
        begin
          tblSave.Enabled:=False;
          tblfind.Enabled:= True;
          tblRefresh .Enabled:=True;
          tblExport.Enabled:=True;
          tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,4]);      //打印
          tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;      //报表设计
          tblFilter.Enabled:= True;
        end ;


      with cdsMainstatus do    //根据状态值和权限码，设置窗口的哪些对象可编辑。
      if (AsInteger in [1,4])and (StrToInt(vprev) in [2,4]) then    //状态= 制作中 或 已退回
      begin
        DghMain .ReadOnly := False;
        dghChild.ReadOnly := False;
        SetControlsReadOnly([edt_ListNumber,edt_MANU_PART_NUMBER,edt_Lin_EMPL_CODE,
            edt_Version,edt_Remark,edt_INV_PART_NUMBER,edt_cld_ListNumber,
            edt_Qty,edt_Param,edt_Position,edt_FAILURE_RATE,edt_cld_Remark],False);
        SetColsReadOnly(DghMain,['ListNumber','MANU_PART_NUMBER','Lin_EMPL_CODE','Version','Remark'],False);
        SetColsReadOnly(dghChild,['INV_PART_NUMBER','ListNumber','Qty','Param','Position','FAILURE_RATE','Remark'],False);
        bt_Submit .Enabled:=True;   //提交审核
        bt_Audit  .Enabled:=False;   //BOM审核
        bt_Return .Enabled:=False;   //BOM退回
        bt_Batch  .Enabled:=cdsChild.FieldByName('Type').AsInteger=0;   //批更新
        bt_Replace.Enabled:=cdsChild.FieldByName('Type').AsInteger=0;   //替代料
        tblEdit   .Enabled:=(not Flag) and (StrToInt(vprev)in [2,4])and(IsEmpty=False);
        tblDelete .Enabled:=(not  Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);
      end
      else
      if (AsInteger in [2])and (StrToInt(vprev) in [2,4]) then
      begin
        DghMain .ReadOnly := True;
        dghChild.ReadOnly := True;
        SetControlsReadOnly([edt_ListNumber,edt_MANU_PART_NUMBER,edt_Lin_EMPL_CODE,
            edt_Version,edt_Remark,edt_INV_PART_NUMBER,edt_cld_ListNumber,
            edt_Qty,edt_Param,edt_Position,edt_FAILURE_RATE,edt_cld_Remark]);
        SetColsReadOnly(DghMain,['ListNumber','MANU_PART_NUMBER','Lin_EMPL_CODE','Version','Remark']);
        SetColsReadOnly(dghChild,['INV_PART_NUMBER','ListNumber','Qty','Param','Position','FAILURE_RATE','Remark']);
        bt_Submit .Enabled:=False;   //提交审核
        bt_Audit  .Enabled:=StrToInt(vprev) in [4];   //BOM审核
        bt_Return .Enabled:=StrToInt(vprev) in [4];   //BOM退回
        bt_Batch  .Enabled:=False;   //批更新
        bt_Replace.Enabled:=False;   //替代料
        tblEdit   .Enabled:=False;
        tblDelete .Enabled:=False;
      end    
      else
      if (AsInteger in [3])and (StrToInt(vprev) in [2,4]) then
      begin
        DghMain .ReadOnly := True;
        dghChild.ReadOnly := True;
        SetControlsReadOnly([edt_ListNumber,edt_MANU_PART_NUMBER,edt_Lin_EMPL_CODE,
            edt_Version,edt_Remark,edt_INV_PART_NUMBER,edt_cld_ListNumber,
            edt_Qty,edt_Param,edt_Position,edt_FAILURE_RATE,edt_cld_Remark]);
        SetColsReadOnly(DghMain,['ListNumber','MANU_PART_NUMBER','Lin_EMPL_CODE','Version','Remark']);
        SetColsReadOnly(dghChild,['INV_PART_NUMBER','ListNumber','Qty','Param','Position','FAILURE_RATE','Remark']);
        bt_Submit .Enabled:=False;   //提交审核
        bt_Audit  .Enabled:=False;   //BOM审核
        bt_Return .Enabled:=StrToInt(vprev) in [4];   //BOM退回
        bt_Batch  .Enabled:=False;   //批更新
        bt_Replace.Enabled:=False;   //替代料
        tblEdit   .Enabled:=False;
        tblDelete .Enabled:=False;
      end
      else
      begin
        DghMain .ReadOnly := True;
        dghChild.ReadOnly := True;
        SetControlsReadOnly([edt_ListNumber,edt_MANU_PART_NUMBER,edt_Lin_EMPL_CODE,
            edt_Version,edt_Remark,edt_INV_PART_NUMBER,edt_cld_ListNumber,
            edt_Qty,edt_Param,edt_Position,edt_FAILURE_RATE,edt_cld_Remark]);
        SetColsReadOnly(DghMain,['ListNumber','MANU_PART_NUMBER','Lin_EMPL_CODE','Version','Remark']);
        SetColsReadOnly(dghChild,['INV_PART_NUMBER','ListNumber','Qty','Param','Position','FAILURE_RATE','Remark']);
        bt_Submit .Enabled:=False;   //提交审核
        bt_Audit  .Enabled:=False;   //BOM审核
        bt_Return .Enabled:=False;   //BOM退回
        bt_Batch  .Enabled:=False;   //批更新
        bt_Replace.Enabled:=False;   //替代料
       // bt_Copy   .Enabled:=False;   //替代料
        tblEdit   .Enabled:=False;
        tblDelete .Enabled:=False;
      end;
      bt_Copy   .Enabled:=(StrToInt(vprev) in [2,4])and cdsMain.IsEmpty=False ;   //BOM复制
    end;
    with ActiveGridEH do
    begin
      if  DataSource.DataSet.Eof  then
      begin
      tblNext.Enabled:=False ;
      tblLast.Enabled:=False ;
      end
      else
      begin
      tblNext.Enabled:=True ;
      tblLast.Enabled:=True ;
      end;

      if  DataSource.DataSet.Bof  then
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
  end;  
end;

procedure TBOM_frm.bt_SubmitClick(Sender: TObject);
begin
  inherited;
  if messagebox(Self.Handle,'你确定要提交审核吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  with cdsMain do
  begin
    if State  <>dsEdit  then
    Edit ;
    FieldByName('Status').Value:=2;
    Post;
    SaveData;
  end;
end;

procedure TBOM_frm.bt_ReturnClick(Sender: TObject);
begin
  inherited;
  if messagebox(Self.Handle,'你确定要退回吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  with cdsMain do
  begin
    if State  <>dsEdit  then
    Edit ;
    FieldByName('AuditDate').Value:= null;
    FieldByName('Status').Value:=4;
    FieldByName('AuditBy_PTR').Value:=null;
    FieldByName('Audit_EMPL_CODE').Value:=null;
    FieldByName('Audit_EMPLOYEE_NAME').Value:=null;
    Post;
    SaveData;
  end;
end;

procedure TBOM_frm.cdsChildRKEY17Change(Sender: TField);
var
  str_ListNumber:string;
begin
  inherited;
  if  (cdsChild.FieldByName('type').AsInteger=0)and (cdsChild.F_IsBatchOperating=False)then
  begin
    str_ListNumber:=cdsChild.fieldByName('ListNumber').asstring;
    //删除旧的替代料
    with  cdsChild do
    begin
      First;
      while not Eof do         //如果有包含关系删除
      begin
        if (FieldByName('type').AsInteger=1)and (Pos (str_ListNumber,Copy(FieldByName('ListNumber').AsString,0,4))>0) then
          Delete
        else
          Next;
      end;
    end;
    //添加新的替代料
    if VarIsNull(Sender.NewValue)=False  then
    with dtRead_018 do
    begin
      Close;
      Parameters.ParamByName('INVENT_PTR').Value := Sender.NewValue;
      Open;

      while not eof do
      begin
        cdsChild.Append;
        cdsChild.FieldByName('type').Value:= 1;
        cdsChild.FieldByName('ListNumber').Value:= Get_New_ListNumber(str_ListNumber);
        cdsChild.FieldByName('INV_PART_NUMBER').Value:=FieldByName('INV_PART_NUMBER').Value;
        cdsChild.Post;
        Next;
      end;
    end;
  end;
end;

procedure TBOM_frm.cdsChildBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if DataSet.IsEmpty=False then
    str_Ole_ListNumber:=Copy(DataSet.FieldByName('ListNumber').AsString,0,4)
  else
    str_Ole_ListNumber:='';
end;

procedure TBOM_frm.cdsMainMANU_PART_NUMBERChange(Sender: TField);
begin
  inherited;
  with dtRead_025 do
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
      cdsMain.FieldByName('RKEY25').Value:=null;
      cdsMain.FieldByName('MANU_PART_DESC').Value:=null;
    end
    else
    begin
      if Locate('MANU_PART_NUMBER',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMain.FieldByName('RKEY25').Value:=FieldByName('rkey').Value ;
          cdsMain.FieldByName('MANU_PART_DESC').Value:= FieldByName('MANU_PART_DESC').Value;
        end
      else
        begin
          cdsMain.FieldByName('RKEY25').Value:=null;
          cdsMain.FieldByName('MANU_PART_DESC').Value:=null;
        end;
    end;
  end;
end;

procedure TBOM_frm.cdsMainLin_EMPL_CODEChange(Sender: TField);
begin
  inherited;
  with dtRead_005_1 do
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
      cdsMain.FieldByName('HardwareLinkman_PTR').Value:=null;
      cdsMain.FieldByName('Lin_EMPLOYEE_NAME').Value:=null;
    end
    else
    begin
      if Locate('EMPL_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMain.FieldByName('HardwareLinkman_PTR').Value:=FieldByName('rkey').Value ;
          cdsMain.FieldByName('Lin_EMPLOYEE_NAME').Value:= FieldByName('EMPLOYEE_NAME').Value;
        end
      else
        begin
          cdsMain.FieldByName('HardwareLinkman_PTR').Value:=null;
          cdsMain.FieldByName('Lin_EMPLOYEE_NAME').Value:=null;
        end;
    end;
  end;
end;

procedure TBOM_frm.cdsChildINV_PART_NUMBERChange(Sender: TField);
begin
  inherited;
  with dtRead_017 do
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
      cdsChild.FieldByName('INV_NAME').Value:=null;
      cdsChild.FieldByName('INV_DESCRIPTION').Value:=null;
      cdsChild.FieldByName('ANALYSIS_CODE5').Value:=null;
      cdsChild.FieldByName('ANALYSIS_CODE1').Value:=null;
      cdsChild.FieldByName('FAILURE_RATE').Value:=null;
      cdsChild.FieldByName('rkey17').Value:=null;
    end
    else
    begin
      if Locate('INV_PART_NUMBER',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsChild.FieldByName('INV_NAME').Value:=FieldByName('INV_NAME').Value;
          cdsChild.FieldByName('INV_DESCRIPTION').Value:=FieldByName('INV_DESCRIPTION').Value;
          cdsChild.FieldByName('ANALYSIS_CODE5').Value:=FieldByName('ANALYSIS_CODE5').Value;
          cdsChild.FieldByName('ANALYSIS_CODE1').Value:=FieldByName('ANALYSIS_CODE1').Value;
          cdsChild.FieldByName('FAILURE_RATE').Value:=FieldByName('FAILURE_RATE').Value;
          cdsChild.FieldByName('rkey17').Value:=FieldByName('rkey').Value;
        end
      else
        begin
          cdsChild.FieldByName('INV_NAME').Value:=null;
          cdsChild.FieldByName('INV_DESCRIPTION').Value:=null;
          cdsChild.FieldByName('ANALYSIS_CODE5').Value:=null;
          cdsChild.FieldByName('ANALYSIS_CODE1').Value:=null;
          cdsChild.FieldByName('FAILURE_RATE').Value:=null;
          cdsChild.FieldByName('rkey17').Value:=null;
        end;
    end;
  end;
end;

end.
