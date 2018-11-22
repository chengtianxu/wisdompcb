unit form_Picking;

interface
                                     
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  StdCtrls,  RzButton, MC_unt, DB, DBCtrls, RzEdit, RzDBEdit, RzDBBnEd,
  DBButtonEdit, ExtCtrls, Mask, ComCtrls, Buttons, cds, Provider, DBClient,
  ADODB, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Menus, ImgList, Grids,
  DBGridEh, RzPanel;

type
  Tfrm_Picking = class(TMC_frm)
    cds0005: TClientDataSet;
    cds0034: TClientDataSet;
    cds0015: TClientDataSet;
    cds0094: TClientDataSet;
    cdsChildRKEY: TAutoIncField;
    cdsChildCUT_NO: TStringField;
    cdsChildSO_NO: TStringField;
    cdsChildFLOW_NO: TIntegerField;
    cdsChildSTEP: TSmallintField;
    cdsChildDEPT_PTR: TIntegerField;
    cdsChildINVENT_PTR: TIntegerField;
    cdsChildQUAN_BOM: TFloatField;
    cdsChildQUAN_ISSUED: TFloatField;
    cdsChildSTATUS: TSmallintField;
    cdsChildPRINTIT: TStringField;
    cdsChildVENDOR: TStringField;
    cdsChildInvent_or: TSmallintField;
    cdsChildquan_alloc: TBCDField;
    cdsChildoverproof: TSmallintField;
    cdsChildINV_PART_NUMBER: TStringField;
    cdsChildINV_PART_DESCRIPTION: TStringField;
    cdsChildunit_name: TStringField;
    cds0017WM: TClientDataSet;
    dtChildRKEY: TAutoIncField;
    dtChildCUT_NO: TStringField;
    dtChildSO_NO: TStringField;
    dtChildFLOW_NO: TIntegerField;
    dtChildSTEP: TSmallintField;
    dtChildDEPT_PTR: TIntegerField;
    dtChildINVENT_PTR: TIntegerField;
    dtChildQUAN_BOM: TFloatField;
    dtChildQUAN_ISSUED: TFloatField;
    dtChildSTATUS: TSmallintField;
    dtChildPRINTIT: TStringField;
    dtChildVENDOR: TStringField;
    dtChildInvent_or: TSmallintField;
    dtChildquan_alloc: TBCDField;
    dtChildoverproof: TWordField;
    dtChildINV_PART_NUMBER: TStringField;
    dtChildINV_PART_DESCRIPTION: TStringField;
    dtChildunit_name: TStringField;
    cds0094RKEY: TAutoIncField;
    cds0094CODE: TStringField;
    cds0094PURCHASE_APPROV_DESC: TStringField;
    cds0034RKEY: TAutoIncField;
    cds0034DEPT_CODE: TStringField;
    cds0034DEPT_NAME: TStringField;
    cds0005RKEY: TAutoIncField;
    cds0005EMPL_CODE: TStringField;
    cds0005EMPLOYEE_NAME: TStringField;
    cds0015RKEY: TAutoIncField;
    cds0015WAREHOUSE_CODE: TStringField;
    cds0015WAREHOUSE_NAME: TStringField;
    cds0015ABBR_NAME: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainnumber: TStringField;
    cdsMaindept_ptr: TIntegerField;
    cdsMainDATE: TDateTimeField;
    cdsMainEMPL_PTR: TIntegerField;
    cdsMainstatus: TSmallintField;
    cdsMainauth_emplptr: TIntegerField;
    cdsMainauth_date: TDateTimeField;
    cdsMainreference: TStringField;
    cdsMainwarehouse_ptr: TIntegerField;
    cdsMainallow_submit_time: TDateTimeField;
    cdsMaincontrol_ptr: TIntegerField;
    cdsMainauth_ptr: TIntegerField;
    cdsMainPrted: TBooleanField;
    cdsMainallow_submit: TSmallintField;
    cdsMainDEPT_CODE: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cdsMainEMPL_CODE: TStringField;
    cdsMainabbr_name: TStringField;
    cdsMainAuditcode: TStringField;
    cdsMainAuditname: TStringField;
    cdsMainstatus_c: TStringField;
    cdsMainrkey94: TAutoIncField;
    cdsMainPURCHASE_APPROV_DESC: TStringField;
    cdsMainfac_name: TStringField;
    cdsMainallow_submit_c: TStringField;
    cdsMainallow_submit_person_code: TStringField;
    cdsNainallow_submit_person_name: TStringField;
    dtMainrkey: TAutoIncField;
    dtMainnumber: TStringField;
    dtMaindept_ptr: TIntegerField;
    dtMainDATE: TDateTimeField;
    dtMainEMPL_PTR: TIntegerField;
    dtMainstatus: TWordField;
    dtMainauth_emplptr: TIntegerField;
    dtMainauth_date: TDateTimeField;
    dtMainreference: TStringField;
    dtMainwarehouse_ptr: TIntegerField;
    dtMainallow_submit_time: TDateTimeField;
    dtMaincontrol_ptr: TIntegerField;
    dtMainauth_ptr: TIntegerField;
    dtMainPrted: TBooleanField;
    dtMainallow_submit: TWordField;
    dtMainDEPT_CODE: TStringField;
    dtMainDEPT_NAME: TStringField;
    dtMainEMPL_CODE: TStringField;
    dtMainabbr_name: TStringField;
    dtMainAuditcode: TStringField;
    dtMainAuditname: TStringField;
    dtMainstatus_c: TStringField;
    dtMainrkey94: TAutoIncField;
    dtMainPURCHASE_APPROV_DESC: TStringField;
    dtMainfac_name: TStringField;
    dtMainallow_submit_c: TStringField;
    dtMainallow_submit_person_code: TStringField;
    dtMainallow_submit_person_name: TStringField;
    dtMainWorkOrder: TStringField;
    dtMainPlanMainDate: TDateTimeField;
    dtMainDeviNumb: TStringField;
    dtMainMainCycl: TStringField;
    cdsMainRepairNUMBER: TStringField;
    cdsMainPlanMainDate: TDateTimeField;
    cdsMainDeviNumb: TStringField;
    cdsMainMainCycl: TStringField;
    cdsMainWorkOrder: TStringField;
    dtMainRepairNUMBER: TStringField;
    dtMainttype: TWordField;
    cdsMainttype: TSmallintField;
    cds0567: TClientDataSet;
    cds0835: TClientDataSet;
    cds0831: TClientDataSet;
    dtMainCODE: TStringField;
    cdsMainCODE: TStringField;
    cds0835rkey: TAutoIncField;
    cds0835WorkOrder: TStringField;
    cds0835DeptName: TStringField;
    cds0835WorkName: TStringField;
    cds0835WorkExpl: TStringField;
    cds0567rkey: TAutoIncField;
    cds0567NUMBER: TStringField;
    cds0567FASSET_CODE: TStringField;
    cds0567FASSET_NAME: TStringField;
    cds0567DEPT_NAME: TStringField;
    dtMainD831_ptr: TIntegerField;
    dtMainD835_ptr: TIntegerField;
    dtMainD567_ptr: TIntegerField;
    cdsMainD831_ptr: TIntegerField;
    cdsMainD835_ptr: TIntegerField;
    cdsMainD567_ptr: TIntegerField;
    dtMainFASSET_NAME: TStringField;
    cdsMainFASSET_NAME: TStringField;
    dtMainD840_ptr: TIntegerField;
    dtMainLocation: TStringField;
    cdsMainD840_ptr: TIntegerField;
    cdsMainLocation: TStringField;
    dtMainFASSET_CODE: TStringField;
    cdsMainFASSET_CODE: TStringField;
    cds0831rkey: TAutoIncField;
    cds0831PlanMainDate: TDateTimeField;
    cds0831DeviNumb: TStringField;
    cds0831FASSET_NAME: TStringField;
    cds0831MainCycl: TStringField;
    dtMainDeptName: TStringField;
    dtMainWorkName: TStringField;
    dtMainWorkExpl: TStringField;
    cdsMainDeptName: TStringField;
    cdsMainWorkName: TStringField;
    cdsMainWorkExpl: TStringField;
    cds0840: TClientDataSet;
    cds0840rkey: TAutoIncField;
    cds0840Location: TStringField;
    cds0017WMRKEY: TIntegerField;
    cds0017WMINV_PART_NUMBER: TStringField;
    cds0017WMINV_PART_DESCRIPTION: TStringField;
    cds0017WMGROUP_DESC: TStringField;
    cds0017WMQty: TBCDField;
    cds0017WMUNIT_NAME: TStringField;
    cds0017WMABBR_NAME: TStringField;
    cds0017WMLOCATION: TStringField;
    cds0017WMXY: TStringField;
    cds0017WMPRINTIT: TIntegerField;
    cds0017WMINV_DESCRIPTION: TStringField;
    N_Reprint: TMenuItem;
    cds0567failure_circs: TStringField;
    cds0567maintain_text: TStringField;
    dtMainfailure_circs: TStringField;
    dtMainmaintain_text: TStringField;
    cdsMainfailure_circs: TStringField;
    cdsMainmaintain_text: TStringField;
    cds0567V_stat: TStringField;
    dtMainEMPLOYEE_DEPT_NAME: TStringField;
    cdsMainEMPLOYEE_DEPT_NAME: TStringField;
    cds0567DEPT_CODE: TStringField;
    cds0567EquiType: TBooleanField;
    cds0831DEPT_CODE: TStringField;
    cds0831EquiType: TBooleanField;
    cds0831DEPT_NAME: TStringField;
    cds0567Location: TStringField;
    cds0831Location: TStringField;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    Label29: TLabel;
    edt_Number: TDBEdit;
    edt_DATE: TDBEdit;
    edt_abbr_name: TDBEdit;
    edt_status_c: TDBEdit;
    edt_PURCHASE_APPROV_DESC: TDBEdit;
    edt_auth_date: TDBEdit;
    cbx_Prted: TDBCheckBox;
    edt_DEPT_NAME: TDBEdit;
    DBRadioGroup_ttype: TDBRadioGroup;
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    Panel_2: TPanel;
    Label5: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    edt_RepairNUMBER: TDBButtonEdit;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    TabSheet6: TTabSheet;
    Panel_4: TPanel;
    Label3: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit4: TDBEdit;
    DBEdit10: TDBEdit;
    edt_WorkOrder: TDBButtonEdit;
    DBMemo2: TDBMemo;
    TabSheet7: TTabSheet;
    Label18: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    DBEdit7: TDBEdit;
    edt_PlanMainDate: TDBButtonEdit;
    edt_FASSET_CODE: TDBButtonEdit;
    edt_reference: TDBMemo;
    edt_fac_name: TDBButtonEdit;
    edt_CODE: TDBButtonEdit;
    edt_Location: TDBButtonEdit;
    edt_DEPT_CODE: TDBButtonEdit;
    edt_EMPLOYEE_DEPT_NAME: TDBEdit;
    BtFind: TSpeedButton;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dteBegin: TDateTimePicker;
    dteEnd: TDateTimePicker;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    bt_Expand: TButton;
    bt_Reject: TButton;
    Button5: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtFindClick(Sender: TObject);
    procedure cdsMainstatusChange(Sender: TField);
    procedure cdsMainEMPL_PTRChange(Sender: TField);
    procedure cdsMainDEPT_CODEChange(Sender: TField);
    procedure cdsMainfac_nameChange(Sender: TField);
    procedure cdsMainCODEChange(Sender: TField);
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure cdsChildINV_PART_NUMBERChange(Sender: TField);
    procedure cdsMainWorkOrderChange(Sender: TField);
    procedure cdsMainRepairNUMBERChange(Sender: TField);
    procedure cdsMainLocationChange(Sender: TField);
    procedure DBRadioGroup_ttypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsMainD831_ptrChange(Sender: TField);
    procedure cdsMainD567_ptrChange(Sender: TField);
    procedure cdsMainD835_ptrChange(Sender: TField);
    procedure cdsChildPRINTITGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DBRadioGroup_ttypeEnter(Sender: TObject);
    procedure MainGrid_PopupMenuPopup(Sender: TObject);
    procedure N_ReprintClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dteEndChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dteBeginExit(Sender: TObject);
    procedure cds0840ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMainttypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsMainttypeSetText(Sender: TField; const Text: String);
