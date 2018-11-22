unit MergeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, Grids, DBGridEh, StrUtils;

type
  Tfrm_Merge = class(TForm)
    Panel1: TPanel;
    lbl1: TLabel;
    Edit1: TEdit;
    btn1: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADS06: TADODataSet;
    ADS06selected: TBooleanField;
    ADS06RKEY: TAutoIncField;
    ADS06wtype06: TWordField;
    ADS06DEPT_CODE: TStringField;
    ADS06DEPT_NAME: TStringField;
    ADS06TTYPE: TStringField;
    ADS06QUAN_SCH: TFloatField;
    ADS06WORK_ORDER_NUMBER: TStringField;
    ADS06PROD_STATUS: TSmallintField;
    ADS06QUAN_REJ: TFloatField;
    ADS06QUAN_PROD: TFloatField;
    ADS06REFERENCE_PTR: TIntegerField;
    ADS06PARENT_PTR: TIntegerField;
    ADS06PNL_ONLine: TIntegerField;
    ADS06MANU_PART_NUMBER: TStringField;
    ADS06MANU_PART_DESC: TStringField;
    ADS06STEP: TSmallintField;
    ADS06Flow_NO_06: TSmallintField;
    ADS06QTY_BACKLOG: TFloatField;
    ADS06TO_BE_STOCKED: TFloatField;
    ADS06PUT_TYPE: TWordField;
    ADS06prod_Status_CN: TStringField;
    ADS06OnlineStatus_Old: TStringField;
    ADS06OnlineStatus: TStringField;
    ADS06CUTNO_WO: TStringField;
    ADS06ReCheck: TStringField;
    CheckBox1: TCheckBox;
    ado06: TADOQuery;
    tmp: TADOQuery;
    ADS06dept_ptr: TIntegerField;
    ADS06PANELS: TIntegerField;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    ADS06TO_BE_CANCD: TIntegerField;
    procedure btn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
      function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;
      function INQCLocked(ARkey06,ARkey34,AQty: Integer): string;//是否在QC管控中
      function INSPCLocked(ARkey06,ARkey34: Integer;var ErrStr: string): Boolean;//是否在SPC管控中
      procedure OperatDB(adotmp:TADOQuery;Asql:string);
    { Private declarations }
  public
    sql_text : string;
    { Public declarations }
  end;

var
  frm_Merge: Tfrm_Merge;

implementation

uses main,Pick_Item_Single,ConstVar,MyClass,common;

{$R *.dfm}

procedure Tfrm_Merge.btn1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/200,MANU_PART_NUMBER/本厂编号/100,DEPT_NAME/工序名称/100,CUTNO_WO/刻印内容/100,prod_Status_CN/作业单状态/100,OnlineStatus/在线状态/100,QTY_BACKLOG/当前在线数量/100,STEP/当前步骤/100';
    InputVar.Sqlstr := 'SELECT  D06.RKEY,  D06.wtype AS wtype06, d34.DEPT_CODE, d34.DEPT_NAME,d34.TTYPE, D06.QUAN_SCH, '+
      ' D06.WORK_ORDER_NUMBER, D06.PROD_STATUS, D06.QUAN_REJ, D06.QUAN_PROD, D06.PANELS,D56.TO_BE_CANCD,' +
      ' D06.REFERENCE_PTR, d25.PARENT_PTR, D56.PANELS AS PNL_ONLine, d25.MANU_PART_NUMBER, d25.MANU_PART_DESC, D56.STEP, ' +
      ' D06.FLOW_NO AS Flow_NO_06, D56.QTY_BACKLOG, D56.TO_BE_STOCKED, D56.dept_ptr,' +
      ' CASE D06.Prod_Status WHEN 3 THEN ''生产中'' WHEN 4 THEN ''外发生产'' WHEN 5 THEN ''待入仓'' WHEN 6 THEN ''待分配'' WHEN 103 THEN ''生产中暂缓'' ELSE '''' END AS' +
      ' prod_Status_CN, CASE isnull(D56.wType, 0) WHEN 0 THEN '''' ELSE ''是'' END AS OnlineStatus_Old, ' +
      ' CASE D06.wtype WHEN 0 THEN ''正常'' WHEN 1 THEN ''被拆分'' WHEN 2 THEN ''待返工'' WHEN 3 THEN ''返工'' WHEN 4 THEN ''待报废'' WHEN 5 THEN ''已报废'' ELSE '''' END' +
      ' AS OnlineStatus, D06.CUTNO_WO, CASE isnull(D56.PUT_TYPE, 0) WHEN 0 THEN '''' ELSE ''是'' END AS ReCheck'+
      ' FROM         dbo.Data0025 AS d25 INNER JOIN' +
      ' dbo.Data0006 AS D06 ON D06.BOM_PTR = d25.RKEY INNER JOIN' +
      ' dbo.Data0056 AS D56 ON D56.WO_PTR = D06.RKEY INNER JOIN' +
      ' dbo.Data0034 AS d34 ON D56.DEPT_PTR = d34.RKEY'  +
      ' WHERE   D06.prod_status in (3,5,6) and ((D06.wtype in (0,1)) or (D06.wtype in (3) and D56.PUT_TYPE>0))';
    Inputvar.KeyField:='';
    InputVar.AdoConn := frmMain.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if  edit1.Text=frmPick_Item_Single.adsPick.fieldbyname('WORK_ORDER_NUMBER').AsString then
      begin
        ADS06.Filter:='';
        ADS06.Filtered := false;
      end;
      edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('WORK_ORDER_NUMBER').AsString;
      Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end
