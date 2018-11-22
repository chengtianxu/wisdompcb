unit MainItem;

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
  dxStatusBar, cxContainer, cxEdit, DBCtrls, Mask, cxDBEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, RzEdit, RzDBEdit, RzDBBnEd, DBButtonEdit,StrUtils;

type
  TMainItem_f = class(TMC_f)
    cdsMainFASSET_CODE: TStringField;
    cdsMainFASSET_NAME: TStringField;
    cdsMainLOCATION: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cdsMainrkey: TIntegerField;
    dtMainFASSET_CODE: TStringField;
    dtMainFASSET_NAME: TStringField;
    dtMainLOCATION: TStringField;
    dtMainDEPT_NAME: TStringField;
    dtMainrkey: TIntegerField;
    cds0417: TClientDataSet;
    cds0417rkey: TIntegerField;
    cds0417FASSET_CODE: TStringField;
    cds0417FASSET_NAME: TStringField;
    cds0417LOCATION: TStringField;
    cds0417DEPT_NAME: TStringField;
    cdsChildrkey: TAutoIncField;
    cdsChildD804_ptr: TIntegerField;
    cdsChildnumber: TSmallintField;
    cdsChildMainCycl: TStringField;
    cds0816: TClientDataSet;
    cds0816MainCycl: TStringField;
    cdsChildMainPhone: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edt_Item: TDBMemo;
    edt_MainMeth: TDBMemo;
    edt_ChecAcce: TDBMemo;
    edt_MainPhone: TDBEdit;
    edt_defauMan: TDBEdit;
    edt_number: TDBEdit;
    edt_MainCycl: TDBButtonEdit;
    cdsChildItem: TStringField;
    cdsChildMainMeth: TStringField;
    cdsChildChecAcce: TStringField;
    cdsChilddefauMan: TStringField;
    dtMainAcceCode: TStringField;
    dtMainAcceName: TStringField;
    cdsMainAcceCode: TStringField;
    cdsMainAcceName: TStringField;
    dtMainPHONE: TStringField;
    cdsMainPHONE: TStringField;
    cds005: TClientDataSet;
    cds005AcceCode: TStringField;
    cds005AcceName: TStringField;
    cds005PHONE: TStringField;
    cds005DEPT_NAME: TStringField;
    cds005rkey: TIntegerField;
    dtMainAcceptan_ptr: TIntegerField;
    cdsMainAcceptan_ptr: TIntegerField;
    GroupBox3: TGroupBox;
    Filter_Label: TLabel;
    Filter_Edit: TEdit;
    dtMainactive_flag: TStringField;
    cdsMainactive_flag: TStringField;
    procedure dspMainGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure FormCreate(Sender: TObject);
    procedure cdsMainFASSET_CODEChange(Sender: TField);
    procedure cdsChildNewRecord(DataSet: TDataSet);
    procedure DghMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsMainAcceCodeChange(Sender: TField);
    procedure Filter_EditChange(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure cdsMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    FilterFieldName:string;
    procedure SetToolbarButtonStatus(Flag: Boolean); override;
    function SaveBeforeCheck ():Boolean;             override;
    function SaveData():Boolean;                     override;
    procedure SetFilterComponent(Column: TColumnEh);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainItem_f: TMainItem_f;

implementation

uses DM_f, PublicFile;

{$R *.dfm}

function TMainItem_f.SaveData():Boolean;
begin
  Result:=True;
  try
    Screen.Cursor := crHourGlass;
    try
      DM.ADOConnection1.BeginTrans;
      with cdsMain do
      begin
        if State in [dsEdit,dsInsert] then
          Post;

        if cdsMain.FieldByName('Acceptan_ptr').IsNull=False then
        if (cdsMain.FieldByName('PHONE').IsNull=False)and (cdsMain.FieldByName('PHONE').AsString<>'')then
        if VarIsNull(cdsMain.FieldByName('PHONE').OldValue) then
        begin
            DM.cdsRead.Close;
            DM.cdsRead.CommandText:=
             'Declare @PHONE varchar(15),@RKEY int set @PHONE='+QuotedStr(cdsMain.FieldByName('PHONE').Value)
            +' set @RKEY='+cdsMain.FieldByName('Acceptan_ptr').AsString
            +' if exists(select *from data0005 where (rkey=@RKEY) and ((PHONE is null)or(PHONE<>@PHONE)) )'
            +' update data0005 set PHONE=@PHONE where rkey=@RKEY select @@rowcount';
            DM.cdsRead.Open;
            if DM.cdsRead.Fields[0].Value>0 then
            begin
              cds005.Close;
              cds005.Open;
            end   ;
            DM.cdsRead.Close;
        end
        else
        begin
          if UpperCase(Trim(cdsMain.FieldByName('PHONE').NewValue))<>
             UpperCase(Trim(cdsMain.FieldByName('PHONE').OldValue))then
          begin
            DM.cdsRead.Close;
            DM.cdsRead.CommandText:=
             'Declare @PHONE varchar(15),@RKEY int set @PHONE='+QuotedStr(cdsMain.FieldByName('PHONE').Value)
            +' set @RKEY='+cdsMain.FieldByName('Acceptan_ptr').AsString
            +' if exists(select *from data0005 where (rkey=@RKEY) and ((PHONE is null)or(PHONE<>@PHONE)) )'
            +' update data0005 set PHONE=@PHONE where rkey=@RKEY select @@rowcount';
            DM.cdsRead.Open;
            if DM.cdsRead.Fields[0].Value>0 then
            begin
              cds005.Close;
              cds005.Open;
            end   ;
            DM.cdsRead.Close;
          end;
        end;

        if ApplyUpdates(0)=0 then    //=0，即保存成功
        begin
          with cdsChild do
          begin
            if State in [dsEdit,dsInsert] then
              Post;

            if ApplyUpdates(0)=0 then     //大于0，保存失败
            begin
              DM.ADOConnection1.CommitTrans;
            end
            else
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

    except
      DM.ADOConnection1.RollbackTrans;
    end;
    dsMainStateChange(nil);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMainItem_f.SaveBeforeCheck():Boolean  ;
var
  strSQL,strMsg,str_Filter:string;
  I_Row :Integer;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
//    if (FieldByName('FASSET_CODE').IsNull=False)then
//    if (UpdateStatus=usInserted)
//         or((UpdateStatus=usModified) and ((UpperCase(FieldByName('FASSET_CODE').NewValue)<>UpperCase(FieldByName('FASSET_CODE').OldValue)))
//           ) then
//    begin
//      strSQL:='select * from data0417 where FASSET_CODE='+QuotedStr(FieldByName('FASSET_CODE').NewValue);
//      if RecordExists(strSQL,DM.cdsRead)then
//      begin
//        strMsg:=strMsg+'字段：“'+FieldByName('FASSET_CODE').DisplayLabel+'”的值“'+trim(FieldByName('FASSET_CODE').NewValue)
//          +'”已经存在！！！'+#13
//      end;
//    end;
//    if FieldByName('Acceptan_ptr').IsNull then
//      strMsg:=strMsg+'字段：“'+FieldByName('AcceCode').DisplayLabel+'”的值不能为空！！！'+#13;
  end;

  if cdsChild.State in [dsEdit ,dsInsert] then    
  cdsChild.Post;
  begin
    with DM.cdsClone do
    try
      Close;
      Data:= cdsChild.Data;
      DisableControls ;
      First;
      for I_Row:=0 to RecordCount-1 do
      begin
        if FieldByName('number').IsNull then
          strMsg:=strMsg+'子表格序号：'+IntToStr(I_Row+1)+'，字段：“'
          +cdsChild.FieldByName('number').DisplayLabel+'”的值不能为空！！！'+#13 ;

        if (FieldByName('MainCycl').IsNull)or(FieldByName('MainCycl').asstring='') then
          strMsg:=strMsg+'子表格序号：'+FieldByName('number').AsString+'，字段：“'+cdsChild.FieldByName('MainCycl').DisplayLabel+'”的值不能为空！！！'+#13
        else
        begin
          if  cds0816.Active=False then
          cds0816.Open;
          if cds0816.Locate('MainCycl',FieldByName('MainCycl').Value,[loCaseInsensitive])=False then
          strMsg:=strMsg+'子表格序号：'+FieldByName('number').AsString+'，字段：“'+cdsChild.FieldByName('MainCycl').DisplayLabel+'”的值不存在！！！'+#13
        end;

        if (FieldByName('Item').IsNull)or(FieldByName('Item').AsString='') then
          strMsg:=strMsg+'子表格序号：'+FieldByName('number').AsString+'，字段：“'
          +cdsChild.FieldByName('Item').DisplayLabel+'”的值不能为空！！！'+#13 ;

        if (FieldByName('MainMeth').IsNull)or(FieldByName('MainMeth').AsString='') then
          strMsg:=strMsg+'子表格序号：'+FieldByName('number').AsString+'，字段：“'
          +cdsChild.FieldByName('MainMeth').DisplayLabel+'”的值不能为空！！！'+#13 ;

        if (FieldByName('ChecAcce').IsNull)or(FieldByName('ChecAcce').AsString='')  then
          strMsg:=strMsg+'子表格序号：'+FieldByName('number').AsString+'，字段：“'
          +cdsChild.FieldByName('ChecAcce').DisplayLabel+'”的值不能为空！！！'+#13 ;         

        Next;
      end;    

      if (FieldByName('Item').IsNull=False)and(FieldByName('Item').asstring<>'') then  // 提示重复的录入行
      begin
        DM.cdsTemp.OnFilterRecord:=DM.cdsTemp_FilterRecord;
        DM.cdsTemp.data:=Data;
        Last;
        for I_Row:=RecordCount-1 downto 0 do
        begin
          DM.cdsTemp.Filtered:=False;
          DM.cdsTempFilterValue:=FieldByName('Item').AsString;
          DM.cdsTemp.Filtered:=True;

          if DM.cdsTemp.RecordCount >=2 then
          begin
            strMsg:=strMsg+'子表格序号：'+FieldByName('number').AsString+'，字段：“'
            +cdsChild.FieldByName('Item').DisplayLabel+'”的值已重复！！！'+#13 ;
          end;
          while not DM.cdsTemp.Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
          DM.cdsTemp.Delete;
          DM.cdsTemp.Filtered:=False;
          Prior;
        end;
        DM.cdsTemp.OnFilterRecord:=nil;
      end;
    finally
      Close;
      DM.cdsTemp.Close;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure TMainItem_f.SetToolbarButtonStatus(Flag: Boolean);
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
      tblDelete.Enabled:=False;   //如果是主表格，删除按钮不允许操作
      actDelete.Enabled:=False;
      tblAdd.Enabled:=False;      //如果是主表格，新增按钮不允许操作
      actAdd.Enabled:=False;

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

procedure TMainItem_f.dspMainGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  inherited;
  TableName:='data0417';
end;

procedure TMainItem_f.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ;  {}

{  dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  UserRKEY :=2522 ;// 2012
  EmplRKEY:=2995;
  vprev:='4';}
  inherited;
  cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+ cdsMain.F_SQLWhere+#13+cdsMain.F_SQLOrderBy;
  cdsMain.Open;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsChild;
    L_GridName              :=dghChild;
    L_ColsInfo:='MainCycl/保养周期/100';
    L_ListDataSet           :=cds0816;
    L_DropdownColumn        :='MainCycl';
    L_ListDataSetFilterField:='MainCycl';
    L_ListResultField       :='MainCycl';
    L_GetValueField         :='MainCycl';
    DropDownInfo_Init(var_DropDown_Info);
    edt_MainCycl.F_ColsInfo         := L_ColsInfo;
    edt_MainCycl.F_DownListDataSet  := cds0816 ;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='AcceCode/雇员代码/100,AcceName/雇员姓名/120,DEPT_NAME/部门/80,PHONE/电话/100';
    L_ListDataSet           :=cds005;
    L_DropdownColumn        :='AcceCode';
    L_ListDataSetFilterField:='AcceCode';
    L_ListResultField       :='AcceCode';
    L_GetValueField         :='AcceCode';
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  FindDisplayFields     :=varArrayOf(['FASSET_CODE','FASSET_NAME','LOCATION','DEPT_NAME','AcceCode','AcceName']);
  FindFieldsName        := varArrayOf([ 'AcceCode']);
  FindQueryFieldsName   := varArrayOf([ 'data0005.EMPL_CODE']);
  SetFilterComponent(DghMain.FieldColumns['FASSET_CODE']);
end;

procedure TMainItem_f.cdsMainFASSET_CODEChange(Sender: TField);
begin
  inherited;
  with cds0417 do
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
      cdsMain.FieldByName('rkey').Value:=null;
      cdsMain.FieldByName('FASSET_NAME').Value:=null;
      cdsMain.FieldByName('LOCATION').Value:=null ;
      cdsMain.FieldByName('DEPT_NAME').Value:=null;
    end
    else
    begin
      if Locate('FASSET_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMain.FieldByName('rkey').Value        :=FieldByName('rkey').Value;
          cdsMain.FieldByName('FASSET_NAME').Value :=FieldByName('FASSET_NAME').Value;
          cdsMain.FieldByName('LOCATION').Value    :=FieldByName('LOCATION').Value ;
          cdsMain.FieldByName('DEPT_NAME').Value   :=FieldByName('DEPT_NAME').Value;
        end
      else
        begin
          cdsMain.FieldByName('rkey').Value:=null;
          cdsMain.FieldByName('FASSET_NAME').Value:=null;
          cdsMain.FieldByName('LOCATION').Value:=null ;
          cdsMain.FieldByName('DEPT_NAME').Value:=null;
        end;
    end;
  end;
end;

procedure TMainItem_f.cdsChildNewRecord(DataSet: TDataSet);
begin
  inherited;
  with  DataSet  do
  begin
    FieldByName('number').AsInteger:=  RecordCount+1;
  end;
end;

procedure TMainItem_f.DghMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;
end;

procedure TMainItem_f.cdsMainAcceCodeChange(Sender: TField);
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
      cdsMain.FieldByName('AcceName').Value:=null ;
      cdsMain.FieldByName('PHONE').Value:=null;
    end
    else
    begin
      if Locate('AcceCode',Sender.Value,[loCaseInsensitive]) then
        begin
          cdsMain.FieldByName('Acceptan_ptr').Value:=FieldByName('rkey').Value;
          cdsMain.FieldByName('AcceName').Value    :=FieldByName('AcceName').Value ;
          cdsMain.FieldByName('PHONE').Value       :=FieldByName('PHONE').Value;
        end
      else
        begin
          cdsMain.FieldByName('Acceptan_ptr').Value:=null;
          cdsMain.FieldByName('AcceName').Value:=null ;
          cdsMain.FieldByName('PHONE').Value:=null;
        end;
    end;
  end;
end;

procedure TMainItem_f.Filter_EditChange(Sender: TObject);
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

procedure TMainItem_f.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  SetFilterComponent(Column)  ;
end;

procedure TMainItem_f.SetFilterComponent(Column: TColumnEh);
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

procedure TMainItem_f.cdsMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if Trim(Filter_Edit.Text) <>'' then
  Accept:=AnsiContainsText(DataSet.FieldByName(FilterFieldName).AsString,Filter_Edit.Text ) ;
end;

end.
