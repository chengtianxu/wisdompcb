unit form_Picking1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet_unt, ppDB,
  ppDBPipe, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppRelatv, ppProd,
  ppReport, ppComm, ppEndUsr, ImgList,  DB,
  DBClient, cds, Provider, ADODB, Grids, DBGridEh, ToolWin, ComCtrls,
  StdCtrls, RzPanel, ExtCtrls,  Menus, Buttons, RzButton;

type
  Tfrm_Picking1 = class(TSingleDataSet_frm)
    cds0034: TClientDataSet;
    cds0005: TClientDataSet;
    cds0094: TClientDataSet;
    cds0015: TClientDataSet;
    cds0417: TClientDataSet;
    cds0831: TClientDataSet;
    cds835: TClientDataSet;
    cds0017: TClientDataSet;
    cds0034CDSDesigner: TStringField;
    cds0034CDSDesigner2: TStringField;
    cds0005CDSDesigner: TStringField;
    cds0005CDSDesigner2: TStringField;
    cds0094CDSDesigner: TStringField;
    cds0094CDSDesigner2: TStringField;
    cds0015CDSDesigner: TStringField;
    cds0417CDSDesigner2: TStringField;
    cds0017CDSDesigner: TStringField;
    cds0017CDSDesigner2: TStringField;
    cds835CDSDesigner: TStringField;
    cds835CDSDesigner2: TStringField;
    cds0417CDSDesigner: TStringField;
    cdsMainCDSDesigner: TStringField;
    cdsMainCDSDesigner2: TDateTimeField;
    cdsMainCDSDesigner3: TDateTimeField;
    cdsMainCDSDesigner4: TStringField;
    cdsMainCDSDesigner5: TStringField;
    cdsMainCDSDesigner6: TStringField;
    cdsMainCDSDesigner7: TStringField;
    cdsMainCDSDesigner8: TStringField;
    cdsMainCDSDesigner9: TStringField;
    cdsMainCDSDesigner10: TStringField;
    cdsMainCDSDesigner11: TStringField;
    cdsMainCDSDesigner12: TStringField;
    cdsMainCDSDesigner13: TStringField;
    cdsMainCDSDesigner14: TStringField;
    cdsMainCDSDesigner15: TBooleanField;
    cdsMainCDSDesigner16: TStringField;
    cdsMainCDSDesigner17: TStringField;
    cdsMainCDSDesigner18: TStringField;
    cdsMainCDSDesigner19: TStringField;
    cdsMainCDSDesigner20: TDateTimeField;
    cdsMainCDSDesigner21: TStringField;
    cdsMainCDSDesigner22: TStringField;
    cdsMainCDSDesigner23: TStringField;
    cdsMainDEPT_PTR: TIntegerField;
    cdsMainCDSDesigner25: TStringField;
    cdsMainCDSDesigner26: TStringField;
    cdsMainCDSDesigner27: TStringField;
    cdsMainCDSDesigner28: TFloatField;
    cdsMainCDSDesigner30: TStringField;
    cdsMainCDSDesigner31: TStringField;
    cdsMainCDSDesigner32: TStringField;
    cdsMainCDSDesigner33: TStringField;
    cdsMainVMI: TStringField;
    cdsMainCDSDesigner34: TBCDField;
    cdsMainCDSDesigner35: TBCDField;
    cdsMainCDSDesigner36: TStringField;
    cdsMainCDSDesigner24: TStringField;
    cdsMainCDSDesigner29: TFloatField;
    Label13: TLabel;
    Label12: TLabel;
    BtFind: TSpeedButton;
    dteEnd: TDateTimePicker;
    dteBegin: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dteBeginChange(Sender: TObject);
    procedure dteEndChange(Sender: TObject);
    procedure BtFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure RightsSetDataSetReadOnly;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Picking1: Tfrm_Picking1;

implementation

uses  DM_unt, PublicFile, form_Picking;//

{$R *.dfm}

procedure Tfrm_Picking1.RightsSetDataSetReadOnly;
begin

  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