end;


procedure Tfrm_Merge.Edit1Change(Sender: TObject);
var
  LWoNo,LWoNum,Lwtype06:string;
  LLen:Integer;
begin
  ado06.Close;
  ado06.SQL.Text := 'SELECT  D06.RKEY,  D06.wtype AS wtype06, d34.DEPT_CODE, d34.DEPT_NAME,d34.TTYPE, D06.QUAN_SCH, '+
      ' D06.WORK_ORDER_NUMBER, D06.PROD_STATUS, D06.QUAN_REJ, D06.QUAN_PROD, D06.PANELS,D56.TO_BE_CANCD,' +
      ' D06.REFERENCE_PTR, d25.PARENT_PTR, D56.PANELS AS PNL_ONLine, d25.MANU_PART_NUMBER, d25.MANU_PART_DESC, D56.STEP, ' +
      ' D06.FLOW_NO AS Flow_NO_06, D56.QTY_BACKLOG, D56.TO_BE_STOCKED,D56.dept_ptr, ' +
      ' CASE D06.Prod_Status WHEN 3 THEN ''生产中'' WHEN 4 THEN ''外发生产'' WHEN 5 THEN ''待入仓'' WHEN 6 THEN ''待分配'' WHEN 103 THEN ''生产中暂缓'' ELSE '''' END AS' +
      ' prod_Status_CN, CASE isnull(D56.wType, 0) WHEN 0 THEN '''' ELSE ''是'' END AS OnlineStatus_Old, ' +
      ' CASE D06.wtype WHEN 0 THEN ''正常'' WHEN 1 THEN ''被拆分'' WHEN 2 THEN ''待返工'' WHEN 3 THEN ''返工'' WHEN 4 THEN ''待报废'' WHEN 5 THEN ''已报废'' ELSE '''' END' +
      ' AS OnlineStatus,D56.PUT_TYPE, D06.CUTNO_WO, CASE isnull(D56.PUT_TYPE, 0) WHEN 0 THEN '''' ELSE ''是'' END AS ReCheck'+
      ' FROM         dbo.Data0025 AS d25 INNER JOIN' +
      ' dbo.Data0006 AS D06 ON D06.BOM_PTR = d25.RKEY INNER JOIN' +
      ' dbo.Data0056 AS D56 ON D56.WO_PTR = D06.RKEY INNER JOIN' +
      ' dbo.Data0034 AS d34 ON D56.DEPT_PTR = d34.RKEY'+
      ' where D06.WORK_ORDER_NUMBER=' + QuotedStr(Edit1.Text);
  ado06.Open;
  LWoNo := Edit1.Text;
  LLen := Length(LWoNo);
  if (ado06.FieldByName('cutno_wo').Value='') or (ado06.FieldByName('parent_ptr').Value>0) then//合卡条件判断(内层工单，或外层工单无刻印内容)
  begin
    if (LWoNo[LLen] in ['0'..'9']) then
    begin
      LWoNum := ' and D06.WORK_ORDER_NUMBER like ''%'+ leftstr(LWoNo,LLen)+'%''' ;
    end
    else
    begin
      LWoNum := ' and D06.WORK_ORDER_NUMBER like ''%' + LeftStr(LWoNo,LLen-1)+'%''';
    end;
  end
  else
  begin
    LWoNum := ' and D06.CUTNO_WO = '+ QuotedStr(ado06.FieldByName('CUTNO_WO').AsString);
  end;
  if (ado06.FieldByName('wtype06').Value=0) then
  begin
    Lwtype06 := ' and D06.wtype in (0,1) ';
  end
  else  if  (ado06.FieldByName('wtype06').Value=1) then
  begin
    Lwtype06 := ' and D06.wtype in (1) ';
  end
  else if (ado06.FieldByName('wtype06').Value=3) and (ado06.FieldByName('PUT_TYPE').Value>0) then
  begin
    Lwtype06 := ' and (D06.wtype in (3) and D56.PUT_TYPE>0) ';
  end
  else
  begin
    Lwtype06 := ' and D06.wtype in (999) ';
  end;
  ADS06.Filter:='';
  ADS06.Filtered := false;
  
  ADS06.Close;
  ADS06.CommandText := sql_text + ' and d34.DEPT_CODE = ' + QuotedStr(ado06.FieldByName('DEPT_CODE').AsString)+
                       ' and MANU_PART_NUMBER = ' + QuotedStr(ado06.FieldByName('MANU_PART_NUMBER').AsString)+
                       ' and D06.rkey not in ('+  ado06.FieldByName('RKEY').AsString+') and d06.PROD_STATUS='+
                       QuotedStr(ado06.FieldByName('PROD_STATUS').AsString) + LWoNum+lwtype06;
  ADS06.Open;
