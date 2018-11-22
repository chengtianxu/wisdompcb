unit Dm;

interface

uses
    Dialogs,Windows, Messages,SysUtils, Classes, DB, ADODB, DBClient,
    Provider,variants,math, TConnect;

type
  TDmcon = class(TDataModule)
    ADOConnection1: TADOConnection;
    adsProdList: TADODataSet;
    dsProdList: TDataSource;
    adsSubProds: TADODataSet;
    dsSubProds: TDataSource;
    adsWorkOrderList: TADODataSet;
    dsWorkOrderList: TDataSource;
    adsTransRec: TADODataSet;
    dsTransRec: TDataSource;
    cdsWorkOrderList: TClientDataSet;
    dspWorkOrder: TDataSetProvider;
    adsWorkOrderListIsSelected: TBooleanField;
    adsWorkOrderListRKEY: TAutoIncField;
    adsWorkOrderListWORK_ORDER_NUMBER: TStringField;
    adsWorkOrderListQty_BackLog: TFloatField;
    adsWorkOrderListENT_DATETIME: TDateTimeField;
    adsWorkOrderListTransQty: TFloatField;
    adsWorkOrderListSO_NO: TStringField;
    adsWorkOrderListQUAN_PROD: TFloatField;
    adsAuto_WO_List: TADODataSet;
    adsWOReleaseList: TADODataSet;
    cdsWOReleaseList: TClientDataSet;
    dsWOReleaseList: TDataSource;
    dspWOReleaseList: TDataSetProvider;
    adsWOReleaseListIsSelected: TBooleanField;
    adsWOReleaseListPROD_STATUS: TSmallintField;
    adsWOReleaseListbarcode_flag: TWordField;
    adsWOReleaseListRKEY: TAutoIncField;
    adsWOReleaseListWORK_ORDER_NUMBER: TStringField;
    adsWOReleaseListBOM_PTR: TIntegerField;
    adsWOReleaseListQUAN_SCH: TFloatField;
    adsWOReleaseListWIPMAT_STATUS: TSmallintField;
    adsWOReleaseListENT_DATETIME: TDateTimeField;
    adsWOReleaseListSCH_COMPL_DATE: TDateTimeField;
    adsWOReleaseListPARTS_PER_PANEL: TFloatField;
    adsWOReleaseListcut_no: TStringField;
    adsWOReleaseListquan_rej: TFloatField;
    adsWOReleaseListquan_prod: TFloatField;
    adsWOReleaseListpanels: TIntegerField;
    adsWOReleaseListSO_NO: TStringField;
    adsWOReleaseListCUST_CODE: TStringField;
    adsWOReleaseListCUSTOMER_PTR: TIntegerField;
    adsWOReleaseListMANU_PART_NUMBER: TStringField;
    adsWOReleaseListMANU_PART_DESC: TStringField;
    adsWOReleaseListTType: TWordField;
    adsWOReleaseListPROD_CODE: TStringField;
    adsWOReleaseListAdvicePordDate: TDateTimeField;
    qryENGFlow: TADOQuery;
    ADO0048: TADOQuery;
    adsWOReleaseListwtype: TWordField;
    adsWOReleaseListput_type: TWordField;
    adsWOCtrlList: TADODataSet;
    dsWOCtrlList: TDataSource;
    adsWO_INFO: TADODataSet;
    dsWO_INFO: TDataSource;
    aqIESParam: TADOQuery;
    dsIESParam: TDataSource;
    aspWO_Split: TADOStoredProc;
    cdsWorkOrderListIsSelected: TBooleanField;
    cdsWorkOrderListRKEY: TAutoIncField;
    cdsWorkOrderListWORK_ORDER_NUMBER: TStringField;
    cdsWorkOrderListQty_BackLog: TFloatField;
    cdsWorkOrderListENT_DATETIME: TDateTimeField;
    cdsWorkOrderListTransQty: TFloatField;
    cdsWorkOrderListSO_NO: TStringField;
    cdsWorkOrderListQUAN_PROD: TFloatField;
    tmpQry: TADOQuery;
    cdsWorkOrderListQuan_Sch: TFloatField;
    adsWorkOrderListQuan_Sch: TFloatField;
    CancelDeploy: TADOStoredProc;
    tmp: TADOQuery;
    adsWOReleaseListWHOUSE_PTR: TIntegerField;
    adsWOReleaseListONHOLD_RELEASE_FLAG: TWordField;
    adsWOReleaseListunit_sq: TFloatField;
    procedure adsProdListAfterScroll(DataSet: TDataSet);
    procedure adsSubProdsAfterScroll(DataSet: TDataSet);
    procedure adsWorkOrderListAfterOpen(DataSet: TDataSet);
    procedure cdsWorkOrderListBeforeInsert(DataSet: TDataSet);
    procedure cdsWOReleaseListBeforeDelete(DataSet: TDataSet);
    procedure adsWOReleaseListAfterOpen(DataSet: TDataSet);
    procedure adsProdListAfterOpen(DataSet: TDataSet);
    procedure adsSubProdsAfterOpen(DataSet: TDataSet);
    procedure cdsWorkOrderListTransQtyChange(Sender: TField);
    procedure cdsWorkOrderListIsSelectedChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsWorkOrderListBeforeEdit(DataSet: TDataSet);
  private
     vIsSelected:boolean;
  public
    //TotalQty:integer;
    vhwnd_TfrmDeployWO:hwnd;
    vTransQty,vTransQtyfr:integer;
    FType: Integer;
    function DeployWO(WONO:integer;var SubWOList,Qty_List:string):boolean;//分配作业单
    function AutoDeployWO(DataSet:TAdoDATASET):boolean;//分配作业单
    function SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
    procedure ShowLSMSG(LS: TStrings);
    function SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
  end;

