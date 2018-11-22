unit formWorkRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MC, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  Menus, ppDB, ppDBPipe, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, dxBar, cxClasses, ImgList,
  ActnList, DB, DBClient, cds, Provider, ADODB, Grids, DBGridEh, ToolWin,
  ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Buttons,StrUtils,
  Mask, DBCtrls, RzEdit, RzDBEdit, RzDBBnEd, DBButtonEdit, DBGrids;

type
  TfrmWorkRecord = class(TMC_f)
    cdsMainDeptName: TStringField;
    cdsMainWorkName: TStringField;
    cdsMainun_Applican: TStringField;
    cdsMainun_RespPeop: TStringField;
    cdsMainMainExecStat: TStringField;
    cdsMainun_AdmiPeop: TStringField;
    cdsMainun_AccePeop: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainWorkOrder: TStringField;
    cdsMainDept_ptr: TIntegerField;
    cdsMainWork_ptr: TIntegerField;
    cdsMainWorkExpl: TStringField;
    cdsMainForeTime: TBCDField;
    cdsMainApplican: TIntegerField;
    cdsMainStatus: TIntegerField;
    cdsMainRespPeop: TIntegerField;
    cdsMainAdmiTime: TDateTimeField;
    cdsMainAdmiPeop: TIntegerField;
    cdsMainCompTime: TDateTimeField;
    cdsMainActuCons: TBCDField;
    cdsMainEfficien: TBCDField;
    cdsMainAcceTime: TDateTimeField;
    cdsMainAccePeop: TIntegerField;
    cdsMainRemark: TStringField;
    dtMainDeptName: TStringField;
    dtMainWorkName: TStringField;
    dtMainun_Applican: TStringField;
    dtMainun_RespPeop: TStringField;
    dtMainMainExecStat: TStringField;
    dtMainun_AdmiPeop: TStringField;
    dtMainun_AccePeop: TStringField;
    dtMainrkey: TAutoIncField;
    dtMainWorkOrder: TStringField;
    dtMainDept_ptr: TIntegerField;
    dtMainWork_ptr: TIntegerField;
    dtMainWorkExpl: TStringField;
    dtMainForeTime: TBCDField;
    dtMainApplican: TIntegerField;
    dtMainStatus: TIntegerField;
    dtMainRespPeop: TIntegerField;
    dtMainAdmiTime: TDateTimeField;
    dtMainAdmiPeop: TIntegerField;
    dtMainCompTime: TDateTimeField;
    dtMainActuCons: TBCDField;
    dtMainAcceTime: TDateTimeField;
    dtMainAccePeop: TIntegerField;
    dtMainRemark: TStringField;
    cdsChildEMPLOYEE_NAME: TStringField;
    cdsChildMainExecStat: TStringField;
    cdsChildrkey: TAutoIncField;
    cdsChildWork_ptr: TIntegerField;
    cdsChildWorkDate: TDateTimeField;
    cdsChildBeginTime: TDateTimeField;
    cdsChildEndTime: TDateTimeField;
    cdsChildTimeCons: TBCDField;
    cdsChildTimeRest: TBCDField;
    cdsChildEmpl_ptr: TIntegerField;
    cdsChildStatus: TIntegerField;
    cdsChildWorkTime: TBCDField;
    cdsChildRemark: TStringField;
    dtChildEMPLOYEE_NAME: TStringField;
    dtChildMainExecStat: TStringField;
    dtChildrkey: TAutoIncField;
    dtChildWork_ptr: TIntegerField;
    dtChildWorkDate: TDateTimeField;
    dtChildBeginTime: TDateTimeField;
    dtChildEndTime: TDateTimeField;
    dtChildTimeCons: TBCDField;
    dtChildTimeRest: TBCDField;
    dtChildEmpl_ptr: TIntegerField;
    dtChildStatus: TIntegerField;
    dtChildWorkTime: TBCDField;
    dtChildRemark: TStringField;
    Button3: TButton;
    Button12: TButton;
    Button7: TButton;
    Button13: TButton;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    dteEnd: TDateTimePicker;
    dteBegin: TDateTimePicker;
    cds0005: TClientDataSet;
    cds0836: TClientDataSet;
    cds0830: TClientDataSet;
    cds0832: TClientDataSet;
    cds0830rkey: TIntegerField;
    cds0830DeptName: TStringField;
    cds0836rkey: TIntegerField;
    cds0836WorkName: TStringField;
    cds0005RKEY: TIntegerField;
    cds0005EMPL_CODE: TStringField;
    cds0005EMPLOYEE_NAME: TStringField;
    cds0832RKEY: TIntegerField;
    cds0832MainExecStat: TStringField;
    dtChildEMPL_CODE: TStringField;
    cdsChildEMPL_CODE: TStringField;
    CheckBox6: TCheckBox;
    Button1: TButton;
    Button6: TButton;
    Button5: TButton;
    Button11: TButton;
    Button2: TButton;
    QryResultTime: TADOQuery;
    Label2: TLabel;
    BtFind: TSpeedButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button4: TButton;
    Label3: TLabel;
    edt_WorkOrder: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edt_un_Applican: TDBEdit;
    Label8: TLabel;
    edt_AdmiTime: TDBEdit;
    Label9: TLabel;
    edt_CompTime: TDBEdit;
    Label11: TLabel;
    edt_MainExecStat: TDBEdit;
    Label12: TLabel;
    edt_AcceTime: TDBEdit;
    Label14: TLabel;
    edt_un_AccePeop: TDBEdit;
    Label15: TLabel;
    edt_ForeTime: TDBEdit;
    Label16: TLabel;
    edt_ActuCons: TDBEdit;
    Label17: TLabel;
    edt_Efficien: TDBEdit;
    Label18: TLabel;
    mo_Remark: TDBMemo;
    edt_DeptName: TDBButtonEdit;
    edt_WorkName: TDBButtonEdit;
    mo_WorkExpl: TDBMemo;
    Button8: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure cdsMainEfficienGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BtFindClick(Sender: TObject);
    procedure cdsMainStatusChange(Sender: TField);
    procedure cdsMainDeptNameChange(Sender: TField);
    procedure cdsMainWorkNameChange(Sender: TField);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cdsChildStatusChange(Sender: TField);
    procedure cdsChildBeforeInsert(DataSet: TDataSet);
    procedure cdsChildBeginTimeChange(Sender: TField);
    procedure cdsChildTimeRestChange(Sender: TField);
    procedure cdsChildEMPL_CODEChange(Sender: TField);
    procedure Button12Click(Sender: TObject);
    procedure dghChildMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Change(Sender: TObject);
    procedure cdsMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure Button4Click(Sender: TObject);
    procedure cdsChildBeforePost(DataSet: TDataSet);
    procedure Button8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsChildNewRecord(DataSet: TDataSet);
    procedure cdsMainNewRecord(DataSet: TDataSet);
  private
    FilterFieldName:string;
    WorkDate:TDate;
    Function  Newline(str:String;AddSpaces:string='') :string;
    function EmployeeStatusCheck(vEmpl_ptr:string):Boolean;
    Function ISDate(DateStr:string):Bool;
    procedure SetButtonStatus; override;
    function SaveBeforeCheck():Boolean  ;  override;
    procedure SetToolbarButtonStatus(Flag: Boolean); override;
    function SaveData():Boolean;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWorkRecord: TfrmWorkRecord;

