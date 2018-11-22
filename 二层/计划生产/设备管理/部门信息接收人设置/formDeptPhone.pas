unit formDeptPhone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet_unt,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  StdCtrls, RzPanel, ExtCtrls, Menus, DBGrids, RzButton;

type
  TfrmDeptPhone = class(TSingleDataSet_frm)
    cdsMainUSER_LOGIN_NAME: TStringField;
    cdsMainUSER_FULL_NAME: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cdsMainWAREHOUSE_CODE: TStringField;
    cdsMainUser_ptr: TIntegerField;
    cdsMainDeptCode: TStringField;
    cdsMainPhone: TStringField;
    cdsMainwarehouse_ptr: TIntegerField;
    cdsMainABBR_NAME: TStringField;
    dtMainUSER_LOGIN_NAME: TStringField;
    dtMainUSER_FULL_NAME: TStringField;
    dtMainDEPT_NAME: TStringField;
    dtMainWAREHOUSE_CODE: TStringField;
    dtMainABBR_NAME: TStringField;
    dtMainUser_ptr: TIntegerField;
    dtMainDeptCode: TStringField;
    dtMainPhone: TStringField;
    dtMainwarehouse_ptr: TIntegerField;
    cds0034: TClientDataSet;
    cds0073: TClientDataSet;
    cds0015: TClientDataSet;
    cds0034DEPT_CODE: TStringField;
    cds0034DEPT_NAME: TStringField;
    cds0034RKEY: TIntegerField;
    cds0073RKEY: TIntegerField;
    cds0073USER_LOGIN_NAME: TStringField;
    cds0073USER_FULL_NAME: TStringField;
    cds0015ABBR_NAME: TStringField;
    cds0015RKEY: TIntegerField;
    cds0015WAREHOUSE_CODE: TStringField;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cdsMainUser_ptrChange(Sender: TField);
    procedure cdsMainUSER_LOGIN_NAMEChange(Sender: TField);
    procedure cdsMainWAREHOUSE_CODEChange(Sender: TField);
    procedure cdsMainDeptCodeChange(Sender: TField);
    procedure cdsMainAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    function SaveBeforeCheck():Boolean;   override;
  public
    { Public declarations }
  end;

var
  frmDeptPhone: TfrmDeptPhone;

implementation

uses DM_unt, PublicFile;

{$R *.dfm}

function TfrmDeptPhone.SaveBeforeCheck():Boolean;
var
  strMsg,strSQL:string;