var
  Dmcon: TDmcon;
  sysDate:Tdatetime;
  
implementation
uses MyClass,common,ConstVar,Unit1;
{$R *.dfm}

procedure TDmcon.adsProdListAfterScroll(DataSet: TDataSet);
var
  S: string;
  LQry: TADOQuery;
  LS: TStringList;
  LStep: Integer;
begin
  adsSubProds.Close;
  //ShowMessage(DataSet.fieldbyname('rkey').AsString);
  if DataSet.IsEmpty then Exit;
  case FType of
    0:
      begin
        LQry := TADOQuery.Create(Self);
        LS := TStringList.Create;
        try
          LS.Add('SELECT MIN(D38.STEP_NUMBER) AS STEMMIN');
          LS.Add(' FROM Data0006 D06');
          LS.Add(' INNER JOIN Data0038 D38 ON D38.SOURCE_PTR = D06.BOM_PTR');
          LS.Add(' INNER JOIN Data0034 D34 ON D34.RKEY = D38.DEPT_PTR');
          LS.Add(' WHERE D06.rkey = ' + DataSet.fieldByName('rKey').AsString +' AND D34.BARCODE_ENTRY_FLAG = ' + QuotedStr('Y'));
          if not SQLOpen(LQry,LS) then Exit;
          if LQry.IsEmpty then
          begin
            ShowMessage('没有找到工序数据');
            Exit;
          end;
          LStep := LQry.FieldByName('STEMMIN').AsInteger;
        finally
          LQry.Close;
          LQry.Free;
          LS.Free;
        end;
        s := 'select data0006.work_order_number,cast((data0025.qty_bom+0.0)/data0025.QTY_PARENTBOM as decimal(18,4)) as qty_bom'+
              ',data0025.manu_part_number,IsNULL(data0488.quan_issued,0) as quan_issued ,'+
              'data0025.rkey,data0025.bom_step,ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0)) as Qty_Total_Req,data0006.rKey as WONO, ' +
              'ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0))-IsNULL(data0488.quan_issued,0) as Qty_Needed '+
              ' from data0006 inner join data0025 on ' +
              ' data0006.bom_ptr=data0025.parent_ptr ' +
              ' LEFT JOIN Data0056 ON Data0056.WO_PTR = Data0006.RKey ' +
              ' left outer join data0488 on data0488.WO_Ptr=data0006.rKey and data0488.bom_ptr=data0025.rkey ' +
              ' where data0006.rkey=:F01 AND Data0025.BOM_STEP = '+ IntToStr(LStep) +' AND ISNULL(Data0056.STEP,-1) = -1 ' +
              ' ORDER by data0025.bom_step,data0025.manu_part_number ';
      end;
    1:
      begin
        s := 'select data0006.work_order_number,cast((data0025.qty_bom+0.0)/data0025.QTY_PARENTBOM as decimal(18,4)) as qty_bom,data0025.manu_part_number,IsNULL(data0488.quan_issued,0) as quan_issued ,'+
              'data0025.rkey,data0025.bom_step,ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0)) as Qty_Total_Req,data0006.rKey as WONO, ' +
              'ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0))-IsNULL(data0488.quan_issued,0) as Qty_Needed ' +
              ' from data0006 inner join data0025 on ' +
              ' data0006.bom_ptr=data0025.parent_ptr ' +
              ' LEFT JOIN Data0056 ON Data0056.WO_PTR = Data0006.RKey ' +
              ' left outer join data0488 on data0488.WO_Ptr=data0006.rKey and data0488.bom_ptr=data0025.rkey ' +
              ' where data0006.rkey=:F01 AND Data0025.BOM_STEP = data0056.STEP ' +
              ' ORDER by data0025.bom_step,data0025.manu_part_number ';

      end;
    2:
      begin
        s := 'select data0006.work_order_number,cast((data0025.qty_bom+0.0)/data0025.QTY_PARENTBOM as decimal(18,4)) as qty_bom,data0025.manu_part_number,IsNULL(data0488.quan_issued,0) as quan_issued ,'+
              'data0025.rkey,data0025.bom_step,ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0)) as Qty_Total_Req,data0006.rKey as WONO, ' +
              'ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0))-IsNULL(data0488.quan_issued,0) as Qty_Needed '+
              ' from data0006 inner join data0025 on ' +
              ' data0006.bom_ptr=data0025.parent_ptr ' +
              ' LEFT JOIN Data0056 ON Data0056.WO_PTR = Data0006.RKey ' +
              ' left outer join data0488 on data0488.WO_Ptr=data0006.rKey and data0488.bom_ptr=data0025.rkey ' +
              ' where data0006.rkey=:F01 '+
              ' ORDER by data0025.bom_step,data0025.manu_part_number ';
      end;  

  end;
  adsSubProds.CommandText := s;
  adsSubProds.Parameters[0].Value := DataSet.fieldByName('rKey').Value;
  adsSubProds.Open;