end;

procedure Tfrm_Merge.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS06.CommandText);
end;

function Tfrm_Merge.UpdateValueToField(pDataSet: TDataSet; value: variant;
  FieldName: string): boolean;
var
  BookMark:Tbookmark;
begin
  try
    BookMark:=pDataSet.GetBookmark;
    pDataSet.DisableControls;
    try
      pDataSet.First;
      while not pDataSet.Eof do begin
        pDataSet.Edit;
        pDataSet.FieldByName(FieldName).Value := Value;
        pDataSet.Post;
        pDataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        pDataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
  finally
    pDataSet.FreeBookmark(Bookmark);
    pDataSet.EnableControls;
  end;

end;

procedure Tfrm_Merge.CheckBox1Click(Sender: TObject);
begin
  UpdateValueToField(ADS06,checkbox1.Checked,'selected');
end;


function Tfrm_Merge.INQCLocked(ARkey06, ARkey34, AQty: Integer): string;
var
  LSql: string;
begin
  Result := '';

  LSql := 'if object_id(N''dbo.QC_PassNumCheck'',N''U'') is not null begin select 1 end else select 0';
  if not OpenQuery(tmp,LSql) then Exit;
  if tmp.Fields[0].AsInteger = 0 then
  begin
    Exit;
  end;

  LSql := ' SELECT PassNum,InputRemark FROM qc_passNumCheck WHERE Enable = 1 AND Rkey06 = ' + IntToStr(ARkey06) +
          ' AND D34_ptr = ' + IntToStr(ARkey34);
  if not OpenQuery(tmp,LSql) then exit;
  if not tmp.IsEmpty then
  begin
    if AQty > tmp.FieldByName('PassNum').AsInteger then
    begin
      Result :=  tmp.FieldByName('InputRemark').AsString;
    end;
  end;

end;

function Tfrm_Merge.INSPCLocked(ARkey06, ARkey34: Integer;
  var ErrStr: string): Boolean;
var
  LSql: string;
  LQryDef,LQrySpcCheck: TADOQuery;
  LCon: TADOConnection;
  LWONumber: string;
  LWHOUSE_PTR: string;