implementation

uses DM_f,PublicFile, formInputDlg, formWorkRecord01, // formWorkRecord04,
  formWorkRecord03, formWorkRecord05;
        
{$R *.dfm}

function TfrmWorkRecord.SaveData():Boolean;
var
  f_Staff_Sum_house :real;
begin
  Result:=True;
  try
    Screen.Cursor := crHourGlass;
    try
      DM.ADOConnection1.BeginTrans;
      with cdsMain do
      begin
        if F_AutoNumb and(UpdateStatus=usInserted) then
        begin
          if RecordExists('select * from '+f_TableName+' where ' +f_AutoNumbField
            +' = '+quotedStr(fieldByName(F_AutoNumbField).AsString),DM.cdsRead)  then//如果当前自动编号被使用,当这个窗口被多个用户打开并录入数据这就会发生。
          begin
            DM.cds0004.Refresh;   //获取自动编号的最新值
            while RecordExists('select * from '+f_TableName+' where ' +f_AutoNumbField
              +' = '+quotedStr(DM.cds0004.FieldByName('SEED_VALUE').AsString),DM.cdsRead)  do  //如果最新值的自动编号还是存在
            begin
              NewNumb(DM.cds0004);  //调用过程在当前编号上加1
            end;
            if not(State in[dsEdit,dsInsert]) then
            Edit;
            FieldByName(F_AutoNumbField).Value:=DM.cds0004.FieldByName('SEED_VALUE').Value;
            Post;
          end;
          NewNumb(DM.cds0004);  //调用过程在当前编号上加1。
        end;

        if State in [dsEdit,dsInsert] then
          Post;
        if cdsMainStatus.AsInteger in [ 4,2] then//待验收  ,已验收
        begin
          cdsRead.Close;               //关闭后复制数据。
          cdsRead.Data:=(cdsChild.Data);
          with cdsRead do
          begin
            First;
            f_Staff_Sum_house:=0;
            while not Eof do
            begin
              if FieldByName('WorkTime').Value>0  then    //工作时间
              f_Staff_Sum_house:= f_Staff_Sum_house+ FieldByName('WorkTime').Value;
              Next;
            end;
            cdsMain.Edit;
            cdsMainActuCons.Value:=  f_Staff_Sum_house ;
          end;        
          cdsMain.Post;
        end;
        if ApplyUpdates(0)=0 then    //=0，即保存成功
        begin
          with cdsChild do
          begin
            if State in [dsEdit,dsInsert] then
              Post;

            if ApplyUpdates(0)>0 then     //大于0，保存失败
            begin
              DM.ADOConnection1.RollbackTrans;
              Result:=False;
            end;
          end;
        end
        else
        begin
          DM.ADOConnection1.RollbackTrans;
          Result:=False;
        end
      end;
      DM.ADOConnection1.CommitTrans;
    except
      DM.ADOConnection1.RollbackTrans;
    end;
    dsMainStateChange(nil);
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmWorkRecord.SetToolbarButtonStatus(Flag: Boolean);
begin
  dxBarManager.LockUpdate:=True;
  with   ActiveGridEH.DataSource.DataSet as TClientDataSet do
  begin
    tblAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4])and(IsEmpty=False);
    actEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4])and(IsEmpty=False);

    tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsMainStatus.AsInteger in [1]);
    actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsMainStatus.AsInteger in [1]);

    if ActiveGridEH=DghMain then
    begin
      if cdsMain.Active then       //(cdsMain.UpdateStatus=usModified)
      if (cdsMain.ChangeCount>0)or(cdsMain.State in [dsEdit,dsInsert])    then
      begin
        tblCancel.Enabled:=True;
        actCancel.Enabled:=True;
      end
      else
      begin
        tblCancel.Enabled:=False;
        actCancel.Enabled:=False;
      end;
    end
    else
    if ActiveGridEH=dghChild then
    begin
      if (cdsChild.ChangeCount>0)or(cdsChild.State in [dsEdit,dsInsert])    then
      begin
        tblCancel.Enabled:=True;
        actCancel.Enabled:=True;
      end
      else
      begin
        tblCancel.Enabled:=False;
        actCancel.Enabled:=False;
      end;
      tblAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4])and(cdsMainStatus.AsInteger in [3]);
      actAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4])and(cdsMainStatus.AsInteger in [3]);
      tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsChildStatus.AsInteger in [3]);
      actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsChildStatus.AsInteger in [3]);
      tblEdit.Enabled:=Flag and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsChildStatus.AsInteger in [3]);
      actEdit.Enabled:=Flag and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsChildStatus.AsInteger in [3]);
    end;

    if ((cdsMain.State  in [dsEdit,dsInsert])or(cdsMain.ChangeCount>0))
                or((cdsChild.State  in [dsEdit,dsInsert])or(cdsChild.ChangeCount>0))and(StrToInt(vprev)in [2,4])  then
      begin
        tblSave.Enabled:=True;
        actSave.Enabled:=True;
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
        tblfind.Enabled:= True;
        actFind.Enabled:= True;
        tblRefresh .Enabled:=True;
        actRefresh .Enabled:=True;
        tblExport.Enabled:=True;
        actExport.Enabled:=True;
        tblExit.Enabled:=True;
        tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,4]);      //打印
        tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;      //报表设计
        tblFilter.Enabled:= True;
        tblReject.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;   //反提交
        tblExpand.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;   //提交
        tblConfirm.Enabled:=True  and (StrToInt(vprev)in [2,4]);   //审核
        tblUConfirm.Enabled:=True and (StrToInt(vprev)in [2,4]);  //反审核
      end ;
  end;

 { with cdsMainstatus do    //这是一个例子,根据状态值和权限码，设置窗口的哪些对象可编辑。
  if (AsInteger in [8,2])and (StrToInt(vprev) in [2,4]) then
  begin
    ControlsSetReadOnly([edt_code,edt_ware_name,edt_PO_REV_NO,edt_DEPT_NAME,
        edt_FOB,edt_CURR_CODE],False);
    DghMain .ReadOnly:=False;
    dghChild.ReadOnly:=False;
  end
  else
  begin
    ControlsSetReadOnly([edt_code,edt_ware_name,edt_PO_REV_NO,edt_DEPT_NAME,
        edt_FOB,edt_CURR_CODE]);
    DghMain .ReadOnly:=True;
    dghChild.ReadOnly:=True;
  end; }

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

