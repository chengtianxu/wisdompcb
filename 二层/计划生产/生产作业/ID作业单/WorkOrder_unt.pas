unit WorkOrder_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,MC_unt, Menus, cds, ImgList, ppEndUsr, ppBands, ppPrnabl,
  ppClass, ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DBClient, DB, Provider, ADODB, Grids, DBGridEh, ComCtrls,
  StdCtrls, ExtCtrls, RzPanel, RzButton, Mask, DBCtrls, Buttons,IniFiles,
  DBGrids;

type
  TWorkOrder_frm = class(TMC_frm)
    ADOQuery1: TADOQuery;
    dtMainEMPL_CODE: TStringField;
    dtMainEMPLOYEE_NAME: TStringField;
    dtMainrkey: TAutoIncField;
    dtMainWORK_ORDER_NUMBER: TStringField;
    dtMainPANELS: TIntegerField;
    dtMainPARTS_PER_PANEL: TIntegerField;
    dtMainQUAN_SCH: TIntegerField;
    dtMainpanel_ln: TBCDField;
    dtMainpanel_wd: TBCDField;
    dtMainEMPLOYEE_PTR: TIntegerField;
    dtMainENT_DATETIME: TDateTimeField;
    dtMainCUST_CODE: TStringField;
    dtMainMANU_PART_NUMBER: TStringField;
    dtMainMANU_PART_DESC: TStringField;
    dtMainANALYSIS_CODE_2: TStringField;
    dtMainPO_NUMBER: TStringField;
    cdsMainEMPL_CODE: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainWORK_ORDER_NUMBER: TStringField;
    cdsMainPANELS: TIntegerField;
    cdsMainPARTS_PER_PANEL: TIntegerField;
    cdsMainQUAN_SCH: TIntegerField;
    cdsMainpanel_ln: TBCDField;
    cdsMainpanel_wd: TBCDField;
    cdsMainEMPLOYEE_PTR: TIntegerField;
    cdsMainENT_DATETIME: TDateTimeField;
    cdsMainCUST_CODE: TStringField;
    cdsMainMANU_PART_NUMBER: TStringField;
    cdsMainMANU_PART_DESC: TStringField;
    cdsMainANALYSIS_CODE_2: TStringField;
    cdsMainPO_NUMBER: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    cdsChildrkey: TAutoIncField;
    cdsChildY1406_RKEY: TIntegerField;
    cdsChildseq_no: TIntegerField;
    dtChildrkey: TAutoIncField;
    dtChildY1406_RKEY: TIntegerField;
    dtChildseq_no: TIntegerField;
    dtChildID: TStringField;
    cdsChildID: TStringField;
    Label17: TLabel;
    Label18: TLabel;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    Edit1: TEdit;
    Label19: TLabel;
    ADOCommand1: TADOCommand;
    dt_0005: TADODataSet;
    dt_0005EMPL_CODE: TStringField;
    dt_0005EMPLOYEE_NAME: TStringField;
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DghMainTitleClick(Column: TColumnEh);
  private
    program_ini:Tinifile;
    database:string;
    function Add_Record (var_WORK_ORDER_NUMBER:string):Boolean;
    function SaveData():Boolean; override;
    function SaveBeforeCheck():Boolean;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WorkOrder_frm: TWorkOrder_frm;

implementation

uses PublicFile, DM_unt;

{$R *.dfm}

function TWorkOrder_frm.SaveBeforeCheck():Boolean;
var
  strMsg,strSQL:string;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;

    if (FieldByName('WORK_ORDER_NUMBER').AsString='')then
    begin
      strMsg:=strMsg+'字段：“'+FieldByName('WORK_ORDER_NUMBER').DisplayLabel+'”的值不能为空。'+#13;
    end
    else
    if (UpdateStatus=usInserted)
         or((UpdateStatus=usModified) and (
         (UpperCase(FieldByName('WORK_ORDER_NUMBER').NewValue)<>UpperCase(FieldByName('WORK_ORDER_NUMBER').OldValue))
         )
           ) then
    begin
      strSQL:='select * from [Y1406] where WORK_ORDER_NUMBER = '+QuotedStr(FieldByName('WORK_ORDER_NUMBER').NewValue);
      if RecordExists(strSQL,DM_frm.cdsRead)then
      begin
        strMsg:=strMsg+'字段“'+FieldByName('WORK_ORDER_NUMBER').DisplayLabel+'”的值“'
          +trim(FieldByName('WORK_ORDER_NUMBER').NewValue)+'”已经存在，不允许重复。'+#13
      end;
    end;
      
    if FieldByName('PANELS').AsInteger < 1 then
      strMsg:=strMsg+'字段：“'+FieldByName('PANELS').DisplayLabel+'”的值必须大于0。'+#13;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

