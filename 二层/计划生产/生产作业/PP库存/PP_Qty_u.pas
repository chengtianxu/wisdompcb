unit PP_Qty_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, //cxPCdxBarPopupMenu,
  dxSkinsdxBarPainter, Menus, ppEndUsr, ppBands, ppPrnabl, ppClass,
  ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  DBClient, cds, Provider, ADODB, dxBar, cxClasses, ImgList, ActnList,
  Grids, DBGridEh, ToolWin, ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls,
  dxStatusBar,StrUtils;

type
  TPP_Qty_f = class(TSingleDataSet_f)
    cdsMainINV_PART_NUMBER: TStringField;
    cdsMainINV_NAME: TStringField;
    cdsMainINV_DESCRIPTION: TStringField;
    cdsMainUNIT_CODE: TStringField;
    cdsMainEMPL_CODE: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainRKEY: TAutoIncField;
    cdsMainD207_PTR: TIntegerField;
    cdsMainD017_PTR: TIntegerField;
    cdsMainD002_PTR: TIntegerField;
    cdsMainQUANTITY: TBCDField;
    cdsMainTDATE: TDateTimeField;
    cdsMainempl_ptr: TIntegerField;
    cdsMainQUAN_ON_HAND_1: TBCDField;
    cdsMainDescText: TStringField;
    dtMainINV_PART_NUMBER: TStringField;
    dtMainINV_NAME: TStringField;
    dtMainINV_DESCRIPTION: TStringField;
    dtMainUNIT_CODE: TStringField;
    dtMainEMPL_CODE: TStringField;
    dtMainEMPLOYEE_NAME: TStringField;
    dtMainRKEY: TAutoIncField;
    dtMainD207_PTR: TIntegerField;
    dtMainD017_PTR: TIntegerField;
    dtMainD002_PTR: TIntegerField;
    dtMainQUANTITY: TBCDField;
    dtMainTDATE: TDateTimeField;
    dtMainempl_ptr: TIntegerField;
    dtMainQUAN_ON_HAND_1: TBCDField;
    dtMainDescText: TStringField;
    btn_add: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Selected: TBooleanField;
    ClientDataSet1rkey: TIntegerField;
    ClientDataSet1INVENTORY_PTR: TIntegerField;
    ClientDataSet1STOCK_UNIT_PTR: TIntegerField;
    ClientDataSet1QUANTITY: TBCDField;
    ClientDataSet1TDATE: TDateTimeField;
    ClientDataSet1IES_PARAMETER_VALUE3: TStringField;
    ClientDataSet1QUANTITY_2: TBCDField;
    DataSetProvider1: TDataSetProvider;
    ADODataSet1: TADODataSet;
    ADODataSet1Selected: TBooleanField;
    ADODataSet1rkey: TAutoIncField;
    ADODataSet1INVENTORY_PTR: TIntegerField;
    ADODataSet1STOCK_UNIT_PTR: TIntegerField;
    ADODataSet1QUANTITY: TBCDField;
    ADODataSet1IES_PARAMETER_VALUE3: TStringField;
    ADODataSet1QUANTITY_2: TBCDField;
    ADODataSet1TDATE: TDateTimeField;
    ADODataSet1Invent_or: TSmallintField;
    ClientDataSet1Invent_or: TSmallintField;
    edit1: TEdit;
    Label1: TLabel;
    ADODataSet1EMPL_CODE: TStringField;
    ClientDataSet1EMPL_CODE: TStringField;
    ADODataSet1EXPIRE_DATE: TDateTimeField;
    ClientDataSet1EXPIRE_DATE: TDateTimeField;
    dtMainEXPIRE_DATE: TDateTimeField;
    cdsMainEXPIRE_DATE: TDateTimeField;
    dtMainSUPPLIER2: TStringField;
    dtMainBARCODE_ID: TStringField;
    dtMainABBR_NAME: TStringField;
    cdsMainSUPPLIER2: TStringField;
    cdsMainBARCODE_ID: TStringField;
    cdsMainABBR_NAME: TStringField;
    dtMainQUAN_ON_HAND_2: TBCDField;
    cdsMainQUAN_ON_HAND_2: TBCDField;
    Button2: TButton;
    ADODataSet1REF_NUMBER: TStringField;
    ADODataSet1INV_PART_NUMBER: TStringField;
    ADODataSet1INV_NAME: TStringField;
    ADODataSet1INV_DESCRIPTION: TStringField;
    ADODataSet1UNIT_CODE: TStringField;
    ADODataSet1DEPT_NAME: TStringField;
    ADODataSet1EMPLOYEE_NAME: TStringField;
    ADODataSet1SUPPLIER2: TStringField;
    ADODataSet1BARCODE_ID: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ClientDataSet1INV_PART_NUMBER: TStringField;
    ClientDataSet1INV_NAME: TStringField;
    ClientDataSet1INV_DESCRIPTION: TStringField;
    ClientDataSet1UNIT_CODE: TStringField;
    ClientDataSet1DEPT_NAME: TStringField;
    ClientDataSet1EMPLOYEE_NAME: TStringField;
    ClientDataSet1SUPPLIER2: TStringField;
    ClientDataSet1BARCODE_ID: TStringField;
    ClientDataSet1ABBR_NAME: TStringField;
    ClientDataSet1REF_NUMBER2: TStringField;
    cds0017: TClientDataSet;
    cds0017RKEY: TIntegerField;
    cds0017CDSDesigner: TStringField;
    cds0017CDSDesigner2: TStringField;
    cds0017CDSDesigner3: TStringField;
    cdsD005: TClientDataSet;
    cdsD005RKEY: TIntegerField;
    cdsD005EMPL_CODE: TStringField;
    cdsD005EMPLOYEE_NAME: TStringField;
    dt023: TADODataSet;
    dt023Code: TStringField;
    dt023ABBR_NAME: TStringField;
    ADOCommand_updt207: TADOCommand;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure DataSetProvider1GetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure edit1Change(Sender: TObject);
    procedure cdsMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DghMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    FilterFieldName:string;
    procedure RightsSetDataSetReadOnly;  override;
    function DeleteSaveData():Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PP_Qty_f: TPP_Qty_f;

