unit form_RespGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,MC_unt, Menus, cds, ImgList, ppEndUsr, ppBands, ppPrnabl,
  ppClass, ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DBClient, DB, Provider, ADODB, Grids, DBGridEh, ComCtrls,
  StdCtrls, ExtCtrls, RzPanel, RzButton, DBCtrls, Mask, RzEdit, RzDBEdit,
  RzDBBnEd, DBButtonEdit;

type
  Tfrm_RespGroup = class(TMC_frm)
    cdsChildEMPL_CODE: TStringField;
    cdsChildEMPLOYEE_NAME: TStringField;
    cdsChildRkey: TAutoIncField;
    cdsChildD840_ptr: TIntegerField;
    cdsChildD005_ptr: TIntegerField;
    cdsChildTTYPE: TBooleanField;
    cdsChildEntrDate: TDateTimeField;
    cdsChildDepaDate: TDateTimeField;
    dtRead_0005: TADODataSet;
    dtRead_0005DEPT_NAME: TStringField;
    dtRead_0005EMPL_CODE: TStringField;
    dtRead_0005EMPLOYEE_NAME: TStringField;
    dtRead_0005rkey: TAutoIncField;
    dtRead_0015: TADODataSet;
    dtRead_0015RKEY: TAutoIncField;
    dtRead_0015WAREHOUSE_CODE: TStringField;
    dtRead_0015ABBR_NAME: TStringField;
    dtChildEMPL_CODE: TStringField;
    dtChildEMPLOYEE_NAME: TStringField;
    dtChildRkey: TAutoIncField;
    dtChildD840_ptr: TIntegerField;
    dtChildD005_ptr: TIntegerField;
    dtChildTTYPE: TBooleanField;
    dtChildEntrDate: TDateTimeField;
    dtChildDepaDate: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    edt_EMPLOYEE_NAME: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    edt_ABBR_NAME: TDBButtonEdit;
    edt_EMPL_CODE: TDBButtonEdit;
    cdsMainABBR_NAME: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainLocation: TStringField;
    cdsMainOutsPrep: TBooleanField;
    cdsMainD015_ptr: TIntegerField;
    cdsMainactive: TBooleanField;
    dtMainABBR_NAME: TStringField;
    dtMainrkey: TAutoIncField;
    dtMainLocation: TStringField;
    dtMainOutsPrep: TBooleanField;
    dtMainD015_ptr: TIntegerField;
    dtMainactive: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure cdsChildAfterOpen(DataSet: TDataSet);
    procedure cdsMainNewRecord(DataSet: TDataSet);
    procedure cdsChildNewRecord(DataSet: TDataSet);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure cdsMainABBR_NAMEChange(Sender: TField);
    procedure cdsChildEMPL_CODEChange(Sender: TField);
  private
    function SaveBeforeCheck():Boolean  ;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_RespGroup: Tfrm_RespGroup;

implementation

uses PublicFile, DM_unt;

{$R *.dfm}

procedure Tfrm_RespGroup.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd'; {  }

