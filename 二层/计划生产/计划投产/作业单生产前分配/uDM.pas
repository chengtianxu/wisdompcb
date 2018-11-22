unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient, Dialogs, Variants, main;

type
  TFieldEvent = procedure(Sender: TField) of object;
  TDM = class(TDataModule)
    adoConn: TADOConnection;
    dsIn: TDataSource;
    aqIn: TADOQuery;
    aqInTransQty: TFloatField;
    aqInSO_NO: TStringField;
    aqInRKEY: TAutoIncField;
    aqInWORK_ORDER_NUMBER: TStringField;
    aqInENT_DATETIME: TDateTimeField;
    aqInQUAN_PROD: TFloatField;
    aqInQuan_Sch: TFloatField;
    aqInQty_BackLog: TFloatField;
    cdsIn: TClientDataSet;
    dspIn: TDataSetProvider;
    aqInIsSelected: TWordField;
    cdsInIsSelected: TSmallintField;
    cdsInTransQty: TFloatField;
    cdsInSO_NO: TStringField;
    cdsInRKEY: TAutoIncField;
    cdsInWORK_ORDER_NUMBER: TStringField;
    cdsInENT_DATETIME: TDateTimeField;
    cdsInQUAN_PROD: TFloatField;
    cdsInQuan_Sch: TFloatField;
    cdsInQty_BackLog: TFloatField;
    aqInBOM_PTR: TIntegerField;
    cdsInBOM_PTR: TIntegerField;
    aqOut: TADOQuery;
    dsOut: TDataSource;
    aqOutIsSelected: TWordField;
    aqOutRKEY: TAutoIncField;
    aqOutWORK_ORDER_NUMBER: TStringField;
    aqOutQUAN_SCH: TFloatField;
    cdsOut: TClientDataSet;
    dspOut: TDataSetProvider;
    cdsOutIsSelected: TSmallintField;
    cdsOutRKEY: TAutoIncField;
    cdsOutWORK_ORDER_NUMBER: TStringField;
    cdsOutQUAN_SCH: TFloatField;
    aqOutCUT_NO: TStringField;
    cdsOutCUT_NO: TStringField;
    aqTmp: TADOQuery;
    aqInPANELS: TIntegerField;
    cdsInPANELS: TIntegerField;
    aqInPARTS_PER_PANEL: TFloatField;
    cdsInPARTS_PER_PANEL: TFloatField;
    aqOutPANELS: TIntegerField;
    cdsOutPANELS: TIntegerField;
    aqInMANU_PART_NUMBER: TStringField;
    aqInMANU_PART_DESC: TStringField;
    cdsInMANU_PART_NUMBER: TStringField;
    cdsInMANU_PART_DESC: TStringField;
    aqInTransPNLQty: TIntegerField;
    cdsInTransPNLQty: TIntegerField;
    aqInQUAN_REJ: TFloatField;
    cdsInQUAN_REJ: TFloatField;
    aqOutMANU_PART_NUMBER: TStringField;
    cdsOutMANU_PART_NUMBER: TStringField;
    aqOutRKEY25: TAutoIncField;
    cdsOutRKEY25: TAutoIncField;
    aqInPARENT_PTR: TIntegerField;
    cdsInPARENT_PTR: TIntegerField;
    aqOutMANU_PART_DESC: TStringField;
    cdsOutMANU_PART_DESC: TStringField;
    aqTmp1: TADOQuery;
    aq48: TADOQuery;
    aqENGFlow: TADOQuery;
    aqOutENT_DATETIME: TDateTimeField;
    cdsOutENT_DATETIME: TDateTimeField;
    aqInPRIORITY_CODE: TWordField;
    cdsInPRIORITY_CODE: TSmallintField;
    procedure cdsInIsSelectedChange(Sender: TField);
    procedure cdsInAfterOpen(DataSet: TDataSet);
    procedure cdsInAfterScroll(DataSet: TDataSet);
    procedure cdsOutIsSelectedChange(Sender: TField);
    procedure cdsInTransPNLQtyValidate(Sender: TField);
    procedure cdsInTransQtyValidate(Sender: TField);
  private
    { Private declarations }
  public
