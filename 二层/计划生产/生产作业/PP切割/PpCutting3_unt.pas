unit PpCutting3_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  MC, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, ADODB, DB, StdCtrls, Mask,
  DBCtrls, Dialogs, Menus, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DBClient,
  cds, Provider, dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh,
  ToolWin, ComCtrls, cxPC, RzPanel, ExtCtrls, dxStatusBar ,StrUtils   ;

type
  TPpCutting3_frm = class(TMC_f)
    cdsMainMANU_PART_NUMBER: TStringField;
    cdsMainINV_PART_NUMBER: TStringField;
    cdsMainINV_NAME: TStringField;
    cdsMainINV_DESCRIPTION: TStringField;
    cdsMainrkey25: TIntegerField;
    cdsMainlam2: TStringField;
    cdsMainlam_ty_gp: TStringField;
    cdsMainrkey17: TIntegerField;
    cdsMainpanel_ln: TBCDField;
    cdsMainpanel_wd: TBCDField;
    cdsMainmanuf_qty: TIntegerField;
    cdsMainpanel_qty: TIntegerField;
    cdsMainpp_quota_len: TBCDField;
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
    ADOUpdate: TADOQuery;
    cdsD005: TClientDataSet;
    cdsD005RKEY: TIntegerField;
    cdsD005EMPL_CODE: TStringField;
    cdsD005EMPLOYEE_NAME: TStringField;
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
    dtChildSelected: TBooleanField;
    cdsChildSelected: TBooleanField;
    cdsChildmatrece_flag: TBooleanField;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
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
    DBEdit16: TDBEdit;
    ADOUpdate1: TADOQuery;
    btn_NormalCut: TButton;
    dtMainMANU_PART_NUMBER: TStringField;
    dtMainINV_PART_NUMBER: TStringField;
    dtMainINV_NAME: TStringField;
    dtMainINV_DESCRIPTION: TStringField;
    dtMainrkey25: TIntegerField;
    dtMainlam2: TStringField;
    dtMainlam_ty_gp: TStringField;
    dtMainrkey17: TIntegerField;
    dtMainpanel_ln: TBCDField;
    dtMainpanel_wd: TBCDField;
    dtMainmanuf_qty: TIntegerField;
    dtMainpanel_qty: TIntegerField;
    dtMainpp_quota_len: TBCDField;
    dtChildWORK_ORDER_NUMBER: TStringField;
    cdsChildWORK_ORDER_NUMBER: TStringField;
    dtMainTTYPE: TWordField;
    cdsMainTTYPE: TSmallintField;
    TempCDS: TClientDataSet;
    dtMainpp_quota_roll: TFloatField;
    cdsMainpp_quota_roll: TFloatField;
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btn_NormalCutClick(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure edt_FilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cdsChildSelectedChange(Sender: TField);
    procedure cdsMainTTYPEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DghMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
  private
    FilterFieldName:string;
    procedure FilterEditSet(Column: TColumnEh);
    procedure ChildDataSetOpen;                      override;
    procedure SetToolbarButtonStatus(Flag: Boolean); override;
    procedure RightsSetDataSetReadOnly;              override;
    procedure SumPanel;//计算切割张数	、配额切割长度(米)的合计值
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PpCutting3_frm: TPpCutting3_frm;

implementation

uses DM_f,PublicFile,  PpCutting_1,//formFindcds,
  PpCutting_2_unt;

{$R *.dfm}

procedure TPpCutting3_frm.FormCreate(Sender: TObject);
begin
  inherited;  
  cdsMain.Open;
  ChildDataSetOpen;

  NeedSave:=False;  //设置当前窗体不需要保存
end;

procedure TPpCutting3_frm.RightsSetDataSetReadOnly;
begin
  if (StrToInt(vprev) in [2,3,4]) then    //
  begin
    cdsMain  .ReadOnly:=False;
    cdsChild .ReadOnly:=False;
  end
  else
  begin
    cdsMain  .ReadOnly:=True;
    cdsChild .ReadOnly:=True;
  end  ;

  if (StrToInt(vprev) in [2,4]) then    //
  begin
    DghMain  .ReadOnly:=True;
    dghChild .ReadOnly:=False;
  end
  else
  begin
    DghMain  .ReadOnly:=True;
    dghChild .ReadOnly:=True;
  end ;
  cdsChild .ReadOnly:=False;
end;

procedure TPpCutting3_frm.SetToolbarButtonStatus(Flag: Boolean);
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
      tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);
      actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);
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
  //btn_NormalCut.Enabled   :=cdsMain.FieldByName('rkey').IsNull;
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

