unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    DS1: TDataSource;
    ADO567: TADOQuery;
    ADO567_1: TADOQuery;
    DS2: TDataSource;
    DS3: TDataSource;
    ADO568: TADOQuery;
    ADO568rkey: TAutoIncField;
    ADO568failure_ptr: TIntegerField;
    ADO568part_name: TStringField;
    ADO568part_desc: TStringField;
    ADO568quantity: TBCDField;
    ADO568supplier_name: TStringField;
    ADO568amout: TBCDField;
    ADO568remart: TStringField;
    ADO567RKEY: TIntegerField;
    ADO567NUMBER: TStringField;
    ADO567STATUS: TWordField;
    ADO567DEPT_PTR: TIntegerField;
    ADO567FASSET_PTR: TIntegerField;
    ADO567PLACE: TStringField;
    ADO567equipment_grade: TStringField;
    ADO567failure_grade: TStringField;
    ADO567failure_degree: TStringField;
    ADO567failure_date: TDateTimeField;
    ADO567EMPL_PTR: TIntegerField;
    ADO567ent_date: TDateTimeField;
    ADO567referring_date: TDateTimeField;
    ADO567CONTACT_NAME: TStringField;
    ADO567CONTACT_PHONE: TStringField;
    ADO567failure_circs: TStringField;
    ADO567disposal_emplptr: TIntegerField;
    ADO567disposal_date: TDateTimeField;
    ADO567maintain_empl: TStringField;
    ADO567maintain_text: TStringField;
    ADO567complete_date: TDateTimeField;
    ADO567validate_emplptr: TIntegerField;
    ADO567validate_date: TDateTimeField;
    ADO567validate_appraise: TStringField;
    ADO567fail_type: TStringField;
    ADO567DEPT_CODE: TStringField;
    ADO567DEPT_NAME: TStringField;
    ADO567FASSET_CODE: TStringField;
    ADO567FASSET_NAME: TStringField;
    ADO567FASSET_DESC: TStringField;
    ADO567EMPL_CODE: TStringField;
    ADO567EMPLOYEE_NAME: TStringField;
    ADO567status_c: TStringField;
    ADO567vali_name: TStringField;
    ADO567rkey34: TIntegerField;
    ADO567dispodalMan: TStringField;
    ADOQuery1: TADOQuery;
    ADO567WHOUSE_PTR: TIntegerField;
    ADO567ABBR_NAME: TStringField;
    ADO567warehouse_code: TStringField;
    qry_841: TADOQuery;
    qry_841USER_FULL_NAME: TStringField;
    qry_841Status: TStringField;
    qry_841Record_date: TDateTimeField;
    qry_841remark: TWideStringField;
    qry_841_1: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    WideStringField1: TWideStringField;
    ADO567validate_Description: TStringField;
    ADO567tslr: TStringField;
    ADO567thlr: TStringField;
    qry_D0846: TADOQuery;
    qry_D0846rkey: TAutoIncField;
    qry_D0846FaultName: TStringField;
    ADO567_1RKEY: TAutoIncField;
    ADO567_1NUMBER: TStringField;
    ADO567_1STATUS: TWordField;
    ADO567_1DEPT_PTR: TIntegerField;
    ADO567_1FASSET_PTR: TIntegerField;
    ADO567_1PLACE: TStringField;
    ADO567_1equipment_grade: TStringField;
    ADO567_1failure_grade: TStringField;
    ADO567_1failure_degree: TStringField;
    ADO567_1failure_date: TDateTimeField;
    ADO567_1EMPL_PTR: TIntegerField;
    ADO567_1ent_date: TDateTimeField;
    ADO567_1referring_date: TDateTimeField;
    ADO567_1CONTACT_NAME: TStringField;
    ADO567_1CONTACT_PHONE: TStringField;
    ADO567_1failure_circs: TStringField;
    ADO567_1disposal_emplptr: TIntegerField;
    ADO567_1disposal_date: TDateTimeField;
    ADO567_1maintain_empl: TStringField;
    ADO567_1maintain_text: TStringField;
    ADO567_1complete_date: TDateTimeField;
    ADO567_1validate_emplptr: TIntegerField;
    ADO567_1validate_date: TDateTimeField;
    ADO567_1validate_appraise: TStringField;
    ADO567_1fail_type: TStringField;
    ADO567_1WHOUSE_PTR: TIntegerField;
    ADO567_1suspended_reason: TWideStringField;
    ADO567_1stoppage_time: TDateTimeField;
    ADO567_1recovery_time: TDateTimeField;
    ADO567_1completion_emplptr: TIntegerField;
    ADO567_1stop_house: TBCDField;
    ADO567_1maintain_house: TBCDField;
    ADO567_1validate_Description: TStringField;
    ADO567_1D846_ptr: TIntegerField;
    ADO567_1FaultName: TStringField;
    qry_D0846All: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField3: TStringField;
    ADO567_1Staff_Sum_house: TBCDField;
    ADO567_1D840_ptr: TIntegerField;
    ADO567_1D073_ptr: TIntegerField;
    ADO567D073_ptr: TIntegerField;
    ADO567D840_ptr: TIntegerField;
    ADO567suspended_reason: TWideStringField;
    ADO567stoppage_time: TDateTimeField;
    ADO567recovery_time: TDateTimeField;
    ADO567completion_emplptr: TIntegerField;
    ADO567stop_house: TBCDField;
    ADO567maintain_house: TBCDField;
    ADO567D846_ptr: TIntegerField;
    ADO567Staff_Sum_house: TBCDField;
    ADO567FASSET_TYPE: TStringField;
    procedure ADO567AfterScroll(DataSet: TDataSet);
  private

  public
    
     function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;
  Frkey567:integer;