function TfrmWorkRecord.SaveBeforeCheck():Boolean  ;
var
  strMsg:string;
  I_Row :Integer;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
    if FieldByName('WorkOrder').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('WorkOrder').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('DeptName').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('DeptName').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('WorkName').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('WorkName').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('WorkExpl').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('WorkExpl').DisplayLabel+'”的值不能为空！！！'+#13;
  end;

  begin
    DM.cdsClone.Close;
    DM.cdsClone.CloneCursor(cdsChild,True);
    with DM.cdsClone do
    try
      DisableControls ;
      First;
      for I_Row:=0 to RecordCount-1 do
      begin
        if FieldByName('WorkDate').IsNull then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('WorkDate').DisplayLabel+'”的值不能为空！！！'+#13;
        if (FieldByName('Empl_ptr').IsNull)then
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('EMPL_CODE').DisplayLabel+'”的值不能为空！！！'+#13;
        if (FieldByName('BeginTime').IsNull)then 
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('BeginTime').DisplayLabel+'”的值不能为空！！！'+#13;
        Next;
      end;
    finally
      EnableControls;
      DM.cdsClone.Close;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

Function TfrmWorkRecord.ISDate(DateStr:string):Bool;
begin
  try
    Result:=false;
    if ((StrToDate(DateStr))>=date) or ((StrToDate(DateStr))<date) then
    Result:=true;
  except
    Result:=false;
  end;
end;

procedure TfrmWorkRecord.SetButtonStatus;
begin
  with cdsMain do
  if FieldByName('Status').AsInteger=1 then    //待执行
  begin
    Button3 .Enabled     :=True ;//受理任务
    Button6 .Enabled     :=False ;//提交验收
    Button5 .Enabled     :=False ;//验收通过
    Button12.Enabled     :=False ;//从历史记录添加
    DghMain .ReadOnly    :=False;
    dghChild.ReadOnly    :=True;
    dghMain.FieldColumns['DeptName'].ReadOnly:=false;
    dghMain.FieldColumns['WorkName'].ReadOnly:=false;
    dghMain.FieldColumns['WorkExpl'].ReadOnly:=false;
    dghMain.FieldColumns['Remark'].ReadOnly:=false;
    dghMain.FieldColumns['ForeTime'].ReadOnly:=false;
    ControlsSetReadOnly([edt_DeptName,edt_WorkName,mo_WorkExpl,edt_ForeTime],False);
    ControlsSetReadOnly([edt_AdmiTime,edt_CompTime],True);
  end
  else
  if FieldByName('Status').AsInteger=3 then     //执行中
  begin
    Button3 .Enabled     :=False ;//受理任务
    Button6 .Enabled     :=True ;//提交验收
    Button5 .Enabled     :=False ;//验收通过
    Button12.Enabled     :=True ;//从历史记录添加
    DghMain .ReadOnly    :=False;
    dghChild.ReadOnly    :=False;  // edt_DeptName,edt_WorkName,
    dghMain.FieldColumns['DeptName'].ReadOnly:=false;
    dghMain.FieldColumns['WorkName'].ReadOnly:=false;
    dghMain.FieldColumns['WorkExpl'].ReadOnly:=false;
    dghMain.FieldColumns['Remark'].ReadOnly:=false;
    dghMain.FieldColumns['ForeTime'].ReadOnly:=false;

    ControlsSetReadOnly([mo_WorkExpl,edt_ForeTime,mo_Remark],False);
    ControlsSetReadOnly([edt_DeptName,edt_WorkName,edt_AdmiTime,edt_CompTime],True);
    if (StrToInt(vprev)in [2])then
    begin
      if cdsChildStatus.AsInteger=3 then
      begin
        dghChild.FieldColumns['WorkDate'].ReadOnly:=false;   //工作日期
        dghChild.FieldColumns['EMPL_CODE'].ReadOnly:=false;  //雇员代码
        dghChild.FieldColumns['TimeRest'].ReadOnly:=false;   //中途休息时间
        dghChild.FieldColumns['Remark'].ReadOnly:=false;     //备注
        dghChild.FieldColumns['BeginTime'].ReadOnly:=false;
        dghChild.FieldColumns['EndTime'].ReadOnly:=false;
      end
      else
      begin
        dghChild.FieldColumns['WorkDate'].ReadOnly:=true;   //工作日期
        dghChild.FieldColumns['EMPL_CODE'].ReadOnly:=true;  //雇员代码
        dghChild.FieldColumns['TimeRest'].ReadOnly:=true;   //中途休息时间
        dghChild.FieldColumns['Remark'].ReadOnly:=true;     //备注
        dghChild.FieldColumns['BeginTime'].ReadOnly:=true;
        dghChild.FieldColumns['EndTime'].ReadOnly:=true;
      end;
    end
    else
    if (StrToInt(vprev)in [4])then
    begin
      if cdsChildStatus.AsInteger=3 then
      begin
        dghChild.FieldColumns['WorkDate'].ReadOnly:=false;   //工作日期
        dghChild.FieldColumns['EMPL_CODE'].ReadOnly:=false;  //雇员代码
        dghChild.FieldColumns['TimeRest'].ReadOnly:=false;   //中途休息时间
        dghChild.FieldColumns['Remark'].ReadOnly:=false;     //备注
        dghChild.FieldColumns['BeginTime'].ReadOnly:=false;
        dghChild.FieldColumns['EndTime'].ReadOnly:=false;
      end
      else
      begin
        dghChild.FieldColumns['WorkDate'].ReadOnly:=true;   //工作日期
        dghChild.FieldColumns['EMPL_CODE'].ReadOnly:=true;  //雇员代码
        dghChild.FieldColumns['TimeRest'].ReadOnly:=true;   //中途休息时间
        dghChild.FieldColumns['Remark'].ReadOnly:=true;     //备注
        dghChild.FieldColumns['BeginTime'].ReadOnly:=false;
        dghChild.FieldColumns['EndTime'].ReadOnly:=false;
      end;
    end;
  end
  else
  if FieldByName('Status').AsInteger =4 then    // 待验收
  begin
    Button3 .Enabled     :=False ;//受理任务
    Button6 .Enabled     :=False ;//提交验收
    Button5 .Enabled     :=True ;//验收通过
    Button12.Enabled     :=False ;//从历史记录添加

    if StrToInt(vprev)=4 then
    begin
      ControlsSetReadOnly([edt_AdmiTime,edt_CompTime],False);
      dghChild.FieldColumns['BeginTime'].ReadOnly:=false;
      dghChild.FieldColumns['EndTime'].ReadOnly:=false;
    end
    else
    begin
      DghMain .ReadOnly    :=True;
      dghChild.ReadOnly    :=True;
    end;
    dghMain.FieldColumns['DeptName'].ReadOnly:=true;
    dghMain.FieldColumns['WorkName'].ReadOnly:=true;
    dghMain.FieldColumns['WorkExpl'].ReadOnly:=true;
    dghMain.FieldColumns['Remark'].ReadOnly:=true;
    ControlsSetReadOnly([edt_ForeTime],False,clWindow);
    ControlsSetReadOnly([edt_DeptName,edt_WorkName,mo_WorkExpl,mo_Remark],True);
  end
  else
  if FieldByName('Status').AsInteger =2 then    // 已验收
  begin
    Button3 .Enabled     :=False ;//受理任务
    Button6 .Enabled     :=False ;//提交验收
    Button5 .Enabled     :=False ;//验收通过
    Button12.Enabled     :=False ;//从历史记录添加
    if StrToInt(vprev)=4 then
    begin
      ControlsSetReadOnly([edt_AdmiTime,edt_CompTime],False);
    end
    else
    begin
      DghMain .ReadOnly    :=True;
      dghChild.ReadOnly    :=True;
    end;
    dghMain.FieldColumns['DeptName'].ReadOnly:=true;
    dghMain.FieldColumns['WorkName'].ReadOnly:=true;
    dghMain.FieldColumns['WorkExpl'].ReadOnly:=true;
    dghMain.FieldColumns['Remark'].ReadOnly:=true;
    dghMain.FieldColumns['ForeTime'].ReadOnly:=true;
    ControlsSetReadOnly([edt_DeptName,edt_WorkName,mo_WorkExpl,edt_ForeTime,mo_Remark],True);
  end
  else
  if FieldByName('Status').AsInteger =8 then    // 8	验收退回
  begin

  end ;
  with cdsChildStatus do
  if AsInteger=3 then
    begin
    Button13.Enabled:=True ;//个人结束
    end
  else
    begin
    Button13.Enabled:=False;
    end;
