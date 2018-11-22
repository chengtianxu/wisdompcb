unit form_ProcessCycle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet_unt,  ppDB,
  ppDBPipe, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppRelatv, ppProd,
  ppReport, ppComm, ppEndUsr, ImgList, ActnList, DB,
  DBClient, cds, Provider, ADODB, Grids, DBGridEh, ToolWin, ComCtrls,
  StdCtrls, RzPanel, ExtCtrls,  Mask, DBCtrls, RzEdit,
  RzDBEdit, RzDBBnEd, DBButtonEdit, Menus, RzButton;

type
  Tfrm_ProcessCycle = class(TSingleDataSet_frm)
    cdsMainDEPT_CODE: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cdsMainDescription: TStringField;
    cdsMainMinValue: TBCDField;
    cdsMainMaxValue: TBCDField;
    cdsMainDateValue: TBCDField;
    cdsMainrkey: TAutoIncField;
    cdsMainDEPT_ptr: TIntegerField;
    cdsMainD051_ptr: TIntegerField;
    dtMainDEPT_CODE: TStringField;
    dtMainDEPT_NAME: TStringField;
    dtMainDescription: TStringField;
    dtMainMinValue: TBCDField;
    dtMainMaxValue: TBCDField;
    dtMainrkey: TAutoIncField;
    dtMainDEPT_ptr: TIntegerField;
    dtMainD051_ptr: TIntegerField;
    dtMainDateValue: TBCDField;
    cds0034: TClientDataSet;
    cds0034RKEY: TAutoIncField;
    cds0034DEPT_CODE: TStringField;
    cds0034DEPT_NAME: TStringField;
    cds0051: TClientDataSet;
    cds0051rkey: TIntegerField;
    cds0051Description: TStringField;
    cds0051MinValue: TBCDField;
    cds0051MaxValue: TBCDField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_DEPT_NAME: TDBEdit;
    edt_MinValue: TDBEdit;
    edt_MaxValue: TDBEdit;
    edt_DateValue: TDBEdit;
    edb_DEPT_CODE: TDBButtonEdit;
    edb_Description: TDBButtonEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cdsMainDEPT_CODEChange(Sender: TField);
    procedure cdsMainDescriptionChange(Sender: TField);
  private
    function SaveBeforeCheck():Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ProcessCycle: Tfrm_ProcessCycle;

implementation

uses DM_unt,PublicFile, form_Cycle;

{$R *.dfm}

function Tfrm_ProcessCycle.SaveBeforeCheck():Boolean;
var
  strMsg,strSQL:string;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
    if FieldByName('DEPT_ptr').IsNull then //周期描述
    begin
      if FieldByName('DEPT_CODE').IsNull then
        strMsg:=strMsg+'字段：“'+FieldByName('DEPT_CODE').DisplayLabel+'”的值不能为空！！！'+#13
      else
        strMsg:=strMsg+'字段：“'+FieldByName('DEPT_CODE').DisplayLabel+'”的值无效！！！'+#13 ;
    end;
    
    if FieldByName('D051_ptr').IsNull then //周期描述
    begin
      if FieldByName('Description').IsNull then
        strMsg:=strMsg+'字段：“'+FieldByName('Description').DisplayLabel+'”的值不能为空！！！'+#13
      else
        strMsg:=strMsg+'字段：“'+FieldByName('Description').DisplayLabel+'”的值无效！！！'+#13;
    end;
                                     //   
    if (FieldByName('DateValue').IsNull)or(FieldByName('DateValue').AsFloat<=0) then //周期描述
      strMsg:=strMsg+'字段：“'+FieldByName('DateValue').DisplayLabel+'”的值必须大于0！！！'+#13;

    if (FieldByName('DEPT_ptr').IsNull=False)and(FieldByName('D051_ptr').IsNull=False)then
    if (UpdateStatus=usInserted)or(
         (UpdateStatus=usModified) and ((UpperCase(FieldByName('D051_ptr').NewValue)<>UpperCase(FieldByName('D051_ptr').OldValue))
         or((UpperCase(FieldByName('DEPT_ptr').NewValue)<>UpperCase(FieldByName('DEPT_ptr').OldValue))))
         ) then
    begin
      strSQL:='select rkey from data0054 where DEPT_ptr='+IntToStr(FieldByName('DEPT_ptr').NewValue)
        +' and D051_ptr='+IntToStr(FieldByName('D051_ptr').NewValue);
      if RecordExists(strSQL,cdsRead)then
      begin
        strMsg:=strMsg+'字段：“'+FieldByName('DEPT_CODE').DisplayLabel+'”的值“'+trim(FieldByName('DEPT_CODE').NewValue)
          +'”，字段：“'+FieldByName('Description').DisplayLabel+'”的值“'+trim(FieldByName('Description').NewValue)+'”已经存在！！！'+#13
      end;
    end;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure Tfrm_ProcessCycle.FormCreate(Sender: TObject);