//    procedure dghChildEditButtonClick(Sender: TObject;
//      var Handled: Boolean);
    procedure cdsChildNewRecord(DataSet: TDataSet);
    procedure bt_ExpandClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure tblPrintClick(Sender: TObject);
    procedure bt_RejectClick(Sender: TObject);
    procedure tblSaveClick(Sender: TObject);
    procedure dghChildColumns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
  private
    str_DeptCode :AnsiString;
    function SaveBeforeCheck ():Boolean  ; override;
    procedure Set_ToolbarButtonStatus(Flag: Boolean); override;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frm_Picking: Tfrm_Picking;
  str_fac_name:string='';    //申请人所在的工厂，是根据DATA0840表查询出的结果
  str_Location:string='';

implementation

uses PublicFile, DM_unt,  URep, form_AuthInfo,
   formSelectItem_private, form_Picking1;

{$R *.dfm}

procedure Tfrm_Picking.Set_ToolbarButtonStatus(Flag: Boolean);
begin
  if  NeedSave then
  if (cdsMain.F_IsBatchOperating<>True)
              or(cdsChild.F_IsBatchOperating<>True) then
  begin                        //只有批处理=false 的时候，才执行按钮刷新。
    with   ActiveGridEH.DataSource.DataSet as TClientDataSet do
    begin
      tblAdd.Enabled  :=(not Flag) and (StrToInt(vprev)in [2,3,4]);
      tblEdit.Enabled :=(not Flag) and (StrToInt(vprev)in [2,3,4])and(IsEmpty=False)
                         and(cdsMainstatus.AsInteger in [0,3])and(cdsMainEMPL_PTR.AsInteger=EmplRKEY);
      tblDelete.Enabled:=(not  Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,3,4])
                         and(cdsMainstatus.AsInteger in [0])and(cdsMainEMPL_PTR.AsInteger=EmplRKEY);       
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
          bt_Reject.Enabled:=False ;   //反提交
          bt_Expand.Enabled:=False ;   //提交
        end
      else
        begin
          tblSave.Enabled:=False;
          tblfind.Enabled:= True;
          tblRefresh .Enabled:=True;
          tblExport.Enabled:=True;
          tblPrint.Enabled:= (StrToInt(vprev)in [2,4])and (cdsMainPrted.AsBoolean = False)and (cdsMainstatus.AsInteger = 2);      //打印
          tblDesign.Enabled:=(StrToInt(vprev)in [2,4]) ;      //报表设计
          tblFilter.Enabled:= True;
          bt_Reject.Enabled := (StrToInt(vprev)in [2,3,4]) and (cdsMainstatus.AsInteger=1) ;   //反提交
          bt_Expand.Enabled := (StrToInt(vprev)in [2,3,4]) and (cdsMainstatus.AsInteger=0) ;   //提交

        end ;
    end;

    if cdsMainstatus.AsInteger>0 then           //如果状态的值大于0，即不是待提交，审批流程代码不允许修改。
      cdsMainCODE.ReadOnly:=True
    else
      cdsMainCODE.ReadOnly:=False  ;

    if cdsChild.IsEmpty then
    begin
      SetControlsReadOnly([edt_fac_name],False);
      edt_fac_name.F_AllowPop:=True;
    end
    else
    begin
      SetControlsReadOnly([edt_fac_name]);
      edt_fac_name.F_AllowPop:=False;
    end;

    if (cdsMainstatus.AsInteger in [0,3])and(cdsMainEMPL_PTR.AsInteger=EmplRKEY) then   //状态＝0：待提交；3：被退回     和申请人等于雇员指针
      begin
        DghMain.ReadOnly:=False;
        dghChild.ReadOnly:=False;
        if StrToInt(vprev)in [2,3,4] then
          begin
            SetColsReadOnly(DghMain,['DEPT_CODE','Location','CODE','fac_name','reference'],False);
            SetColsReadOnly(dghChild,['INV_PART_NUMBER','QUAN_BOM'],False);
            SetControlsReadOnly([edt_DEPT_CODE,edt_Location,edt_CODE,edt_reference,DBRadioGroup_ttype,
            edt_RepairNUMBER,edt_WorkOrder,edt_PlanMainDate,edt_FASSET_CODE],False);
          end
        else
          begin
            SetColsReadOnly(DghMain,['DEPT_CODE','Location','CODE','fac_name','reference']);
            SetColsReadOnly(dghChild,['INV_PART_NUMBER','QUAN_BOM']);
            SetControlsReadOnly([edt_DEPT_CODE,edt_Location,edt_CODE,edt_reference,DBRadioGroup_ttype,
            edt_RepairNUMBER,edt_WorkOrder,edt_PlanMainDate,edt_FASSET_CODE]);
          end;
      end
    else
    if (cdsMainstatus.AsInteger in [4])  then     
      begin
        DghMain.ReadOnly  :=True;
        dghChild.ReadOnly :=True;
        SetColsReadOnly(DghMain,['DEPT_CODE','Location','CODE','fac_name','reference']);
        SetColsReadOnly(dghChild,['INV_PART_NUMBER','QUAN_BOM']);
        SetControlsReadOnly([edt_DEPT_CODE,edt_Location,edt_CODE,edt_reference,DBRadioGroup_ttype,
            edt_RepairNUMBER,edt_WorkOrder,edt_PlanMainDate,edt_FASSET_CODE]);

        if ActiveGridEH=dghChild then
        begin
          tblAdd.Enabled:=False;
          tblEdit.Enabled:=False;
        end;
        if (StrToInt(vprev)=4) then          //如果已发料(状态=4) ，且权限等于4，DBRadioGroup_ttype可以修改。张兴旺要求
          DBRadioGroup_ttype.ReadOnly:=False ;
      end
    else
      begin
        DghMain.ReadOnly  :=True;
        dghChild.ReadOnly :=True;
        SetColsReadOnly(DghMain,['DEPT_CODE','Location','CODE','fac_name','reference']);
        SetColsReadOnly(dghChild,['INV_PART_NUMBER','QUAN_BOM']);
        SetControlsReadOnly([edt_DEPT_CODE,edt_Location,edt_CODE,edt_reference,DBRadioGroup_ttype,
            edt_RepairNUMBER,edt_WorkOrder,edt_PlanMainDate,edt_FASSET_CODE]);

        if ActiveGridEH=dghChild then
        begin
        tblAdd.Enabled:=False;
        tblEdit.Enabled:=False;
        end;
      end;
    Set_ButtonStatus;    //数据集的状态发生更改时，重新设置右边竖工具条的状态。20141116添加
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