procedure Tfrm_Picking1.FormCreate(Sender: TObject);
begin
  inherited;
  dteBegin.Date:=Date-30;
  dteEnd  .Date:=Date;
  dteBeginChange(nil);
  dteEndChange(nil);
  BtFind.Click;
  NeedSave:=False;

  Find_DisplayFields:= VarArrayOf(['申领单号','审核日期','申领部门','类型',
  '部门名称','申领人代码','申领员工名称','审核状态','工厂','审核员工代码', '审核员工名称',
  '设备责任小组','供应商','材料编码','材料名称/规格','申领数量', '空调事业部工作单号',
  '维修单单号','保养日期','保养周期','设备编号','设备名称','使用区域','是否VMI','备注']);
  Find_FieldsName       := VarArrayOf(['材料名称/规格']);
  Find_QueryFieldsName  := VarArrayOf(['[材料名称/规格]']);

end;

procedure Tfrm_Picking1.actFindExecute(Sender: TObject);
begin
//  FindFormHeight:=520;

 inherited;                                          // '打印否','审核状态','申领数量','单位','确认状态'
 { if ShowfrmFindcds(Self,cdsMain,frmFindOutSQL,[],[],[],[],600) then
  begin
    cdsMain.Close;
    cdsMain.CommandText:=cdsMain.F_SQLSelectFrom+#13+'where '+ frmFindOutSQL;
    //ShowMessage(cdsMain.CommandText);
    cdsMain.Open;
  end; }

end;

procedure Tfrm_Picking1.FormShow(Sender: TObject);
begin
  inherited;
//  SetLength(Query_Info,11);
//  Query_Info[0]:=TQueryInfo.Create();
//  with Query_Info[0] do
//  begin
//    L_ListDataSetName       :=cds0005;
//    L_DropdownColumn        :='申领员工名称';   //雇员
//    L_ListResultField       :='员工名称';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds0005;
    L_ColsInfo              :='员工代码/员工代码/100,员工名称/员工名称/150';
    L_DropdownColumn        :='申领人代码';   //审批流程代码
    L_ListDataSetFilterField:='员工代码';
    L_ListResultField       :='员工代码';
    L_GetValueField         :='申领人代码';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds0005;
    L_ColsInfo              :='员工代码/员工代码/100,员工名称/员工名称/150';
    L_DropdownColumn        :='审核员工代码';   //审批流程代码
    L_ListDataSetFilterField:='员工代码';
    L_ListResultField       :='员工代码';
    L_GetValueField         :='审核员工代码';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[1]:=TQueryInfo.Create();
//  with Query_Info[1] do
//  begin
//    L_ListDataSetName       :=cds0005;
//    L_DropdownColumn        :='审核员工代码';   //雇员代码
//    L_ListResultField       :='员工代码';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds0034;
    L_ColsInfo              :='申领部门/申领部门/100,部门名称/部门名称/150';
    L_DropdownColumn        :='部门名称';   //审批流程代码
    L_ListDataSetFilterField:='部门名称';
    L_ListResultField       :='部门名称';
    L_GetValueField         :='部门名称';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[2]:=TQueryInfo.Create();
//  with Query_Info[2] do
//  begin
//    L_ListDataSetName       :=cds0034;
//    L_DropdownColumn        :='部门名称';
//    L_ListResultField       :='部门名称';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds0094;
    L_ColsInfo              :='审批流程代码/审批流程代码/100,审批流程/审批流程/150';
    L_DropdownColumn        :='审批流程代码';   //审批流程代码
    L_ListDataSetFilterField:='审批流程代码';
    L_ListResultField       :='审批流程代码';
    L_GetValueField         :='审批流程代码';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[3]:=TQueryInfo.Create();
//  with Query_Info[3] do
//  begin
//    L_ListDataSetName       :=cds0094;
//    L_DropdownColumn        :='审批流程代码';
//    L_ListResultField       :='审批流程代码';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds0015;
    L_ColsInfo              :='工厂/工厂/150';
    L_DropdownColumn        :='工厂';   //审批流程代码
    L_ListDataSetFilterField:='工厂';
    L_ListResultField       :='工厂';
    L_GetValueField         :='工厂';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[4]:=TQueryInfo.Create();