function TWorkOrder_frm.SaveData():Boolean;
var
  i,Max_ID:Integer;
  str_SQL,str_NO:string;
begin
  Result:=False;
  str_SQL := '';
  try
    Screen.Cursor := crHourGlass;
    try
      DM_frm.ADOConnection1.BeginTrans;
      with cdsMain do
      begin
        if State in [dsEdit,dsInsert] then
          Post;

        if ApplyUpdates(0)=0 then    //=0，即保存成功
        begin
          Max_ID := StrToInt( SQLResultValue(dtRead ,'select cast(isnull(max(id),0) as int ) from Y1407')  ) ;
          for i := 1 to cdsMain.FieldByName('PANELS').AsInteger do
          begin
                   //      StringofChar('0',Len-Length(IntToStr(curr_row)));
            //str_NO := Copy('000000000',0,10-Length(IntToStr( Max_ID + i )) )+  IntToStr( Max_ID + i ) ;
            str_NO := StringofChar('0',9-Length(IntToStr( Max_ID + i )) )+  IntToStr( Max_ID + i ) ;

            str_SQL := str_SQL
             +  'insert into Y1407(ID,y1406_rkey,seq_no) values('+QuotedStr(str_NO)+','
             +QuotedStr(cdsMain.FieldByName('rkey').AsString)+','+intToStr(i)+' )' ;
          end;
          ADOCommand1.CommandText := str_SQL;
          //ShowMessage(str_SQL);
          try
            ADOCommand1.Execute;
            DM_frm.ADOConnection1.CommitTrans;
          except
            DM_frm.ADOConnection1.RollbackTrans;
          end; 
        end
        else
        begin
          DM_frm.ADOConnection1.RollbackTrans;
        end
      end;
    except
      DM_frm.ADOConnection1.RollbackTrans;
    end;
    ChildDataSetOpen;
    dsMainStateChange(nil);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TWorkOrder_frm.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('PANELS').Value       :=  0;
    FieldByName('PARTS_PER_PANEL').Value:=  0;
    FieldByName('QUAN_SCH').Value     :=  0;
    FieldByName('panel_ln').Value     :=  0;
    FieldByName('panel_wd').Value     :=  0;
    FieldByName('ENT_DATETIME').Value :=  GetDataBaseDate(dtread);   //创建日期
    FieldByName('EMPLOYEE_PTR').Value :=  EmplRKEY;  //	创建人员外健05.rkey
    FieldByName('EMPL_CODE').Value    :=  EMPL_CODE;
    FieldByName('EMPLOYEE_NAME').Value:=  EmplName;  //
  end;
end;

