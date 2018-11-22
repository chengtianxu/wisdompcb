unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,mask,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADO570: TADOQuery;
    tmp: TADOQuery;
    DS1: TDataSource;
    ADO570RKEY: TAutoIncField;
    ADO570number: TStringField;
    ADO570ttype: TWordField;
    ADO570status: TWordField;
    ADO570DEPT_PTR: TIntegerField;
    ADO570formula_number: TStringField;
    ADO570start_date: TDateTimeField;
    ADO570end_date: TDateTimeField;
    ADO570EMPL_PTR: TIntegerField;
    ADO570Statistic_date: TDateTimeField;
    ADO570authempl_ptr: TIntegerField;
    ADO570auth_date: TDateTimeField;
    ADO570INVENTORY_PTR: TIntegerField;
    ADO570Statistic_ptr: TIntegerField;
    ADO570OPEN_QUANTITY: TBCDField;
    ADO570expend_QUANTITY: TBCDField;
    ADO570CLOSED_QUANTITY: TBCDField;
    ADO570theory_result: TBCDField;
    ADO570measure_result1: TBCDField;
    ADO570measure_result2: TBCDField;
    ADO570measure_result3: TBCDField;
    ADO570master_remark: TStringField;
    ADO570status_c: TStringField;
    ADO570abbr_name: TStringField;
    ADO570INV_PART_NUMBER: TStringField;
    ADO570ttype_c: TStringField;
    ADO570dept_name: TStringField;
    ADO570_1: TADOQuery;
    ADO571: TADOQuery;
    ADO572: TADOQuery;
    ADO571Statistic_ptr: TIntegerField;
    ADO571recno_number: TIntegerField;
    ADO571ttype: TWordField;
    ADO571WORK_ORDER_number: TStringField;
    ADO571PANEL_A_B: TStringField;
    ADO571customer_name: TStringField;
    ADO571MANU_PART_NUMBER: TStringField;
    ADO571MANU_PART_DESC: TStringField;
    ADO571EPI_NUMBER: TStringField;
    ADO571REMARK: TStringField;
    ADO571pan_qty: TIntegerField;
    ADO571set_qty: TIntegerField;
    ADO571pan_size: TStringField;
    ADO571set_size: TStringField;
    ADO571pcs_size: TStringField;
    ADO571pan_sqrt: TBCDField;
    ADO571set_sqrt: TBCDField;
    ADO571pcs_sqrt: TBCDField;
    ADO571theory_result: TBCDField;
    ADO571measure_result1: TBCDField;
    ADO571measure_result2: TBCDField;
    ADO571measure_result3: TBCDField;
    ADO571PARA_PTR_0: TIntegerField;
    ADO571PARA_PTR_1: TIntegerField;
    ADO571PARA_PTR_2: TIntegerField;
    ADO571PARA_PTR_3: TIntegerField;
    ADO571PARA_PTR_4: TIntegerField;
    ADO571PARA_PTR_5: TIntegerField;
    ADO571PARA_PTR_6: TIntegerField;
    ADO571PARA_PTR_7: TIntegerField;
    ADO571PARA_PTR_8: TIntegerField;
    ADO571PARA_PTR_9: TIntegerField;
    DS2: TDataSource;
    ADO572Statistic_ptr: TIntegerField;
    ADO572recno_number: TIntegerField;
    ADO572bach_num: TIntegerField;
    ADO572se_num: TIntegerField;
    ADO572au_umply: TBCDField;
    ADO572measure_date: TDateTimeField;
    ADO572measure_empl: TStringField;
    DS3: TDataSource;
    ADO570dept_code: TStringField;
    ADO570rkey34: TAutoIncField;
    ADO570INV_PART_DESCRIPTION: TStringField;
    ADOCon1: TADOConnection;
    tmp1: TADOQuery;
    ADOPara: TADOQuery;
    DS4: TDataSource;
    AQ280: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    AQ280rkey: TAutoIncField;
    AQ280ENG_TABLE_NAME: TStringField;
    AQ280DATA_TYPE: TIntegerField;
    AQ280fx_type: TWordField;
    AQ280fy_type: TWordField;
    ADOStoredProc1tvalue: TStringField;
    ADO570theorycalc_meth: TStringField;
    ADO570measurecalc_meth1: TStringField;
    ADO570measurecalc_meth2: TStringField;
    ADO570measurecalc_meth3: TStringField;
    ADO571PARA_VALUE_0: TStringField;
    ADO571PARA_VALUE_1: TStringField;
    ADO571PARA_VALUE_2: TStringField;
    ADO571PARA_VALUE_3: TStringField;
    ADO571PARA_VALUE_4: TStringField;
    ADO571PARA_VALUE_5: TStringField;
    ADO571PARA_VALUE_6: TStringField;
    ADO571PARA_VALUE_7: TStringField;
    ADO571PARA_VALUE_8: TStringField;
    ADO571PARA_VALUE_9: TStringField;
    ADO569: TADOQuery;
    ADO571pcs_qty: TIntegerField;
    ADO570unit_name: TStringField;
    ADO570inv_name: TStringField;
    procedure ADO572NewRecord(DataSet: TDataSet);
    procedure ADO571NewRecord(DataSet: TDataSet);
    procedure ADO571AfterOpen(DataSet: TDataSet);
    procedure ADO571AfterScroll(DataSet: TDataSet);
    procedure ADO571ttypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADO571pan_qtySetText(Sender: TField; const Text: String);
    procedure ADO572BeforePost(DataSet: TDataSet);
    procedure ADO572BeforeDelete(DataSet: TDataSet);
  private

  public
    Fa:array of string;
    isFa:boolean;
    function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
    procedure readData(sD1,sD2:string;tp:integer;sDept:string);
    function getval(tp:integer):double;
    function Calcu(sExpr:string):double;
    procedure GetTotal(var iRec, iPnl,iSet:integer);
  end;