end;
  
Function  TfrmWorkRecord.Newline(str:String;AddSpaces:string='') :string;
begin
  Result:='';
  if str<>  '' then
  begin
    str:=str+#10#13+AddSpaces;        //加4个空格，信息的层次结构明显
    Result:=  str;
  end;
end;

procedure TfrmWorkRecord.FormCreate(Sender: TObject);
begin
 if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ; {}

 {  dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  UserRKEY := 2522;
  vprev:='2';   }

  inherited;
  SetEmployeeInfo(dtRead,dxStatusBar1);

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ListDataSet           :=cds0830;
    L_ColsInfo              :='DeptName/部门名称/150';
    L_DropdownColumn        :='DEPTName';
    L_ListDataSetFilterField:='DEPTName';
    L_ListResultField       :='DEPTName';
    L_GetValueField         :='DEPTName';
    DropDownInfo_Init(var_DropDown_Info);
    edt_DeptName.F_ColsInfo:= L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ListDataSet           :=cds0836;
    L_ColsInfo              :='WorkName/任务名称/150';
    L_DropdownColumn        :='WorkName';
    L_ListDataSetFilterField:='WorkName';
    L_ListResultField       :='WorkName';
    L_GetValueField         :='WorkName';
    DropDownInfo_Init(var_DropDown_Info);
    edt_WorkName.F_ColsInfo:= L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsChild ;
    L_GridName              :=dghChild;
    L_ListDataSet           :=cds0005;
    L_ColsInfo              :='EMPL_CODE/雇员代码/100,EMPLOYEE_NAME/雇员名称/150';
    L_DropdownColumn        :='EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='EMPL_CODE';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_DropdownColumn        :='MainExecStat';
    L_AddPickList          := VarArrayOf(['待执行','执行中','待验收','已验收']);
//    L_PickListResultValues := VarArrayOf(['1','3','4','2']);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  Curr_Date := GetDataBaseDate(cdsread,2);
  dteBegin.Date:=Curr_Date-100;
  dteEnd  .Date:=Curr_Date+1;
  BtFindClick(nil);
  FilterFieldName:='WorkOrder';
  FindDisplayFields:=VarArrayOf(['WorkOrder','DeptName','WorkName','WorkExpl','ForeTime','un_Applican','MainExecStat',
        'un_RespPeop','AdmiTime','un_AdmiPeop','CompTime','ActuCons','Efficien','AcceTime','un_AccePeop','Remark']);
  Find_Def_FieldName  :=VarArrayOf(['AdmiTime']);
  Find_Def_Oper       :=VarArrayOf(['BETWEEN']);
  Find_Def_FieldValue :=VarArrayOf([DateToStr(dteBegin.Date)]);
  Find_Def_Field2Value:=VarArrayOf([DateToStr(dteEnd.Date)]);        
  FirstControl := edt_WorkOrder;
  LastControl  := mo_Remark;
  AutoNumb_Edit:= edt_WorkOrder;
end;

procedure TfrmWorkRecord.Button3Click(Sender: TObject);
var
  NowDate:TDateTime;