function Tfrm_Picking.SaveBeforeCheck():Boolean  ;
var
  strMsg:string;
  I_Row :Integer;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;

    if FieldByName('number').IsNull then //申领单号
      strMsg:=strMsg+'字段：“'+FieldByName('number').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('dept_ptr').IsNull then //申领部门
      strMsg:=strMsg+'字段：“'+FieldByName('DEPT_CODE').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('warehouse_ptr').IsNull then //工厂
      strMsg:=strMsg+'字段：“'+FieldByName('fac_name').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('auth_ptr').IsNull then //工厂
      strMsg:=strMsg+'字段：“'+FieldByName('PURCHASE_APPROV_DESC').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('d840_ptr').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('Location').DisplayLabel+'”的值不能为空！！！'+#13;

    if ( FieldByName('ttype').AsInteger in [2,4])and((cdsMainD567_ptr.IsNull)and(cdsMainD835_ptr.IsNull)) then
      strMsg:=strMsg+'字段：“'+cdsMainRepairNUMBER.DisplayLabel+'”的值不能为空！！！'+#13
    else
    if ( FieldByName('ttype').AsInteger=3)and(cdsMainD831_ptr.IsNull)and(cdsMainD567_ptr.IsNull) then
      strMsg:=strMsg+'请输入维护单或者是维修单！！！'+#13 ;
  end;

  with cdsChild do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
    if IsEmpty then
      strMsg:=strMsg+'明细表至少要有一行记录！！！'+#13
    else
    begin
      try
        DisableControls ;
        First;
        for I_Row:=0 to RecordCount-1 do
        begin
          if cdsMaindept_ptr.IsNull=False then
          begin
            Edit;
            FieldByName('DEPT_PTR').Value:= cdsMaindept_ptr.Value;
            Post;
          end;
          if FieldByName('INVENT_PTR').IsNull then //材料编码
            strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+FieldByName('INV_PART_NUMBER').DisplayLabel+'”的值不能为空！！！'+#13;
          if (FieldByName('QUAN_BOM').IsNull)or(FieldByName('QUAN_BOM').Value<=0) then //申领数量
            strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+FieldByName('QUAN_BOM').DisplayLabel+'”的值必须大于0！！！'+#13;
          Next;
        end;
      finally
        EnableControls;
      end;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure Tfrm_Picking.BtFindClick(Sender: TObject);