//    procedure AddStings;
    procedure cdsOutRefresh;
    function DeployWO(WONO:integer;var SubWOList,Qty_List,PNLQty_List:string):boolean;//分配作业单
  end;

var
  DM: TDM;

implementation

uses MyClass, common;

{$R *.dfm}

procedure TDM.cdsInIsSelectedChange(Sender: TField);
var i: Byte;
  str: string;
  tg: Boolean;
  RKEY: Integer;
  iEvent: TFieldEvent;
begin
  RKEY:= cdsIn.FieldByName('RKEY').AsInteger;
  iEvent:= cdsInIsSelected.OnChange;

  if cdsIn.FieldByName('IsSelected').AsInteger = 0 then
  begin
    if LList.IndexOf(cdsIn.FieldByName('RKEY').AsString) >= 0 then LList.Delete(LList.IndexOf(cdsIn.FieldByName('RKEY').AsString));
    if LList.Count = 0 then
    begin
      cdsInIsSelected.OnChange:= nil;
      try
        if cdsOut.Locate('IsSelected',1,[]) then
        begin
          if not (cdsOut.State in [dsEdit]) then cdsOut.Edit;
          cdsOut.FieldByName('IsSelected').AsInteger:= 0;
        end;
        with cdsIn do
        begin
          if not (State in [dsEdit]) then Edit;
          FieldByName('IsSelected').AsInteger:= 0;
          Filter:= '';
          Filtered:= False;
          Locate('RKEY',RKEY,[]);
        end;
      finally
        cdsInIsSelected.OnChange:= iEvent;
      end;
    end;
  end;
  if cdsIn.FieldByName('IsSelected').AsInteger = 1 then
  begin
    if LList.IndexOf(cdsIn.FieldByName('RKEY').AsString) < 0 then LList.Add(cdsIn.FieldByName('RKEY').AsString);
    cdsInIsSelected.OnChange:= nil;
    try
      if cdsOut.RecordCount=0 then  //如果没找到其对应的外层,先将内层的"选中"状态去掉,在把它从LList中删掉
      begin
        if not (cdsIn.State in [dsEdit]) then cdsIn.Edit;
        cdsIn.FieldByName('IsSelected').AsInteger:= 0;
        if LList.IndexOf(cdsIn.FieldByName('RKEY').AsString) >= 0 then LList.Delete(LList.IndexOf(cdsIn.FieldByName('RKEY').AsString));
        Exit;
      end;
      if not cdsOut.Locate('IsSelected',1,[]) then
      begin
        cdsOutRefresh;

        i:=1;
        str:= UpperCase(cdsIn.FieldByName('WORK_ORDER_NUMBER').AsString);
        if Pos('W-',str)=1 then  //退货作业单号
        str:= Copy(str,3,Length(str)-2);
        while i<=2 do
        begin
          str:=Copy(str,Pos('-',str)+1,Length(Str)-Pos('-',Str));
          Inc(i);
        end;
        if str[Length(str)] in['A'..'Z'] then str:= '-'+Copy(str,1,Length(str)-1)  //取作业单号从第二个'-'开始到最后的字符
        else
          str:= '-'+str;
        tg:= True;
        with cdsOut do
        begin
          DisableControls;
          try
            First;
            while not Eof do
            begin
              if Pos(str,FieldByName('WORK_ORDER_NUMBER').AsString)>0 then
              begin
                if not (cdsOut.State in [dsEdit]) then cdsOut.Edit;
                tg:= False;  //标记：找到后缀相同的
                cdsOut.FieldByName('IsSelected').AsInteger:= 1;
                Break;
              end;
              Next;
            end;
          finally
            EnableControls;
          end;
        end;
        if tg then
        begin
          if cdsOut.RecordCount=0 then Exit;
          cdsOut.First;
          if not (cdsOut.State in [dsEdit]) then cdsOut.Edit;
          cdsOut.FieldByName('IsSelected').AsInteger:= 1;
        end;
      end;
      with cdsIn do
      begin
        if not (State in [dsEdit]) then Edit;
        FieldByName('IsSelected').AsInteger:= 1;
        Filter:= 'PARENT_PTR = '+cdsOut.FieldByName('RKEY25').AsString;
        Filtered:= True;
        Locate('RKEY',RKEY,[]);
      end;
    finally
      cdsInIsSelected.OnChange:= iEvent;
    end;
  end;