procedure TPpCutting3_frm.ChildDataSetOpen;
begin
  with  cdsChild do
  begin
    Close;
    CommandText:= F_SQLSelectFrom+#13
    +'where data0731.rkey25= '+ IntToStr(cdsMain.FieldByName('rkey25').AsInteger)
    +' and  data0732.rkey17   = '+ IntToStr(cdsMain.FieldByName('rkey17').AsInteger)
    +' and  data0732.panel_ln = '+ FloatToStr(cdsMain.FieldByName('panel_ln').AsFloat )
    +' and  data0732.panel_wd = '+ FloatToStr(cdsMain.FieldByName('panel_wd').AsFloat )
    +' and  data0731.ttype = '   + IntToStr(cdsMain.FieldByName('ttype').AsInteger )
    +' and  data0732.qg_flag = 0 and Data0731.Tstatus=1 ' ;

    if  F_SQLOrderBy<>'' then
    CommandText:=CommandText+#13+F_SQLOrderBy;
    Open;
  end;
end;

procedure TPpCutting3_frm.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Type').Value:=0;
end;

procedure TPpCutting3_frm.btn_NormalCutClick(Sender: TObject);
var
  PpCutting_1_frm: TPpCutting_1_frm;
  i:Integer;
  str_SQL,str_SQL1:string;
  My_List: TStringList;

  function str_exists(rkey731:string):Boolean;
    var i :integer;
  begin
    Result:=False ;
    for i:=0 to My_List.Count-1 do
    begin
      if My_List.Strings[i]=rkey731 then
      Result:=True ;
    end;
  end;