implementation

uses DM_f,PublicFile, formSelectMultiItem, PP_Qty1_unt;

{$R *.dfm}

procedure TPP_Qty_f.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ;  {}

   { dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  UserRKEY := 2522;
  vprev:='4';      }
  inherited;
  SetEmployeeInfo(dtRead,dxStatusBar1);

end;

function TPP_Qty_f.DeleteSaveData():Boolean;
var
  s,i:integer;
begin
  Result:=True;
  with cdsMain  do
  if Active and (not IsEmpty) then
  //if DeleteBeforeCheck then
  begin
    if FieldByName('QUANTITY').Value>FieldByName('QUAN_ON_HAND_1').Value then   //如果领用数量>当前数量，不允许删除
    begin
      MsgError('当前记录已切割耗用，无法删除。');
      Exit;
    end;
    if cdsMain.FieldByName('empl_ptr').Value <> EmplRKEY then
    begin
      MsgError('你无权删除，只有本人添加的才允许删除。');
      Exit;
    end;
    s:=messagebox(Self.Handle,'你确定要删除吗?删除后将不能恢复！','询问',MB_YESNO+MB_iconquestion) ;
    if S = idyes  then
    begin
      try
        DM.ADOConnection1.BeginTrans;
        with DghMain do
        begin
          if SelectedRows.Count >1 then  //如果用户选择的行数大于1，即多行。
          begin
            try
              F_IsBatchOperating:=True;  //如果选择的是多行，即多行一起删除，将状态FIsBatchOperating设置为真
              with   DataSource.DataSet   do
              for i:= SelectedRows.Count -1 downto 0 do
              begin
                GotoBookmark(pointer(SelectedRows.Items[i]));
                ADOCommand_updt207.CommandText:='update data207 set Invent_or=0 where rkey='+cdsMain.FieldByName('D207_PTR').AsString;
                ADOCommand_updt207.Execute;
                Delete;        //删除多行。
              end;
            finally
              F_IsBatchOperating:=False;   //删除结束后，复位
            end;
          end
          else
          begin
            ADOCommand_updt207.CommandText:='update data0207 set Invent_or=0 where rkey='+cdsMain.FieldByName('D207_PTR').AsString;
            ADOCommand_updt207.Execute;
            DataSource.DataSet.Delete; //否则用户选择的是单行，删除。
          end;
        end ;
        if ApplyUpdates(0)>0 then
        begin
          DM.ADOConnection1.RollbackTrans;
          Result:=True;
        end;
        DM.ADOConnection1.CommitTrans;
        dsMainStateChange(dsMain);
        dxStatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
      except
        on E: Exception do
        begin
          MsgError(e.Message);
          DM.ADOConnection1.RollbackTrans;
        end;
        
      end;
    end;
  end;
   //SaveData();      //调用过程保存
end;

procedure TPP_Qty_f.RightsSetDataSetReadOnly;
begin
  if (StrToInt(vprev) in [2,4]) then    //
  begin
    cdsMain.ReadOnly:=False;
    DghMain.ReadOnly:=False;
  end
  else
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
    btn_add.Enabled:=False;
  end;
end;