//  with Query_Info[4] do
//  begin
//    L_ListDataSetName       :=cds0015;
//    L_DropdownColumn        :='工厂';
//    L_ListResultField       :='工厂';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds0417;
    L_ColsInfo              :='设备编号/设备编号/120,设备名称/设备名称/200';
    L_DropdownColumn        :='设备编号';   //审批流程代码
    L_ListDataSetFilterField:='设备编号';
    L_ListResultField       :='设备编号';
    L_GetValueField         :='设备编号';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[5]:=TQueryInfo.Create();
//  with Query_Info[5] do
//  begin
//    L_ListDataSetName       :=cds0417;
//    L_DropdownColumn        :='设备代码';
//    L_ListResultField       :='设备代码';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds0017;
    L_ColsInfo              :='材料编码/材料编码/120,材料名称规格/材料名称规格/250';
    L_DropdownColumn        :='材料编码';   //审批流程代码
    L_ListDataSetFilterField:='材料编码';
    L_ListResultField       :='材料编码';
    L_GetValueField         :='材料编码';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[6]:=TQueryInfo.Create();
//  with Query_Info[6] do
//  begin
//    L_ListDataSetName       :=cds0017;
//    L_DropdownColumn        :='材料编码';   //雇员代码
//    L_ListResultField       :='材料编码';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=cds835;
    L_ColsInfo              :='空调事业部工作单号/空调事业部工作单号/150,工作任务说明/工作任务说明/200';
    L_DropdownColumn        :='空调事业部工作单号';   //审批流程代码
    L_ListDataSetFilterField:='空调事业部工作单号';
    L_ListResultField       :='空调事业部工作单号';
    L_GetValueField         :='空调事业部工作单号';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[7]:=TQueryInfo.Create();
//  with Query_Info[7] do
//  begin
//    L_ListDataSetName       :=cds835;
//    L_DropdownColumn        :='空调事业部工作单号';   //雇员代码
//    L_ListResultField       :='空调事业部工作单号';
//  end;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_FindDataSet           :=frm_Picking.cds0840;
    L_ColsInfo              :='Location/设备责任小组/150';
    L_DropdownColumn        :='设备责任小组';   //审批流程代码
    L_ListDataSetFilterField:='Location';
    L_ListResultField       :='Location';
    L_GetValueField         :='设备责任小组';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[9]:=TQueryInfo.Create();
//  with Query_Info[9] do
//  begin
//    L_ListDataSetName       :=frm_Picking.cds0840;
//    L_DropdownColumn        :='设备责任小组';
//    L_ListResultField       :='Location';
//  end;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
//    L_SourceDataSet         :=cdsMain;
//    L_GridName              :=DghMain;
//    L_ListDataSet           :=cds0094;
//    L_ColsInfo              :='员工代码/员工代码/100,员工名称/员工名称/150';
//    L_DropdownColumn        :='';   //审批流程代码
//    L_ListDataSetFilterField:='';
//    L_ListResultField       :='';
//    L_GetValueField         :='';
    L_DropdownColumn        :='类型';
    L_AddPickList           :=varArrayOf(['维修','维护','工程','公用']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
//  Query_Info[10]:=TQueryInfo.Create();
//  with Query_Info[10] do
//  begin
//    //L_ListDataSetName       :=frm_Picking.cds0840;
//    L_DropdownColumn        :='类型';
//    L_AddPickList           :=varArrayOf(['维修','维护','工程','公用']);
//  end;
end;

procedure Tfrm_Picking1.dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain.Params.ParamByName('SD').Value:=  DateToStr(dteBegin.Date);
end;

procedure Tfrm_Picking1.dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain.Params.ParamByName('ED').Value:=  DateToStr(dteEnd.Date+1);
end;

procedure Tfrm_Picking1.BtFindClick(Sender: TObject);
begin
  inherited;
  cdsMain.Close;
  cdsMain.CommandText:=cdsMain.F_SQLSelectFrom;
  cdsMain.Open;
end;

procedure Tfrm_Picking1.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized  ;
end;

end.