begin
 if not App_init_2(DM_frm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;             
  Caption:=application.Title ;   {  }

  {  DM_frm.ADOConnection1.Close;
  DM_frm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  DM_frm.ADOConnection1.Open;
  UserRKEY := 2522;
  vprev:='4';  }
  inherited;
  with  cdsMain   do
  begin
    CommandText:=F_SQLSelectFrom+#13 +F_SQLOrderBy;
    cdsMain.Open;
  end;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='Description/周期描述/120,MinValue/最小值/120,MaxValue/最大值/120';
    L_ListDataSet           :=cds0051;
    L_DropdownColumn        :='Description';
    L_ListDataSetFilterField:='Description';
    L_ListResultField       :='Description';
    L_GetValueField         :='Description';
    L_SourceField           :=varArrayOf(['D051_ptr']);
    L_ResultField           :=varArrayOf(['rkey']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_SourceDataSet         :=cdsMain;
    L_GridName              :=DghMain;
    L_ColsInfo:='DEPT_CODE/部门代码/120,DEPT_NAME/部门名称/120';
    L_ListDataSet           :=cds0034;
    L_DropdownColumn        :='DEPT_CODE';
    L_ListDataSetFilterField:='DEPT_CODE';
    L_ListResultField       :='DEPT_CODE';
    L_GetValueField         :='DEPT_CODE';
    L_SourceField           :=varArrayOf(['DEPT_ptr','DEPT_NAME']);
    L_ResultField           :=varArrayOf(['rkey','DEPT_NAME']);
    DropDownInfo_Init(var_DropDown_Info);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  Find_DisplayFields:=VarArrayOf(['DEPT_CODE','DEPT_NAME','Description','MinValue','MaxValue','DateValue']);

  FirstControl :=edb_DEPT_CODE;
  LastControl  :=edt_DateValue;
end;

procedure Tfrm_ProcessCycle.Button2Click(Sender: TObject);
begin
  inherited;
  if  Assigned(frm_Cycle)=False then
  Application.CreateForm(Tfrm_Cycle, frm_Cycle);
  frm_Cycle.ShowModal;
end;

procedure Tfrm_ProcessCycle.cdsMainDEPT_CODEChange(Sender: TField);
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
    cdsMain.FieldByName('dept_ptr').Value:=null;
    cdsMain.FieldByName('DEPT_NAME').Value:=null ;
    
  end
  else
  begin
    if cds0034.Locate('DEPT_CODE',Sender.Value,[loCaseInsensitive]) then
      begin
      cdsMaindept_ptr.Value := cds0034.FieldByName('rkey').Value ;
      cdsMainDEPT_NAME.Value:= cds0034.FieldByName('DEPT_NAME').Value ;
      end
    else
      begin
      cdsMain.FieldByName('dept_ptr').Value:=null;
      cdsMain.FieldByName('DEPT_NAME').Value:=null ;
    //  cdsMain.FieldByName('DEPT_CODE').Value:=null;
      ShowMessage('部门代码不存在！！！');
      end;
  end;
end;

procedure Tfrm_ProcessCycle.cdsMainDescriptionChange(Sender: TField);
begin
  inherited;
  with cds0051 do
  if Active=False then
  Open;

  if cds0051.Filtered then
  cds0051.Filtered:=False;

  with Sender.DataSet do
  if not(State in [dsEdit,dsInsert]) then
  Edit;

  if Sender.IsNull then
  begin
    cdsMain.FieldByName('D051_ptr').Value:=null;
    cdsMain.FieldByName('MinValue').Value:=null ;
    cdsMain.FieldByName('MaxValue').Value:=null ;
  end
  else
  begin
    if cds0051.Locate('Description',Sender.Value,[loCaseInsensitive]) then
      begin
      cdsMainD051_ptr.Value := cds0051.FieldByName('rkey').Value ;
      cdsMainMinValue.Value:= cds0051.FieldByName('MinValue').Value ;
      cdsMainMaxValue.Value:= cds0051.FieldByName('MaxValue').Value ;
      end
    else
      begin
      cdsMain.FieldByName('D051_ptr').Value:=null;
      cdsMain.FieldByName('MinValue').Value:=null ;
      cdsMain.FieldByName('MaxValue').Value:=null ;
      ShowMessage('“'+Sender.DisplayLabel+'”不存在！！！');
      end;
  end;
end;

end.