begin
  if cdsMain.FieldByName('panel_qty').AsInteger<=0 then
  begin
    MsgError('切割张数必须大于0。');
    Exit;
  end;
  //根据732表已选择的记录，查询 731表中的已确认字段是否已有更改,如果有更改，重新刷新，
  with cdsChild do          //修改data0732表的外键值 ,并修改qg_flag为真
  begin
    My_List := TStringList.Create;
    DisableControls;
    First;
    while not eof do
    begin
      if FieldByName('Selected').AsBoolean then
      begin
        if Not str_exists(FieldByName('rkey731').AsString) then//当rkey731在My_List中不存在时，添加
        My_List.Add(FieldByName('rkey731').AsString);
      end;
      Next;
    end;
    EnableControls;
  end;
  for i:=0 to  My_List.Count-1 do
  begin
    str_SQL1:=str_SQL1+My_List.Strings[i]+',';
  end;
  str_SQL1:=Copy(str_SQL1,0,Length(str_SQL1)-1);//删除最后一个逗号
  str_SQL1:='select count(*) from data0731 where rkey in ('+str_SQL1+') and TSTATUS=1';
  //ShowMessage(IntToStr(My_List.Count));

  if  My_List.Count>StrToInt(SQLResultValue(cdsRead,str_SQL1))  then
  begin
    MsgError('PP配料单的确认状态已经更改，操作不能继续，当前数据将要刷新。');
    actRefreshExecute(nil );
    My_List.Free;
    Exit;
  end;
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
    with  PpCutting_1_frm do
    begin
      ControlsSetReadOnly([edt_lam2,edt_lam_ty_gp,edt_pp_quota_len,edt_pp_quota_roll,edt_panel_qty,edt_EMPL_CODE,edt_EMPLOYEE_NAME]);
      CutType:=0;
    end;
                                   
    PpCutting_1_frm.edt_lam2         .DataSource:=dsMain;
    PpCutting_1_frm.edt_lam_ty_gp    .DataSource:=dsMain;
    PpCutting_1_frm.edt_panel_qty    .Text:= cdsMain.FieldByName('panel_qty').AsString;

   { //这段代码注释掉，正常切割时的数据由"切割"窗体带过来
   if (PpCutting_1_frm.edt_panel_qty.Text<>'') then  //  and(edt_panel_qty.ReadOnly=False)
    begin
      //根据0017表的宽度计算一剪能开出多少张panel  一剪出几PNL =IES_PARAMETER_VALUE2/PNL纬向
      i:=strToFloat(PpCutting_1_frm.cds0017.FieldByName('IES_PARAMETER_VALUE2').Value) * 25.4/cdsMainpanel_ln.AsVariant;
     // 需要消耗的米数=PP 的张数/一剪出几PNL *(PNL经向+0.5MM)/1000
      PpCutting_1_frm.edt_pp_quota_len.Text :=
      FloatToStr(
      Ceil(StrToInt(PpCutting_1_frm.edt_panel_qty.Text)/ i) * (cdsMain.FieldByName('panel_wd').Value + 0.5)/1000
      );

      PpCutting_1_frm.edt_pp_quota_roll.Text:=FloatToStr(
      Ceil(StrToFloat(PpCutting_1_frm.edt_pp_quota_len.Text)*100000/(PpCutting_1_frm.cds0017.FieldByName('IES_PARAMETER_VALUE3').Value-2))/100000 //每卷要损耗2米
      )
    end; }
    PpCutting_1_frm.edt_pp_quota_len .Text:= cdsMain.FieldByName('pp_quota_len').AsString;
    PpCutting_1_frm.edt_pp_quota_roll.Text:= cdsMain.FieldByName('pp_quota_roll').AsString;

    PpCutting_1_frm.cds735.Open;
    if PpCutting_1_frm.ShowModal =mrOK then
    begin
      if  My_List.Count>StrToInt(SQLResultValue(cdsRead,str_SQL1))  then
      begin
        MsgError('PP配料单的确认状态已经更改，操作没有完成，当前数据将要刷新。');
        actRefreshExecute(nil );
       // My_List.Free;
        Exit;
      end;
      //保存材料消耗记录，同时将主Data0732表的中
      //首先写入 733表，然后修改 732表，最后写入  735表
      try
        DM.ADOConnection1.BeginTrans;
        with ADOUpdate do
        begin
          Close;
          Parameters.ParamByName('TYPE').Value:=0;//cdsMain.FieldByName('TYPE').Value;
          Parameters.ParamByName('empl_ptr').Value:=PpCutting_1_frm.edt_EMPL_CODE.F_rkey;//cdsMain.FieldByName('empl_ptr').Value;
          Parameters.ParamByName('create_empl_ptr').Value:=EmplRKEY;//cdsMain.FieldByName('create_empl_ptr').Value;
       //   Parameters.ParamByName('creare_date').Value:=GetDataBaseSmallDate(cdsRead);//cdsMain.FieldByName('creare_date').Value;
          Parameters.ParamByName('rkey25').Value:=cdsMain.FieldByName('rkey25').Value;
          Parameters.ParamByName('lam2').Value:=cdsMain.FieldByName('lam2').Value;
          Parameters.ParamByName('lam_ty_gp').Value:=cdsMain.FieldByName('lam_ty_gp').Value;
          Parameters.ParamByName('rkey17').Value:=cdsMain.FieldByName('rkey17').Value;
          Parameters.ParamByName('panel_ln').Value:=cdsMain.FieldByName('panel_ln').Value;
          Parameters.ParamByName('panel_wd').Value:=cdsMain.FieldByName('panel_wd').Value;
          Parameters.ParamByName('manuf_qty').Value:=cdsMain.FieldByName('manuf_qty').Value;
          Parameters.ParamByName('panel_qty').Value:=cdsMain.FieldByName('panel_qty').Value;
          Parameters.ParamByName('pp_quota_len').Value:=PpCutting_1_frm.edt_pp_quota_len.Text;//cdsMain.FieldByName('pp_quota_len').Value;
          PpCutting_1_frm.CurrSum   ;
          Parameters.ParamByName('pp_quota_roll').Value:=PpCutting_1_frm.r_RollSum;//PpCutting_1_frm.edt_pp_quota_roll.Text;//cdsMain.FieldByName('pp_quota_roll').Value;
          Parameters.ParamByName('remark').Value:=PpCutting_1_frm.Memo_remark.Text;//cdsMain.FieldByName('remark').Value;
          Parameters.ParamByName('rkey733').Value:=null;//cdsMain.FieldByName('rkey733').Value;
          Parameters.ParamByName('panel_qty_e').Value:=0;//cdsMain.FieldByName('panel_qty_e').Value;
          Parameters.ParamByName('pp_quota_len_e').Value:=0;//cdsMain.FieldByName('pp_quota_len_e').Value;
          Parameters.ParamByName('pp_quota_roll_e').Value:=0;//cdsMain.FieldByName('pp_quota_roll_e').Value;
          Parameters.ParamByName('pick_material_qty').Value:=0;//cdsMain.FieldByName('pick_material_qty').Value;
          Open;                  //将切割记录写入733表
        end;
        with cdsChild do          //修改data0732表的外键值 ,并修改qg_flag为真
        begin
         // My_List := TStringList.Create;
          DisableControls;
          First;
          while not eof do
          begin
            if FieldByName('Selected').AsBoolean then
            begin
              if State <>dsEdit then
              Edit;
              FieldByName('qg_flag').Value:=1;
              FieldByName('rkey733').Value:=ADOUpdate.Fields[0].Value;
              Post;

