unit formPlanMain04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Menus, Buttons;

type
  TfrmPlanMain04 = class(TSingleDataSet_f)
    cdsMainCDSDesigner: TDateTimeField;
    cdsMainCDSDesigner2: TStringField;
    cdsMainCDSDesigner3: TStringField;
    cdsMainCDSDesigner4: TStringField;
    cdsMainCDSDesigner5: TStringField;
    cdsMainCDSDesigner6: TStringField;
    cdsMainCDSDesigner7: TStringField;
    cdsMainCDSDesigner8: TStringField;
    cdsMainCDSDesigner9: TStringField;
    cdsMainCDSDesigner10: TStringField;
    cdsMainCDSDesigner11: TDateTimeField;
    cdsMainCDSDesigner12: TDateTimeField;
    cdsMainCDSDesigner13: TWideStringField;
    cdsMainCDSDesigner14: TBCDField;
    cdsMainCDSDesigner15: TStringField;
    cdsMainCDSDesigner16: TBCDField;
    cdsMainCDSDesigner17: TStringField;
    cdsMainCDSDesigner18: TDateTimeField;
    cdsMainCDSDesigner19: TDateTimeField;
    cdsMainCDSDesigner20: TDateTimeField;
    cdsMainCDSDesigner21: TBCDField;
    cdsMainCDSDesigner22: TBCDField;
    cdsMainCDSDesigner24: TBCDField;
    cdsMainCDSDesigner23: TStringField;
    cdsMainCDSDesigner25: TStringField;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label2: TLabel;
    dteEnd: TDateTimePicker;
    dteBegin: TDateTimePicker;
    dteBeginTime: TDateTimePicker;
    dteEndTime: TDateTimePicker;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    BtFind: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure cdsMainCDSDesigner24GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dteBeginChange(Sender: TObject);
    procedure dteEndChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtFindClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure RightsSetDataSetReadOnly; override;
    procedure SetToolbarButtonStatus(Flag:Boolean);override;
    { Public declarations }
  end;

var
  frmPlanMain04: TfrmPlanMain04;

implementation

uses formPlanMain, PublicFile;

{$R *.dfm}
procedure TfrmPlanMain04.RightsSetDataSetReadOnly;
begin
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

procedure TfrmPlanMain04.SetToolbarButtonStatus(Flag: Boolean);
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
        tblExport.Enabled:=True  ;
        actExport.Enabled:=True  ;
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

procedure TfrmPlanMain04.cdsMainCDSDesigner24GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  Text := FloatToStr(round(Sender.AsFloat * 10000)/100) + '%';
end;

procedure TfrmPlanMain04.FormCreate(Sender: TObject);
begin
  inherited;
  DghMain.FrozenCols:=6;
  dteBegin.Date:= Date-1;
  dteEnd  .Date:= Date;
  dteBeginChange(nil);
  dteEndChange(nil);
  Edit1Change(nil);
  BtFindClick(nil);

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo              :='FASSET_CODE/设备代码/100,FASSET_NAME/设备名称/200,FASSET_DESC/设备描述/150,DEPT_CODE/部门代码/50,DEPT_NAME/部门名称/80';
    L_FindDataSet           :=frmPlanMain.cds0417;
    L_DropdownColumn        :='设备编号';
    L_ListDataSetFilterField:='FASSET_CODE';
    L_ListResultField       :='FASSET_CODE';
    L_GetValueField         :='设备编号';
//    L_SourceField           :=varArrayOf(['createBy_PTR','EMPLOYEE_NAME']);
//    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
//    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120'; // rkey//0,
    L_FindDataSet           :=frmPlanMain.cds0015;
    L_DropdownColumn        :='工厂';
    L_ListDataSetFilterField:='ABBR_NAME';
    L_ListResultField       :='ABBR_NAME';
    L_GetValueField         :='工厂';
//    L_SourceField           :=varArrayOf(['createBy_PTR','EMPLOYEE_NAME']);
//    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
//    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120'; // rkey//0,
    L_FindDataSet           :=frmPlanMain. cds0005;
    L_DropdownColumn        :='雇员';
    L_ListDataSetFilterField:='EMPLOYEE_NAME';
    L_ListResultField       :='EMPLOYEE_NAME';
    L_GetValueField         :='雇员';
//    L_SourceField           :=varArrayOf(['createBy_PTR','EMPLOYEE_NAME']);
//    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
//    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120'; // rkey//0,
    L_FindDataSet           :=frmPlanMain.cds840;
    L_DropdownColumn        :='责任小组';
    L_ListDataSetFilterField:='Location';
    L_ListResultField       :='Location';
    L_GetValueField         :='责任小组';
//    L_SourceField           :=varArrayOf(['createBy_PTR','EMPLOYEE_NAME']);
//    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  FindNotDisplayFields:=VarArrayOf(['开始保养时间','达成率']);
  Find_Def_FieldName    := VarArrayOf(['计划保养时间']);
  Find_Def_Oper         := VarArrayOf(['>=']);
  Find_Def_FieldValue   := VarArrayOf([DateToStr(Curr_Date-7)] );
end;

procedure TfrmPlanMain04.FormShow(Sender: TObject);
//var
//  PriorCol:Integer;
begin
  inherited;