procedure TWorkOrder_frm.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ;   

 {DM_frm.ADOConnection1.Close;                                                                                                             // sj_v20_live
 // DM_frm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=wisdompcb_idtrace;Data Source=172.16.68.8';
  DM_frm.ADOConnection1.Open;
  UserRKEY := 1;
  vprev:='4';     }
  SetEmployeeInfo(dtRead);
  inherited;
  cdsMain.Open;

  Curr_Date:=GetDataBaseDate(dtRead,ADate);
  //以下用于查找窗体
  Find_DisplayFields := VarArrayOf(['WORK_ORDER_NUMBER', 'PANELS',
  'PARTS_PER_PANEL','QUAN_SCH', 'panel_ln', 'panel_wd',
  'EMPL_CODE','EMPLOYEE_NAME','ENT_DATETIME',
  'MANU_PART_NUMBER', 'CUST_CODE','MANU_PART_DESC',
  'ANALYSIS_CODE_2', 'PO_NUMBER']);

  Find_FieldsName      := VarArrayOf(['WORK_ORDER_NUMBER', 'PANELS',
  'PARTS_PER_PANEL','QUAN_SCH', 'panel_ln', 'panel_wd',
  'EMPL_CODE','EMPLOYEE_NAME','ENT_DATETIME',
  'MANU_PART_NUMBER', 'CUST_CODE','MANU_PART_DESC',
  'ANALYSIS_CODE_2', 'PO_NUMBER']);

  Find_QueryFieldsName := VarArrayOf(['Y1406.WORK_ORDER_NUMBER', 'Y1406.PANELS',
  'Y1406.PARTS_PER_PANEL','Y1406.QUAN_SCH', 'Y1406.panel_ln', 'Y1406.panel_wd',
  'Data0005.EMPL_CODE','Data0005.EMPLOYEE_NAME','Y1406.ENT_DATETIME',
  'Y1406.MANU_PART_NUMBER', 'Y1406.CUST_CODE','Y1406.MANU_PART_DESC',
  'Y1406.ANALYSIS_CODE_2', 'Y1406.PO_NUMBER']);

  Find_Def_FieldName  :=VarArrayOf(['ENT_DATETIME']);
  Find_Def_Oper       :=VarArrayOf(['>']);
  Find_Def_FieldValue :=VarArrayOf([DateToStr(Curr_Date-30)]);
  Find_Def_Field2Value :=VarArrayOf(['']);

  var_DropDown_Info:=TDropDownInfo.Create();       // 下列代码仅仅是在查询窗体中设置下拉列表，只需要设置以下属性
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_FindSQL               :='select EMPL_CODE,EMPLOYEE_NAME from data0005';
    L_ColsInfo              :='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_DropdownColumn        :='EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='EMPL_CODE';
    L_SetDataSet;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
end;

procedure TWorkOrder_frm.FormShow(Sender: TObject);
begin
  inherited;
  //不论权限码和状态值，这些表格列和编辑框控件必须是只读 DBEdit2,
  SetControlsReadOnly([Edit2,DBEdit1,DBEdit2,DBEdit3,DBEdit4,DBEdit5,DBEdit6,DBEdit7,DBEdit8,DBEdit9,
                       DBEdit10,DBEdit11,DBEdit12,DBEdit13,DBEdit14,DBEdit15,DBEdit16]);
                                  //
  SetColsReadOnly(DghMain,['WORK_ORDER_NUMBER','PANELS','PARTS_PER_PANEL','QUAN_SCH','EMPL_CODE','EMPLOYEE_NAME','panel_ln',
  'panel_wd','ENT_DATETIME','CUST_CODE','MANU_PART_NUMBER','MANU_PART_DESC','ANALYSIS_CODE_2','PO_NUMBER']);

  SetColsReadOnly(dghChild,['ID','seq_no']);
  //动态设置过滤用控件
  Filter_Create(Panel_Bottom);
  Filter_Set(DghMain.FieldColumns['WORK_ORDER_NUMBER']);
end;

procedure TWorkOrder_frm.FormActivate(Sender: TObject);
var
  filename:string;
begin
  inherited;
  filename:=Extractfilepath(ParamStr(0))+'WISDOMPCB.ini';
  program_ini:=Tinifile.Create(filename);
  program_ini.ReadSection('数据库',combobox2.Items);
end;