end;

procedure TDM.cdsInAfterOpen(DataSet: TDataSet);
begin
  cdsOutRefresh;
  frmMain.get_treedate(dm.cdsInPARENT_PTR.Value,frmMain.TreeView1);
end;

procedure TDM.cdsInAfterScroll(DataSet: TDataSet);
begin
  if not cdsOut.Locate('IsSelected',1,[]) then cdsOutRefresh;
  frmMain.get_treedate(dm.cdsInPARENT_PTR.Value,frmMain.TreeView1);
end;

procedure TDM.cdsOutIsSelectedChange(Sender: TField);
var
  rkey: integer;
  str1,str2: string;
  iEvent: TFieldEvent;
begin
  if cdsOut.FieldByName('IsSelected').AsInteger = 0 then
  begin
    if RList.IndexOf(cdsOut.FieldByName('RKEY').AsString) >= 0 then RList.Delete(RList.IndexOf(cdsOut.FieldByName('RKEY').AsString));
  end;
  if cdsOut.FieldByName('IsSelected').AsInteger = 1 then
  begin
    rkey:= cdsOutRKEY.Value;
    iEvent:= cdsOutIsSelected.OnChange;
    cdsOutIsSelected.OnChange:= nil;
    with cdsOut do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          if cdsOutRKEY.Value <> rkey then
          begin
            if not (State in [dsEdit]) then Edit;
            FieldByName('IsSelected').AsInteger:= 0;
            if RList.IndexOf(cdsOut.FieldByName('RKEY').AsString) >= 0 then RList.Delete(RList.IndexOf(cdsOut.FieldByName('RKEY').AsString));
          end
          else
          begin
            if not (State in [dsEdit]) then Edit;
            FieldByName('IsSelected').AsInteger:= 1;
            if RList.IndexOf(cdsOut.FieldByName('RKEY').AsString) < 0 then RList.Add(cdsOut.FieldByName('RKEY').AsString);

            str1:= UpperCase(cdsOut.FieldByName('WORK_ORDER_NUMBER').AsString);
            str2:= Copy(str1,1,Length(str1)-2);
          end;
          Next;
        end;

        //寻找顺序更优先的作业单
        First;
        while not EOF do
        begin
          frmMain.ExistBef:= False;
          if Pos(str2,UpperCase(cdsOut.FieldByName('WORK_ORDER_NUMBER').AsString)) > 0 then
          begin
            if str1 > UpperCase(cdsOut.FieldByName('WORK_ORDER_NUMBER').AsString) then
            begin
              frmMain.ExistBef:= True;
              Break;
            end;
          end;
          Next;
        end;
        Locate('rkey',rkey,[]);
      finally
        cdsOutIsSelected.OnChange:= iEvent;
        EnableControls;
      end;
    end;
  end;
end;

procedure TDM.cdsOutRefresh;
begin
  with aqOut do
  begin
    Close;
    Parameters.ParamByName('BOM_PTR').Value:= cdsInBOM_PTR.Value;
    Open;
  end;
  cdsOut.Close;
  cdsOut.Open;
end;