begin
  inherited;
  if (cdsMain.Active)and( not cdsMain.IsEmpty) then
  begin
    try
      Screen.Cursor := crHourGlass;
      if messagebox(Self.Handle,'你确定要开始受理吗？','询问',MB_yesno+MB_iconquestion)=idNo then
        Exit ;
      if cdsMain.State in [dsEdit,dsInsert] then
        cdsMain.Post;
      NowDate:=GetDataBaseDate(DM.cdsRead,1);

      with   cdsMain   do
      begin
        try
          DM.ADOConnection1.BeginTrans;
          Edit;
          FieldByName('Status').Value:=3;     //将状态改为“执行中 ”     3	执行中
          if FieldByName('AdmiTime').IsNull then  //如果 '保养开始时间'是空，获取当前数据库服务器的时间
            FieldByName('AdmiTime').value:= NowDate;
          FieldByName('AdmiPeop')   .Value:=  UserRKEY;
          FieldByName('un_AdmiPeop').Value:=  USER_FULL_NAME;
          Post;
          if ApplyUpdates(0)=0 then
          begin
           { with cdsChild do        //取消自动添加雇员
            if Active then
            begin
              Append;
              FieldByName('Work_ptr').Value:=cdsMainrkey.Value;
              FieldByName('WorkDate').Value:=Date;
              FieldByName('BeginTime').Value:=GetDataBaseSmallDate(cdsRead);
              FieldByName('Status').Value:=3;
              FieldByName('TimeRest').Value:=2.5;
              FieldByName('Empl_ptr').Value:=EmplRKEY;
              FieldByName('EMPL_CODE').Value:=EMPL_CODE;
              FieldByName('EMPLOYEE_NAME').Value:=EmplName;
              Post;
              if ApplyUpdates(0)<>0 then
              begin
                DM.ADOConnection1.RollbackTrans;
                Exit;
              end;
            end; }
            with cdsRead do           //在 DATA0839表插入一条状态的记录
            begin
              Close;
              CommandText:= 'insert into DATA0839([TableName],[Record_rkey],[User_ptr],[Status_ptr],[Record_date]) '
                   +' values(:vTableName,:vRecord_rkey,:vUser_ptr,:vStatus_ptr,:vRecord_date)';
              Params.ParseSQL(cdsRead.CommandText,True)  ;
              with  Params do
              begin
                ParamByName('vTableName')  .Value:='data0835';
                ParamByName('vRecord_rkey').Value:=cdsMainrkey.Value;
                ParamByName('vUser_ptr')   .Value:=UserRKEY;
                ParamByName('vStatus_ptr') .Value:=3;
                ParamByName('vRecord_date').Value:=NowDate;
              end;
              Execute;
            end;
            DM.ADOConnection1.CommitTrans;
          end
          else
          begin
            DM.ADOConnection1.RollbackTrans;
            Exit;
          end;
        except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            cdsMain.Cancel;
            ShowMessage('提交失败！'+#13#10+e.Message);
          end;
        end;
      end;
    finally
      dsMainStateChange(nil);
      SetButtonStatus;       //重新设置右边按钮的状态。
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmWorkRecord.cdsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  with cdsMain  do
  if (FieldByName('ForeTime').Value>0) and (FieldByName('ActuCons').Value>0) then
  begin
    FieldByName('Efficien').Value:=FieldByName('ForeTime').Value/FieldByName('ActuCons').Value;
  end;

end;

procedure TfrmWorkRecord.cdsMainEfficienGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  Text := FloatToStr(Sender.AsFloat * 10000/100) + '%';
end;

procedure TfrmWorkRecord.BtFindClick(Sender: TObject);
var
  strStatusValue:string;
begin
  inherited;
  if VarIsNull(dteBegin.Date) or VarIsNull(dteEnd.Date)then
  begin
    msgError('受理日期不能为空！！！');
    Exit;
  end;
  strStatusValue:='';     //如果记录的5种状态都要查询的话，下用执行下面的查询条件。因为该查询条件根本不需要存在，查询速度会更快。
  if (CheckBox1.Checked and CheckBox3.Checked and CheckBox4.Checked and CheckBox2.Checked and CheckBox6.Checked)=False  then
  begin
    if CheckBox1.Checked then
      strStatusValue:='1,';   //待执行

    if CheckBox3.Checked then
      strStatusValue:=strStatusValue+'3,'; //执行中

    if CheckBox4.Checked then
      strStatusValue:=strStatusValue+'4,';     //待验收

    if CheckBox2.Checked then
      strStatusValue:=strStatusValue+'2,';   //已验收

    if CheckBox6.Checked then
      strStatusValue:=strStatusValue+'6,';   //已暂停

    if  strStatusValue<>'' then
    begin                            //    去掉后面的一个","
      strStatusValue:=' and Data0835.status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')';
    end;
  end;
                                 //  完成时间
  if strStatusValue='' then
     strStatusValue:= 'where ((Data0835.AdmiTime >=' +QuotedStr(DateToStr(dteBegin.Date))
         +' and Data0835.AdmiTime <= '+QuotedStr(DateToStr(dteEnd.Date+1))+ ')or( Data0835.AdmiTime is null))'
  else
    strStatusValue:= 'where ((Data0835.AdmiTime>=' +QuotedStr(DateToStr(dteBegin.Date))
         +' and Data0835.AdmiTime<='+QuotedStr(DateToStr(dteEnd.Date+1))+ ')or( Data0835.AdmiTime is null))'+strStatusValue;
  cdsMain.Close;
  cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+strStatusValue+ #13+cdsMain.F_SQLOrderBy;
  cdsMain.Open;
end;

procedure TfrmWorkRecord.cdsMainStatusChange(Sender: TField);
begin
  inherited;
  if cds0832.Active=False then
     cds0832.Open;
  cdsMainMainExecStat.Value:=cds0832.Lookup('rkey',Sender.Value,'MainExecStat') ;
end;