procedure TPP_Qty_f.FormShow(Sender: TObject);
begin
  inherited;
  cdsMain.Open;
  FilterFieldName:='INV_PART_NUMBER' ;
//  FindFormHeight:=350;
  FindDisplayFields:=VarArrayOf(['ABBR_NAME','TDATE','INV_PART_NUMBER','INV_NAME','INV_DESCRIPTION',
      'UNIT_CODE','QUANTITY','QUAN_ON_HAND_2','EMPL_CODE','EMPLOYEE_NAME','EXPIRE_DATE','SUPPLIER2','BARCODE_ID','DescText']);
  FindFieldsName      :=VarArrayOf(['ABBR_NAME','INV_PART_NUMBER','INV_NAME','INV_DESCRIPTION',
      'UNIT_CODE','EMPL_CODE','EMPLOYEE_NAME','Tdate','EXPIRE_DATE','SUPPLIER2','BARCODE_ID']);
  FindQueryFieldsName :=VarArrayOf(['Data0023.ABBR_NAME','data0017.INV_PART_NUMBER','data0017.INV_NAME',
  'data0017.INV_DESCRIPTION','data0002.UNIT_CODE','data0005.EMPL_CODE','data0005.EMPLOYEE_NAME',
  'Data0730.Tdate','Data0730.EXPIRE_DATE','Data0022.SUPPLIER2','Data0022.BARCODE_ID']);
  Curr_Date:=GetDataBaseDate(cdsRead,2) ;//获取当前服务器的日期

  cdsMain.Last;//进入最后一行
  try
    cdsMain.F_IsBatchOperating:=True;
    DghMain.sumlist.active:=true;
  finally
    cdsMain.F_IsBatchOperating:=False;
  end;

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
    L_FindDataSet           :=cdsD005;
  //  L_ColsInfo              :='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_DropdownColumn        :='EMPLOYEE_NAME';
    L_ListDataSetFilterField:='EMPLOYEE_NAME';
    L_ListResultField       :='EMPLOYEE_NAME';
    L_GetValueField         :='EMPLOYEE_NAME';
   // L_SetDataSet;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();       // 下列代码仅仅是在查询窗体中设置下拉列表，只需要设置以下属性
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_FindDataSet           :=dt023;
  //  L_ColsInfo              :='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_DropdownColumn        :='ABBR_NAME';
    L_ListDataSetFilterField:='ABBR_NAME';
    L_ListResultField       :='ABBR_NAME';
    L_GetValueField         :='ABBR_NAME';
   // L_SetDataSet;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
{  SetLength(Query_Info,3);
  Query_Info[0]:=TQueryInfo.Create();
  with Query_Info[0] do
  begin
    L_ListDataSetName  :=cds0017;          //下拉列表数据集名
    L_DropdownColumn   :='INV_PART_NUMBER';            //添加下拉列表的字段名
    L_ListResultField  :='原材料代码';            //下拉列表数据集返回的字段名     AnsiString
  end;
  Query_Info[1]:=TQueryInfo.Create();
  with Query_Info[1] do
  begin
    L_ListDataSetName  :=cdsD005;                    //下拉列表数据集名
    L_DropdownColumn   :='EMPLOYEE_NAME';            //添加下拉列表的字段名
    L_ListResultField  :='EMPLOYEE_NAME';            //下拉列表数据集返回的字段名     AnsiString
  end;
  Query_Info[2]:=TQueryInfo.Create();
  with Query_Info[2] do
  begin
    L_ListDataSetName  :=dt023;                  //下拉列表数据集名
    L_DropdownColumn   :='ABBR_NAME';            //添加下拉列表的字段名
    L_ListResultField  :='ABBR_NAME';            //下拉列表数据集返回的字段名     AnsiString
  end;   }
end;

procedure TPP_Qty_f.btn_addClick(Sender: TObject);
var
  curr_date:TDateTime;