//              if Not str_exists(FieldByName('rkey731').AsString) then//当rkey731在My_List中不存在时，添加
//              My_List.Add(FieldByName('rkey731').AsString);
            end;
            Next;
          end;
          EnableControls;
        end;

        for i:=0 to My_List.Count-1 do
        begin
          //SQL语句查询同一个731表中的所有记录行，是否还有没有切割的，
          str_SQL:=str_SQL+'if not exists(select * from data0732  where data0732.rkey731='+My_List.Strings[i]+' and data0732.qg_flag=0) '+
          'update data0731 set qg_flag=1 where rkey='+My_List.Strings[i]+#13;
        end;
        ADOUpdate1.SQL.Text:=str_SQL;

        with PpCutting_1_frm.cds735 do            //修改DATA0735表的外键值
        begin
          DisableControls;
          First;
          while not eof do
          begin
            if State <>dsEdit then
            Edit;
            FieldByName('rkey733').Value:=ADOUpdate.Fields[0].Value;
            Post;
            Next;
          end;
          EnableControls;
        end;

        if cdsChild.ApplyUpdates(0)=0 then             //修改732表中的记录,
        begin
          if PpCutting_1_frm.cds735.ApplyUpdates(0)=0 then      //写入 735表中的发料记录
          begin
            if  PpCutting_1_frm.cds0730.ApplyUpdates(0)=0 then   // 修改730表中PP库存记录
            begin
              try
                ADOUpdate1.ExecSQL;                             //判断，如果是731表关联的所有732已切割，修改731的qg_flag=1
                //在数据提交前，检查731表的状态是否是已确认，否则回滚
                if  My_List.Count>StrToInt(SQLResultValue(cdsRead,str_SQL1))  then
                begin
                  DM.ADOConnection1.RollbackTrans;
                  MsgError('PP配料单的确认状态已经更改，切割操作失败，当前数据将要刷新。');
                  actRefreshExecute(nil );
                //  My_List.Free;
                  Exit;
                end;
                DM.ADOConnection1.CommitTrans;
              except
                DM.ADOConnection1.RollbackTrans;
              end ;
            end
            else
              DM.ADOConnection1.RollbackTrans;
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
          MsgError('提交失败！'+#13#10+e.Message);
        end;
      end;
      dsMainStateChange(dsMain);
      cdsMain.Close;
      cdsMain.Open;
     // ADOUpdate.Close;
    end;
  finally
    My_List.Free;
    PpCutting_1_frm.Free;
  end;

end;

procedure TPpCutting3_frm.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  FilterEditSet(Column);
end;

procedure TPpCutting3_frm.FilterEditSet(Column: TColumnEh);
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

procedure TPpCutting3_frm.edt_FilterChange(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if trim(edt_Filter.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TPpCutting3_frm.FormShow(Sender: TObject);
begin
  inherited;
  FilterEditSet(DghMain.FieldColumns['MANU_PART_NUMBER']);
end;

procedure TPpCutting3_frm.cdsMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if Trim(edt_Filter.Text) <>'' then
  Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(edt_Filter.Text )) ;
end;

procedure TPpCutting3_frm.cdsChildSelectedChange(Sender: TField);
var         //,i_rkey
  i_panel_qty:Integer;
  r_pp_quota_len,r_pp_quota_roll:Currency;
  Temp_CDS:TClientDataSet;
begin
  inherited;
  i_panel_qty :=0;
  r_pp_quota_len:=0;
  try
    Temp_CDS:=TClientDataSet.Create(Self);
    Temp_CDS.CloneCursor(cdsChild,True);
    with Temp_CDS do
    begin
     // i_rkey:=cdsChildrkey.Value;;
     // DisableControls;
      first;
      while not eof do
      begin
        if FieldByName('selected').AsBoolean then
        begin
          i_panel_qty     := i_panel_qty  + FieldByName('panel_qty').Value;
          r_pp_quota_len  := r_pp_quota_len + FieldByName('pp_quota_len').Value;
          r_pp_quota_roll := r_pp_quota_roll + FieldByName('pp_quota_roll').Value;
        end;
        Next;
      end;
      //Locate('rkey',i_rkey,[]);
     // EnableControls;
    end;
    cdsMain.Edit;
    cdsMain.FieldByName('panel_qty').Value    :=i_panel_qty;
    cdsMain.FieldByName('pp_quota_len').Value :=r_pp_quota_len;
    cdsMain.FieldByName('pp_quota_roll').Value:=r_pp_quota_roll;
    cdsMain.Post;

    SumPanel;
  finally
    Temp_CDS.Free;
  end;
end;

procedure TPpCutting3_frm.cdsMainTTYPEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsInteger=0 then
    Text:='正常配料单'
  else
  if Sender.AsInteger=1 then
    Text:='补料配料单' ;
end;

procedure TPpCutting3_frm.DghMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('ttype').AsInteger=1 then
  begin
    if (State = [gdSelected]) or (State = [gdSelected, gdFocused]) then
      DghMain.Canvas.Font.Color :=clYellow 
    else
    DghMain.Canvas.Font.Color :=clGreen ;
    DghMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TPpCutting3_frm.SumPanel;
var
  i_panel_qty:Integer;
  r_pp_quota_len:Currency;
begin
  i_panel_qty:=0;
  r_pp_quota_len:=0;
  with TempCDS do
  begin
    Close;
    data:=cdsMain .Data;
    while not eof do
    begin
      i_panel_qty:=i_panel_qty+ FieldByName('panel_qty').AsInteger;
      r_pp_quota_len:=r_pp_quota_len+ FieldByName('pp_quota_len').AsCurrency;
      Next;
    end;
  end;
  DghMain.FieldColumns['panel_qty'].Footers.Add;
  DghMain.FieldColumns['panel_qty'].Footers[0].ValueType := fvtStaticText;
  DghMain.FieldColumns['panel_qty'].Footers[0].Value     :=intToStr(i_panel_qty) ;

  DghMain.FieldColumns['pp_quota_len'].Footers.Add;
  DghMain.FieldColumns['pp_quota_len'].Footers[0].ValueType := fvtStaticText;
  DghMain.FieldColumns['pp_quota_len'].Footers[0].Value     := formatfloat('0.####',r_pp_quota_len) ;
end;

procedure TPpCutting3_frm.cdsMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  SumPanel;
end;

end.