var
  DM: TDM;
  rkey570:integer;
  MaxRecno_number:integer;
  svFlag:boolean;
  sCust:string;

  FCurrDate:TDatetime;
  isWF:boolean;

  Fistate:integer;
implementation
 uses myclass;
{$R *.dfm}

{ TDM }

function TDM.GetNo(edt: TMaskEdit; ikey: string; tp: integer): boolean;
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

procedure TDM.ADO572NewRecord(DataSet: TDataSet);
begin
  ADO572recno_number.Value:=ADO571recno_number.Value;
  ADO572measure_date.Value:=FCurrDate;
  if Fistate=2 then // 570 Edit
    ADO572Statistic_ptr.Value:=ADO570RKEY.Value;
end;

procedure TDM.ADO571NewRecord(DataSet: TDataSet);
var i:integer;
   sfld:string;
begin
  ADO571recno_number.Value:=MaxRecno_number;
  if Fistate=2 then // 570 Edit
    ADO571Statistic_ptr.Value:=ADO570RKEY.Value;
  for i:=0 to 9 do
  begin
    sfld:='PARA_PTR_'+inttostr(i);
    if not ADO569.fieldbyname(sfld).IsNull then
      ADO571.fieldbyname(sfld).Value:=ADO569.fieldbyname(sfld).value;
  end;
  inc(MaxRecno_number);
end;

procedure TDM.ADO571AfterOpen(DataSet: TDataSet);
var i:integer;
begin
  if ADO571.IsEmpty then
    MaxRecno_number:=1
  else begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select max(Recno_number) from data0571 where statistic_ptr='+ADO570RKEY.AsString;
    DM.tmp.Open;
    MaxRecno_number:=DM.tmp.Fields[0].AsInteger+1;

    ADOPara.Close;
    for i:=0 to 9 do
      ADOPara.Parameters[i].Value:=ADO571.fieldbyname('PARA_PTR_'+inttostr(i)).AsInteger;
    ADOPara.Open;
  end;
end;

