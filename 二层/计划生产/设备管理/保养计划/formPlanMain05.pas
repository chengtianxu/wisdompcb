unit formPlanMain05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Menus;

type
  TfrmPlanMain05 = class(TSingleDataSet_f)
    cdsMainFASSET_CODE: TStringField;
    cdsMainFASSET_NAME: TStringField;
    cdsMainRKEY: TAutoIncField;
    cdsMainD417_ptr: TIntegerField;
    cdsMainMainCycl: TStringField;
    cdsMainStdTimeCons: TBCDField;
    dtMainFASSET_CODE: TStringField;
    dtMainFASSET_NAME: TStringField;
    dtMainRKEY: TAutoIncField;
    dtMainD417_ptr: TIntegerField;
    dtMainMainCycl: TStringField;
    dtMainStdTimeCons: TBCDField;
    cds0417L: TClientDataSet;
    cds0417Lrkey: TIntegerField;
    cds0417LFASSET_CODE: TStringField;
    cds0417LFASSET_NAME: TStringField;
    cds0417LFASSET_DESC: TStringField;
    dtMainDEPT_CODE: TStringField;
    dtMainDEPT_NAME: TStringField;
    cdsMainDEPT_CODE: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cds0417LDEPT_CODE: TStringField;
    cds0417LDEPT_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsMainFASSET_CODEChange(Sender: TField);
    procedure FormShow(Sender: TObject);
  private
    procedure SetToolbarButtonStatus(Flag: Boolean);override;
    function SaveBeforeCheck():Boolean;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanMain05: TfrmPlanMain05;

implementation

uses formPlanMain, PublicFile, DM_f;

{$R *.dfm}

function TfrmPlanMain05.SaveBeforeCheck():Boolean;
var
  strMsg,strSQL:string;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then     //usModified
    Post;
    if FieldByName('D417_ptr').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('FASSET_CODE').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('MainCycl').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('MainCycl').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('StdTimeCons').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('StdTimeCons').DisplayLabel+'”的值不能为空！！！'+#13;

    if (FieldByName('D417_ptr').IsNull=False)and(FieldByName('MainCycl').IsNull=False)then
    if (UpdateStatus=usInserted)or(
         (UpdateStatus=usModified) and ((UpperCase(FieldByName('D417_ptr').NewValue)<>UpperCase(FieldByName('D417_ptr').OldValue))
         or((UpperCase(FieldByName('MainCycl').NewValue)<>UpperCase(FieldByName('MainCycl').OldValue))))
         ) then
    begin
      strSQL:='select rkey from Data0847 where D417_ptr='+IntToStr(FieldByName('D417_ptr').NewValue)
        +' and MainCycl='+QuotedStr(FieldByName('MainCycl').NewValue);
      if RecordExists(strSQL,cdsRead)then
      begin
        strMsg:=strMsg+'字段：“'+FieldByName('FASSET_CODE').DisplayLabel+'”的值“'+trim(FieldByName('FASSET_CODE').NewValue)
          +'”，字段：“'+FieldByName('MainCycl').DisplayLabel+'”的值“'+trim(FieldByName('MainCycl').NewValue)+'”已经存在！！！'+#13
      end;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure TfrmPlanMain05.SetToolbarButtonStatus(Flag: Boolean);
begin
  with cdsMain   do
  begin
    dxBarManager.LockUpdate:=True;

    tblAdd.Enabled:=Flag and (StrToInt(vprev)in [2,3,4]);
    actAdd.Enabled:=Flag and (StrToInt(vprev)in [2,3,4]);

    tblEdit.Enabled:=Flag and (StrToInt(vprev)in [2,3,4]);
    actEdit.Enabled:=Flag and (StrToInt(vprev)in [2,3,4]);

    tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,3,4]);
    actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,3,4]);

    if ((State  in [dsEdit,dsInsert])or(ChangeCount>0))  then
      begin
        tblSave.Enabled:=True and(StrToInt(vprev)in [2,3,4]);
        actSave.Enabled:=True and(StrToInt(vprev)in [2,3,4]);
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
        tblExport.Enabled:=True  and(StrToInt(vprev)in [2,3,4]);
        actExport.Enabled:=True  and(StrToInt(vprev)in [2,3,4]);
        tblExit.Enabled:=True;
        tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,3,4]);      //打印
        tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,3,4]) ;      //报表设计
        tblFilter.Enabled:= True;
        tblReject.Enabled:=True   and (StrToInt(vprev)in [2,3,4])  ;   //反提交
        tblExpand.Enabled:=True   and (StrToInt(vprev)in [2,3,4])  ;   //提交
        tblConfirm.Enabled:=True  and (StrToInt(vprev)in [2,3,4]);   //审核
        tblUConfirm.Enabled:=True and (StrToInt(vprev)in [2,3,4]);  //反审核
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

procedure TfrmPlanMain05.FormCreate(Sender: TObject);
begin
  inherited;
  cdsMain.Open;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_GridName              :=DghMain;
    L_ListDataSet           :=frmPlanMain.cds0417;
    L_DropdownColumn        :='FASSET_CODE';
    L_ListDataSetFilterField:='FASSET_CODE';
    L_ListResultField       :='FASSET_CODE';
    L_GetValueField         :='FASSET_CODE';
    L_ColsInfo              :='FASSET_CODE/设备代码/100,FASSET_NAME/设备名称/200,FASSET_DESC/设备描述/150,DEPT_CODE/部门代码/50,DEPT_NAME/部门名称/80';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  
  FindDisplayFields:=VarArrayOf(['FASSET_CODE','FASSET_NAME','MainCycl','StdTimeCons']);

  ColumnAddList(DghMain,'MainCycl','select MainCycl from dbo.Data0816 order by rkey');
end;

procedure TfrmPlanMain05.cdsMainFASSET_CODEChange(Sender: TField);
begin
  inherited;
  with frmPlanMain.cds0417 do
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
      cdsMain.FieldByName('D417_ptr').Value:=null;
      cdsMain.FieldByName('FASSET_NAME').Value:=null ;
      cdsMain.FieldByName('DEPT_CODE').Value:=null ;
      cdsMain.FieldByName('DEPT_NAME').Value:=null ;
    end
    else
    begin
      if Locate('FASSET_CODE',(Sender.Value),[loCaseInsensitive]) then
        begin
        cdsMainD417_ptr.Value := FieldByName('rkey').Value ;
        cdsMain.FieldByName('FASSET_NAME').Value:=FieldByName('FASSET_NAME').Value ;
        cdsMain.FieldByName('DEPT_CODE').Value:=FieldByName('DEPT_CODE').Value ;
        cdsMain.FieldByName('DEPT_NAME').Value:=FieldByName('DEPT_NAME').Value ;
        end
      else
        begin
        cdsMain.FieldByName('D417_ptr').Value:=null;
        cdsMain.FieldByName('FASSET_NAME').Value:=null ;
        cdsMain.FieldByName('DEPT_CODE').Value:=null ;
        cdsMain.FieldByName('DEPT_NAME').Value:=null ;
        ShowMessage('设备代码不存在！！！');
        end;
    end;
  end;
end;

procedure TfrmPlanMain05.FormShow(Sender: TObject);
begin
  inherited;
  cdsMain.Close;
  cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+ cdsMain.F_SQLOrderBy;
  cdsMain.Open;
end;

end.