procedure TWorkOrder_frm.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if combobox2.ItemIndex>=0 then
  with ADOQuery4 do
  begin
    close;
    sql.Text:='select * from sys.servers where name='+quotedstr(edit2.Text);
    open;
    if IsEmpty then
    with ADOQuery3 do
    begin
      close;
      sql.Text:='exec sp_addlinkedserver '+quotedstr(edit2.Text);
      try
        ExecSQL;
        MsgInfo('注册成功!');
      except
        MsgInfo('注册不成功,请与管理员联系。');
      end;
    end
    else
    MsgInfo('数据库'''+combobox2.Text+'''已经在当前数据库中注册。');
  end
  else
  MsgError('请首先选择数据库。');
end;

procedure TWorkOrder_frm.ComboBox2Change(Sender: TObject);
begin
  inherited;
  edit2.Text:=program_ini.ReadString('服务器',combobox2.Text,'');
  database:= '['+edit2.Text+'].'+
  program_ini.ReadString('数据库',combobox2.Text,'')+'.';
end;

function TWorkOrder_frm.add_Record (var_WORK_ORDER_NUMBER:string):Boolean;
begin
  Result:=False;
  with ADOQuery1 do
  begin
    Close;
    SQL.Text :=
                'select Data0006.PANELS,Data0006.PARTS_PER_PANEL,Data0006.QUAN_SCH, '
                +'Data0006.panel_ln,Data0006.panel_wd,data0010.CUST_CODE, '
                +'Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2,data0097.PO_NUMBER  '
                +#13+'from '+database+'dbo.Data0006  '
                +#13+'join '+database+'dbo.data0492 on Data0006.CUT_NO = data0492.CUT_NO  '
                +#13+'join '+database+'dbo.Data0060 on data0492.SO_NO = Data0060.SALES_ORDER '
                +#13+'join '+database+'dbo.data0010 on data0492.COMPLETED = data0010.rkey  '
                +#13+'join '+database+'dbo.Data0025 on data0492.BOM_PTR = Data0025.rkey  '
                +#13+'join '+database+'dbo.data0097 on Data0060.PURCHASE_ORDER_PTR = data0097.rkey '
                +#13+'where Data0006.WORK_ORDER_NUMBER =   ' +QuotedStr(var_WORK_ORDER_NUMBER);
    Open;
   // ShowMessage(SQL.Text);
    if IsEmpty=False then
    begin
      cdsMain.Append;
      cdsMain.FieldByName('WORK_ORDER_NUMBER').Value:= Edit1.Text;
      cdsMain.FieldByName('PANELS').Value          :=  FieldByName('PANELS').Value ;
      cdsMain.FieldByName('PARTS_PER_PANEL').Value :=  FieldByName('PARTS_PER_PANEL').Value;
      cdsMain.FieldByName('QUAN_SCH').Value        :=  FieldByName('QUAN_SCH').Value ;
      cdsMain.FieldByName('panel_ln').Value        :=  FieldByName('panel_ln').Value;
      cdsMain.FieldByName('panel_wd').Value        :=  FieldByName('panel_wd').Value ;
      cdsMain.FieldByName('CUST_CODE').Value       :=  FieldByName('CUST_CODE').Value;
      cdsMain.FieldByName('MANU_PART_NUMBER').Value:=  FieldByName('MANU_PART_NUMBER').Value;
      cdsMain.FieldByName('MANU_PART_DESC').Value  :=  FieldByName('MANU_PART_DESC').Value;
      cdsMain.FieldByName('ANALYSIS_CODE_2').Value :=  FieldByName('ANALYSIS_CODE_2').Value;
      cdsMain.FieldByName('PO_NUMBER').Value       :=  FieldByName('PO_NUMBER').Value;
      cdsMain.Post;

      Result:=True;
    end
    else
    begin
      MsgError('输入的作业单不存在，请确认你选择的数据库是否正确。');
    end;

  end;
end;

procedure TWorkOrder_frm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    str_sql:string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if (Key= 13)and(Trim(Edit1.Text)<>'') then
    begin
      str_sql := 'select rkey from Y1406 where WORK_ORDER_NUMBER='+QuotedStr(Edit1.Text);
      if RecordExists(str_sql,dtRead)then
      begin
        MsgError('作业单号的值'+QuotedStr(Edit1.Text)+'已经存在。');
        edit1.Text := '';
        Exit;
      end;

      if Add_Record (Edit1.Text)       then
      begin
        tblSaveClick(nil);
        edit1.Text := '';
      end;
    end;
  finally    
    Screen.Cursor := crDefault;
  end;    
end;

procedure TWorkOrder_frm.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  Filter_Set(Column);
end;

end.