{  dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  UserRKEY := 1;  //
  vprev:='4';}

  inherited;
  cdsMain.CommandText :=' SELECT data0015.ABBR_NAME,data0840.* FROM data0840 '+#13
          +'left join data0015 on data0840.D015_ptr=data0015.rkey';
  cdsMain.F_SQLSelectFrom := cdsMain.CommandText ;
  cdsMain.F_TableName := 'Data0840';
  cdsMain.F_AutoIncrField := 'rkey';

  cdsChild.CommandText :='  SELECT Data0005.EMPL_CODE,Data0005.EMPLOYEE_NAME,[Data0855].* '+#13
          +'FROM [dbo].[Data0855] join Data0005 on [Data0855].[D005_ptr]=Data0005.RKEY';
  cdsChild.F_SQLSelectFrom := cdsChild.CommandText ;
  cdsChild.F_TableName := 'Data0855';
  cdsChild.F_AutoIncrField := 'rkey';
  cdsChild.F_Primarykey := 'rkey';
  cdsChild.F_Foreignkey := 'D840_ptr';

  IsMC:=False;
  cdsMain.Open;
  if cdsChild.Active = False then
    ChildDataSetOpen;
  SetEmployeeInfo(dtRead,StatusBar1);
  Curr_Date:=GetDataBaseDate(dtRead,ADate);
                                              //设置查找对话框的属性
  Find_DisplayFields   :=VarArrayOf(['ABBR_NAME', 'Location', 'OutsPrep','active']);
  Find_FieldsName      :=VarArrayOf(['ABBR_NAME', 'Location', 'OutsPrep','active']);
  Find_QueryFieldsName :=VarArrayOf(['Data0015.ABBR_NAME', 'Data0840.Location', 'Data0840.OutsPrep','Data0840.active']);
                                             //设置下拉列表和对话框下拉列表的属性
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='WAREHOUSE_CODE/工厂代码/80,ABBR_NAME/工厂简称/120';
    L_ListDataSet           :=dtRead_0015;
    L_DropdownColumn        :='ABBR_NAME';
    L_ListDataSetFilterField:='ABBR_NAME';
    L_ListResultField       :='ABBR_NAME';
    L_GetValueField         :='ABBR_NAME';
    L_SourceField           :=varArrayOf(['D015_ptr']);
    L_ResultField           :=varArrayOf(['rkey']);
    DropDownInfo_Init(var_DropDown_Info);
    edt_ABBR_NAME.F_ColsInfo         := L_ColsInfo;
    edt_ABBR_NAME.F_DownListDataSet  := dtRead_0015 ;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsChild;
    L_GridName              :=dghChild;
    L_ColsInfo:='EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120';
    L_ListDataSet           :=dtRead_0005;
    L_DropdownColumn        :='EMPL_CODE';
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPL_CODE';
    L_GetValueField         :='EMPL_CODE';
    L_SourceField           :=varArrayOf(['D005_ptr','EMPLOYEE_NAME']);
    L_ResultField           :=varArrayOf(['rkey','EMPLOYEE_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
    edt_EMPL_CODE.F_ColsInfo         := L_ColsInfo;
    edt_EMPL_CODE.F_DownListDataSet  := dtRead_0005 ;
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

                     //设置窗体底部过滤属性
  Panel_Bottom.Height := 25;
  Filter_Create(Panel_Bottom);
  Filter_Set(DghMain.FieldColumns['ABBR_NAME']);

  SetControlsReadOnly([edt_EMPLOYEE_NAME]);
  SetColsReadOnly(dghChild,['EMPLOYEE_NAME']);
end;

function Tfrm_RespGroup.SaveBeforeCheck():Boolean  ;
var
  strSQL,strMsg:string;
  I_Row :Integer;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
    
    if (FieldByName('Location').AsString='')then
    begin
      strMsg:=strMsg+'字段：“'+FieldByName('Location').DisplayLabel+'”的值不能为空。'+#13;
    end
    else
    if (UpdateStatus=usInserted)
         or((UpdateStatus=usModified) and (
         (UpperCase(FieldByName('Location').NewValue)<>UpperCase(FieldByName('Location').OldValue))
         )
           ) then
    begin
      strSQL:='select * from [Data0840] where Location = '+QuotedStr(FieldByName('Location').NewValue);
      if RecordExists(strSQL,dtRead)then
      begin
        strMsg:=strMsg+'字段“'+FieldByName('Location').DisplayLabel+'”的值“'+trim(FieldByName('Location').NewValue)+'”已经存在。'+#13
      end;
    end;

    if FieldByName('D015_ptr').IsNull then
      strMsg:=strMsg+'字段：“'+FieldByName('ABBR_NAME').DisplayLabel+'”的值不能为空！！！'+#13;
  end;

  with cdsChild do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
  end;

  with DM_frm.cdsClone do
  try
    Close;
    CloneCursor(cdsChild,False);
    DM_frm.cdsTemp.Data:=cdsChild.Data;

    DisableControls ;
    Last;    
    for I_Row := RecordCount downto 1 do
    begin
      if FieldByName('D005_ptr').AsString='' then
        strMsg:=strMsg+'明细表第'+IntToStr(I_Row+1)+'行，字段：“'+cdsChild.FieldByName('EMPL_CODE').DisplayLabel+'”的值不能为空。'+#13
      else
      begin
        //判断子表中是否有相同雇员
        with DM_frm.cdsTemp do
        begin
          Last;
          Filtered := False;
          Filter   := 'D005_ptr = '+DM_frm.cdsClone.FieldByName('D005_ptr').AsString;
          Filtered := True;

          if RecordCount >=2 then
          begin
            strMsg:=strMsg+'明细表第'+IntToStr(I_Row)+'行，字段：“'
            +cdsChild.FieldByName('EMPL_CODE').DisplayLabel+'”的值已重复。'+#13 ;
          end;
          while not Eof do    //检查过的记录或者是检查有多行重复的记录全部删除。
          Delete;
          Filtered:=False;
          Prior;
        end;
        //判断子表中的雇员是否已经在其它责任小组中存在
        strSQL := 'select data0840.Location from data0840 join data0855 on data0840.rkey = data0855.D840_ptr'
          +' where data0840.Location <> '+QuotedStr(cdsMain.FieldByName('Location').AsString )
          +' and data0855.D005_ptr = '+ DM_frm.cdsClone.FieldByName('D005_ptr').AsString  ;
        strSQL :=  SQLResultValue(dtRead,strSQL)  ;
        if strSQL <> '' then
        begin
          strMsg:=strMsg+'明细表第'+IntToStr(I_Row)+'行，字段：“'+cdsChild.FieldByName('EMPL_CODE').DisplayLabel+'”的值“'
          +FieldByName('EMPL_CODE').AsString+'”已经在“'+strSQL+'”中存在。'+#13 ;
        end;
      end;
      if FieldByName('EntrDate').IsNull then
        strMsg:=strMsg+'明细表第'+IntToStr(I_Row)+'行，字段：“'+cdsChild.FieldByName('EntrDate').DisplayLabel+'”的值不能为空。'+#13 ;
      Prior;
    end;
  finally
    Close;
    DM_frm.cdsTemp .Close ;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure Tfrm_RespGroup.cdsChildAfterOpen(DataSet: TDataSet);
var
  ActiveCount:Integer;
begin
  inherited;
  ActiveCount := 0;
  DM_frm.cdsClone.CloneCursor(cdsChild,False);
  with DM_frm.cdsClone do
  try
    First;
    while not Eof do
    begin
      if FieldByName('DepaDate').IsNull then
      ActiveCount :=  ActiveCount + 1;
      Next;
    end;
  finally
    Close;
  end;
  StatusBar1.Panels[2].Text:= '在职雇员人数:'+ IntToStr(ActiveCount); 
end;

procedure Tfrm_RespGroup.cdsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('OutsPrep').Value:=False ;
  DataSet.FieldByName('active').Value:=true ;  
end;

procedure Tfrm_RespGroup.cdsChildNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TTYPE').Value:=False ;
end;

procedure Tfrm_RespGroup.DghMainTitleClick(Column: TColumnEh);
begin
  inherited;
  Filter_Set(Column);
end;

procedure Tfrm_RespGroup.cdsMainABBR_NAMEChange(Sender: TField);
begin
  inherited;
  with dtRead_0015 do
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
      cdsMain.FieldByName('D015_ptr').Value:=null;
    end
    else
    begin
      if Locate('ABBR_NAME',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainD015_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        cdsMain.FieldByName('D015_ptr').Value:=null;
        cdsMain.FieldByName('ABBR_NAME').Value:=null ;
        end;
    end;
  end;
end;

procedure Tfrm_RespGroup.cdsChildEMPL_CODEChange(Sender: TField);
begin
  inherited;
  with dtRead_0005 do
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
      if Sender.DataSet.FieldByName('EMPLOYEE_NAME').isnull=False then
        Sender.DataSet.FieldByName('EMPLOYEE_NAME').Value:=null;
      if Sender.DataSet.FieldByName('D005_ptr').isnull=False then
        Sender.DataSet.FieldByName('D005_ptr').Value:=null ;
    end
    else
    begin
      if Locate('EMPL_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
          Sender.DataSet.FieldByName('D005_ptr').Value := FieldByName('rkey').Value ;
          Sender.DataSet.FieldByName('EMPLOYEE_NAME').Value:= FieldByName('EMPLOYEE_NAME').Value ;
        end
      else
        begin
          if Sender.DataSet.FieldByName('D005_ptr').isnull=False then
          Sender.DataSet.FieldByName('D005_ptr').Value:=null;
          if Sender.DataSet.FieldByName('EMPLOYEE_NAME').isnull=False then
          Sender.DataSet.FieldByName('EMPLOYEE_NAME').Value:=null ;
          Sender.Value:=null;
          ShowMessage('雇员代码不存在！！！');
        end;
    end;
  end;
end;

end.