begin
  Result:=True;
  with cdsMain do
  begin          
    if State in [dsEdit ,dsInsert] then
    Post;
    if FieldByName('User_ptr').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('USER_LOGIN_NAME').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('DeptCode').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('DeptCode').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('Phone').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('Phone').DisplayLabel+'”的值不能为空！！！'+#13;
    if FieldByName('warehouse_ptr').IsNull then //
      strMsg:=strMsg+'字段：“'+FieldByName('WAREHOUSE_CODE').DisplayLabel+'”的值不能为空！！！'+#13;

    if (FieldByName('User_ptr').IsNull=False)and (FieldByName('DeptCode').IsNull=False)and (FieldByName('warehouse_ptr').IsNull=False) then
    if (UpdateStatus=usInserted)
         or((UpdateStatus=usModified) and ((UpperCase(FieldByName('User_ptr').NewValue)<>UpperCase(FieldByName('User_ptr').OldValue))
                                         or(UpperCase(FieldByName('DeptCode').NewValue)<>UpperCase(FieldByName('DeptCode').OldValue))
                                         or(UpperCase(FieldByName('warehouse_ptr').NewValue)<>UpperCase(FieldByName('warehouse_ptr').OldValue))
                                         )
           ) then
    begin
      strSQL:='select * from data0834 where User_ptr='+IntToStr(FieldByName('User_ptr').NewValue)
             +' and DeptCode= '+QuotedStr(FieldByName('DeptCode').NewValue)
             +' and warehouse_ptr= '+IntToStr(FieldByName('warehouse_ptr').NewValue);
    //  ShowMessage(strSQL);
      if RecordExists(strSQL,DM_frm.cdsRead)then
      begin
        strMsg:=strMsg+'字段：“'+FieldByName('USER_LOGIN_NAME').DisplayLabel+'”的值“'+trim(FieldByName('USER_LOGIN_NAME').NewValue)
                      +'，字段：“'+FieldByName('DeptCode').DisplayLabel+'”的值“'+trim(FieldByName('DeptCode').NewValue)
                      +'，字段：“'+FieldByName('WAREHOUSE_CODE').DisplayLabel+'”的值“'+trim(FieldByName('WAREHOUSE_CODE').NewValue)
          +'”已经存在！！！'+#13
      end;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure TfrmDeptPhone.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;  
  Caption := application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd'; { }
     
 {  DM_frm.ADOConnection1.Close;
  DM_frm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  DM_frm.ADOConnection1.Open;
  Userrkey := 2522;
  vprev := '4';}

  Find_DisplayFields  :=VarArrayOf(['USER_LOGIN_NAME','USER_FULL_NAME','DeptCode','DEPT_NAME','WAREHOUSE_CODE','ABBR_NAME','Phone']);
  Find_FieldsName     :=VarArrayOf(['Phone']);
  Find_QueryFieldsName:=VarArrayOf(['data0834.Phone']);

  inherited;
  SetEmployeeInfo(dtRead,StatusBar1);
  with  cds0034 do
  begin
    if  StrToInt(vprev) < 4 then           //如果权限码小于4，只能查看到本人所有部门和本人所在部门的工序
    begin
      Close;
      CommandText:='declare @vUSER_Rkey int select @vUSER_Rkey='+IntToStr(UserRkey)
               +' select data0034.rkey,data0034.DEPT_CODE,DEPT_NAME,TTYPE '
               +'from data0034 '
               +'where ttype in (1,4,5)and(rkey in     (select employee_id from  dbo.Data0005 '
                                   +'join data0073 on Data0005.rkey=data0073.EMPLOYEE_PTR '
                                   +'where data0073.rkey=@vUSER_Rkey)) '
               +'or(BIG_DEPT_PTR in (select employee_id from  dbo.Data0005 '
                                   +'join data0073 on Data0005.rkey=data0073.EMPLOYEE_PTR '
                                   +'where data0073.rkey=@vUSER_Rkey))';
      DghMain.FieldColumns['DEPTCODE'].ReadOnly:=true;           // 如果权限码小于4，只能选择，不能输入。限制输入人员只能添加本部门的数据。
      dghMain.FieldColumns['USER_LOGIN_NAME'].ReadOnly:=true;
    end;
    Open;
  end;


  if vprev = '4' then                       //如果权限码是4，可打开所有的数据
  begin
    cdsMain.CommandText:=cdsMain.F_SQLSelectFrom+#13+cdsMain.F_SQLOrderBy ;
    cdsMain.Open;

    var_DropDown_Info:=TDropDownInfo.Create();
    with var_DropDown_Info do
    begin
      L_SourceDataSet         :=cdsMain;
      L_GridName              :=DghMain;
      L_ColsInfo:='USER_LOGIN_NAME/用户代码/80,USER_FULL_NAME/用户名称/120';
      L_ListDataSet           :=cds0073;
      L_DropdownColumn        :='USER_LOGIN_NAME';
      L_ListDataSetFilterField:='USER_LOGIN_NAME';
      L_ListResultField       :='USER_LOGIN_NAME';
      L_GetValueField         :='USER_LOGIN_NAME';
      L_SourceField           :=varArrayOf(['User_ptr','USER_FULL_NAME']);
      L_ResultField           :=varArrayOf(['rkey','USER_FULL_NAME']);
      DropDownInfo_Init(var_DropDown_Info);
    end;
    DropDown_Info_List.Add(var_DropDown_Info) ;
  end
  else                                   //否则只能打开自己相关的记录
  begin
    cdsMain.Close;
    cdsMain.CommandText:=cdsMain.F_SQLSelectFrom+' where User_ptr='+IntTostr(UserRkey)+#13+cdsMain.F_SQLOrderBy ;
    cdsMain.Open; 
  end;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='DEPT_CODE/部门代码/80,DEPT_NAME/部门名称/120';
    L_ListDataSet           :=cds0034;
    L_DropdownColumn        :='DeptCode';
    L_ListDataSetFilterField:='DEPT_CODE';
    L_ListResultField       :='DEPT_CODE';
    L_GetValueField         :='DeptCode';
    L_SourceField           :=varArrayOf(['DEPT_NAME']);
    L_ResultField           :=varArrayOf(['DEPT_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='WAREHOUSE_CODE/工厂代码/80,ABBR_NAME/工厂名称/120';
    L_ListDataSet           :=cds0015;
    L_DropdownColumn        :='WAREHOUSE_CODE';
    L_ListDataSetFilterField:='WAREHOUSE_CODE';
    L_ListResultField       :='WAREHOUSE_CODE';
    L_GetValueField         :='WAREHOUSE_CODE';
    L_SourceField           :=varArrayOf(['warehouse_ptr','ABBR_NAME']);
    L_ResultField           :=varArrayOf(['rkey','ABBR_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
end;

procedure TfrmDeptPhone.Button2Click(Sender: TObject);
begin
  inherited;
  if messagebox(Self.Handle,'确定要将当前电话号码更新到对应的雇员记录中吗？','询问',MB_YESNO+MB_iconquestion)=idNo then
    Exit;
  if cdsMain.State in [dsInsert,dsEdit] then
    cdsMain.Post;

  if (cdsMain.FieldByName('PHONE').IsNull=False )and(cdsMain.FieldByName('PHONE').AsString<>'' )then
  with cdsRead do
  begin                                    {用户指针改变的时候，记取雇员电话号码，如果不是空，给当前用户电话号码赋值}
    Close;
    CommandText:='update data0005 set PHONE='+QuotedStr(cdsMain.FieldByName('PHONE').AsString)
      +' from  data0073 join data0005 on data0073.EMPLOYEE_PTR=data0005.rkey where data0073.rkey='+IntToStr(UserRkey )
      +' select @@error F_error,@@ROWCOUNT F_ROWCOUNT';
    Execute;
    Open;
    if (FieldByName('F_error').AsInteger=0) and  (FieldByName('F_ROWCOUNT').AsInteger=1) then
    begin
      messagebox(Self.Handle,'已成功更新雇员中的电话号码！','信息',MB_ok+MB_iconinformation);
    end;
    Close;
  end;
end;

procedure TfrmDeptPhone.cdsMainUser_ptrChange(Sender: TField);
begin
  inherited;
  if Sender.IsNull =False then
  begin
    with cdsRead do
    begin                                    {用户指针改变的时候，记取雇员电话号码，如果不是空，给当前用户电话号码赋值}
      Close;
      CommandText:='select t5.PHONE from data0073 t3 join data0005 t5 on t3.EMPLOYEE_PTR=t5.rkey where t3.rkey='+Sender.AsString;
      Open;
      if (FieldByName('PHONE').IsNull=False )and(FieldByName('PHONE').AsString<>'' )then
      begin
        Sender.DataSet.FieldByName('PHONE').Value:= FieldByName('PHONE').Value;
      end;
      Close;
    end;
  end;
end;

procedure TfrmDeptPhone.cdsMainUSER_LOGIN_NAMEChange(Sender: TField);
begin
  inherited;
  with cds0073 do
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
      cdsMainUser_ptr.Value  :=null;
      cdsMainUSER_FULL_NAME.Value:= null;
    end
    else
    begin
      if Locate('USER_LOGIN_NAME',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainUser_ptr.Value      := FieldByName('rkey').Value ;
        cdsMainUSER_FULL_NAME.Value:= FieldByName('USER_FULL_NAME').Value ;
        end
      else
        begin
        cdsMainUser_ptr.Value  :=null;
        cdsMainUSER_FULL_NAME.Value:= null;
        ShowMessage('用户名不存在！！！');
        end;
    end;
  end;
end;

procedure TfrmDeptPhone.cdsMainWAREHOUSE_CODEChange(Sender: TField);
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
      cdsMain.FieldByName('warehouse_ptr').Value := null;
      cdsMain.FieldByName('ABBR_NAME')    .Value := null;
    end
    else
    begin
      if Locate('WAREHOUSE_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
        cdsMainwarehouse_ptr.Value            := FieldByName('rkey').Value ;
        cdsMain.FieldByName('ABBR_NAME').Value:= FieldByName('ABBR_NAME').Value ;
        end
      else
        begin
          cdsMain.FieldByName('warehouse_ptr').Value := null;
          cdsMain.FieldByName('ABBR_NAME')    .Value := null;
          ShowMessage('工厂名称不存在！！！');
        end;
    end;
  end;
end;

procedure TfrmDeptPhone.cdsMainDeptCodeChange(Sender: TField);
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
    cdsMain.FieldByName('DEPT_NAME').Value:=null ;
  end
  else
  begin
    if cds0034.Locate('DEPT_CODE',Sender.Value,[loCaseInsensitive]) then
      begin
      cdsMainDEPT_NAME.Value:= cds0034.FieldByName('DEPT_NAME').Value ;
      end
    else
      begin
      cdsMain.FieldByName('DEPT_NAME').Value:=null ;
      ShowMessage('部门代码不存在！！！');
      end;
  end;
end;

procedure TfrmDeptPhone.cdsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
    if StrToInt(vprev)<4 then
    DataSet.FieldByName('USER_LOGIN_NAME').Value:=USER_LOGIN_NAME;
end;

end.