procedure TfrmWorkRecord.cdsMainDeptNameChange(Sender: TField);
begin
  inherited;
  with cds0830 do
  begin
    if Active=False then   Open;
    if Filtered then   Filtered:=False;
    with Sender.DataSet do  if not(State in [dsEdit,dsInsert]) then  Edit;

    if Sender.IsNull then
    begin
      cdsMain.FieldByName('Dept_ptr').Value:=null;   //
    end
    else
    begin
      if Locate('DeptName',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainDept_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        cdsMain.FieldByName('Dept_ptr').Value:=null;
        ShowMessage('部门不存在！！！');
        end;
    end;
  end;
end;

procedure TfrmWorkRecord.cdsMainWorkNameChange(Sender: TField);
begin
  inherited;
  with cds0836 do
  begin
    if Active=False then   Open;
    if Filtered then   Filtered:=False;
    with Sender.DataSet do  if not(State in [dsEdit,dsInsert]) then  Edit;

    if Sender.IsNull then
    begin
      cdsMain.FieldByName('Work_ptr').Value:=null;   //
    end
    else
    begin
      if Locate('WorkName',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainWork_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        cdsMain.FieldByName('Work_ptr').Value:=null;
        ShowMessage('部门不存在！！！');
        end;
    end;
  end;
end;

procedure TfrmWorkRecord.Button6Click(Sender: TObject);
var
  i:Integer;
  NowDate:TDateTime;
begin
  try
    Screen.Cursor := crHourGlass;
    if (cdsMain.Active)and( not cdsMain.IsEmpty) then
    begin
      //在验收前要判断是否还有状态是执行中的雇员记录
      with cdsRead do
      begin
        Data:=cdsChild.Data;
        First;
        while not Eof do
        begin
          if FieldByName('Status').AsInteger=3 then
          begin
            MsgError('当前工作记录还存在状态是“执行中”的雇员记录！！！');
            Exit;
          end;
          Next;
        end;
        Close;
      end;
      if messagebox(Self.Handle,'你确定要提交验收吗？','询问',MB_yesno+MB_iconquestion)=idNo then
        Exit ;
      if cdsMain.State in [dsEdit,dsInsert] then
        cdsMain.Post;
      NowDate:=GetDataBaseDate(DM.cdsRead,1);

      with  cdsMain   do
      begin
        try
          DM.ADOConnection1.BeginTrans;
          Edit;
          FieldByName('Status').Value:=4;     //将状态改为“待验收 ”     4待验收
          if FieldByName('CompTime').IsNull then  //如果 '保养开始时间'是空，获取当前数据库服务器的时间
            FieldByName('CompTime').value:= NowDate;

          with DM.cdsRead do
          begin
            Close;
            CommandText:='select Isnull(Sum(workTime),0) from Data0837 where [Work_ptr]='+cdsMainRkey.AsString;
            Open;
          end;
          FieldByName('ActuCons').Value:= DM.cdsRead.FieldList[0].Value;  //实际耗时
          Post;
          if ApplyUpdates(0)<>0 then
          begin
            DM.ADOConnection1.RollbackTrans;
            Exit;
          end;
          with DM.cdsRead do
          begin
            Close;
            CommandText:= 'insert into DATA0839([TableName],[Record_rkey],[User_ptr],[Status_ptr],[Record_date]) '
                 +' values(:vTableName,:vRecord_rkey,:vUser_ptr,:vStatus_ptr,:vRecord_date)';
            DM.cdsRead.Params.ParseSQL(DM.cdsRead.CommandText,True)  ;

            with  Params do
            begin
              ParamByName('vTableName')  .Value:='data0835';
              ParamByName('vRecord_rkey').Value:=cdsMainrkey.Value;
              ParamByName('vUser_ptr')   .Value:=UserRKEY;
              ParamByName('vStatus_ptr') .Value:=4;
              ParamByName('vRecord_date').Value:=NowDate;
            end;
            Execute;
          end;
          DM.ADOConnection1.CommitTrans;
        except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            cdsMain.Refresh;
            ShowMessage('提交失败！'+#13#10+e.Message);
          end;
        end;
      end;
    end;
  finally
    dsMainStateChange(nil);
    SetButtonStatus;       //重新设置右边按钮的状态。
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmWorkRecord.Button5Click(Sender: TObject);
var
  i:Integer;
  NowDate:TDateTime;
begin
  try
    Screen.Cursor := crHourGlass;
    if (cdsMain.Active)and( not cdsMain.IsEmpty) then
    begin
      if messagebox(Self.Handle,'你确定要开始验收吗？','询问',MB_yesno+MB_iconquestion)=idNo then
        Exit ;
      if cdsMain.State in [dsEdit,dsInsert] then
        cdsMain.Post;
      NowDate:=GetDataBaseDate(cdsRead);
      with   cdsMain  do
      begin
        try
          DM.ADOConnection1.BeginTrans;
          Edit;
          FieldByName('Status').Value:=2;     //将状态改为“执行中 ”     3	执行中
          if FieldByName('AcceTime').IsNull then  //如果 '保养开始时间'是空，获取当前数据库服务器的时间
            FieldByName('AcceTime').value:= NowDate;
          FieldByName('AccePeop').Value:=  UserRKEY;
          FieldByName('un_AccePeop').Value:=  user_full_name;

          Post;
          if ApplyUpdates(0)<>0 then
          begin
            DM.ADOConnection1.RollbackTrans;
            Exit;
          end;

          with DM.cdsRead do
          begin
            Close;
            CommandText:= 'insert into DATA0839([TableName],[Record_rkey],[User_ptr],[Status_ptr],[Record_date]) '
                 +' values(:vTableName,:vRecord_rkey,:vUser_ptr,:vStatus_ptr,:vRecord_date)';
            DM.cdsRead.Params.ParseSQL(DM.cdsRead.CommandText,True)  ;
            with  Params do
            begin
              ParamByName('vTableName')  .Value:='data0835';
              ParamByName('vRecord_rkey').Value:=cdsMainrkey.Value;
              ParamByName('vUser_ptr')   .Value:=UserRKEY;
              ParamByName('vStatus_ptr') .Value:=2;
              ParamByName('vRecord_date').Value:=NowDate;
            end;
            Execute;
            Close;
          end;
          DM.ADOConnection1.CommitTrans;
        except
          on e:Exception do
          begin
             DM.ADOConnection1.RollbackTrans;
            cdsMain.Refresh;
            ShowMessage('提交失败！'+#13#10+e.Message);
          end;
        end;
      end;
    end;
  finally
    dsMainStateChange(nil);
    SetButtonStatus;       //重新设置右边按钮的状态。
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmWorkRecord.Button7Click(Sender: TObject);
begin
  inherited;
  with DM.cdsRead do
  begin
    Close;
    CommandText:='select Isnull(Sum(workTime),0) from Data0837 where [Work_ptr]='+cdsMainRkey.AsString;
    Open;
  end;

  with   cdsMain   do
  if State <>dsEdit then
  begin
    Edit;
    FieldByName('ActuCons').Value:= DM.cdsRead.FieldList[0].Value;  //实际耗时
    Post;
    if ApplyUpdates(0)=0 then
    begin
      dsMainStateChange(nil);
      SetButtonStatus;
    end;

  end;
end;

procedure TfrmWorkRecord.Button13Click(Sender: TObject);
  procedure Exec(var NowDate:TDateTime);
  begin
    with cdsChild do
    begin
      Edit;
      FieldByName('Status').Value:=7;     //将状态改为7	已结束
      if FieldByName('EndTime').IsNull then  //如果 '保养开始时间'是空，获取当前数据库服务器的时间
        FieldByName('EndTime').value:= NowDate;
      Post;
    end;
  end;
var
  i:Integer;
  NowDate:TDateTime;
  IsLast:Boolean;
  strReason:string;
  f_Staff_Sum_house :real;
begin
  with cdsChild do
  try
    Screen.Cursor := crHourGlass;
    if messagebox(Self.Handle,'你确定要结束吗？','询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;
    if State in [dsEdit,dsInsert] then
      Post;
    NowDate:=GetDataBaseDate(DM.cdsRead,1);
    if   dghChild.SelectedRows.Count > 1 then  //如果用户选择的行数大于1，即多行。
      begin
        try
          try
            DisableControls;
            F_IsBatchOperating :=True;
            for   i:=   dghChild.SelectedRows.Count   -   1   downto   0   do
            begin
              GotoBookmark(pointer(dghChild.SelectedRows.Items[i]));
              Edit;
              FieldByName('Status').Value:=7;     //将状态改为7	已结束
              if FieldByName('EndTime').IsNull then  //如果 '保养开始时间'是空，获取当前数据库服务器的时间
                FieldByName('EndTime').value:= NowDate;
              Post;
            end;
            DM.ADOConnection1.BeginTrans;
            if ApplyUpdates(0)=0 then
            begin
              DM.ADOConnection1.CommitTrans;
            end
            else
            begin
              DM.ADOConnection1.RollbackTrans;
              Exit;
            end;
            
          finally
            F_IsBatchOperating :=False;
            EnableControls;
          end;
        except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            Refresh;
            ShowMessage('提交失败！'+#13#10+e.Message);
          end;
        end;
      end
    else     //否则，如果用户选择的1行。
    begin
      Edit;
      FieldByName('Status').Value:=7;     //将状态改为7	已结束
      if FieldByName('EndTime').IsNull then  //如果 '保养开始时间'是空，获取当前数据库服务器的时间
        FieldByName('EndTime').value:= NowDate;
      Post;
      if ApplyUpdates(0)<>0 then
      begin
//        DM.ADOConnection1.RollbackTrans;
        Exit;
      end;
    end;
  finally
    dsMainStateChange(nil);
    SetButtonStatus;
    Screen.Cursor := crDefault;

  end;

end;

procedure TfrmWorkRecord.Button11Click(Sender: TObject);
begin
  inherited;
  if Assigned(frmWorkRecord01)=False then
  Application.CreateForm(TfrmWorkRecord01, frmWorkRecord01);
  with frmWorkRecord01 do
  begin
    Caption:='状态记录';
    with  cdsMain do
    begin
      Close;
      Params.ParamByName('vTableName').Value:=Self.cdsMain.F_TableName;
      Params.ParamByName('vRecord_rkey').Value:=Self.cdsMainrkey.Value;
      Open;
    end;
    ShowModal;
  end;
end;

procedure TfrmWorkRecord.Button2Click(Sender: TObject);
begin
  inherited;
{  if Assigned (frmWorkRecord02)=False then
  frmWorkRecord02:= TfrmWorkRecord02.Create(Self);
  with  frmWorkRecord02 do
  begin
    with  cdsMain   do
    begin
      Close;
      Params.ParamByName('vWork_ptr').Value:= self.cdsMain.FieldByName('Rkey').Value;
      Open;
    end;
    Caption:=(Sender as TButton).Caption;        //给窗口标题赋值
    ShowModal;
  end;  }
end;

function TfrmWorkRecord.EmployeeStatusCheck(vEmpl_ptr:string):Boolean;

begin
  Result:=False;
  with DM.cdsRead do
  begin
    Close;
    commandtext:='select WorkOrder from Data0837 join data0835 on Data0837.work_ptr=data0835.rkey '
        +'where Data0837.empl_ptr='+vEmpl_ptr+' and Data0837.[status]=3';
    Open;
    if IsEmpty=False then         //如果该雇员存在未完成的记录，返回值为真
    begin
      ShowMessage('该雇员在工作单：“'+FieldByName('WorkOrder').AsString+'”存在未完成的记录！！！');
      Result:=True;
    end;
  end;
end;

procedure TfrmWorkRecord.Button1Click(Sender: TObject);  //暂停结束按钮
var
  vNUMBER:string;
begin
  if EmployeeStatusCheck(IntToStr(EmplRKEY)) then
  begin
    Exit;
  end;

  try
    with cdsChild do
    if Active then
    begin
      Append;
      if cds0005.Active=False then
        cds0005.Open;
      if cds0005.Locate('rkey',EmplRkey,[])   then
      begin
        FieldByName('Work_ptr').Value:=cdsMainrkey.Value;
        FieldByName('WorkDate').Value:=Date;
        FieldByName('BeginTime').Value:=GetDataBaseDate(cdsRead,1);
        FieldByName('Status').Value:=3;
        FieldByName('TimeRest').Value:=2.5;
        FieldByName('Empl_ptr').Value:=cds0005Rkey.Value;
        FieldByName('EMPL_CODE').Value:=cds0005EMPL_CODE.Value;
        FieldByName('EMPLOYEE_NAME').Value:=cds0005EMPLOYEE_NAME.Value;
        Post;

        DM.ADOConnection1.BeginTrans;
        if ApplyUpdates(0) =0 then
        begin
          cdsMain.Edit;
          cdsMain.FieldByName('Status').Value:=3;
          cdsMain.Post;
          if cdsMain.ApplyUpdates(0) =0 then
          begin
            with cdsRead do
            begin
              Close;          //将暂停记录的结束时间填写上
              CommandText:='update dbo.DATA0849 set stop_end_date=getdate() where Work_ptr='+cdsMainrkey.AsString +' and stop_end_date is null';
              Execute;
            end;
            DM.ADOConnection1.CommitTrans;
          end
          else
          begin
            DM.ADOConnection1.RollbackTrans;
          end;
        end
        else
        begin
          DM.ADOConnection1.RollbackTrans;
        end;

      end;
      SetButtonStatus;
      dsMainStateChange(nil);
    end;
  except
    DM.ADOConnection1.RollbackTrans;
  end;
end;

procedure TfrmWorkRecord.cdsChildStatusChange(Sender: TField);
begin
  inherited;
  if cds0832.Active=False then
     cds0832.Open;
  cdsChildMainExecStat.Value:=cds0832.Lookup('rkey',Sender.Value,'MainExecStat') ;
end;

procedure TfrmWorkRecord.cdsChildBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  with cdsMain do
  begin
    if State in [dsInsert,dsEdit] then
    Post;
  end;
  if cdsMainStatus.AsInteger in [3,8] then    //3	执行中；8	验收退回
  begin
    with cdsChild do
    if (IsEmpty=False)and(FieldByName('WorkDate').IsNull=False) then
      WorkDate:=FieldByName('WorkDate').Value
    else
      WorkDate:= StrToDate(DateToStr(now));
  end
  else
    Abort;
  
end;

procedure TfrmWorkRecord.cdsChildBeginTimeChange(Sender: TField);
begin
  inherited;
  QryResultTime.Close;
  QryResultTime.Parameters.ParamByName('vbeginTime').Value:=cdsChildBeginTime.Value;
  QryResultTime.Parameters.ParamByName('vEndTime').Value:=cdsChildEndTime.Value;
  QryResultTime.Open;
  cdsChildTimeRest.Value:= QryResultTime.FieldList[0].Value;
end;

procedure TfrmWorkRecord.cdsChildTimeRestChange(Sender: TField);
var
  strSQL:string;
begin
  inherited;
  with  cdsChild do
  if FieldByName('EndTime').IsNull=False then
  begin
    strSQL:='SELECT datediff( minute ,'+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',FieldByName('BeginTime').Value))
         +','+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',FieldByName('EndTime').Value))+' )';
    if FieldByName('TimeRest').Value>0 then   //中途休息时间
      strSQL:=strSQL+'-'+  FloatToStr(FieldByName('TimeRest').Value*60) ;

    FieldByName('WorkTime').Value:=StrToFloat(SQLResultValue(cdsRead,strSQL))/60;//实际工作时间
  end;
end;

procedure TfrmWorkRecord.cdsChildEMPL_CODEChange(Sender: TField);
begin
  inherited;
  with cds0005 do
  begin
    if Active=False then   Open;
    if Filtered then   Filtered:=False;
    with Sender.DataSet do  if not(State in [dsEdit,dsInsert]) then  Edit;

    if Sender.IsNull then
    begin
      cdsChild.FieldByName('Empl_ptr').Value:=null;   //
      cdsChild.FieldByName('EMPLOYEE_NAME').Value:=null;   //
    end
    else
    begin
      if Locate('EMPL_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsChild.FieldByName('Empl_ptr').Value:=FieldByName('rkey').Value;   //
        cdsChild.FieldByName('EMPLOYEE_NAME').Value:=FieldByName('EMPLOYEE_NAME').Value;   //
        end
      else
        begin
        cdsChild.FieldByName('Empl_ptr').Value:=null;   //
        cdsChild.FieldByName('EMPLOYEE_NAME').Value:=null;   //
        ShowMessage('雇员不存在！！！');
        end;
    end;
  end;
end;

procedure TfrmWorkRecord.Button12Click(Sender: TObject);
var
  NowDate:TDateTime;
begin
  inherited;
  if not Assigned(frmWorkRecord03) then
  Application.CreateForm(TfrmWorkRecord03, frmWorkRecord03);
  frmWorkRecord03.cdsMain.Open;
  if frmWorkRecord03.ShowModal=mrOk then
  with  frmWorkRecord03 do
  begin
    NowDate:=GetDataBaseDate(DM.cdsRead,1);

    try
      Self.cdsChild.F_IsBatchOperating:=True;
      Screen.Cursor := crHourGlass;
      cdsChild.DisableControls;
      Self.cdsChild.DisableControls;
      cdsChild.First;
      while not cdsChild.Eof do
      begin
        if frmWorkRecord03.dghChild.FieldColumns['selected'].Field.AsBoolean=True then
        begin
          self.cdsChild.Append;   //[WorkDate]                 [Datetime]not null,--工作日期
          self.cdsChild.FieldByName('WorkDate').Value    :=frmWorkRecord03.DBDateTimeEditEh1.Value;    //  工作日期
          self.cdsChild.FieldByName('BeginTime').Value   :=NowDate;    //  开始时间
          self.cdsChild.FieldByName('EMPL_CODE').Value    :=cdsChild.FieldByName('雇员代码').Value;  //雇员指针

          self.cdsChild.Post;

          cdsChild.Edit;
          cdsChild.FieldByName('selected').AsBoolean:=False;
          cdsChild.Post;
        end;
        cdsChild.Next;
      end;
    finally
      Self.cdsChild.F_IsBatchOperating:=False;
      cdsChild.EnableControls;
      Self.cdsChild.EnableControls;
      Screen.Cursor := crDefault;
    end;
    SetToolbarButtonStatus(ActiveGridEH.DataSource.DataSet.State in[dsEdit,dsInsert]=False);
  end;

end;

procedure TfrmWorkRecord.dghChildMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i :Integer;
begin
  inherited;
  with dghChild do
  begin
    if  SelectedRows.Count>1 then
    for   i:=   SelectedRows.Count   -   1   downto   0   do
    begin
      cdsChild.GotoBookmark(pointer(SelectedRows.Items[i]));
      if cdsChild.FieldByName('Status').AsInteger<>3 then
      begin
        Button13.Enabled    :=False ;//个人结束
        Break;
      end;
    end;
  end;
end;

procedure TfrmWorkRecord.Edit1Change(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if trim(Edit1.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TfrmWorkRecord.cdsMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if Trim(Edit1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(Edit1.Text )) ;
end;

procedure TfrmWorkRecord.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  if Column.Field.DataType in[ftString,ftWideString] then
  if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
  begin
    Edit1.Text:='';
    FilterFieldName:= Column.Field.FieldName;
    Label1.Caption:=Column.Field.DisplayLabel;
    Edit1.Left:=Label1.Left+5+ Label1.Width;
  end;
end;

procedure TfrmWorkRecord.Button4Click(Sender: TObject);
begin
  inherited;
//  if  Assigned(frmWorkRecord04)=False then
//  Application.CreateForm(TfrmWorkRecord04, frmWorkRecord04);
//
//  frmWorkRecord04.ShowModal;
end;

procedure TfrmWorkRecord.cdsChildBeforePost(DataSet: TDataSet);
begin
  inherited;
  if  (cdsChild.State=dsInsert)then
  if (DataSet.FieldByName('Empl_ptr').AsInteger>0) then
  begin
    if EmployeeStatusCheck (DataSet.FieldByName('Empl_ptr').AsString) then
    Abort;
  end
  else
    Abort;
end;

procedure TfrmWorkRecord.Button8Click(Sender: TObject);
begin
  inherited;
  if  Assigned(frmWorkRecord05)=False then
  Application.CreateForm(TfrmWorkRecord05, frmWorkRecord05);

  frmWorkRecord05.ShowModal;
end;

procedure TfrmWorkRecord.FormShow(Sender: TObject);
begin
  inherited;
  Curr_Date:=GetDataBaseDate(cdsRead,2) ;
                           //申请人 受理日期  受理人  完成日期  责任人  状态  验收时间 验收人 效率  实际耗时
  SetColsReadOnly(DghMain,['un_Applican','AdmiTime','un_AdmiPeop','CompTime',
  'un_RespPeop','MainExecStat','AcceTime','un_AccePeop','Efficien','ActuCons']);
  //状态 雇员  实际工作时间
  SetColsReadOnly(dghChild,['MainExecStat','EMPLOYEE_NAME','WorkTime']);
  ControlsSetReadOnly([edt_un_Applican,edt_AdmiTime,edt_CompTime,
  edt_MainExecStat,edt_AcceTime,edt_un_AccePeop,edt_Efficien,edt_ActuCons]);
end;

procedure TfrmWorkRecord.cdsChildNewRecord(DataSet: TDataSet);
begin
  inherited;
  with cdsChild do
  begin
    if  cdsChild.RecordCount = 0 then
      FieldByName('WorkDate').Value := Curr_Date
    else
      FieldByName('WorkDate').Value :=WorkDate;
//    if isdate(DateToStr(WorkDate)) then
//    begin
//      FieldByName('WorkDate').Value :=WorkDate;
//    end
//    else
//      FieldByName('WorkDate').Value := Curr_Date;

    if F_IsBatchOperating=False then
    begin
      FieldByName('BeginTime').Value:= GetDataBaseDate(DM.cdsRead,1);
    end;

    FieldByName('Status')   .Value:= 3;     //3	执行中
    FieldByName('TimeCons') .Value:= 0;     //3	暂停时间
    FieldByName('TimeRest') .Value:= 0;   //3	中途休息时间
  end;
end;

procedure TfrmWorkRecord.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  with     DataSet do
  begin
    FieldByName('Applican').Value:=UserRKEY;    //申请人
    FieldByName('un_Applican').Value:=USER_FULL_NAME;
    FieldByName('Status').Value:=1;    //
  end;
end;

end.