begin
  inherited;
  ClientDataSet1.Close;
  ClientDataSet1.Open;
  ClientDataSet1.Locate('TDATE',DateToStr(Now),[loPartialKey]) ;

  if ShowfrmSelectMultiItem(Self,ClientDataSet1,'INV_PART_NUMBER',0,0,1000)then
  begin
    with frmSelectMultiItem do
    begin
      curr_date :=  GetDataBaseDate(cdsRead)   ;
        try
          cdsMain.F_IsBatchOperating:=True;
          Screen.Cursor := crHourGlass;
          cdsMain.DisableControls;
          ClientDataSet1.First;
          while not ClientDataSet1.Eof do
          begin
            if ClientDataSet1.FieldByName('selected').AsBoolean then
            begin
              cdsMain.Append;
              cdsMain.FieldByName('INV_PART_NUMBER').Value   := ClientDataSet1.FieldByName('INV_PART_NUMBER').Value;
              cdsMain.FieldByName('INV_NAME').Value          := ClientDataSet1.FieldByName('INV_NAME').Value;
              cdsMain.FieldByName('INV_DESCRIPTION').Value   := ClientDataSet1.FieldByName('INV_DESCRIPTION').Value;
              cdsMain.FieldByName('UNIT_CODE').Value         := ClientDataSet1.FieldByName('UNIT_CODE').Value;
              cdsMain.FieldByName('D207_PTR').Value          :=ClientDataSet1.FieldByName('rkey').Value;
              cdsMain.FieldByName('D017_PTR').Value          :=ClientDataSet1.FieldByName('INVENTORY_PTR').Value;
              cdsMain.FieldByName('D002_PTR').Value          :=ClientDataSet1.FieldByName('STOCK_UNIT_PTR').Value;
              cdsMain.FieldByName('QUANTITY').Value          :=ClientDataSet1.FieldByName('QUANTITY').Value;
              cdsMain.FieldByName('TDATE').Value             :=curr_date;
              cdsMain.FieldByName('empl_ptr').Value          :=EmplRKEY;
              cdsMain.FieldByName('EMPL_CODE').Value         := EMPL_CODE;
              cdsMain.FieldByName('EMPLOYEE_NAME').Value     := EmplName;
              cdsMain.FieldByName('QUAN_ON_HAND_1').Value    :=ClientDataSet1.FieldByName('QUANTITY').Value;
              cdsMain.FieldByName('QUAN_ON_HAND_2').Value    :=ClientDataSet1.FieldByName('QUANTITY_2').Value;
              cdsMain.FieldByName('EXPIRE_DATE').Value       :=ClientDataSet1.FieldByName('EXPIRE_DATE').Value;
              cdsMain.FieldByName('ABBR_NAME').Value         :=ClientDataSet1.FieldByName('ABBR_NAME').Value;
              cdsMain.FieldByName('SUPPLIER2').Value         :=ClientDataSet1.FieldByName('SUPPLIER2').Value;
              cdsMain.FieldByName('BARCODE_ID').Value        :=ClientDataSet1.FieldByName('BARCODE_ID').Value;
              cdsMain.Post;

              ClientDataSet1.Edit;
              ClientDataSet1.FieldByName('Invent_or').Value:=1;
              ClientDataSet1.Post;
            end;
            ClientDataSet1.Next;
          end;

          try
            DM.ADOConnection1.BeginTrans ;
            if cdsMain.ApplyUpdates(0)=0then
            begin
              if ClientDataSet1.ApplyUpdates(0)=0 then
                DM.ADOConnection1.CommitTrans
              else
                DM.ADOConnection1.RollbackTrans;
            end
            else
              DM.ADOConnection1.RollbackTrans;
          except
            if DM.ADOConnection1.InTransaction then
            DM.ADOConnection1.RollbackTrans;
          end;
        finally
          cdsMain.F_IsBatchOperating:=False;
          cdsMain.EnableControls;
          Screen.Cursor := crDefault;
        end;
        Self.dsMainStateChange(dsMain);
    end;
  end;
end;

procedure TPP_Qty_f.DataSetProvider1GetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  inherited;
  TableName:='data0207';
end;

procedure TPP_Qty_f.DghMainTitleClick(Column: TColumnEh);
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

procedure TPP_Qty_f.edit1Change(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if trim(Edit1.Text) <> '' then
  begin
    try
      F_IsBatchOperating:=True;
      Filtered := False;
      Filtered := true;
    finally
      F_IsBatchOperating:=False;
    end;
  end
  else
  begin
    try
      F_IsBatchOperating:=True;
      Filtered := False;
    finally
      F_IsBatchOperating:=False;
    end;
  end;
end;

procedure TPP_Qty_f.cdsMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if Trim(Edit1.Text) <>'' then
  Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(Edit1.Text )) ;
end;

procedure TPP_Qty_f.DghMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;
end;

procedure TPP_Qty_f.Button2Click(Sender: TObject);
var
  PP_Qty1_frm: TPP_Qty1_frm;
begin
  inherited;
  PP_Qty1_frm:= TPP_Qty1_frm.Create(Application);
  try
    with PP_Qty1_frm.cdsMain do
    begin
      CommandText:=F_SQLSelectFrom+#13+'where data0735.rkey730= '+intTostr(cdsMainRkey.AsInteger);;
      Open;
    end;
    PP_Qty1_frm.ShowModal;
  finally
    PP_Qty1_frm.Free;
  end;   
end;

end.
