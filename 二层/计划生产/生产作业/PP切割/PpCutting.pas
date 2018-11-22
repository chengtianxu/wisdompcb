unit PpCutting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MC, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, Menus, ppEndUsr, ppBands, ppPrnabl, ppClass,
  ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  DBClient, cds, Provider, ADODB, dxBar, cxClasses, ImgList, ActnList,
  Grids, DBGridEh, ToolWin, ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls,
  dxStatusBar,StrUtils, cxContainer, cxEdit, cxCurrencyEdit, cxDBEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, Mask,
  DBCtrls, Buttons,math, RzEdit, RzBtnEdt, ButtonEdit, EditBit, RzDBEdit,
  RzDBBnEd, DBButtonEdit;

type
  TMyThread = class(TThread)
  protected
    procedure Execute; override;
  end;

type
  TPpCutting_frm = class(TMC_f)
    cdsMainEMPL_CODE: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainMANU_PART_NUMBER: TStringField;
    cdsMainINV_PART_NUMBER: TStringField;
    cdsMainINV_NAME: TStringField;
    cdsMainINV_DESCRIPTION: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainTYPE: TSmallintField;
    cdsMainempl_ptr: TIntegerField;
    cdsMaincreate_empl_ptr: TIntegerField;
    cdsMaincreare_date: TDateTimeField;
    cdsMainrkey25: TIntegerField;
    cdsMainlam2: TStringField;
    cdsMainlam_ty_gp: TStringField;
    cdsMainrkey17: TIntegerField;
    cdsMainpanel_ln: TBCDField;
    cdsMainpanel_wd: TBCDField;
    cdsMainmanuf_qty: TIntegerField;
    cdsMainpanel_qty: TIntegerField;
    cdsMainremark: TWideStringField;
    cdsMaincreate_EMPLOYEE_NAME: TStringField;
    cdsChildrkey: TAutoIncField;
    cdsChildrkey731: TIntegerField;
    cdsChildrkey06: TIntegerField;
    cdsChildrkey17: TIntegerField;
    cdsChildmanuf_qty: TIntegerField;
    cdsChildpp_quota: TIntegerField;
    cdsChildpanel_qty: TIntegerField;
    cdsChildpanel_ln: TBCDField;
    cdsChildpanel_wd: TBCDField;
    cdsChildPP_TYP: TStringField;
    cdsChildpp_rc: TStringField;
    cdsChildpp_tg: TStringField;
    cdsChildpp_quota_len: TBCDField;
    cdsChildpp_quota_roll: TBCDField;
    cdsChildqg_flag: TBooleanField;
    cdsChildrkey733: TIntegerField;
    cdsChildremark: TWideStringField;
    dtChildrkey: TAutoIncField;
    dtChildrkey731: TIntegerField;
    dtChildrkey06: TIntegerField;
    dtChildrkey17: TIntegerField;
    dtChildmanuf_qty: TIntegerField;
    dtChildpp_quota: TIntegerField;
    dtChildpanel_qty: TIntegerField;
    dtChildpanel_ln: TBCDField;
    dtChildpanel_wd: TBCDField;
    dtChildPP_TYP: TStringField;
    dtChildpp_rc: TStringField;
    dtChildpp_tg: TStringField;
    dtChildpp_quota_len: TBCDField;
    dtChildpp_quota_roll: TBCDField;
    dtChildqg_flag: TBooleanField;
    dtChildrkey733: TIntegerField;
    dtChildremark: TWideStringField;
    cdsD005: TClientDataSet;
    cdsD005RKEY: TIntegerField;
    cdsD005EMPL_CODE: TStringField;
    cdsD005EMPLOYEE_NAME: TStringField;
    dtMainEMPL_CODE: TStringField;
    dtMainEMPLOYEE_NAME: TStringField;
    dtMaincreate_EMPLOYEE_NAME: TStringField;
    dtMainMANU_PART_NUMBER: TStringField;
    dtMainINV_PART_NUMBER: TStringField;
    dtMainINV_NAME: TStringField;
    dtMainINV_DESCRIPTION: TStringField;
    dtMainrkey: TIntegerField;
    dtMainTYPE: TWordField;
    dtMainempl_ptr: TIntegerField;
    dtMaincreate_empl_ptr: TIntegerField;
    dtMaincreare_date: TDateTimeField;
    dtMainrkey25: TIntegerField;
    dtMainlam2: TStringField;
    dtMainlam_ty_gp: TStringField;
    dtMainrkey17: TIntegerField;
    dtMainpanel_ln: TBCDField;
    dtMainpanel_wd: TBCDField;
    dtMainmanuf_qty: TIntegerField;
    dtMainpanel_qty: TIntegerField;
    dtMainremark: TWideStringField;
    dtMainrkey733: TIntegerField;
    dtMainpanel_qty_e: TIntegerField;
    dtMainpick_material_qty: TIntegerField;
    dtMainpick_material_qty_e: TIntegerField;
    cdsMainrkey733: TIntegerField;
    cdsMainpanel_qty_e: TIntegerField;
    cdsMainpick_material_qty: TIntegerField;
    cdsMainpick_material_qty_e: TIntegerField;
    edt_Filter: TEdit;
    Label1: TLabel;
    cds0017: TClientDataSet;
    cds0017RKEY: TIntegerField;
    cds0017CDSDesigner: TStringField;
    cds0017CDSDesigner2: TStringField;
    cds0017CDSDesigner3: TStringField;
    cds025: TClientDataSet;
    cds025RKEY: TIntegerField;
    cds025MANU_PART_NUMBER: TStringField;
    cds025MANU_PART_DESC: TStringField;
    dtChildmatrece_flag: TBooleanField;
    cdsChildmatrece_flag: TBooleanField;
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
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit16: TDBEdit;
    ADOUpdate1: TADOQuery;
    RadioGroup2: TRadioGroup;
    dtChildWORK_ORDER_NUMBER: TStringField;
    cdsChildWORK_ORDER_NUMBER: TStringField;
    cdsMainSurplusSheet: TIntegerField;
    Label26: TLabel;
    DBEdit24: TDBEdit;
    dtMainpp_quota_len: TFloatField;
    dtMainpp_quota_roll: TFloatField;
    cdsMainpp_quota_len: TFloatField;
    cdsMainpp_quota_roll: TFloatField;
    dtMainpp_quota_len_e: TFloatField;
    dtMainpp_quota_roll_e: TFloatField;
    cdsMainpp_quota_len_e: TFloatField;
    cdsMainpp_quota_roll_e: TFloatField;
    btn_InCut: TBitBtn;
    btn_Consumption: TButton;
    btn_RecordSee: TButton;
    Timer1: TTimer;
    Button1: TButton;
    dtMainCODE: TStringField;
    dtMainREJECT_DESCRIPTION: TStringField;
    dtMainrkey76: TIntegerField;
    dtMainrkey05: TIntegerField;
    dtMaind5_2_EMPLOYEE_NAME: TStringField;
    cdsMaind5_2_EMPLOYEE_NAME: TStringField;
    cdsMainCODE: TStringField;
    cdsMainREJECT_DESCRIPTION: TStringField;
    cdsMainrkey76: TIntegerField;
    cdsMainrkey05: TIntegerField;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    dtMaind5_2_EMPL_CODE: TStringField;
    cdsMaind5_2_EMPL_CODE: TStringField;
    cds076: TClientDataSet;
    cds076RKEY: TIntegerField;
    cds076CODE: TStringField;
    cds076REJECT_DESCRIPTION: TStringField;
    dt025: TADODataSet;
    dsp025: TDataSetProvider;
    dtMaincreate_EMPL_CODE: TStringField;
    cdsMaincreate_EMPL_CODE: TStringField;
    dt025RKEY: TIntegerField;
    dt025MANU_PART_NUMBER: TStringField;
    dt025MANU_PART_DESC: TStringField;
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsMainEMPL_CODEChange(Sender: TField);
    procedure cdsMainTYPEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btn_ConsumptionClick(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure edt_FilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure btn_RecordSeeClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure btn_InCutClick(Sender: TObject);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FilterFieldName:string;
    procedure FilterEditSet(Column: TColumnEh);
    procedure SetToolbarButtonStatus(Flag: Boolean); override;
    procedure RightsSetDataSetReadOnly;              override;
    function QueryNoCutting:Boolean;          //查询data0732表是否还有没有切割的记录。
    procedure SetButtonStatus; override;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PpCutting_frm: TPpCutting_frm;
  i_PPC_CONTROL2:Integer;  //允许的损坏比例 ,读取192表赋值

implementation

uses DM_f,PublicFile,  PpCutting_1,//formFindcds,
  PpCutting_2_unt, PpCutting3_unt, PpCutting5_unt;

{$R *.dfm}

procedure TMyThread.Execute;
begin
//  FreeOnTerminate := True; {这可以让线程执行完毕后随即释放}
//  with PpCutting_frm.cds025  do
//  if Active=False then
//  begin
//   {cds025需要打开数万行记录，运用多线程，多次加载数据}
//    PacketRecords:=5000;
//    open ;
//    while  1=1 do
//    if GetNextPacket=0  then
//    break;
//  end;
end;

procedure TPpCutting_frm.FormCreate(Sender: TObject);
begin
 {}if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;

  Caption:=application.Title ;    

 {  dm.ADOConnection1.Close;
 dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  // dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb;Data Source=172.18.0.8';
  dm.ADOConnection1.Open;
  UserRKEY := 1411;//2522;
  vprev:='4';   }

  inherited;
  SetEmployeeInfo(dtRead,dxStatusBar1);
  cdsMain.Open;    
  with cdsMain do
  begin
    try
      F_IsBatchOperating:=True;
      DghMain.SumList.Active:=True;
    finally
      F_IsBatchOperating:=False;
    end;
  end;
  cdsMain.Last;
  ChildDataSetOpen;

  NeedSave:=False;  //设置当前窗体不需要保存
end;

function TPpCutting_frm.QueryNoCutting:Boolean;
begin
  Result:=False;
  if  StrToBool(
    SQLResultValue(cdsRead,'if exists(select data0732.rkey from data0732 join data0731 on data0732.rkey731=data0731.rkey '
     +'where data0732.qg_flag=0 and data0731.TSTATUS=1 )select 1 else select 0')
    )then
    Result:=True;
end;

procedure TPpCutting_frm.RightsSetDataSetReadOnly;
begin
    cdsMain  .ReadOnly:=True;
    cdsChild .ReadOnly:=True;
    DghMain  .ReadOnly:=True;
    dghChild .ReadOnly:=True;
end;

procedure TPpCutting_frm.SetButtonStatus;
begin
  if cdsMain.FieldByName('Type').AsInteger=0 then
  begin
    btn_Consumption.Enabled:= True;
    btn_RecordSee  .Enabled:= True ;
  end
  else
  begin
    btn_Consumption.Enabled:= False;
    btn_RecordSee  .Enabled:= False ;
  end;
end;

procedure TPpCutting_frm.SetToolbarButtonStatus(Flag: Boolean);
begin
  dxBarManager.LockUpdate:=True;
  with   ActiveGridEH.DataSource.DataSet as TClientDataSet do
  begin
    tblAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4])and(IsEmpty=False);
    actEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4])and(IsEmpty=False);

    tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);
    actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);

    if ActiveGridEH=DghMain then
    begin
      tblDelete.Enabled:=False;
      actDelete.Enabled:=False;
      if cdsMain.Active then
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
      tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsMain.FieldByName('rkey').IsNull);
      actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4])and(cdsMain.FieldByName('rkey').IsNull);
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