var
  strStatusValue:string;
begin
  inherited;
  if VarIsNull(dteBegin.Date) or VarIsNull(dteEnd.Date)then
  begin
    msgError('日期不能为空！！！');
    Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    dteEndChange(nil);
    cdsMain.Close;
    cdsMain.CommandText:=cdsMain.F_SQLSelectFrom+#10#13+ cdsMain.F_SQLWhere
      +' and DATA0268.DATE>='+QuotedStr(DateToStr(dteBegin.Date))
      +' and DATA0268.DATE<='+QuotedStr(DateToStr(dteEnd.Date+1));
    cdsMain.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Picking.cdsChildINV_PART_NUMBERChange(Sender: TField);
begin
  inherited;
  if Sender.IsNull then
  begin
    cdsChild.FieldByName('INVENT_PTR')          .Value :=null;   //材料指针
    cdsChild.FieldByName('INV_PART_DESCRIPTION').Value :=null ;
    cdsChild.FieldByName('unit_name')           .Value :=null ;
    cdsChild.FieldByName('VENDOR')              .Value :=null ;  //  供应商
    cdsChild.FieldByName('PRINTIT')             .Value :=null ;  //是否VMI
  end
  else
  begin
    cdsChildINVENT_PTR.Value           := cds0017WM.FieldByName('rkey').Value ;
    cdsChildINV_PART_DESCRIPTION.Value := cds0017WM.FieldByName('INV_PART_DESCRIPTION').Value ;
    cdsChildunit_name.Value            := cds0017WM.FieldByName('unit_name').Value ;
    cdsChild.FieldByName('VENDOR') .Value :=cds0017WM.FieldByName('ABBR_NAME').Value ;  //  供应商
    if cds0017WM.FieldByName('PRINTIT').Value=1 then
      cdsChild.FieldByName('PRINTIT').Value :='Y'
    else
      cdsChild.FieldByName('PRINTIT').Value :='N';  //是否VMI
  end  ;
end;

procedure Tfrm_Picking.cdsChildPRINTITGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
  if  Sender.AsString  =  'Y'  then
    Text  :=  '普通库存'
  else
  if  Sender.AsString  =  'N'  then
    Text  :=  'VMI库存' ;
end;

procedure Tfrm_Picking.cdsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  DBRadioGroup_ttypeClick(nil);
  if cdsMain.FieldByName('fac_name').IsNull=False then
  begin
    if  (cds0017WM.Params.ParamByName('vWarehouse_ptr').Value)<>(cdsMain.FieldByName('warehouse_ptr').Value) then
    begin
      cds0017WM.Close;
      cds0017WM.Params.ParamByName('vWarehouse_ptr').Value:=cdsMain.FieldByName('warehouse_ptr').Value;
    end;
  end
  else
  begin
    cds0017WM.Close;
    cds0017WM.Params.ParamByName('vWarehouse_ptr').Value:=null;
  end;
end;