//  DghMain.FieldColumns['TimeCons'].DisplayFormat
 { try
    cdsMain.DisableControls  ;
    cdsMain.F_IsBatchOperating:=True;
    PriorCol :=   DghMain.FieldColumns['保养人'].Index-1;
    if PriorCol<0 then
      PriorCol:=0;
    DghMain.Columns[PriorCol].Footer.ValueType := fvtStaticText;
    DghMain.Columns[PriorCol].Footer.Value := '汇总：';
    DghMain.FieldColumns['保养消耗时间'].Footer.ValueType := fvtSum; //fvtSum
    DghMain.FieldColumns['达成率'].Footer.ValueType := fvtAvg;
    DghMain.FieldColumns['达成率'].Footer.Value:='50.5';
    DghMain.Columns[0].Footer.Value := '50.5';

    DghMain.FieldColumns['标准消耗时间'].Footer.ValueType := fvtSum;
    DghMain.FooterFont.Color:= clBlue;
//    DghMain.SumList.Active:=true;
//    DghMain.FieldColumns['TimeCons'].Footer.Value:='12300';
  finally
    cdsMain.F_IsBatchOperating:=false;
    cdsMain.EnableControls ;
  end;     }

end;

procedure TfrmPlanMain04.dteBeginChange(Sender: TObject);
begin
  inherited;
//  cdsMain.Params.ParamByName('vPlanMainDate').Value:= DateToStr(dteBegin.Date);
//  cdsMain.Params.ParamByName('SD').Value:=
//              DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time);

end;

procedure TfrmPlanMain04.dteEndChange(Sender: TObject);
begin
  inherited;
//  cdsMain.Params.ParamByName('ED').Value:=
//             DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time);
end;

procedure TfrmPlanMain04.Edit1Change(Sender: TObject);
begin
  inherited;
//  if Edit1.Text<>'' then
//  begin
//    if  StrToFloat(edit1.Text)<=0 then
//    begin
//      MsgError('必须大于0！！！');
//      Exit;
//    end;
//    if ComboBox1.ItemIndex=0 then
//      cdsMain.F_SQLWhere:='where 达成率>'+FloatToStr(StrToFloat(edit1.Text)/100)
//    else
//    if ComboBox1.ItemIndex=1 then
//      cdsMain.F_SQLWhere:='where 达成率>='+FloatToStr(StrToFloat(edit1.Text)/100)
//    else
//    if ComboBox1.ItemIndex=2 then
//      cdsMain.F_SQLWhere:='where 达成率<'+FloatToStr(StrToFloat(edit1.Text)/100)
//    else
//    if ComboBox1.ItemIndex=3 then
//      cdsMain.F_SQLWhere:='where 达成率<='+FloatToStr(StrToFloat(edit1.Text)/100);
//  end
//  else
//  cdsMain.F_SQLWhere:='';
end;

procedure TfrmPlanMain04.BtFindClick(Sender: TObject);
var
  strSQL:string;
begin
  inherited;
  with cdsMain do
  begin
    strSQL:='where ([计划保养时间]='+ QuotedStr(FormatDateTime('yyyy-m-d',dteBegin.Date))
    +')or([实际完成时间]>='+ QuotedStr(FormatDateTime('yyyy-m-d h:n:s',StrToDateTime(DateToStr(dteBegin.Date)+' '+TimeToStr(dteBeginTime.Time))))
    +' and [实际完成时间]<'+ QuotedStr(FormatDateTime('yyyy-m-d h:n:s',StrToDateTime(DateToStr(dteEnd.Date)+' '+TimeToStr(dteEndTime.Time))))+')';
    if Edit1.Text<>'' then
    begin
      if ComboBox1.ItemIndex=0 then
        strSQL:=strSQL+' and 达成率>'+FloatToStr(StrToFloat(edit1.Text)/100)
      else
      if ComboBox1.ItemIndex=1 then
        strSQL:=strSQL+' and 达成率>='+FloatToStr(StrToFloat(edit1.Text)/100)
      else
      if ComboBox1.ItemIndex=2 then
        strSQL:=strSQL+' and 达成率<'+FloatToStr(StrToFloat(edit1.Text)/100)
      else
      if ComboBox1.ItemIndex=3 then
        strSQL:=strSQL+' and 达成率<='+FloatToStr(StrToFloat(edit1.Text)/100);
    end;
    Close;
    CommandText:=F_SQLSelectFrom+#13+strSQL+#13+F_SQLORderBY;
    Open;
  end;
end;

procedure TfrmPlanMain04.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#13,#8 ,#46]) then
  key := #0;
end;

procedure TfrmPlanMain04.cdsMainAfterOpen(DataSet: TDataSet);
var
  r_1,r_2,r_3:Real;
begin
  inherited;
  DghMain.FieldColumns['保养消耗时间'].Footer.Value:='';
  DghMain.FieldColumns['标准消耗时间'].Footer.Value:='';
  DghMain.FieldColumns['达成率'].Footer.Value:='';
  r_1:=0;
  r_2:=0;
  r_3:=0;
  with cdsRead do
  begin
    Data:=cdsMain.Data;
    First;
    while not eof do
    begin
      if FieldByName('保养消耗时间').AsFloat>0 then
      r_1:=r_1+FieldByName('保养消耗时间').Value;

      if FieldByName('标准消耗时间').AsFloat>0 then
      r_2:=r_2+FieldByName('标准消耗时间').Value;

      if FieldByName('达成率').AsFloat>0 then
      r_3:=r_3+FieldByName('达成率').Value;

      Next;
    end;
    if r_1>0 then
    DghMain.FieldColumns['保养消耗时间'].Footer.Value:= '合计：'+formatfloat('0.##',r_1) ;
    if r_2>0 then
    DghMain.FieldColumns['标准消耗时间'].Footer.Value:= '合计：'+formatfloat('0.##',r_2) ;
    if  r_3>0 then
    r_3:=r_3*100/cdsMain.RecordCount;
    DghMain.FieldColumns['达成率'].Footer.Value:='平均：'+(formatfloat('0.##',r_3))+'%';
  end;

end;

end.