//procedure TDM.AddStings;
//var
//  rkey:integer;
//begin
//  LList.Clear;
//  RList.Clear;
//  with cdsIn do
//  begin
//    rkey:= cdsInRKEY.Value;
//    DisableControls;
//    try
//      First;
//      while not Eof do
//      begin
//        if FieldByName('IsSelected').AsInteger = 1 then
//        begin
//          if LList.IndexOf(FieldByName('RKEY').AsString) = -1 then
//            LList.Add(FieldByName('RKEY').AsString);
//        end;
//        Next;
//      end;
//      Locate('rkey',rkey,[]);
//    finally
//      EnableControls;
//    end;
//  end;
//  with cdsOut do
//  begin
//    rkey:= cdsOutRKEY.Value;
//    DisableControls;
//    try
//      First;
//      while not Eof do
//      begin
//        if FieldByName('IsSelected').AsInteger = 1 then
//        begin
//          if RList.IndexOf(FieldByName('RKEY').AsString) = -1 then
//            RList.Add(FieldByName('RKEY').AsString);
//        end;
//        Next;
//      end;
//      Locate('rkey',rkey,[]);
//    finally
//      EnableControls;
//    end;
//  end;
//end;

function TDM.DeployWO(WONO: integer; var SubWOList,
  Qty_List,PNLQty_List: string): boolean;
var
  sproc_name: string;
  ParamStrs: array of variant;
  Direction: array of TParameterDirection;
begin
  sproc_name := 'Deploy_WO_Qty;2';
  SetLength(ParamStrs,6);
  SetLength(Direction,6);
  ParamStrs[0]:= 0;
  ParamStrs[1]:= WONO;
  ParamStrs[2]:= SubWOList;
  ParamStrs[3]:= Qty_List;
  ParamStrs[4]:= PNLQty_List;
  ParamStrs[5]:= StrToInt(User_ptr);

  Direction[0] := pdReturnValue;
  Direction[1] := pdInput;
  Direction[2] := pdInput;
  Direction[3] := pdInput;
  Direction[4] := pdInput;
  Direction[5] := pdInput;
  try
    MyDataClass.ExecProc(sproc_name, ParamStrs, Direction);
  finally
    SubWOList:='';  Qty_List:='';  PNLQty_List:='';
    result := VarAsType(ParamStrs[0],varInteger)=0;//0更新成功，否则失败
  end;
end;

procedure TDM.cdsInTransPNLQtyValidate(Sender: TField);
begin
  if ((Sender.AsFloat>cdsIn.FieldByName('PANELS').AsFloat) or (Sender.AsFloat<=0)) then
  begin
    ShowMessage('发放PNL数不能大于在线PNL数或小于等于0！');
    Sender.AsFloat:= cdsIn.FieldByName('PANELS').AsFloat;
    Abort;
  end;
  if ((Sender.AsFloat*cdsIn.FieldByName('PARTS_PER_PANEL').AsFloat > cdsIn.FieldByName('Qty_BackLog').AsFloat)
    and (Sender.AsFloat < cdsIn.FieldByName('PANELS').AsFloat)) then  //如果PNL数未一次用完,那么PCS数必须要有剩余
  begin
    ShowMessage('本次发放PCS数将超出在线PCS数，请检查！');
    Sender.AsFloat:= cdsIn.FieldByName('PANELS').AsFloat;
    Abort;
  end;
  if Sender.AsFloat*cdsIn.FieldByName('PARTS_PER_PANEL').AsFloat <= cdsIn.FieldByName('Qty_BackLog').AsFloat then
    cdsIn.FieldByName('TransQty').AsFloat:= Sender.AsFloat*cdsIn.FieldByName('PARTS_PER_PANEL').AsFloat
  else
    cdsIn.FieldByName('TransQty').AsFloat:= cdsIn.FieldByName('Qty_BackLog').AsFloat;
end;

procedure TDM.cdsInTransQtyValidate(Sender: TField);
begin
  if ((Sender.AsFloat>cdsIn.FieldByName('Qty_BackLog').AsFloat) or (Sender.AsFloat<=0)) then
  begin
    ShowMessage('发放PCS数不能大于在线PCS数或小于等于0！');
    Sender.AsFloat:= cdsIn.FieldByName('Qty_BackLog').AsFloat;
    Abort;
  end;
end;

end.