implementation

uses Frm_main_u;

{$R *.dfm}

function TDM.GetNo(edt: TMaskEdit; ikey: string;tp:integer=0):boolean;
var i,iL:integer;
    s,sL:string;
    B:boolean;
    table_name:string;
begin
  result:=false;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select SEED_VALUE,seed_flag,table_name  from data0004  where rkey ='+ikey;
  DM.Tmp.Open;
  if DM.Tmp.IsEmpty or (DM.Tmp.Fields[1].AsInteger=1) then exit;

  s:=trim(DM.Tmp.Fields[0].AsString);
  table_name:=trim(DM.Tmp.Fields[2].AsString);
  if DM.Tmp.Fields[1].AsInteger=2 then        //固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL:=length(s);
    for i:=iL downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
    edt.editmask:=copy(s,1,i)+'!'+copy('9999999999',i+1,iL-i)+';1;_';
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=s
    else begin
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 number from '+table_name+' where number='''+edt.Text+'''';
      DM.Tmp.Open;
      if not DM.Tmp.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 number from '+table_name+' order by number desc';
      DM.Tmp.Open;
      if DM.Tmp.IsEmpty or (DM.Tmp.Fields[0].AsString<=edt.Text) then
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE='''+copy(edt.Text,1,i)+rightstr('00000'+inttostr(strtoint(rightstr(edt.Text,length(edt.Text)-i))+1),length(edt.Text)-i)+
                         '''  where rkey='+ikey;
        DM.Tmp.ExecSQL;
      end;

    end;
  end else if DM.Tmp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;    
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
      if DM.Tmp.ExecSQL=0  then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end;
    end;
  end else if DM.Tmp.Fields[1].AsInteger=4 then begin  //只能系统产生
    edt.ReadOnly:=true;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;

      B:=true;
      while B do
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                         'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
        if DM.Tmp.ExecSQL=0 then
        begin
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey ='+ikey;
          DM.Tmp.Open;
          edt.Text:=DM.Tmp.Fields[0].AsString;
        end else
          B:=false;
      end;
    end;
  end ;
  result:=true;
end;

procedure TDM.ADO567AfterScroll(DataSet: TDataSet);
begin
  Frm_main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DataSet.RecNo)+'/总记录数:'+ IntToStr(DataSet.RecordCount);
end;

end.