begin
  Result := False;
  LSql :=
  ' SELECT EDITED_BY FROM Data0006 d06 ' +
  ' inner join data0492 d492 on d492.CUT_NO = d06.CUT_NO ' +
  ' WHERE d492.WHOUSE_PTR = 1 and d06.rkey=' +  IntToStr(ARkey06);
  if not OpenQuery(tmp,LSql) then Exit;
  if tmp.IsEmpty then Exit;
  if tmp.Fields[0].AsInteger = 1 then
  begin
    ShowMessage('此工单已经被IQPS锁定，请联系IQPS');
    Result := True;
    Exit;
  end;

  LSql := 'if object_id(N''dbo.SPC_LockDeptDef'',N''U'') is not null begin select 1 end else select 0';
  if not OpenQuery(tmp,LSql) then Exit;
  if tmp.Fields[0].AsInteger = 0 then
  begin
    Exit;
  end;

  LQryDef := TADOQuery.Create(Self);
  LQrySpcCheck := TADOQuery.Create(Self);
  LCon := TADOConnection.Create(Self);
  LCon.LoginPrompt := False;
  LQrySpcCheck.Connection := LCon;
  try
    LQryDef.Connection := frmMain.ADOConnection1;
    tmp.Close;
    tmp.SQL.Text := 'select WHOUSE_PTR from data0006 where rkey = ' + IntToStr(ARkey06);
    tmp.Open;
    LWHOUSE_PTR := tmp.fieldbyname('WHOUSE_PTR').AsString;

    //取得spc定义的项目
    LSql := 'SELECT * FROM SPC_LockDeptDef WHERE Active = 1 and D34_Ptr = ' + IntToStr(ARkey34) + ' and WHOUSE_PTR = ' + LWHOUSE_PTR;
    LQryDef.SQL.Text := LSql;
    LQryDef.Open;

    if LQryDef.IsEmpty then
    begin
      Exit;
    end;

    tmp.Close;
    tmp.SQL.Text := 'select work_order_number from data0006 where rkey = ' + IntToStr(ARkey06);
    tmp.Open;
    LWONumber := tmp.fieldbyname('work_order_number').AsString;

    //取得spc的明细
    LQryDef.First;
    while not LQryDef.Eof do
    begin
      LSql := 'select 1 from ' + LQryDef.fieldbyname('SPCTableName').AsString + ' where ' + LQryDef.fieldbyname('WOCol').AsString + ' = ' + QuotedStr(LWONumber);
      LCon.Close;
      LCon.ConnectionString := LQryDef.FieldByName('ConStr').AsString;
      LCon.Open;
      LQrySpcCheck.Close;
      LQrySpcCheck.SQL.Text := LSql;
      LQrySpcCheck.Open;
      if LQrySpcCheck.IsEmpty then
      begin
        Result := True;
        ErrStr := LQryDef.fieldbyname('SPC_TestName').AsString;
        Exit;
      end;
      LQryDef.Next;
    end;

  finally
    LQryDef.Free;
    LQrySpcCheck.Free;
    LCon.Free;
  end;
end;

procedure Tfrm_Merge.Button1Click(Sender: TObject);
var
  rkey06,clamp06,LErrStr: string;
  Lnum : Integer;
  adotmp:TADOQuery;
begin

  if IS_Stock_Inventorying then
  begin
    showmsg('在线产品正在盘点,当前不能合卡',1);
    Exit;
  end;
  try
    ADS06.DisableControls;
    MyDataClass.Set_Filter('selected=1',ADS06);