end;

procedure TDmcon.adsSubProdsAfterScroll(DataSet: TDataSet);
begin
  adsTransRec.Close;
  adsTransRec.Parameters[0].Value := adsSubProds.fieldByName('WONO').Value;
  adsTransRec.Parameters[1].Value := adsSubProds.fieldByName('rKey').Value;
  adsTransRec.open;
end;

procedure TDmcon.adsWorkOrderListAfterOpen(DataSet: TDataSet);
begin
  cdsWorkOrderList.Data := dspWorkOrder.Data;
end;

function TDmcon.AutoDeployWO(DataSet: TAdoDATASET): boolean;
var
  TotalNeedQty,ProvidQty,SubTotalQty : integer;
  Sqlstr,WO_List,Qty_List:string;
begin
//1.遍历内层产品,如果内层数量不足,那么就要自动发放数量,
//2.如果自动发放数量不够,那么就终止,否则继续下一个内层
//3.遍历结束后,如果内层数量够,那么操作结束,否则失败
  try
    result := false;
    adsSubProds.First;
    while not adsSubProds.Eof do
    begin
      //已发放数量不满足主产品的需求,那么需要自动分配内层作业单数量
      if adsSubProds.FieldByName('quan_issued').Asinteger < adsSubProds.FieldByName('Qty_Total_Req').Asinteger then
      begin
        WO_List:='';
        Qty_List:='';
        TotalNeedQty:=adsSubProds.FieldByName('Qty_Needed').Asinteger;
        //打开可发放的在线作业单列表
        DataSet.Close;
        Sqlstr:='select D06.RKEY, D56.Qty_BackLog,D06.WORK_ORDER_NUMBER '+
                'from data0006 D06 inner join data0056 D56 on D56.WO_Ptr=D06.rKey '+
                'inner join data0492 D492 on D06.Cut_NO=D492.Cut_NO '+
                'where D06.PROD_STATUS=6 and D06.BOM_Ptr='+adsSubProds.FieldByName('rKey').Asstring+
                ' and D06.panel_A_B='+adsProdList.fieldbyname('panel_A_B').AsString;

        if adsProdList.fieldByName('ttype').AsInteger = 2 then //属于mrb投产,不能用SO_NO来过滤作业单,需要用mrb_ptr
          Sqlstr := Sqlstr+ ' and D492.mrb_ptr='+adsProdList.FieldByName('mrb_ptr').Asstring
        else
         // Sqlstr := Sqlstr+ ' and D492.SO_NO='+QuotedStr(adsProdList.FieldByName('SO_NO').Asstring);   //同一批投产的才能自动分配
          Sqlstr := Sqlstr+ ' and left(D492.Cut_NO,len(D492.Cut_NO)-1)='''+copy(trim(adsProdList.FieldByName('Cut_NO').Asstring),1,length(trim(adsProdList.FieldByName('Cut_NO').Asstring))-1)+'''';

        DataSet.CommandText:=Sqlstr+' order by D492.SO_NO, D06.work_order_Number,D06.ENT_DATETIME';
        DataSet.open;
        ProvidQty:=Floor(Get_Field_Total_Value(DataSet,'Qty_BackLog'));

        if ProvidQty < TotalNeedQty then    //可发放数量 < 需求数量
        begin
          result := false;
          exit;
        end else begin                    //可发放数量 >= 需求数量
          SubTotalQty:=0;
          DataSet.First;
          while not DataSet.Eof do
          begin
            SubTotalQty:=SubTotalQty+DataSet.FieldByName('Qty_BackLog').AsInteger;
            if SubTotalQty<=TotalNeedQty then    
            begin
              if WO_List = '' then
                WO_List:=DataSet.FieldByName('rKey').AsString
              else
                WO_List:=WO_List+','+DataSet.FieldByName('rKey').AsString;
              if Qty_List= '' then
                Qty_List:=DataSet.FieldByName('Qty_BackLog').AsString
              else
                Qty_List:=Qty_List+','+DataSet.FieldByName('Qty_BackLog').AsString;
              if SubTotalQty=TotalNeedQty then break;
            end else begin
              if WO_List = '' then
                WO_List:=DataSet.FieldByName('rKey').AsString
              else
                WO_List:=WO_List+','+DataSet.FieldByName('rKey').AsString;
              if Qty_List= '' then
                Qty_List:=inttostr(TotalNeedQty-SubTotalQty+DataSet.FieldByName('Qty_BackLog').AsInteger)
              else
                Qty_List:=Qty_List+','+inttostr(TotalNeedQty-SubTotalQty+DataSet.FieldByName('Qty_BackLog').AsInteger);
              break;
            end;

            tmpQry.Close;
            tmpQry.SQL.Text:='select D06.rkey from data0006 D06 inner join data0056 D56 on D56.WO_Ptr=D06.rKey '+
                             'where d06.PROD_STATUS=6 and D06.rkey='+DataSet.FieldByName('rKey').AsString+
                             ' and D56.Qty_BackLog-d06.quan_allrej='+DataSet.FieldByName('Qty_BackLog').AsString;
            tmpQry.Open;
            if tmpQry.IsEmpty then
            begin
              ShowMsg('作业单:'+DataSet.FieldByName('WORK_ORDER_NUMBER').AsString+'在线数量或状态发生改变,请检查!',1);
              adsSubProds.Close;
              adsSubProds.Open;
              exit;
            end;

            DataSet.next;
          end;
          result :=dmcon.DeployWO(dmcon.adsProdList.fieldByName('rKey').AsInteger,WO_List,Qty_List);
          if not result then exit;
        end;
        
      end;
      adsSubProds.next;
    end;
  finally
    DATASET.Close;
  end;
end;

procedure TDmcon.cdsWorkOrderListBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

function TDmcon.DeployWO(WONO: integer; var SubWOList,Qty_List: string): boolean;
var
  sproc_name: string;
  ParamStrs: array of variant;
  Direction: array of TParameterDirection;
begin
  sproc_name := 'Deploy_WO_Qty';
  SetLength(ParamStrs,5);
  SetLength(Direction,5);
  ParamStrs[0]:= 0;
  ParamStrs[1]:= WONO;
  ParamStrs[2]:= SubWOList;
  ParamStrs[3]:= Qty_List;
  ParamStrs[4]:= StrToInt(User_ptr);


  Direction[0] := pdReturnValue;
  Direction[1] := pdInput;
  Direction[2] := pdInput;
  Direction[3] := pdInput;
  Direction[4] := pdInput;

  try
    MyDataCLass.ExecProc(sproc_name, ParamStrs, Direction);
  finally
    SubWOList:='';  Qty_List:='';
    result := VarAsType(ParamStrs[0],varInteger)=0;//0更新成功，否则失败
  end;
end;

procedure TDmcon.cdsWOReleaseListBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TDmcon.adsWOReleaseListAfterOpen(DataSet: TDataSet);
begin
  cdsWOReleaseList.Data := dspWOReleaseList.Data;
end;

procedure TDmcon.adsProdListAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
    adsSubProds.Close;
    adsSubProds.Parameters[0].Value := 0;
    adsSubProds.Open;
  end;
end;

procedure TDmcon.adsSubProdsAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
    adsTransRec.Close;
    adsTransRec.Parameters[0].Value := 0;
    adsTransRec.Parameters[1].Value := 0;
    adsTransRec.open;
  end;
end;

procedure TDmcon.cdsWorkOrderListTransQtyChange(Sender: TField);
begin
  if Sender.IsNull then exit;
  if Sender.Value < 0 then
  begin
    ShowMsg('发放数量不能小于零!',1);
    abort;
  end
  else if Sender.Asinteger > cdsWorkOrderList.FieldByName('Qty_BackLog').Asinteger then
  begin
    ShowMsg('发放数量不能大于在线数量!',1);
    abort;
  end;

  if not cdsWorkOrderList.IsEmpty then
  begin
    if cdsWorkOrderList.fieldByName('IsSelected').AsBoolean then
    begin
      if vIsSelected then
         vTransQty := vTransQty - vTransQtyfr + cdsWorkOrderList.fieldByName('TransQty').AsInteger
      else
         vTransQty := vTransQty  + cdsWorkOrderList.fieldByName('TransQty').AsInteger ;

    end else begin
      if vIsSelected then
          vTransQty := vTransQty - vTransQtyfr ;
    end ;
    SendMessage(vhwnd_TfrmDeployWO, MYMESSAGE8, vTransQty, 0);
    vIsSelected := cdsWorkOrderList.fieldByName('IsSelected').AsBoolean;
    vTransQtyfr := cdsWorkOrderList.fieldByName('TransQty').AsInteger ;
  end ;

end;

procedure TDmcon.cdsWorkOrderListIsSelectedChange(Sender: TField);
begin
  if not cdsWorkOrderList.IsEmpty then
  begin
    if cdsWorkOrderList.fieldByName('IsSelected').AsBoolean then
    begin
      if vIsSelected then
          vTransQty := vTransQty - vTransQtyfr + cdsWorkOrderList.fieldByName('TransQty').AsInteger
      else
          vTransQty := vTransQty  + cdsWorkOrderList.fieldByName('TransQty').AsInteger ;
    end
    else
    begin
      if vIsSelected then
          vTransQty := vTransQty - vTransQtyfr ;
    end ;
    SendMessage(vhwnd_TfrmDeployWO, MYMESSAGE8, vTransQty, 0);
    vIsSelected := cdsWorkOrderList.fieldByName('IsSelected').AsBoolean;
    vTransQtyfr := cdsWorkOrderList.fieldByName('TransQty').AsInteger ;
  end ;
end;

procedure TDmcon.DataModuleCreate(Sender: TObject);
begin
  vTransQty := 0;
  vTransQtyfr := 0;
end;

procedure TDmcon.cdsWorkOrderListBeforeEdit(DataSet: TDataSet);
begin
  if not cdsWorkOrderList.IsEmpty then
  begin
    vIsSelected := cdsWorkOrderList.fieldByName('IsSelected').AsBoolean;
    vTransQtyfr := cdsWorkOrderList.fieldByName('TransQty').AsInteger ;
  end;
end;

function TDmcon.SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := Dmcon.ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.Open;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误!');
    ShowLSMSG(ASQL);
  end;
end;

procedure TDmcon.ShowLSMSG(LS: TStrings);
var
  S: string;
  I: Integer;
begin
  for I := 0 to LS.Count - 1 do
    S := S + #13 + LS[I];
  ShowMessage(S);
end;

function TDmcon.SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := Dmcon.ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.ExecSQL;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误');
    ShowLSMSG(ASQL);
  end;
end;

end.
