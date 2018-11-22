unit FASSET_set1_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  Menus, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider,
  ADODB,   ImgList, ActnList, Grids, DBGridEh, ToolWin,
  ComCtrls,  StdCtrls, RzPanel, ExtCtrls, 
  SingleDataSet_unt, RzButton, DBCtrls, Mask, RzEdit, RzDBEdit, RzDBBnEd,
  DBButtonEdit, MC1_unt;

type
  TFASSET_set_frm = class(TMC1_frm)
    dtMainABBR_NAME: TStringField;
    dtMainDEPT_CODE: TStringField;
    dtMainDEPT_NAME: TStringField;
    dtMainEMPL_CODE: TStringField;
    dtMainEMPLOYEE_NAME: TStringField;
    dtMainRKEY: TAutoIncField;
    dtMainFASSET_CODE: TStringField;
    dtMainFASSET_NAME: TStringField;
    dtMainFASSET_DESC: TStringField;
    dtMainDEPT_PTR: TIntegerField;
    dtMainLOCATION: TStringField;
    dtMainREMARK: TStringField;
    dtMainactive_flag: TWordField;
    dtMainUSER_DATE: TDateTimeField;
    dtMainUSER_PTR: TIntegerField;
    dtMainwarehouse_ptr: TIntegerField;
    dtMainequipment_grade: TStringField;
    dtMainRateProd: TBCDField;
    dtMainScan_QTY: TIntegerField;
    cdsMainABBR_NAME: TStringField;
    cdsMainDEPT_CODE: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cdsMainEMPL_CODE: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainRKEY: TAutoIncField;
    cdsMainFASSET_CODE: TStringField;
    cdsMainFASSET_NAME: TStringField;
    cdsMainFASSET_DESC: TStringField;
    cdsMainDEPT_PTR: TIntegerField;
    cdsMainLOCATION: TStringField;
    cdsMainREMARK: TStringField;
    cdsMainactive_flag: TSmallintField;
    cdsMainUSER_DATE: TDateTimeField;
    cdsMainUSER_PTR: TIntegerField;
    cdsMainwarehouse_ptr: TIntegerField;
    cdsMainequipment_grade: TStringField;
    cdsMainRateProd: TBCDField;
    cdsMainScan_QTY: TIntegerField;
    dtRead_015: TADODataSet;
    dtRead_015RKEY: TIntegerField;
    dtRead_015WAREHOUSE_CODE: TStringField;
    dtRead_015ABBR_NAME: TStringField;
    dtMainWAREHOUSE_CODE: TStringField;
    cdsMainWAREHOUSE_CODE: TStringField;
    dtRead_034: TADODataSet;
    dtRead_034RKEY: TAutoIncField;
    dtRead_034DEPT_CODE: TStringField;
    dtRead_034DEPT_NAME: TStringField;
    dtRead_002: TADODataSet;
    dtRead_002RKEY: TAutoIncField;
    dtRead_002UNIT_CODE: TStringField;
    cdsMainUNIT_CODE: TStringField;
    Panel1: TPanel;
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
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edt_ABBR_NAME: TDBEdit;
    edt_DEPT_NAME: TDBEdit;
    edt_FASSET_CODE: TDBEdit;
    edt_FASSET_NAME: TDBEdit;
    edt_LOCATION: TDBEdit;
    edt_active_flag: TDBEdit;
    edt_equipment_grade: TDBEdit;
    edt_Capacity: TDBEdit;
    edt_RateProd: TDBEdit;
    edt_Scan_QTY: TDBEdit;
    edt_REMARK: TDBMemo;
    edt_USER_DATE: TDBEdit;
    edt_USER_FULL_NAME: TDBEdit;
    edt_USER_LOGIN_NAME: TDBEdit;
    edt_FASSET_DESC: TDBMemo;
    edt_WAREHOUSE_CODE: TDBButtonEdit;
    edt_DEPT_CODE: TDBButtonEdit;
    edt_Rate_UNIT: TDBButtonEdit;
    cdsChildDEPT_CODE: TStringField;
    cdsChildDEPT_NAME: TStringField;
    cdsChildRKEY: TAutoIncField;
    cdsChildFASS_PTR: TIntegerField;
    cdsChildDEPT_PTR: TIntegerField;
    dtChildDEPT_CODE: TStringField;
    dtChildDEPT_NAME: TStringField;
    dtChildRKEY: TAutoIncField;
    dtChildFASS_PTR: TIntegerField;
    dtChildDEPT_PTR: TIntegerField;
    dtMainCapa_UNIT_PTR: TIntegerField;
    dtMainRate_UNIT_PTR: TIntegerField;
    dtMainCapa_UNIT: TStringField;
    dtMainRate_UNIT: TStringField;
    cdsMainCapa_UNIT_PTR: TIntegerField;
    cdsMainRate_UNIT_PTR: TIntegerField;
    cdsMainRate_UNIT: TStringField;
    Label19: TLabel;
    edt_Capa_UNIT: TDBButtonEdit;
    dtRead_034_1: TADODataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    dtRead_073: TADODataSet;
    dtRead_073RKEY: TAutoIncField;
    dtRead_073USER_LOGIN_NAME: TStringField;
    dtRead_073USER_FULL_NAME: TStringField;
    dtMainCapacity: TStringField;
    cdsMainCapacity: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsMainactive_flagGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure Panel1Enter(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cdsMainWAREHOUSE_CODEChange(Sender: TField);
    procedure cdsMainDEPT_CODEChange(Sender: TField);
    procedure cdsMainUNIT_CODEChange(Sender: TField);
    procedure cdsMainRate_UNITChange(Sender: TField);
    procedure cdsChildDEPT_CODEChange(Sender: TField);
  private
    function  SaveBeforeCheck():Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FASSET_set_frm: TFASSET_set_frm;

implementation

uses PublicFile, DM_unt;

{$R *.dfm}

procedure TFASSET_set_frm.FormCreate(Sender: TObject);
begin

if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ;  

 {  DM_frm.ADOConnection1.Close;
   DM_frm.ADOConnection1.Open;
  UserRKEY := 1;
  vprev:='4';  }

  inherited;
  IsMC:=False;
  AutoNumb_Edit := edt_FASSET_CODE;
  FirstControl:=edt_FASSET_CODE;
  LastControl :=edt_REMARK;
  
  cdsMain.F_IsBatchOperating:=True;
  cdsChild.F_IsBatchOperating:=True;
  cdsMain.Open;
  ChildDataSetOpen;
  cdsMain.F_IsBatchOperating:=False;
  cdsChild.F_IsBatchOperating:=False;

  SetEmployeeInfo(dtRead,StatusBar1);
  Curr_Date:=GetDataBaseDate(dtRead,ADate);
  Find_DisplayFields:=VarArrayOf(['FASSET_CODE', 'FASSET_NAME', 'FASSET_DESC','LOCATION',
  'WAREHOUSE_CODE','ABBR_NAME', 'DEPT_CODE','DEPT_NAME','active_flag','equipment_grade',
  'Capacity','RateProd','Scan_QTY','REMARK', 'USER_DATE','USER_LOGIN_NAME','USER_FULL_NAME']);
  Find_FieldsName      :=VarArrayOf(['FASSET_CODE', 'FASSET_NAME', 'FASSET_DESC','LOCATION',
  'WAREHOUSE_CODE','ABBR_NAME', 'DEPT_CODE','DEPT_NAME','active_flag','equipment_grade',
  'Capacity','RateProd','Scan_QTY','REMARK', 'USER_DATE','USER_LOGIN_NAME','USER_FULL_NAME']);
  Find_QueryFieldsName :=VarArrayOf(['[Y1417].FASSET_CODE','[Y1417].FASSET_NAME','[Y1417].FASSET_DESC','[Y1417].LOCATION',
  '[Data0015].WAREHOUSE_CODE','[Data0015].ABBR_NAME', '[Data0034].DEPT_CODE','[Data0034].DEPT_NAME','[Y1417].active_flag','[Y1417].equipment_grade',
  '[Y1417].Capacity','[Y1417].RateProd','[Y1417].Scan_QTY','[Y1417].REMARK', '[Y1417].USER_DATE','Data0073.USER_LOGIN_NAME','Data0073.USER_FULL_NAME']);
  Find_Def_FieldName  :=VarArrayOf(['USER_DATE']);
  Find_Def_Oper       :=VarArrayOf(['>']);
  Find_Def_FieldValue :=VarArrayOf([DateToStr(Curr_Date-180)]);
  Find_Def_Field2Value :=VarArrayOf(['']);

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='WAREHOUSE_CODE/工厂代码/80,ABBR_NAME/工厂简称/120';
    L_ListDataSet           :=dtRead_015;
    L_DropdownColumn        :='WAREHOUSE_CODE';
    L_ListDataSetFilterField:='WAREHOUSE_CODE';
    L_ListResultField       :='WAREHOUSE_CODE';
    L_GetValueField         :='WAREHOUSE_CODE';
    L_SourceField           :=varArrayOf(['warehouse_ptr','ABBR_NAME']);
    L_ResultField           :=varArrayOf(['rkey','ABBR_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
    edt_WAREHOUSE_CODE.F_ColsInfo:= L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='DEPT_CODE/部门代码/80,DEPT_NAME/部门名称/120';
    L_ListDataSet           :=dtRead_034;
    L_DropdownColumn        :='DEPT_CODE';
    L_ListDataSetFilterField:='DEPT_CODE';
    L_ListResultField       :='DEPT_CODE';
    L_GetValueField         :='DEPT_CODE';
    L_SourceField           :=varArrayOf(['DEPT_PTR','DEPT_NAME']);
    L_ResultField           :=varArrayOf(['rkey','DEPT_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
    edt_DEPT_CODE.F_ColsInfo:= L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='UNIT_CODE/单位/100';
    L_ListDataSet           :=dtRead_002;
    L_DropdownColumn        :='Capa_UNIT';
    L_ListDataSetFilterField:='UNIT_CODE';
    L_ListResultField       :='UNIT_CODE';
    L_GetValueField         :='Capa_UNIT';
    L_SourceField           :=varArrayOf(['Capa_UNIT_PTR']);
    L_ResultField           :=varArrayOf(['rkey']);
    L_FieldNotNull          :=True;
    DropDownInfo_Init(var_DropDown_Info);
    edt_Capa_UNIT.F_ColsInfo               := L_ColsInfo;
    edt_Capa_UNIT.F_DownDataSetFilterField := 'UNIT_CODE';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='UNIT_CODE/单位/100';
    L_ListDataSet           :=dtRead_002;
    L_DropdownColumn        :='Rate_UNIT';
    L_ListDataSetFilterField:='UNIT_CODE';
    L_ListResultField       :='UNIT_CODE';
    L_GetValueField         :='Rate_UNIT';
    L_SourceField           :=varArrayOf(['Rate_UNIT_PTR']);
    L_ResultField           :=varArrayOf(['rkey']);
    L_FieldNotNull          :=True;
    DropDownInfo_Init(var_DropDown_Info);
    edt_Rate_UNIT.F_ColsInfo               := L_ColsInfo;
    edt_Rate_UNIT.F_DownDataSetFilterField := 'UNIT_CODE';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo:='USER_LOGIN_NAME/用户代码/100,USER_FULL_NAME/用户名/100';
    L_FindDataSet           :=dtRead_073;            //仅仅只是在"查找窗口"出现下拉列表
    L_DropdownColumn        :='USER_LOGIN_NAME';
    L_ListDataSetFilterField:='USER_LOGIN_NAME';
    L_ListResultField       :='USER_LOGIN_NAME';
    L_GetValueField         :='USER_LOGIN_NAME';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsChild;
    L_GridName              :=dghChild;
    L_ColsInfo:='DEPT_CODE/部门代码/80,DEPT_NAME/部门名称/120';
    L_ListDataSet           :=dtRead_034_1;
    L_DropdownColumn        :='DEPT_CODE';
    L_ListDataSetFilterField:='DEPT_CODE';
    L_ListResultField       :='DEPT_CODE';
    L_GetValueField         :='DEPT_CODE';
    L_SourceField           :=varArrayOf(['DEPT_PTR','DEPT_NAME']);
    L_ResultField           :=varArrayOf(['rkey','DEPT_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  
end;

procedure TFASSET_set_frm.cdsMainactive_flagGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.IsNull=False then
  case Sender. Value  of
    0: Text:='无效';
    1: Text:='有效';
  end;
end;

procedure TFASSET_set_frm.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('active_flag').Value:=1;
    FieldByName('USER_DATE').Value:=GetDataBaseDate(dtRead);
    FieldByName('USER_PTR').Value:=UserRKEY;
    FieldByName('USER_FULL_NAME').Value:=USER_FULL_NAME;
    FieldByName('USER_LOGIN_NAME').Value:=USER_LOGIN_NAME;
  end;
end;

function TFASSET_set_frm.SaveBeforeCheck():Boolean;
var
  strMsg,strSQL,str_Filter,str_Rows:WideString;
  cds_Temp:TClientDataSet;
  I_Row:Integer;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then    
    Post;
    if FieldByName('WAREHOUSE_CODE').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('WAREHOUSE_CODE').DisplayLabel+'”的值不能为空。'+#13;
    if FieldByName('DEPT_CODE').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('DEPT_CODE').DisplayLabel+'”的值不能为空。'+#13;
    if FieldByName('FASSET_NAME').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('FASSET_NAME').DisplayLabel+'”的值不能为空。'+#13;

    if (FieldByName('FASSET_CODE').AsString='')then
    begin
      strMsg:=strMsg+'字段：“'+FieldByName('FASSET_CODE').DisplayLabel+'”的值不能为空。'+#13;
    end
    else
    if (UpdateStatus=usInserted)
         or((UpdateStatus=usModified) and (
         (UpperCase(FieldByName('FASSET_CODE').NewValue)<>UpperCase(FieldByName('FASSET_CODE').OldValue))
         )
           ) then
    begin
      strSQL:='select * from [Y1417] where FASSET_CODE = '+QuotedStr(FieldByName('FASSET_CODE').NewValue);
      if RecordExists(strSQL,DM_frm.cdsRead)then
      begin
        strMsg:=strMsg+'字段“'+FieldByName('FASSET_CODE').DisplayLabel+'”的值“'+trim(FieldByName('FASSET_CODE').NewValue)+'”已经存在。'+#13
      end;
    end;
  end;

  if cdsChild.State in [dsEdit ,dsInsert] then     //usModified
  cdsChild.Post;
  begin
    with DM_frm.cdsClone do
    try
      Close;
      CloneCursor(cdsChild,True);
      cds_Temp:=TClientDataSet.Create(Application);
      cds_Temp.Data:=cdsChild.Data;
      DM_frm.cdsTemp.Close;
      DM_frm.cdsTemp.CloneCursor(cdsChild,True);

      DisableControls ;
      First;
      for I_Row:=0 to RecordCount-1 do
      begin
        if FieldByName('DEPT_PTR').IsNull then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段“'+cdsChild.FieldByName('DEPT_CODE').DisplayLabel+'”的值不能为空。'+#13
        else
        begin
          //**********工序代码不允许重重//
          with cds_Temp do
          begin
            Filtered:=False;
            if IsEmpty=False then
            begin
              str_Filter:= 'DEPT_PTR = '+FieldByName('DEPT_PTR').AsString;
              Filter:= str_Filter;
              Filtered:=True;
              if RecordCount > 1 then
              begin
                str_Rows:='';
                DM_frm.cdsTemp.First;
                while not DM_frm.cdsTemp.Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
                begin
                  if DM_frm.cdsTemp.FieldByName('DEPT_PTR').AsInteger= FieldByName('DEPT_PTR').AsInteger then
                  str_Rows:=str_Rows+IntToStr(DM_frm.cdsTemp.RecNo)+'、';
                  DM_frm.cdsTemp.Next;
                end;
                str_Rows:=Copy(str_Rows,0,Length(str_Rows)-1);//去掉最后一个 '、'号
                strMsg:=strMsg+'明细表'+str_Rows+'行，字段“'
                +cdsChild.FieldByName('DEPT_CODE').DisplayLabel+'”的值“'
                +trim( FieldByName('DEPT_CODE').AsString)+'”已重复。'+#13 ;
              end;
              while not Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
              Delete; 
            end;
          end;
          //**********//
        end;
        Next;
      end;
    finally
      EnableControls;
      Close;
      DM_frm.cdsTemp .Close ;
      cds_Temp.Free;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure TFASSET_set_frm.FormShow(Sender: TObject);
begin
  inherited;
  //不论权限码和状态值，这些表格列和编辑框控件必须是只读
  SetControlsReadOnly([edt_ABBR_NAME,edt_DEPT_NAME,edt_USER_DATE,edt_USER_LOGIN_NAME,
  edt_USER_FULL_NAME,edt_active_flag]);
  SetColsReadOnly(DghMain,['ABBR_NAME','DEPT_NAME','USER_DATE','USER_LOGIN_NAME','USER_FULL_NAME','active_flag']);
  SetColsReadOnly(dghChild,['DEPT_NAME']);
  //动态设置过滤用控件
  Filter_Create(Panel_Bottom);
  Filter_Set(DghMain.FieldColumns['FASSET_CODE']);   
end;

procedure TFASSET_set_frm.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  Filter_Set(Column);
end;

procedure TFASSET_set_frm.Panel1Enter(Sender: TObject);
begin
  inherited;
  ActiveGridEH:=DghMain;
end;

procedure TFASSET_set_frm.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ActiveGridEH:=DghMain;
end;

procedure TFASSET_set_frm.cdsMainWAREHOUSE_CODEChange(Sender: TField);
begin
  inherited;
  with dtRead_015 do
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
      cdsMain.FieldByName('warehouse_ptr').Value := null;
      cdsMain.FieldByName('ABBR_NAME').Value := null ;
    end
    else
    begin
      if Locate('WAREHOUSE_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMainwarehouse_ptr.Value  := FieldByName('rkey').Value ;
          cdsMainABBR_NAME.Value := FieldByName('ABBR_NAME').Value ;
        end
      else
        begin
          cdsMain.FieldByName('warehouse_ptr').Value := null;
          cdsMain.FieldByName('ABBR_NAME').Value := null ;
         // cdsMain.FieldByName('WAREHOUSE_CODE').Value := null;
          ShowMessage('部门代码不存在！！！');
        end;
    end;
  end;
end;

procedure TFASSET_set_frm.cdsMainDEPT_CODEChange(Sender: TField);
begin
  inherited;
  with dtRead_034 do
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
      cdsMain.FieldByName('dept_ptr').Value :=null;
      cdsMain.FieldByName('DEPT_NAME').Value := null ;
    end
    else
    begin
      if Locate('DEPT_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMaindept_ptr.Value  := FieldByName('rkey').Value ;
          cdsMainDEPT_NAME.Value := FieldByName('DEPT_NAME').Value ;
        end
      else
        begin
          cdsMain.FieldByName('dept_ptr').Value := null;
          cdsMain.FieldByName('DEPT_NAME').Value := null ;
         // cdsMain.FieldByName('DEPT_CODE').Value := null;
          ShowMessage('部门代码不存在！！！');
        end;
    end;
  end;
end;

procedure TFASSET_set_frm.cdsMainUNIT_CODEChange(Sender: TField);
begin
  inherited;
  with dtRead_002 do
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
      cdsMain.FieldByName('Capa_UNIT_PTR').Value :=null;
    end
    else
    begin
      if Locate('UNIT_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMainCapa_UNIT_PTR.Value  := FieldByName('rkey').Value ;
        end
      else
        begin
          cdsMain.FieldByName('Capa_UNIT_PTR').Value := null;
        end;
    end;
  end;
end;

procedure TFASSET_set_frm.cdsMainRate_UNITChange(Sender: TField);
begin
  inherited;
  with dtRead_002 do
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
      cdsMain.FieldByName('Rate_UNIT').Value :=null;
    end
    else
    begin
      if Locate('UNIT_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMainRate_UNIT_PTR.Value  := FieldByName('rkey').Value ;
        end
      else
        begin
          cdsMain.FieldByName('Rate_UNIT').Value := null;
        end;
    end;
  end;
end;

procedure TFASSET_set_frm.cdsChildDEPT_CODEChange(Sender: TField);
begin
  inherited;
  with dtRead_034_1 do
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
      cdsMain.FieldByName('DEPT_PTR').Value :=null;
      cdsMain.FieldByName('DEPT_NAME').Value := null ;
    end
    else
    begin
      if Locate('DEPT_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMaindept_ptr.Value  := FieldByName('rkey').Value ;
          cdsMainDEPT_NAME.Value := FieldByName('DEPT_NAME').Value ;
        end
      else
        begin
          cdsMain.FieldByName('DEPT_PTR').Value := null;
          cdsMain.FieldByName('DEPT_NAME').Value := null ;
         // cdsMain.FieldByName('DEPT_CODE').Value := null;
          ShowMessage('部门代码不存在！！！');
        end;
    end;
  end;
end;

end.