procedure Tfrm_Picking.cdsMainCODEChange(Sender: TField);
begin
  inherited;
  with cds0094 do
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
      cdsMain.FieldByName('auth_ptr').Value:=null;   //审核流程指针
    end
    else
    begin
      if Locate('CODE',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainAuth_ptr.Value := FieldByName('rkey').Value ;

        cdsMainPURCHASE_APPROV_DESC.Value:= FieldByName('PURCHASE_APPROV_DESC').Value ;
        end
      else
        begin
        cdsMain.FieldByName('Auth_ptr').Value:=null;
        cdsMain.FieldByName('PURCHASE_APPROV_DESC').Value:=null ;
        ShowMessage('审核流程不存在！！！');
        end;
    end;
  end;
end;

procedure Tfrm_Picking.cdsMainD567_ptrChange(Sender: TField);
begin
  inherited;
  if (Sender.IsNull=False)and(cds0567.Locate('rkey',Sender.Value,[loCaseInsensitive]))then
  begin
    cdsMain.FieldByName('FASSET_CODE').Value:=cds0567.FieldByName('FASSET_CODE').Value;
    cdsMain.FieldByName('FASSET_NAME').Value :=cds0567.FieldByName('FASSET_NAME').Value;
    cdsMain.FieldByName('failure_circs').Value:=cds0567.FieldByName('failure_circs').Value;
    cdsMain.FieldByName('maintain_text').Value :=cds0567.FieldByName('maintain_text').Value;
  end
  else
  begin
    cdsMain.FieldByName('FASSET_NAME').Value:=null;
    cdsMain.FieldByName('FASSET_CODE').Value:=null;
    cdsMain.FieldByName('failure_circs').Value:=null;
    cdsMain.FieldByName('maintain_text').Value :=null;
  end  ;
end;

procedure Tfrm_Picking.cdsMainD831_ptrChange(Sender: TField);
begin
  inherited;
  if (Sender.IsNull=False)and(cds0831.Locate('rkey',Sender.Value,[loCaseInsensitive]))then
  begin
    cdsMain.FieldByName('PlanMainDate').Value:=cds0831.FieldByName('PlanMainDate').Value;
    cdsMain.FieldByName('FASSET_NAME').Value :=cds0831.FieldByName('FASSET_NAME').Value;
    cdsMain.FieldByName('FASSET_CODE').Value :=cds0831.FieldByName('DeviNumb').Value;

    if cds0831.FieldByName('EquiType').AsBoolean then
      cdsMainDEPT_CODE.Value:= cds0831.FieldByName('DEPT_CODE').Value ;
  end
  else
  begin
    cdsMain.FieldByName('PlanMainDate').Value:=null;
    cdsMain.FieldByName('FASSET_NAME').Value:=null;
    cdsMain.FieldByName('FASSET_CODE').Value:=null;
    cdsMain.FieldByName('DEPT_CODE').Value  :=null;
  end  ;
end;

procedure Tfrm_Picking.cdsMainD835_ptrChange(Sender: TField);
begin
  inherited;
  if (Sender.IsNull=False)and(cds0835.Locate('rkey',Sender.Value,[loCaseInsensitive]))then
  begin
    cdsMain.FieldByName('DeptName').Value:=cds0835.FieldByName('DeptName').Value;
    cdsMain.FieldByName('WorkName').Value :=cds0835.FieldByName('WorkName').Value;
    cdsMain.FieldByName('WorkExpl').Value :=cds0835.FieldByName('WorkExpl').Value;
  end
  else
  begin
    cdsMain.FieldByName('DeptName').Value:=null;
    cdsMain.FieldByName('WorkName').Value:=null;
    cdsMain.FieldByName('WorkExpl').Value:=null;
  end  ;
end;

procedure Tfrm_Picking.cdsMainDEPT_CODEChange(Sender: TField);
begin
  inherited;
  with cds0034 do
  if Active=False then
  Open;

  if cds0034.Filtered then
  cds0034.Filtered:=False;

  with Sender.DataSet do
  if not(State in [dsEdit,dsInsert]) then
  Edit;

  if Sender.IsNull then
  begin
    cdsMain.FieldByName('dept_ptr').Value:=null;
    cdsMain.FieldByName('DEPT_NAME').Value:=null ;
  end
  else
  begin
    if cds0034.Locate('DEPT_CODE',Sender.Value,[loCaseInsensitive]) then
      begin
      cdsMaindept_ptr.Value := cds0034.FieldByName('rkey').Value ;
      cdsMainDEPT_NAME.Value:= cds0034.FieldByName('DEPT_NAME').Value ;
      end
    else
      begin
      cdsMain.FieldByName('dept_ptr').Value:=null;
      cdsMain.FieldByName('DEPT_NAME').Value:=null ;
      cdsMain.FieldByName('DEPT_CODE').Value:=null;
      ShowMessage('部门代码不存在！！！');
      end;
  end;
end;

procedure Tfrm_Picking.cdsMainEMPL_PTRChange(Sender: TField);
begin
  inherited;
  with cds0005 do
  begin
    if Active=False then
    Open;

    if Locate('rkey',Sender.Value,[]) then
      cdsMain.FieldByName('abbr_name').Value:=Lookup('rkey',Sender.Value,'EMPLOYEE_NAME')
    else
      cdsMain.FieldByName('abbr_name').Value:=null;
  end;
end;

procedure Tfrm_Picking.cdsMainfac_nameChange(Sender: TField);
begin
  inherited;
  with cds0015 do
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
      cdsMain.FieldByName('warehouse_ptr').Value:=null;
      cds0017WM.Close;
      cds0017WM.Params.ParamByName('vWarehouse_ptr').Value:=null;
    end
    else
    begin
      if Locate('ABBR_NAME',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainwarehouse_ptr.Value := FieldByName('rkey').Value ;
        cds0017WM.Close;
        cds0017WM.Params.ParamByName('vWarehouse_ptr').Value:=FieldByName('rkey').Value;
        end
      else
        begin                         
        cdsMain.FieldByName('warehouse_ptr').Value:=null;
        cdsMain.FieldByName('fac_name').Value:=null ;
        cds0017WM.Close;
        cds0017WM.Params.ParamByName('vWarehouse_ptr').Value:=null;
        ShowMessage('工厂名称不存在！！！');
        end;
    end;
  end;
end;

procedure Tfrm_Picking.cdsMainLocationChange(Sender: TField);
begin
  inherited;
  with cds0840 do
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
      cdsMain.FieldByName('D840_ptr').Value:=null;
    end
    else
    begin
      if Locate('Location',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainD840_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        cdsMain.FieldByName('D840_ptr').Value:=null;
        ShowMessage('设备责任小组没有找到！！！');
        end;
    end;
  end;
end;

procedure Tfrm_Picking.cdsMainRepairNUMBERChange(Sender: TField);
begin
  inherited;
  with cds0567 do
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
      cdsMain.FieldByName('D567_ptr').Value:=null;
    end
    else
    begin
      if Locate('NUMBER',Sender.Value,[loCaseInsensitive]) then
        begin
          if FieldByName('EquiType').AsBoolean then
            cdsMainDEPT_CODE.Value:= FieldByName('DEPT_CODE').Value
          else
            if cdsMainDEPT_CODE.AsString<>'' then
            cdsMain.FieldByName('DEPT_CODE') .Value  :=null ;

          cdsMainD567_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        cdsMain.FieldByName('D567_ptr').Value     :=null;
        cdsMain.FieldByName('RepairNUMBER').Value :=null ;
        cdsMainDEPT_CODE.Value                    :=null ;
        ShowMessage('维修单单号不存在！！！');
        end;
    end;
  end;
end;

procedure Tfrm_Picking.cdsMainstatusChange(Sender: TField);
begin
  inherited;
  case Sender.AsInteger of
    0:cdsMainstatus_c.Value:='待提交';
    1:cdsMainstatus_c.Value:='待审核';
    2:cdsMainstatus_c.Value:='已审核';
    3:cdsMainstatus_c.Value:='被退回';
    4:cdsMainstatus_c.Value:='已发料';
  end;
end;

procedure Tfrm_Picking.cdsMainWorkOrderChange(Sender: TField);
begin
  inherited;
  with cds0835 do
  if Active=False then
  Open;

  if cds0835.Filtered then
  cds0835.Filtered:=False;

  with Sender.DataSet do
  if not(State in [dsEdit,dsInsert]) then
  Edit;

  if Sender.IsNull then
  begin
    cdsMain.FieldByName('D835_ptr').Value:=null;
  end
  else
  begin
    if cds0835.Locate('WorkOrder',Sender.Value,[loCaseInsensitive]) then
      begin

        cdsMainD835_ptr.Value := cds0835.FieldByName('rkey').Value ;
      end
    else
      begin
      cdsMain.FieldByName('D835_ptr').Value:=null;
      cdsMain.FieldByName('WorkOrder').Value:=null ;
      ShowMessage('空调事业部工作单号不存在！！！');
      end;
  end;
end;

procedure Tfrm_Picking.DBRadioGroup_ttypeClick(Sender: TObject);
begin
  inherited;
  with     DBRadioGroup_ttype do
  if ItemIndex in [0,2] then
  begin
    PageControl1.Visible:=True;
    TabSheet5.TabVisible:=True;
    TabSheet6.TabVisible:=True;
    TabSheet7.TabVisible:=False;
  end
  else
  if ItemIndex=1 then
  begin
    PageControl1.Visible:=True;
    TabSheet5.TabVisible:=True;
    TabSheet6.TabVisible:=False;
    TabSheet7.TabVisible:=True;
  end
  else
  if ItemIndex=3  then
  begin
    PageControl1.Visible:=False;
  end ;
end;

procedure Tfrm_Picking.DBRadioGroup_ttypeEnter(Sender: TObject);
begin
  inherited;
  ActiveGridEH:=DghMain;
end;

procedure Tfrm_Picking.FormCreate(Sender: TObject);
var
  i,j:Integer;
begin
 if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ; { }
    //
 { DM_frm.ADOConnection1.Close;
  DM_frm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  DM_frm.ADOConnection1.Open;
  UserRKEY := 2522;
  //EmplRKEY:=2995;
  vprev:='4';
  }
  
  inherited;
  SetEmployeeInfo(dtRead,StatusBar1);
  str_DeptCode:='';
  Curr_Date:=GetDataBaseDate(dtread,ADate);
  dteBegin.Date:=Curr_Date-30;
  dteEnd  .Date:=Curr_Date;      
  BtFind.Click;
  AutoNumb_Edit := edt_Number;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ListDataSet           :=cds0094;
    L_ColsInfo              :='CODE/审批代码/80,PURCHASE_APPROV_DESC/审批名称/120';
    L_DropdownColumn        :='CODE';   //审批流程代码
    L_ListDataSetFilterField:='CODE';
    L_ListResultField       :='CODE';
    L_GetValueField         :='CODE';
    DropDownInfo_Init(var_DropDown_Info);
    edt_CODE.F_ColsInfo:= L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ListDataSet           :=cds0034;
    L_ColsInfo              :='DEPT_CODE/部门代码/80,DEPT_NAME/部门名称/120';
    L_DropdownColumn        :='DEPT_CODE';
    L_ListDataSetFilterField:='DEPT_CODE';
    L_ListResultField       :='DEPT_CODE';
    L_GetValueField         :='DEPT_CODE';
    DropDownInfo_Init(var_DropDown_Info);
    edt_DEPT_CODE.F_ColsInfo:= L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ListDataSet           :=cds0015;
    L_ColsInfo              :='WAREHOUSE_CODE/工厂代码/60,ABBR_NAME/简称/80,WAREHOUSE_NAME/工厂名称/200';
    L_DropdownColumn        :='fac_name';     //工厂
    L_ListDataSetFilterField:='ABBR_NAME';
    L_ListResultField       :='ABBR_NAME';
    L_GetValueField         :='fac_name';
    DropDownInfo_Init(var_DropDown_Info);
    edt_fac_name.F_ColsInfo:=  L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ListDataSet           :=cds0840;
    L_ColsInfo              :='Location/设备责任小组/120';
    L_DropdownColumn        :='Location';     //工厂
    L_ListDataSetFilterField:='Location';
    L_ListResultField       :='Location';
    L_GetValueField         :='Location';
    DropDownInfo_Init(var_DropDown_Info);
    edt_Location.F_ColsInfo:=L_ColsInfo;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  cds0094.CommandText:='select data0094.RKEY,CODE,PURCHASE_APPROV_DESC from data0094 '
        +' join data0034 on data0094.dept_ptr=data0034.rkey '
        +' join data0005 on data0005.EMPLOYEE_ID=data0034.rkey '
        +' where data0005.rkey='+IntToStr(EmplRKEY) +' and dbo.Data0094.type=2 and (data0034.ACTIVE_FLAG=0) ';
  ReportFileName:='Rep268_1.rtm';

  FirstControl:=edt_CODE;
  LastControl:=edt_reference;

  Find_DisplayFields := VarArrayOf(['number','abbr_name','DEPT_CODE','DEPT_NAME','CODE',
       'PURCHASE_APPROV_DESC','DATE','auth_date','Auditname','fac_name','Location','ttype',
       'RepairNUMBER','WorkOrder','reference']);    //,'ttype'   , 'Prted',
  Find_FieldsName       := VarArrayOf(['fac_name','number','Location','ttype','DEPT_CODE', 'DEPT_NAME','DATE','RepairNUMBER']);
  Find_QueryFieldsName  := VarArrayOf(['dbo.Data0015.ABBR_NAME','dbo.DATA0268.number',
  'data0840.Location','DATA0268.ttype','dbo.Data0034.DEPT_CODE', 'dbo.Data0034.DEPT_NAME','dbo.DATA0268.DATE','data0567.NUMBER']);
  Find_Def_FieldName  :=  VarArrayOf(['DATE']);
  Find_Def_Oper       :=  VarArrayOf(['BETWEEN']);
  Find_Def_FieldValue :=  VarArrayOf([DateToStr(dteBegin.Date)]);
  Find_Def_Field2Value:=  VarArrayOf([DateToStr(dteEnd.Date+1)]);
                       
  SetColsReadOnly(DghMain,['Prted','abbr_name','DATE','DEPT_NAME','status_c',   //打印否  申领员工名称 申请日期 部门名称 审核状态  审批流程 审核日期 审核员工名称
  'PURCHASE_APPROV_DESC','auth_date','Auditname']);
  SetControlsReadOnly([cbx_Prted,edt_abbr_name,edt_DATE,edt_status_c,edt_PURCHASE_APPROV_DESC,
  edt_auth_date,edt_EMPLOYEE_DEPT_NAME,edt_DEPT_NAME,DBEdit1,DBEdit3,DBMemo3,DBMemo4,DBEdit4,DBEdit10,DBMemo2,DBEdit7]);
               
  SetColsReadOnly(dghChild,['INV_PART_DESCRIPTION','unit_name','QUAN_ISSUED','VENDOR','PRINTIT']);    //材料名称/规格  库存单位  已发放数量  供应商  是否VMI
end;

procedure Tfrm_Picking.FormShow(Sender: TObject);
begin
  inherited;
  cds0015.Open;
  Panel_2.BevelOuter:=bvNone ;
  Panel_4.BevelOuter:=bvNone ;
  TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Picking.MainGrid_PopupMenuPopup(Sender: TObject);
begin
  inherited;
  if (StrToInt(vprev)=4)and(cdsMainPrted.AsBoolean) then
    N_Reprint.Enabled:=True
  else
    N_Reprint.Enabled:=False;
end;

procedure Tfrm_Picking.N_ReprintClick(Sender: TObject);
begin
  inherited;
  try
    Report_Frm:= TReport_Frm.Create(application);
    Report_Frm.ADS268.Close;
    if cdsMainrkey.IsNull then
    cdsMain.Refresh;
    Report_Frm.ADS268.Parameters[0].Value:=cdsMainrkey.Value;
    Report_Frm.ADS268.Open;
    Report_Frm.ppReport1.Reset;
    Report_Frm.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'Rep268_1.rtm';
    Report_Frm.ppReport1.Template.LoadFromFile;
    Report_Frm.ppReport1.SaveAsTemplate:=False;
    Report_Frm.ppReport1.Print;
  finally
    Report_Frm.ADS468.Close;
    Report_Frm.ADS268.Close;
    Report_Frm.Free;
  end;
end;

procedure Tfrm_Picking.Button3Click(Sender: TObject);
begin
  inherited;
  if Assigned(frm_Picking1)=False then
  Application.CreateForm(Tfrm_Picking1, frm_Picking1);
  frm_Picking1.ShowModal;
end;

procedure Tfrm_Picking.dteEndChange(Sender: TObject);
var
  strStatusValue:string;
begin
  inherited;
  cdsMain.F_SQLWhere:='where (1=1)';
  strStatusValue:='';                           //如果记录的5种状态都要查询的话，不用执行下面的查询条件。因为该查询条件根本不需要存在，查询速度会更快。
  if (CheckBox1.Checked and  CheckBox2.Checked and CheckBox3.Checked and CheckBox4.Checked and CheckBox5.Checked)=False  then
  begin
    if CheckBox1.Checked then   //待提交
      strStatusValue:='0,';
       
    if CheckBox2.Checked then    //执行中
      strStatusValue:=strStatusValue+'1,';
        
    if CheckBox3.Checked then    //待验收
      strStatusValue:=strStatusValue+'2,';
        
    if CheckBox4.Checked then    //已验收
      strStatusValue:=strStatusValue+'3,';
      
    if CheckBox5.Checked then     //已通知
      strStatusValue:=strStatusValue+'4,';

    if  strStatusValue<>'' then
    begin                            //    去掉后面的一个","
      cdsMain.F_SQLWhere:='where (data0268.status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+') )';
    end;  
  end;
end;

procedure Tfrm_Picking.CheckBox1Click(Sender: TObject);
begin
  inherited;
  dteEndChange(nil);
end;

procedure Tfrm_Picking.dteBeginExit(Sender: TObject);
begin
  inherited;
  dteEndChange(nil);
end;

procedure Tfrm_Picking.cds0840ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  MsgError('保存失败，原因是：'+E.Message);
  tblCancelClick(nil);
end;

procedure Tfrm_Picking.cdsMainttypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsInteger=2 then
    Text:= '维修'
  else
  if Sender.AsInteger=3 then
    Text:= '维护'
  else
  if Sender.AsInteger=4 then
    Text:= '工程'
  else
  if Sender.AsInteger=5 then
    Text:= '公用' ;

end;

procedure Tfrm_Picking.cdsMainttypeSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if Text= '维修' then
    Sender.AsInteger:=2
  else
  if Text= '维护' then
    Sender.AsInteger:=3
  else
  if Text= '工程' then
    Sender.AsInteger:=4
  else
  if Text= '公用' then
     Sender.AsInteger:=5;
end;

procedure Tfrm_Picking.cdsChildNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('DEPT_PTR').Value:=cdsMaindept_ptr.Value;
    FieldByName('PRINTIT').Value:= 'Y';
    FieldByName('QUAN_BOM').Value:= 0  ;
    FieldByName('QUAN_ISSUED').Value:= 0  ;
    FieldByName('overproof').Value:= 0  ;
    FieldByName('Invent_or').Value:= 0;
    FieldByName('Invent_or').Value:= 0;
    FieldByName('quan_alloc').Value:= 0;
    FieldByName('STEP').Value:= 0;
    FieldByName('STATUS').Value:= 0;
  end;
end;

procedure Tfrm_Picking.bt_ExpandClick(Sender: TObject);
var
 iRank:integer;
begin
  inherited;
  if not (strtoint(vprev)in [2,3,4]) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;

  if messagebox(Self.Handle,'你确定要提交审核吗？','提示',MB_YesNo+MB_iconquestion)=idyes then
  begin
    if cdsMainallow_submit.Value in[0] then
    begin
      try
        if DM_frm.ADOConnection1.InTransaction then
        DM_frm.ADOConnection1.RollbackTrans;
        DM_frm.ADOConnection1.BeginTrans;

        DM_frm.cdsRead.Close;
        DM_frm.cdsRead.CommandText:='DELETE FROM DATA0368  WHERE APPLY_PTR='+cdsMainRKEY.AsString;
        DM_frm.cdsRead.Execute;

        DM_frm.cdsRead.Close;
        DM_frm.cdsRead.CommandText:='SELECT * FROM DATA0275 WHERE auth_group_ptr='+cdsMainAuth_PTR.aSsTRING+' ORDER BY RKEY';
        DM_frm.cdsRead.Open;
        iRank:=1;
        WHILE NOT DM_frm.cdsRead.Eof DO
        BEGIN
          DM_frm.cdsRead1.Close;
          IF IrANK=1 THEN
           DM_frm.cdsRead1.CommandText:='INSERT INTO DATA0368(APPLY_PTR,USER_PTR,RANKING,AUTH_FLAG) '+
                               'VALUES('+cdsMainRKEY.AsString+','+DM_frm.cdsRead.FieldByName('USER_PTR').AsString+','+
                               INTTOSTR(IrANK)+',''y'')'
          ELSE
           DM_frm.cdsRead1.CommandText:='INSERT INTO DATA0368(APPLY_PTR,USER_PTR,RANKING,AUTH_FLAG) '+
                               'VALUES('+cdsMainRKEY.aSsTRING+','+DM_frm.cdsRead.FieldByName('USER_PTR').AsString+','+
                               INTTOSTR(IrANK)+',''n'')';
          DM_frm.cdsRead1.Execute;
          INC(IrANK);
          DM_frm.cdsRead.Next;
        END;
        cdsMain.Edit;
        cdsmainstatus.Value:=1;
        cdsMain.Post;
        cdsMain.ApplyUpdates(0);
        DM_frm.ADOConnection1.CommitTrans;
      except
        DM_frm.ADOConnection1.RollbackTrans;
       showmessage('数据提交出现错误,请与管理员联系!!!');
      end;
    end
    else
    begin
      showmessage('您申请的物料未达到平均标准，已经无法提交，请耐心等待确认...');
      Exit;
    end ;
    dsMainStateChange(nil);
  end;
end;

procedure Tfrm_Picking.Button5Click(Sender: TObject);
begin
  inherited;
  if Assigned(frm_AuthInfo)=False then
    Application.CreateForm(Tfrm_AuthInfo, frm_AuthInfo);

  with frm_AuthInfo do
  try     
    cdsRead.Close;
    cdsRead.CommandText:='SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0368.user_ptr,'+
                    'data0368.auth_date,data0368.ranking,data0368.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0368 '+
                    'ON dbo.Data0073.RKEY = dbo.data0368.user_ptr '+
                    'WHERE dbo.data0368.apply_ptr='+IntToStr(cdsMainRkey.AsInteger)+
                    ' order by dbo.data0368.ranking';
    cdsRead.Open;
    frm_AuthInfo.ShowModal;
  finally

  end;
end;

procedure Tfrm_Picking.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  if  str_fac_name='' then
  begin
    cdsRead.Close;
    cdsRead.CommandText:='select data0015.ABBR_NAME,data0840.Location from data0015 join data0840 on data0840.D015_ptr=data0015.rkey '
             +' join data0855 on data0855.d840_ptr=data0840.rkey where data0855.D005_ptr='+inttoStr(EmplRKEY);
    cdsRead.Open;
    if   cdsRead.IsEmpty =False then
    begin
      str_fac_name:=  cdsRead.FieldByName('ABBR_NAME') .AsString;
      str_Location:=  cdsRead.FieldByName('Location') .AsString;
    end;
    cdsRead.Close;
  end;

  cdsMainstatus.Value      :=0;
  cdsMainEMPL_PTR.Value    :=EmplRKEY   ;
  cdsMainPrted.Value       :=False;//打印否
  cdsMainDATE.Value        := GetDataBaseDate(DM_frm.dtread);
  cdsMainttype.Value       :=2;     //2：维修
  cdsMainabbr_name.Value   :=EmplName;
  cdsMainallow_submit.Value:=0;
  if  str_fac_name<>'' then
  begin
    cdsMainfac_name.Value    :=  str_fac_name;
    cdsMainLocation.Value    :=  str_Location;
  end;

  if str_DeptCode='' then
  begin
    DM_frm.cdsRead.Close;
    DM_frm.cdsRead.CommandText:='select data0034.DEPT_CODE from data0005 join data0034'
    +' on data0005.EMPLOYEE_ID=data0034.rkey where data0005.rkey='+IntToStr(EmplRKEY);
    DM_frm.cdsRead.Open;
    str_DeptCode:= DM_frm.cdsRead.Fields[0].AsString;
  end;

  cdsMainEMPLOYEE_DEPT_NAME.Value:=str_DeptCode;
  with  cds0094  do
  if Active=False then
  begin
    Open;
    if recordCount=1 then
    cdsMainCODE.Value:= FieldByName('CODE').Value;
  end;

  if PageControl_M.ActivePageIndex=0 then
    PageControl_M.ActivePageIndex:=1;
  if  FirstControl<>nil then
    FirstControl.SetFocus;
end;

procedure Tfrm_Picking.tblPrintClick(Sender: TObject);
begin
//  inherited;
  if cdsMainPrted.AsBoolean and (vprev<>'3') then
  begin
    showmessage('此申请单已经打印,您无权重复打印...');
    exit;
  end;
  try
    Report_Frm:= TReport_Frm.Create(application);
    Report_Frm.ADS268.Close;
    if cdsMainrkey.IsNull then
    cdsMain.Refresh;
    Report_Frm.ADS268.Parameters[0].Value:=cdsMainrkey.Value;
    Report_Frm.ADS268.Open;
    Report_Frm.ppReport1.Reset;
    Report_Frm.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'Rep268_1.rtm';
    Report_Frm.ppReport1.Template.LoadFromFile;
    Report_Frm.ppReport1.SaveAsTemplate:=False;
    Report_Frm.ppReport1.Print;
  finally
    Report_Frm.ADS468.Close;
    Report_Frm.ADS268.Close;
    Report_Frm.Free;
  end;
end;

procedure Tfrm_Picking.bt_RejectClick(Sender: TObject);
begin
  inherited;
  if not (strtoint(vprev)in [2,3,4]) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;

  if messagebox(Self.Handle,'你确定要取消提交吗？','提示',MB_YesNo+MB_iconquestion)=idyes then
  begin
    try
      DM_frm.ADOConnection1.BeginTrans;

      cdsMain.Edit;
      cdsmainStatus.Value:=0;
      cdsmain.FieldByName('Auth_emplptr').Value:=null;
      cdsmain.FieldByName('Auth_date').Value:=null ;
      cdsMain.Post;
      cdsMain.ApplyUpdates(0)   ;

      DM_frm.cdsRead.Close;
      if cdsMain.FieldByName('rkey').IsNull  then  //刚保存的数据Rkey是Null.
        cdsMain.Refresh;
      DM_frm.cdsRead.CommandText:='delete from data0368  where apply_ptr='+cdsMainRkey.AsString;
      DM_frm.cdsRead.Execute;
      DM_frm.ADOConnection1.CommitTrans;

    except
      on e:Exception do
      begin
        DM_frm.ADOConnection1.RollbackTrans;
        ShowMessage('提交失败！'+#13#10+e.Message);
      end;
    end;
    dsMainStateChange(nil);
  end;
end;

procedure Tfrm_Picking.tblSaveClick(Sender: TObject);
begin
  with cdsMain do
  begin
    if cdsMainstatus.AsInteger=3 then  //如果状态=被退回
    begin
      if State <>dsEdit   then
        Edit;
      cdsMainstatus.Value:=0;//待提交
    end;

    if State in [dsEdit ,dsInsert] then
      Post;
  end;

  with cdsChild do
  if State in [dsEdit ,dsInsert] then
    Post;
  inherited;

end;


procedure Tfrm_Picking.dghChildColumns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  I_Left,I_Top,I_Width,X:Integer;
  Vpoint:   Tpoint;
begin
  with ((Sender as TControl).Parent).Parent as TDBGridEh do
  begin
    if  DataSource.DataSet is TClientDataSet then
    if ((((Sender as TControl).Parent).Parent as TDBGridEh).DataSource.DataSet as TClientDataSet).ReadOnly then
    Exit;
    if  DataSource.DataSet is TCustomADODataSet then
    if (DataSource.DataSet as TCustomADODataSet).LockType=ltReadOnly then
    Exit;
    if ReadOnly then        //如果当前表格控件是只读，退出。
    Exit;
  end;
  with ((Sender as TControl).Parent).Parent as TDBGridEh do  //Button的父是EDIT，EDIT的父才是DBGRIDEH控件
  begin
    Vpoint   := (Sender as TControl).Parent.ClientToScreen(Point((Sender as TControl).Left,(Sender as TControl).Top));
    I_Top:= Vpoint.y+(Sender as TControl).Height;
    if I_Top+250>Screen.Height-30 then
      I_Top:=Vpoint.y-250;
    I_Width:=700;
    x:=Screen.Width- Vpoint.X-I_Width+ (Sender as TControl).Parent.Width;
    if x<0 then
      I_Left:=Screen.Width -I_Width
    else
      I_Left:= Vpoint.X- (Sender as TControl).Parent.Width;
    if cds0017WM.Active=False then
      cds0017WM.Open;
    if ShowfrmSelectItem_private(Self,cds0017WM,'INV_PART_NUMBER',
              Trim(dghChild.FieldColumns['INV_PART_NUMBER'].Field.asstring),
              I_Left,I_Top,I_Width) then
    begin
      if not (dghChild.DataSource.DataSet.State in [dsEdit,dsInsert]) then
        dghChild.DataSource.DataSet.Edit;
      dghChild.DataSource.DataSet.FieldByName('INV_PART_NUMBER').Value :=
                    cds0017WM.FieldByName('INV_PART_NUMBER').value;
    end;
    if cds0017WM.Filtered then
    cds0017WM.Filtered :=False;
  end;
end;

end.