//     ShowMessage(ADS417_1rKey.AsString);
    if ADS06.IsEmpty then
    begin
      ShowMessage('请选择子工单');
      ADS06.Filter:='';
      ADS06.Filtered := false;
      exit;
    end;
  finally
    ADS06.EnableControls;
  end;

  ADS06.First;
  while not ADS06.Eof do
  begin
  //*生产过数管控
    LErrStr:=INQCLocked(ads06.fieldbyName('rkey').AsInteger,ads06.fieldbyName('dept_ptr').AsInteger,ads06.fieldbyName('QTY_BACKLOG').AsInteger);
    if LErrStr<>'' then
    begin
      ShowMessage('该工单受到品质部门管控，原因如下：'+#13+LErrStr+'');
      ADS06.Filter:='';
      ADS06.Filtered := false;
      ADS06.Close;
      ADS06.Open;
      Exit;
    end;
    //*****************
    //*****************
    //*SPC管控
    if INSPCLocked(ads06.fieldbyName('rkey').AsInteger,ads06.fieldbyName('dept_ptr').AsInteger,LErrStr) then
    begin
      ShowMessage(LErrStr + ' SPC检测信息受管控，请联系SPC 品质部！');
      ADS06.Filter:='';
      ADS06.Filtered := false;
      ADS06.Close;
      ADS06.Open;
      Exit;
    end;

    with tmp do
    begin
      Close;
      SQL.Text := 'SELECT  D06.RKEY,  D06.wtype AS wtype06, d34.DEPT_CODE, d34.DEPT_NAME,d34.TTYPE, D06.QUAN_SCH, '+
      ' D06.WORK_ORDER_NUMBER, D06.PROD_STATUS, D06.QUAN_REJ, D06.QUAN_PROD,D06.PANELS,D56.TO_BE_CANCD, ' +
      ' D06.REFERENCE_PTR, d25.PARENT_PTR, D56.PANELS AS PNL_ONLine, d25.MANU_PART_NUMBER, d25.MANU_PART_DESC, D56.STEP, ' +
      ' D06.FLOW_NO AS Flow_NO_06, D56.QTY_BACKLOG, D56.TO_BE_STOCKED,D56.dept_ptr ' +
      ' FROM         dbo.Data0025 AS d25 INNER JOIN' +
      ' dbo.Data0006 AS D06 ON D06.BOM_PTR = d25.RKEY INNER JOIN' +
      ' dbo.Data0056 AS D56 ON D56.WO_PTR = D06.RKEY INNER JOIN' +
      ' dbo.Data0034 AS d34 ON D56.DEPT_PTR = d34.RKEY'+
      ' where D06.WORK_ORDER_NUMBER=' + QuotedStr(ADS06WORK_ORDER_NUMBER.AsString)+' and d34.DEPT_CODE = '+
      QuotedStr(ADS06DEPT_CODE.AsString)+ ' and MANU_PART_NUMBER = ' + QuotedStr(ADS06MANU_PART_NUMBER.AsString)+
      ' and d06.PROD_STATUS='+ QuotedStr(ADS06PROD_STATUS.AsString)+' and D06.wtype='+ QuotedStr(ADS06wtype06.AsString)+
      ' and d06.quan_sch='+ ADS06QUAN_SCH.AsString+' and D06.QUAN_REJ='+ ADS06QUAN_REJ.AsString+' and D06.QUAN_PROD='+
      ADS06QUAN_PROD.AsString+' and D56.QTY_BACKLOG='+ ADS06QTY_BACKLOG.AsString + 'and D56.TO_BE_STOCKED='+
      ADS06TO_BE_STOCKED.AsString;
      
      Open;
    end;
    if tmp.IsEmpty then
    begin
      ShowMessage('你选择的作业单:'+ QuotedStr(ADS06WORK_ORDER_NUMBER.AsString)+'已发生变更，请重新选择母工单进行刷新');
      ADS06.Filter:='';
      ADS06.Filtered := false;
      ADS06.Close;
      ADS06.Open;
      Exit;
    end;
    ADS06.Next;
  end;

  //*****************
  ado06.Close;
  ado06.Open;
  //*生产过数管控
  LErrStr:=INQCLocked(ado06.fieldbyName('rkey').AsInteger,ado06.fieldbyName('dept_ptr').AsInteger,ado06.fieldbyName('QTY_BACKLOG').AsInteger);
  if LErrStr<>'' then
  begin
    ShowMessage('该工单受到品质部门管控，原因如下：'+#13+LErrStr+'');
    ADS06.Filter:='';
    ADS06.Filtered := false;
    ADS06.Close;
    ADS06.Open;
    Exit;
  end;
  //*****************
  //*****************
  //*SPC管控
  if INSPCLocked(ado06.fieldbyName('rkey').AsInteger,ado06.fieldbyName('dept_ptr').AsInteger,LErrStr) then
  begin
    ShowMessage(LErrStr + ' SPC检测信息受管控，请联系SPC 品质部！');
    ADS06.Filter:='';
    ADS06.Filtered := false;
    ADS06.Close;
    ADS06.Open;
    Exit;
  end;
  //*****************
  adotmp:= TADOQuery.Create(nil);
  adotmp.Connection:= frmMain.ADOConnection1;
  try
    frmMain.ADOConnection1.BeginTrans;
      try
        clamp06 := ado06.FieldByName('rkey').AsString;
        ADS06.First;
        while not ADS06.Eof do
        begin
          rkey06 := ADS06RKEY.AsString;
          with ADOQuery1 do //修改两张合并工单06表
          begin
           Close;
           sql.Clear;
           SQL.Add('select * from data0006 where rkey='+rkey06);
           Open;
          end;
      
          ado06.Edit;//合并母单数量增加
          ado06.FieldByName('quan_sch').Value:=ado06.FieldByName('quan_sch').Value+ADOQuery1.FieldByName('quan_sch').Value;
          ado06.FieldByName('quan_rej').Value:=ado06.FieldByName('quan_rej').Value+ADOQuery1.FieldByName('quan_rej').Value;
          ado06.FieldByName('QUAN_PROD').Value:=ado06.FieldByName('quan_prod').Value+ADOQuery1.FieldByName('quan_prod').Value;
          ado06.FieldByName('panels').Value:=ado06.FieldByName('panels').Value+ADOQuery1.FieldByName('panels').Value;
          ado06.Post;
      
          ADOQuery1.Edit;//子单数量清0
          ADOQuery1.FieldByName('prod_status').Value:=202;
          ADOQuery1.FieldByName('quan_sch').Value:=0;
          ADOQuery1.FieldByName('quan_rej').Value:=0;
          ADOQuery1.FieldByName('quan_prod').Value:=0;
          ADOQuery1.FieldByName('panels').Value:=0;
          ADOQuery1.Post;

          OperatDB(adotmp,'update data0058 set wo_ptr='+ clamp06+' where wo_ptr='+ rkey06);      //修改报废记录工单指针

          OperatDB(adotmp,'update data0053 set WORK_ORDER_PTR='+clamp06+' where WORK_ORDER_PTR='+ rkey06);  //修改成品库存指针


          with ADOQuery1 do //修改母单56表在线数量（加上子单的数量）并删除子单在线作业单
          begin
           Close;
           sql.Clear;
           SQL.Add('select * from data0056 where wo_ptr='+rkey06);
           Open;
          end;

          Lnum := ADOQuery1.FieldByName('QTY_BACKLOG').Value;
          ado06.Edit; //母单在线作料单相关数量增加
          ado06.FieldByName('QTY_BACKLOG').Value:=ado06.FieldByName('QTY_BACKLOG').Value+ ADOQuery1.FieldByName('QTY_BACKLOG').Value;
          ado06.FieldByName('TO_BE_STOCKED').Value:=ado06.FieldByName('TO_BE_STOCKED').Value+ADOQuery1.FieldByName('TO_BE_STOCKED').Value;
          ado06.FieldByName('PNL_ONLine').Value:=ado06.FieldByName('PNL_ONLine').Value+ADOQuery1.FieldByName('panels').Value;
          ado06.FieldByName('TO_BE_CANCD').Value:=ado06.FieldByName('TO_BE_CANCD').Value+ADOQuery1.FieldByName('TO_BE_CANCD').Value;
          ado06.Post;

          OperatDB(adotmp,'delete from data0056 where WO_PTR='+ rkey06);   //子单在线工单删除

          OperatDB(adotmp,'update data0048 set wo_ptr='+ clamp06 + 'where wo_ptr='+rkey06);   //更改过数记录48表子工单合并时的作业单指针（合并过数记录）


          with tmp do //合并作业单分配0488表
          begin
            Close;
            sql.Clear;
            sql.Add('select * from data0488 where wo_ptr='+clamp06+'order by BOM_PTR');
            Open;
          end;
          with ADOQuery1 do
          begin
            Close;
            sql.Clear;
            sql.Add('select * from data0488 where wo_ptr='+rkey06+'order by BOM_PTR');
            Open;
          end;

          while not tmp.Eof do
          begin
           tmp.Edit;
           tmp.FieldByName('quan_req').Value:=tmp.FieldByName('quan_req').Value+ADOQuery1.FieldValues['quan_req'];
           tmp.FieldByName('quan_issued').Value:=tmp.FieldByName('quan_issued').Value+ADOQuery1.FieldValues['quan_issued'];
           tmp.Post;
           tmp.Next;
           ADOQuery1.Delete;
          end;

          with tmp do //合并作业单分配0489表
          begin
            close;
            SQL.Clear;
            sql.Add('select * from data0489 where wo_ptr=' + clamp06 + ' order by BOM_PTR');
            Open;
          end;
          with ADOQuery1 do
          begin
            close;
            SQL.Clear;
            sql.Add('SELECT  WO_PTR,SOURCE_PTR,BOM_PTR,QTY AS qty from data0489 where wo_ptr='+rkey06
                    +'  ORDER BY BOM_PTR');
            Open;
          end;

          while not ADOQuery1.Eof do
          begin
            tmp.Locate('BOM_PTR',tmp.FieldByName('BOM_PTR').Value,[]);

            tmp.Edit;
            tmp.FieldByName('QTY').Value:= tmp.FieldByName('QTY').Value + ADOQuery1.FieldByName('QTY').Value;
            tmp.Post;
            ADOQuery1.Delete;
          end;

      //合并410表
          with tmp do
          begin
            Close;
            sql.Clear;
            sql.Add('select * from data0410 where wo_ptr='+rkey06);
            Open;
          end;
          if not tmp.IsEmpty then
          begin
            tmp.First;
            while not tmp.Eof do
            begin
             with ADOQuery1 do
             begin
               Close;
               sql.Clear;
               SQL.Add('select * from data0410 where wo_ptr='+ado06.FieldByName('rkey').AsString);
               SQL.Add(' and D0451_ptr='+tmp.FieldByName('D0451_ptr').AsString);
//               SQL.Add(' and step='+tmp.FieldByName('step').AsString);
               sql.Add(' and dept_ptr='+tmp.FieldByName('dept_ptr').AsString);
               Open;
             end;
             if not ADOQuery1.IsEmpty then
             begin
               ADOQuery1.Edit;
               ADOQuery1.FieldByName('QTY').Value:=ADOQuery1.FieldByName('QTY').Value+tmp.FieldByName('QTY').Value;
               ADOQuery1.FieldByName('MATL_AMOUNT').Value:=ADOQuery1.FieldByName('MATL_AMOUNT').Value+tmp.FieldByName('MATL_AMOUNT').Value;
               ADOQuery1.FieldByName('ovhd1_AMOUNT').Value:=ADOQuery1.FieldByName('ovhd1_AMOUNT').Value+tmp.FieldByName('ovhd1_AMOUNT').Value;
               ADOQuery1.FieldByName('ovhd2_AMOUNT').Value:=ADOQuery1.FieldByName('ovhd2_AMOUNT').Value+tmp.FieldByName('ovhd2_AMOUNT').Value;
               ADOQuery1.FieldByName('ovhd3_AMOUNT').Value:=ADOQuery1.FieldByName('ovhd3_AMOUNT').Value+tmp.FieldByName('ovhd3_AMOUNT').Value;
               ADOQuery1.Post;
             end
             else
             begin
              tmp.Edit;
              tmp.FieldByName('wo_ptr').Value:= ado06.FieldByName('rkey').AsString;
              tmp.Post;
             end;
             tmp.Next;
            end;
          end;
          OperatDB(adotmp,'delete from data0410 where wo_ptr= ' + rkey06);   //删除子工单

          with tmp do
          begin
            Close;
            sql.Clear;
            sql.Text:=' insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark) '+
                ' values ('+ado06.FieldByName('rkey').AsString+',2,0,'+ user_ptr +',getdate(),'+
                IntToStr(8)+','+QuotedStr('作业单'+ ads06.FieldValues['work_order_number']+'跟作业单'+
                ado06.FieldValues['work_order_number']+'合并'+' '+'数量为：'+ IntToStr(Lnum))+')';
            ExecSQL;
          end;
          ADS06.Next;

        end;
        frmMain.ADOConnection1.CommitTrans;
        
        ModalResult := mrOk;
      except
        on E:Exception do
        begin
          frmMain.ADOConnection1.RollbackTrans;
          ADS06.Filter:='';
          ADS06.Filtered := false;      
          ADS06.Close;
          ADS06.Open;
          ShowMessage('合并失败');
          MessageDlg(E.Message,mtError,[mbCancel],0);
        end;
      end
  finally
    adotmp.Free;
  end;
end;

procedure Tfrm_Merge.OperatDB(adotmp: TADOQuery; Asql: string);
begin
  with adotmp do
  begin
    Close;
    sql.Text:= Asql;
    ExecSQL;
  end;
end;

end.