procedure TDM.readData(sD1, sD2: string;tp:integer;sDept:string);
begin
  svFlag:=true;
  DM.ADO571.Filter:='customer_name='''+sCust+'''';
  DM.ADO571.First;
  while not DM.ADO571.Eof do DM.ADO571.Delete;
  DM.ADO571.Filter:='';
  if tp=0 then //汇总
    tmp.SQL.Text:='SELECT sum(dbo.Data0048.PANELS) PANELS , sum(CEILING(dbo.Data0048.QTY_PROD / dbo.Data0025.set_qty)) sc_setqty, sum(dbo.Data0048.QTY_PROD) QTY_PROD,'+
                     'null WORK_ORDER_NUMBER,dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+
                     'CASE dbo.Data0006.PANEL_A_B WHEN 0 THEN ''APNL'' WHEN 1 THEN ''BPNL'' ELSE '''' END AS PNL, dbo.Data0025.ttype, dbo.Data0006.pnl_size,'+
                     'dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.ANALYSIS_CODE_5, sum(dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001) pan_sq,'+
                     'sum(dbo.Data0025.set_lngth * dbo.Data0025.set_width * 0.000001) set_sq, sum(dbo.Data0025.pcs_sq) pcs_sq '+
                     'FROM dbo.Data0048 INNER JOIN '+
                     'dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INNER JOIN '+
                     'dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY '+
                   'WHERE (dbo.Data0048.FM_DEPT_PTR ='+sDept+' ) AND (dbo.Data0048.OUTTIME >'''+sD1+''') AND '+
                   '(dbo.Data0048.OUTTIME <= '''+sD2+''') AND (dbo.Data0048.WTYPE <> 3)'+
              'group by dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,dbo.Data0006.PANEL_A_B,dbo.Data0025.ttype,dbo.Data0006.pnl_size,'+
              'dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.ANALYSIS_CODE_5 order by dbo.Data0025.MANU_PART_NUMBER'
  else
    tmp.SQL.Text:='SELECT dbo.Data0048.PANELS,CEILING(dbo.Data0048.QTY_PROD/dbo.Data0025.set_qty) AS sc_setqty, dbo.Data0048.QTY_PROD,'+
                        'dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+
                        'CASE dbo.Data0006.PANEL_A_B WHEN 0 THEN ''APNL'' WHEN 1 THEN ''BPNL'' ELSE '''' END AS PNL, dbo.Data0025.ttype, dbo.Data0006.pnl_size,'+
                        'dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025.ANALYSIS_CODE_5, dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001 AS pan_sq,'+
                        'dbo.Data0025.set_lngth*dbo.Data0025.set_width * 0.000001 AS set_sq, dbo.Data0025.pcs_sq '+
                        'FROM dbo.Data0048 INNER JOIN '+
                        'dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INNER JOIN '+
                        'dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY '+
                   'WHERE (dbo.Data0048.FM_DEPT_PTR ='+sDept+' ) AND (dbo.Data0048.OUTTIME >'''+sD1+''') AND '+
                        '(dbo.Data0048.OUTTIME <= '''+sD2+''') AND (dbo.Data0048.WTYPE <> 3) order by dbo.Data0025.MANU_PART_NUMBER';

  tmp.Close;
  tmp.Open;
  while not tmp.Eof do
  begin
    ADO571.Append;
    ADO571ttype.Value:=DM.tmp.fieldbyname('ttype').AsInteger;
    ADO571WORK_ORDER_number.Value:=DM.tmp.fieldbyname('WORK_ORDER_NUMBER').AsString;
    ADO571PANEL_A_B.Value:=DM.tmp.fieldbyname('PNL').Value;
    ADO571customer_name.Value:=sCust;
    ADO571MANU_PART_NUMBER.Value:=DM.tmp.fieldbyname('MANU_PART_NUMBER').AsString;
    ADO571MANU_PART_DESC.Value:=DM.tmp.fieldbyname('MANU_PART_DESC').AsString;
    ADO571pan_qty.Value:=DM.tmp.fieldbyname('PANELS').Value;
    ADO571set_qty.Value:=DM.tmp.fieldbyname('sc_setqty').Value;
    ADO571pcs_qty.Value:=DM.tmp.fieldbyname('QTY_PROD').Value;
    ADO571pan_size.Value:=DM.tmp.fieldbyname('pnl_size').Value;
    ADO571set_size.Value:=DM.tmp.fieldbyname('ANALYSIS_CODE_1').Value;
    ADO571pcs_size.Value:=DM.tmp.fieldbyname('ANALYSIS_CODE_5').Value;
    ADO571pan_sqrt.Value:=DM.tmp.fieldbyname('pan_sq').Value;
    ADO571set_sqrt.Value:=DM.tmp.fieldbyname('set_sq').Value;
    ADO571pcs_sqrt.Value:=DM.tmp.fieldbyname('pcs_sq').Value;
    ADO571.Post;
    tmp.Next;
  end;
  svFlag:=false;
end;

procedure TDM.ADO571AfterScroll(DataSet: TDataSet);
var i:integer;
begin
  if not (svFlag or isWF) then
  begin
    ADOPara.Close;
    for i:=0 to 9 do
      ADOPara.Parameters[i].Value:=ADO571.fieldbyname('PARA_PTR_'+inttostr(i)).AsInteger;
    ADOPara.Open;
  end;
end;

function TDM.getval(tp: integer): double;
var v:real;
begin
  if not DM.ADO572.Active then
  begin
    DM.ADO572.Parameters[0].Value:=DM.ADO570RKEY.Value;
    DM.ADO572.Open;
  end;
  DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
  if DM.ADO572.RecordCount=0 then
  begin
    result:=0;
    exit;
  end;

  DM.ADO572.First;
  if tp=0 then  //max
  begin
    v:=0;
    while not  DM.ADO572.Eof do
    begin
      if ADO572au_umply.Value>v then v:=ADO572au_umply.Value;
      DM.ADO572.Next;
    end;
  end else if tp=1 then //min
  begin
    v:=10000;
    while not  DM.ADO572.Eof do
    begin
      if ADO572au_umply.Value<v then v:=ADO572au_umply.Value;
      DM.ADO572.Next;
    end;
  end else begin  //aver
    v:=0;
    while not  DM.ADO572.Eof do begin v:=v+ADO572au_umply.Value;DM.ADO572.Next;end;
    v:=v/DM.ADO572.RecordCount;
  end;
  result:=v;
end;

function TDM.Calcu(sExpr: string): double;
var
  strExpr,sP:string;
  i:integer;

  j,j0,j1,j2:integer;
  vstring,vstring1,vstring2,vresult:string;
  vcol,vrow,vptr:string;
begin
  strExpr:=sExpr;

  //一步:替换回车及转换成大写
  strExpr := StringReplace(strExpr, #$D#$A, '', [rfReplaceAll]);
  strExpr:=uppercase(strExpr);

  //二步:替换变量
  for i:=0 to 9 do
  begin
   sP:=trim(uppercase(ADOPara.FieldByName('pn'+inttostr(i)).AsString));
  if (sP<>'') and (pos(sP,strExpr)>0)  then
  begin
    if ADOPara.FieldByName('d_tp'+inttostr(i)).AsString='1' then   //是数字参数
    begin
      if ADO571.FieldByName('para_value_'+inttostr(i)).IsNull or (ADO571.FieldByName('para_value_'+inttostr(i)).AsString='') then
         strExpr:= StringReplace(strExpr,' '+sP+' ','0',[rfReplaceAll])
      else
        strExpr:= StringReplace(strExpr,' '+sP+' ',ADO571.FieldByName('para_value_'+inttostr(i)).AsString,[rfReplaceAll])
    end else
      strExpr:= StringReplace(strExpr,' '+sP+' ',''''+ADO571.FieldByName('para_value_'+inttostr(i)).AsString+'''',[rfReplaceAll])
  end;
  end;
                                                         //是字符值参数
  strExpr:= StringReplace(strExpr,' PANEL_A_B ',''''+ADO571.FieldByName('PANEL_A_B').AsString+'''',[rfReplaceAll]);
  strExpr:= StringReplace(strExpr,' PAN_QTY ',ADO571.FieldByName('PAN_QTY').AsString,[rfReplaceAll]);
  strExpr:= StringReplace(strExpr,' SET_QTY ',ADO571.FieldByName('SET_QTY').AsString,[rfReplaceAll]);
  strExpr:= StringReplace(strExpr,' PCS_QTY ',ADO571.FieldByName('PCS_QTY').AsString,[rfReplaceAll]);
  strExpr:= StringReplace(strExpr,' PAN_SQRT ',ADO571.FieldByName('PAN_SQRT').AsString,[rfReplaceAll]);
  strExpr:= StringReplace(strExpr,' SET_SQRT ',ADO571.FieldByName('SET_SQRT').AsString,[rfReplaceAll]);
  strExpr:= StringReplace(strExpr,' PCS_SQRT ',ADO571.FieldByName('PCS_SQRT').AsString,[rfReplaceAll]);

//三步:替换工程表单值
  vstring:=strExpr;
  if not dm.aq280.Active then dm.aq280.Open ;  //工程表单
  dm.aq280.first;
  while not dm.AQ280.Eof do
   begin
    while pos(trim(dm.AQ280ENG_TABLE_NAME.Value)+'(',vstring)>0 do
     begin //如果一个参数出现了多次就通过这个循环逐一代换
      j:=pos(trim(dm.AQ280ENG_TABLE_NAME.Value)+'(',vstring);
      j0:=pos('(',copy(vstring,j,length(vstring)-j));
      j1:=pos(',',copy(vstring,j,length(vstring)-j));
      j2:=pos(')',copy(vstring,j,length(vstring)-j));
      vstring1:=copy(vstring,1,j-1);
      vstring2:=copy(vstring,j+j2,500-j-j2);

      vptr:=DM.AQ280RKEY.AsString;
      vrow:=copy(vstring,j+j0,j1-j0-1); //函数X变量
      vcol:=copy(vstring,j+j1,j2-j1-1); //函数Y变量

      with dm.ADOStoredProc1 do //读取所在的行号
       begin
        close;
        parameters.ParamByName('@vptr').Value :=strtoint(vptr); //280.RKEY
        parameters.ParamByName('@vtpx').Value :=DM.AQ280fx_type.Value; //x方向变量类型
        parameters.ParamByName('@vtpy').Value :=DM.AQ280fy_type.Value; //Y方向变量类型
        if dm.AQ280fx_type.Value=1 then //数字类型
         begin
          parameters.ParamByName('@vcol').Value :=strtofloat(vrow);
          parameters.ParamByName('@vcol0').Value :='';
         end
        else
         begin
          parameters.ParamByName('@vcol').Value := 0;
          parameters.ParamByName('@vcol0').Value := trim(vrow);
         end;
        if dm.AQ280fy_type.Value=1 then //数字类型
         begin
          parameters.ParamByName('@vrow').Value :=strtofloat(vcol);
          parameters.ParamByName('@vrow0').Value :='';
         end
        else
         begin
          parameters.ParamByName('@vrow').Value := 0;
          parameters.ParamByName('@vrow0').Value := trim(vcol);
         end;
        prepared;
        open;
        vresult:=trim(dm.ADOStoredProc1tvalue.Value);
       end;

      if dm.AQ280DATA_TYPE.Value=1 then
       if pos('.',vresult)>0 then
         vstring:=vstring1+vresult+vstring2
       else
         vstring:=vstring1+' '+vresult+'.000000'+' '+vstring2
      else
        vstring:=vstring1+' '''+vresult+''' '+vstring2;
     end;
   dm.AQ280.Next;
  end;
  dm.ADOStoredProc1.Close;
  strExpr:=vstring;
  
 //四步:替换IF函数,并计算出结果
  strExpr:= Formula_Verify.Get_If_Expr(strExpr);
  if trim(strExpr)='' then strExpr:=' 0 ';
 try
  tmp.Close;
  tmp.SQL.Text :='SELECT convert(float,'+strExpr+') as vqty';
  tmp.Prepared;
  tmp.Open;
  result:=tmp.Fields[0].AsFloat;
 except
   MessageDlg('警告: 公式无法正确计算结果!', mtInformation, [mbOK],0);
   svFlag:=false;
   DM.ADO571.EnableControls;
   exit;
 end;
end;

procedure TDM.ADO571ttypeGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsInteger=0 then Text:='量产' else Text:='样板';
end;

procedure TDM.ADO571pan_qtySetText(Sender: TField; const Text: String);
begin
  if Text='' then Sender.AsInteger:=0 else  Sender.AsString:=Text;  //数据库有非空约束
end;

procedure TDM.GetTotal(var iRec, iPnl, iSet: integer);
var rec:integer;
begin
  rec:=ADO571recno_number.AsInteger;
  ADO571.DisableControls;
  svFlag:=true;
  iRec:=0; iPnl:=0; iSet:=0;
  ADO571.First;
  while not ADO571.Eof do
  begin
   // if ADO571PANEL_A_B.AsString<>'SET' then
      iPnl:=iPnl+ADO571pan_qty.asinteger;
  //  else
      iSet:=iSet+ADO571set_qty.asinteger;
    ADO571.Next;
  end;
  ADO571.Locate('recno_number',rec,[]) ;
  ADO571.EnableControls;
  iRec:=ADO571.RecordCount;
  svFlag:=false;
end;

procedure TDM.ADO572BeforePost(DataSet: TDataSet);
var s:string;
    i,j:integer;
begin
  if isFa then
  begin
    if ADO572au_umply.AsString='' then
    begin
      showmessage('您输入的金厚不能为空');
      abort;
    end;
    j:=-2;
    if DM.ADO572.RecordCount>0 then
    begin
      s:=DM.ADO572bach_num.AsString+'-'+DM.ADO572se_num.AsString;
      if DM.ADO572.State in [dsEdit] then j:=DM.ADO572.RecNo-1;
      for i:=0 to DM.ADO572.RecordCount-1 do
      if i=j then
        continue
      else if s=fa[i] then
      begin
        showmessage('您输入的批号加序号重复');
        abort;
      end;
    end else
      i:=0;
    if j<>-2 then i:=j;
    fa[i]:=DM.ADO572bach_num.AsString+'-'+DM.ADO572se_num.AsString;
  end;
end;

procedure TDM.ADO572BeforeDelete(DataSet: TDataSet);
var
    i:integer;
begin
  if isFa then
  for i:=ADO572.RecNo-1 to ADO572.RecordCount-1 do
    Fa[i]:=Fa[i+1];
end;

end.