//  btn_Consumption.Enabled:=(cdsMain.FieldByName('rkey').IsNull=False)
//     and(cdsMain.FieldByName('Type').AsInteger=0);
//  btn_RecordSee.Enabled:= (cdsMain.FieldByName('Type').AsInteger=0)
//     and (cdsMain.FieldByName('Rkey').IsNull =False) ;

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

procedure TPpCutting_frm.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Type').Value:=0;
end;

procedure TPpCutting_frm.cdsMainEMPL_CODEChange(Sender: TField);
begin
  inherited;
  with cdsD005 do
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
      cdsMain.FieldByName('empl_ptr').Value:=null;
      cdsMain.FieldByName('EMPLOYEE_NAME').Value:=null ;
    end
    else
    begin
      if Locate('EMPL_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMain.FieldByName('empl_ptr').Value      := FieldByName('rkey').Value ;
        cdsMain.FieldByName('EMPLOYEE_NAME').Value := FieldByName('EMPLOYEE_NAME').Value ;
        end
      else
        begin
        cdsMain.FieldByName('empl_ptr').Value:=null;
        cdsMain.FieldByName('EMPLOYEE_NAME').Value:=null ;
        ShowMessage('雇员代码不存在！！！');
        end;
    end;
  end;
end;

procedure TPpCutting_frm.cdsMainTYPEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsInteger=0 then
    Text:='正常切割'
  else
  if Sender.AsInteger=1 then
    Text:='损耗切割' ;
end;

procedure TPpCutting_frm.btn_ConsumptionClick(Sender: TObject);
var
  PpCutting_1_frm: TPpCutting_1_frm;
  i_panel_qty:Integer;
begin
  if i_PPC_CONTROL2=0 then     //在主窗体上定义的全局变量
  i_PPC_CONTROL2:=StrToInt(SQLResultValue(cdsRead,'select isnull(PPC_CONTROL2,0)from data0192') );
  try
    PpCutting_1_frm:= TPpCutting_1_frm.create(Application);
    with  PpCutting_1_frm. cds0730 do
    begin
      CommandText:=CommandText+#13+'and (data0730.[D017_PTR]= '
        +cdsMain.FieldByName('rkey17').AsString+')';
      Open;
    end;
    with  PpCutting_1_frm.cds0017  do
    begin
      CommandText:='select data0017.IES_PARAMETER_VALUE2,data0017.IES_PARAMETER_VALUE3 '
            +' from data0017 where rkey = '+cdsMainrkey17.AsString;
      cdsReadData(PpCutting_1_frm.cds0017);
    end;
    PpCutting_1_frm.edt_panel_qty    .Text:= '';
    PpCutting_1_frm.edt_pp_quota_len .Text:= '';
    PpCutting_1_frm.edt_pp_quota_roll.Text:= '';
    PpCutting_1_frm.edt_lam2     .DataSource:=dsMain;
    PpCutting_1_frm.edt_lam_ty_gp.DataSource:=dsMain;
    PpCutting_1_frm.edt_panel_qty_e.DataSource:=dsMain;
    with  PpCutting_1_frm do
    begin
      ControlsSetReadOnly([edt_lam2,edt_lam_ty_gp,edt_pp_quota_len,edt_pp_quota_roll,
      edt_EMPL_CODE,edt_EMPLOYEE_NAME,edt_d5_2_EMPLOYEE_NAME,edt_REJECT_DESCRIPTION,
      edt_panel_qty_e,edt_panel_qty_e1]);
      ControlsSetReadOnly([edt_panel_qty],False);

      Label_d5_2_EMPL_CODE    .Visible:=True;
      edt_d5_2_EMPL_CODE      .Visible:=True;
      Label_d5_2_EMPLOYEE_NAME.Visible:=True;
      edt_d5_2_EMPLOYEE_NAME  .Visible:=True;
      Label_CODE              .Visible:=True;
      edt_CODE                .Visible:=True;
      Label_REJECT_DESCRIPTION.Visible:=True;
      edt_REJECT_DESCRIPTION  .Visible:=True;
      Label_panel_qty_e       .Visible:=True;
      edt_panel_qty_e         .Visible:=True;
      Labe_panel_qty_e1      .Visible:=True;
      edt_panel_qty_e1        .Visible:=True;

      i_panel_qty:= Ceil(cdsMain.FieldByName('panel_qty').Value*i_PPC_CONTROL2/100
       -cdsMain.FieldByName('panel_qty_e').Value
      ) ;
      if i_panel_qty=1 then
      i_panel_qty:=2;//设置为最少切割2张
      edt_panel_qty_e1.Text:=IntToStr(i_panel_qty);
      CutType:=1;
    end;   
    PpCutting_1_frm.edt_panel_qty.OnChange:=  PpCutting_1_frm.proc_edt_panel_qtyChange;
    PpCutting_1_frm.cds735.Open;
    if PpCutting_1_frm.ShowModal =mrOK then
    begin
      try
        DM.ADOConnection1.BeginTrans;
        with ADOUpdate1 do
        begin
          Close;
          Parameters.ParamByName('panel_qty').Value         :=PpCutting_1_frm.edt_panel_qty.Text;
          Parameters.ParamByName('pp_quota_len').Value      :=PpCutting_1_frm.edt_pp_quota_len.Text;
          Parameters.ParamByName('pp_quota_roll').Value     :=PpCutting_1_frm.edt_pp_quota_roll.Text;
          Parameters.ParamByName('rkey733').Value           :=cdsMain.FieldByName('rkey').Value;
          Parameters.ParamByName('TYPE').Value              :=1;
          Parameters.ParamByName('empl_ptr').Value          :=PpCutting_1_frm.edt_EMPL_CODE.F_rkey;
          Parameters.ParamByName('create_empl_ptr').Value   :=EmplRKEY;
          Parameters.ParamByName('rkey25').Value            :=cdsMain.FieldByName('rkey25').Value;
          Parameters.ParamByName('lam2').Value              :=cdsMain.FieldByName('lam2').Value;
          Parameters.ParamByName('lam_ty_gp').Value         :=cdsMain.FieldByName('lam_ty_gp').Value;
          Parameters.ParamByName('rkey17').Value            :=cdsMain.FieldByName('rkey17').Value;
          Parameters.ParamByName('panel_ln').Value          :=cdsMain.FieldByName('panel_ln').Value;
          Parameters.ParamByName('panel_wd').Value          :=cdsMain.FieldByName('panel_wd').Value;
          Parameters.ParamByName('manuf_qty').Value         :=cdsMain.FieldByName('manuf_qty').Value;
          Parameters.ParamByName('panel_qty1').Value        :=PpCutting_1_frm.edt_panel_qty.Text;
          Parameters.ParamByName('pp_quota_len1').Value     :=PpCutting_1_frm.edt_pp_quota_len.Text;
          Parameters.ParamByName('pp_quota_roll1').Value    :=PpCutting_1_frm.edt_pp_quota_roll.Text;
          Parameters.ParamByName('remark').Value            :=PpCutting_1_frm.Memo_remark.Lines.Text;
          Parameters.ParamByName('rkey733_1').Value         :=cdsMain.FieldByName('rkey').Value;
          Parameters.ParamByName('panel_qty_e').Value       :=0;
          Parameters.ParamByName('pp_quota_len_e').Value    :=0;
          Parameters.ParamByName('pp_quota_roll_e').Value   :=0;
          Parameters.ParamByName('pick_material_qty').Value :=0;
          Parameters.ParamByName('rkey05').Value            :=PpCutting_1_frm.edt_d5_2_EMPL_CODE.F_rkey;
          Parameters.ParamByName('rkey76').Value            :=PpCutting_1_frm.edt_CODE.F_rkey;
          Open;           //写入733的记录   
        end;
        with PpCutting_1_frm.cds735 do       //修改DATA0735表的外键值
        begin
          DisableControls;
          First;
          while not eof do
          begin
            if State <>dsEdit then
            Edit;
            FieldByName('rkey733').Value:=ADOUpdate1.Fields[0].Value;
            Post;
            Next;
          end;
          EnableControls;
        end;

        if PpCutting_1_frm.cds735.ApplyUpdates(0)=0 then    //写入 735表中的发料记录
        begin
          if  PpCutting_1_frm.cds0730.ApplyUpdates(0)=0 then // 修改730表中PP库存记录
          begin
            DM.ADOConnection1.CommitTrans;
          end
          else
            DM.ADOConnection1.RollbackTrans;
        end
        else
          DM.ADOConnection1.RollbackTrans;
      except
        on e:Exception do
        begin
          if DM.ADOConnection1.InTransaction then
          DM.ADOConnection1.RollbackTrans;
          MsgError('通知失败！'+#13#10+e.Message);
        end;
      end;
      cdsMain.F_IsBatchOperating:=True;
      cdsMain.Close;
      cdsMain.Open;
      cdsMain.F_IsBatchOperating:=False;
      dsMainStateChange(dsMain);
      cdsMain.Locate('rkey',ADOUpdate1.Fields[0].Value,[]);       //重新定位
      ADOUpdate1.Close;
    end;

  finally
    PpCutting_1_frm.Free;
  end;

end;

procedure TPpCutting_frm.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  FilterEditSet(Column);
end;

procedure TPpCutting_frm.FilterEditSet(Column: TColumnEh);
begin
  if Column.Field.DataType in[ftString,ftWideString] then
  if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
  begin
    edt_Filter.Text:='';
    FilterFieldName:= Column.Field.FieldName;
    Label1.Caption:=Column.Field.DisplayLabel;
    edt_Filter.Left:=Label1.Left+5+ Label1.Width;
  end;
end;

procedure TPpCutting_frm.edt_FilterChange(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if trim(edt_Filter.Text) <> '' then
  begin
    F_IsBatchOperating:=true;
    Filtered := False;
    if  RadioGroup2.ItemIndex=0 then
      Filter:='Type=0'
    else
    if RadioGroup2.ItemIndex=1 then
      Filter:='Type=1'
    else
      Filter:=''  ;
    Filtered := true;
    F_IsBatchOperating:=False;
  end
  else
  begin
    F_IsBatchOperating:=true;
    Filtered := False;
    F_IsBatchOperating:=False;
  end;
end;

procedure TPpCutting_frm.FormShow(Sender: TObject);
begin
  inherited;
  FilterEditSet(DghMain.FieldColumns['MANU_PART_NUMBER']);
  ControlsSetReadOnly([DBEdit1,DBEdit2,DBEdit3,DBEdit4,DBEdit5,DBEdit6,DBEdit7,DBEdit8,DBEdit9,
  DBEdit10,DBEdit11,DBEdit12,DBEdit13,DBEdit14,DBEdit15,DBEdit16,DBEdit17,DBEdit18,DBEdit19,DBEdit20,DBEdit21,
  DBEdit22,DBEdit23,DBEdit24,DBMemo1,DBEdit25,DBEdit26,DBEdit27]);
                                                   //
  FindDisplayFields:=VarArrayOf(['rkey','creare_date','create_EMPL_CODE','create_EMPLOYEE_NAME','MANU_PART_NUMBER','INV_PART_NUMBER',
       'INV_NAME','INV_DESCRIPTION','EMPL_CODE','EMPLOYEE_NAME','lam2','lam_ty_gp','panel_ln','panel_wd',
       'manuf_qty','panel_qty','pp_quota_len','pp_quota_roll','remark','panel_qty_e','pp_quota_len_e',
       'pp_quota_roll_e','pick_material_qty','pick_material_qty_e']);

  FindFieldsName:=VarArrayOf(['EMPL_CODE','EMPLOYEE_NAME','create_EMPL_CODE','create_EMPLOYEE_NAME',
  'MANU_PART_NUMBER','INV_PART_NUMBER','INV_NAME','INV_DESCRIPTION','remark']);
  FindQueryFieldsName:=VarArrayOf(['data0005.EMPL_CODE','data0005.EMPLOYEE_NAME','d5.EMPL_CODE','d5.EMPLOYEE_NAME',
  'data0025.MANU_PART_NUMBER','data0017.INV_PART_NUMBER','data0017.INV_NAME','data0017.INV_DESCRIPTION','data0733.remark']);   //
                                                        //下列三个参数要一起使用，用于设置查询对话框的默认值
  Find_Def_FieldName    :=VarArrayOf(['creare_date']);
  Find_Def_Oper         :=VarArrayOf(['>=']);
  Find_Def_FieldValue   :=VarArrayOf([DateToStr(GetDataBaseDate(cdsRead,2)-7)]);
  Find_Def_Field2Value  :=VarArrayOf(['']);

  cdsReadData(cds0017);
  var_DropDown_Info:=TDropDownInfo.Create();       // 下列代码仅仅是在查询窗体中设置下拉列表，只需要设置以下属性
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_FindDataSet           :=cds0017;
  //  L_ColsInfo              :='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_DropdownColumn        :='INV_PART_NUMBER';
    L_ListDataSetFilterField:='原材料代码';
    L_ListResultField       :='原材料代码';
    L_GetValueField         :='INV_PART_NUMBER';
   // L_SetDataSet;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();       // 下列代码仅仅是在查询窗体中设置下拉列表，只需要设置以下属性
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_FindDataSet           :=dt025;
  //  L_ColsInfo              :='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_DropdownColumn        :='MANU_PART_NUMBER';
    L_ListDataSetFilterField:='MANU_PART_NUMBER';
    L_ListResultField       :='MANU_PART_NUMBER';
    L_GetValueField         :='MANU_PART_NUMBER';
   // L_SetDataSet;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();       // 下列代码仅仅是在查询窗体中设置下拉列表，只需要设置以下属性
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_FindDataSet           :=cdsD005;
  //  L_ColsInfo              :='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_DropdownColumn        :='EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='EMPL_CODE';
   // L_SetDataSet;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();       // 下列代码仅仅是在查询窗体中设置下拉列表，只需要设置以下属性
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_FindDataSet           :=cdsD005;
  //  L_ColsInfo              :='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_DropdownColumn        :='create_EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='create_EMPL_CODE';
   // L_SetDataSet;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
{  SetLength(Query_Info,4);
  Query_Info[0]:=TQueryInfo.Create();
  with Query_Info[0] do
  begin
    L_ListDataSetName  :=cds0017;                   //下拉列表数据集名
    L_DropdownColumn   :='INV_PART_NUMBER';         //添加下拉列表的字段名
    L_ListResultField  :='原材料代码';              //下拉列表数据集返回的字段名     AnsiString
  end;
  Query_Info[1]:=TQueryInfo.Create();
  with Query_Info[1] do
  begin
    L_ListDataSetName  :=dt025;                        //下拉列表数据集名
    L_DropdownColumn   :='MANU_PART_NUMBER';            //添加下拉列表的字段名
    L_ListResultField  :='MANU_PART_NUMBER';            //下拉列表数据集返回的字段名     AnsiString
  end;
  Query_Info[2]:=TQueryInfo.Create();
  with Query_Info[2] do
  begin
    L_ListDataSetName  :=cdsD005;                        //下拉列表数据集名
    L_DropdownColumn   :='EMPL_CODE';            //添加下拉列表的字段名
    L_ListResultField  :='EMPL_CODE';            //下拉列表数据集返回的字段名     AnsiString
  end;
  Query_Info[3]:=TQueryInfo.Create();
  with Query_Info[3] do
  begin
    L_ListDataSetName  :=cdsD005;                        //下拉列表数据集名
    L_DropdownColumn   :='create_EMPL_CODE';            //添加下拉列表的字段名
    L_ListResultField  :='EMPL_CODE';            //下拉列表数据集返回的字段名     AnsiString
  end;     }

  Timer1.Interval:=900000  ;     //每15分钟运行一次
  Timer1.Enabled:=False;

  if QueryNoCutting() then
    begin
      btn_InCut.Font.Color:=clRed ;
    end
  else
    begin
      btn_InCut.Font.Color:=clBlack ;
      Timer1.Enabled:=True;
    end;
  Curr_Date:=GetDataBaseDate(cdsRead,2) ;
end;

procedure TPpCutting_frm.cdsMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if Trim(edt_Filter.Text) <>'' then
  Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(edt_Filter.Text )) ;
end;

procedure TPpCutting_frm.btn_RecordSeeClick(Sender: TObject);
var
  PpCutting_2_frm: TPpCutting_2_frm;
begin
  inherited;
  try
    PpCutting_2_frm:= TPpCutting_2_frm .Create(Application);
    PpCutting_2_frm.cdsMain.CommandText:=PpCutting_2_frm.cdsMain.F_SQLSelectFrom
    +#13+'where rkey733 = ' +cdsMainRkey.AsString;
    PpCutting_2_frm.cdsMain.Open;
    PpCutting_2_frm.ShowModal;
  finally
    PpCutting_2_frm.Free;
  end
end;

procedure TPpCutting_frm.RadioGroup2Click(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if trim(edt_Filter.Text) = '' then
  begin
    F_IsBatchOperating:=True;
    Filtered := False;
    if  RadioGroup2.ItemIndex=0 then
      Filter:='Type=0'
    else
    if RadioGroup2.ItemIndex=1 then
      Filter:='Type=1'
    else
      Filter:='';
    Filtered := true;
    F_IsBatchOperating:=False;
  end
  else
  edt_FilterChange(nil);
end;

procedure TPpCutting_frm.btn_InCutClick(Sender: TObject);
var
  PpCutting3_frm: TPpCutting3_frm;
begin
  inherited;
  PpCutting3_frm:= TPpCutting3_frm.Create(Application);
  try
    PpCutting3_frm.ShowModal;
    try
      if  PpCutting3_frm.ADOUpdate.Active then
      begin
        cdsMain.F_IsBatchOperating:=True;
        cdsMain.Close;
        cdsMain.Open;
        cdsMain.Locate('rkey',PpCutting3_frm.ADOUpdate.Fields[0].AsInteger,[]);     //如果有插入新记录，定位到最后一次的记录行
        ChildDataSetOpen;     //因为已将主数据集的 F_IsBatchOperating设置为真，所以要手工打开子数据集
        //SetToolbarButtonStatus(ActiveGridEH.DataSource.DataSet.State in[dsEdit,dsInsert]=False);
      end;
      
    finally
      cdsMain.F_IsBatchOperating:=False;
    end;
  finally
    PpCutting3_frm.Free;
  end;
end;

procedure TPpCutting_frm.cdsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  with   DataSet do
  begin
    if FieldByName('TYPE').AsInteger=0 then
   // 剩余张数= 切割张数	+ 损耗切割总张数 -已正常领用PP张数  -已损耗领用PP张数
    FieldByName('SurplusSheet').Value:= FieldByName('panel_qty').Value+
    FieldByName('panel_qty_e').Value-FieldByName('pick_material_qty').Value-FieldByName('pick_material_qty_e').Value;
  end;
end;

procedure TPpCutting_frm.Timer1Timer(Sender: TObject);
begin
  inherited;
  if QueryNoCutting() then
    begin
      btn_InCut.Font.Color:=clRed ;
    end
  else
    begin
      btn_InCut.Font.Color:=clBlack ;
      Timer1.Enabled:=True;
    end;
end;

procedure TPpCutting_frm.Button1Click(Sender: TObject);
var
  PpCutting5_frm: TPpCutting5_frm;
begin
  inherited;
  PpCutting5_frm:= TPpCutting5_frm.Create(Application);
  try
    with PpCutting5_frm.cdsMain do
    begin
      CommandText:=F_SQLSelectFrom+#13+'where data0735.rkey733 = '+intTostr(cdsMainRkey.AsInteger);
      Open;
    end;
    PpCutting5_frm.ShowModal;
  finally
    PpCutting5_frm.Free;
  end;
end;

procedure TPpCutting_frm.FormActivate(Sender: TObject);
begin
  inherited;
//  TMyThread.Create(False);
end;

end.
