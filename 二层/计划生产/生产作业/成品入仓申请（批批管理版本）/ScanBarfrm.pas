unit ScanBarfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, ComCtrls, ADODB, DB, DM,
  Grids, DBGridEh, DBClient, Provider, Menus;

type
  TfrmScanBar = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl1: TLabel;
    edtbar: TEdit;
    btnOK: TButton;
    btnClose: TButton;
    qryNow56: TADOQuery;
    adsbarInfo: TADODataSet;
    dsbarinfo: TDataSource;
    adsWOInfo: TADODataSet;
    dsWOInfo: TDataSource;
    adsbarInfoMANU_PART_NUMBER: TStringField;
    adsbarInfoMANU_PART_DESC: TStringField;
    adsbarInfoQty: TIntegerField;
    adsbarInfoSALES_ORDER: TStringField;
    adsbarInfoPO_NUMBER: TStringField;
    adsbarInfoCUST_CODE: TStringField;
    adsbarInfoqty_ordered: TFloatField;
    adsbarInfoRkey: TAutoIncField;
    adsbarInfoREPUT_APPR_BY: TIntegerField;
    adsbarInfocut_no: TStringField;
    adsWOInfowork_order_number: TStringField;
    adsWOInfodept_name: TStringField;
    adsWOInfoQTY_BACKLOG: TFloatField;
    adsWOInfoPANELS: TIntegerField;
    adsWOInfoTO_BE_STOCKED: TFloatField;
    adsWOInfoTO_BE_CANCD: TIntegerField;
    adsWOInfoUNIT_PTR: TIntegerField;
    dspWOInfo: TDataSetProvider;
    ehWOInfo: TDBGridEh;
    cdsWOinfo: TClientDataSet;
    adsWOInfoselected: TBooleanField;
    adsWOInfopostPcs: TIntegerField;
    adsWOInfoPostpnl: TIntegerField;
    adsWOInfoSO_NO: TStringField;
    cdsWOinfowork_order_number: TStringField;
    cdsWOinfodept_name: TStringField;
    cdsWOinfoQTY_BACKLOG: TFloatField;
    cdsWOinfoPANELS: TIntegerField;
    cdsWOinfoTO_BE_STOCKED: TFloatField;
    cdsWOinfoTO_BE_CANCD: TIntegerField;
    cdsWOinfoUNIT_PTR: TIntegerField;
    cdsWOinfoselected: TBooleanField;
    cdsWOinfopostPcs: TIntegerField;
    cdsWOinfoPostpnl: TIntegerField;
    adsWOInforkey06: TAutoIncField;
    cdsWOinforkey06: TAutoIncField;
    lbl14: TLabel;
    edtBZ: TEdit;
    adsbarInforkey60: TAutoIncField;
    adsWOInforkey56: TAutoIncField;
    cdsWOinforkey56: TAutoIncField;
    rg1: TRadioGroup;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl5: TLabel;
    lbl8: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    lbl3: TLabel;
    edtBCBH: TDBEdit;
    edtBXSL: TDBEdit;
    edtKHXH: TDBEdit;
    edtKHDDH: TDBEdit;
    edtPLDH: TDBEdit;
    edtKHDM: TDBEdit;
    grp2: TGroupBox;
    lbl4: TLabel;
    lbl9: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtXSSD: TDBEdit;
    edtDDZS: TDBEdit;
    edtrkdsh: TDBEdit;
    edtHXRK: TDBEdit;
    edtbcrk: TDBEdit;
    ehMutiPost: TDBGridEh;
    dspMutiBar: TDataSetProvider;
    cdsMutiBar: TClientDataSet;
    dsMutiBar: TDataSource;
    adsbarInfobarid: TStringField;
    adsbarInfopostNote: TStringField;
    cdsMutiBarMANU_PART_NUMBER: TStringField;
    cdsMutiBarMANU_PART_DESC: TStringField;
    cdsMutiBarQty: TIntegerField;
    cdsMutiBarSALES_ORDER: TStringField;
    cdsMutiBarPO_NUMBER: TStringField;
    cdsMutiBarCUST_CODE: TStringField;
    cdsMutiBarqty_ordered: TFloatField;
    cdsMutiBarRkey: TAutoIncField;
    cdsMutiBarREPUT_APPR_BY: TIntegerField;
    cdsMutiBarcut_no: TStringField;
    cdsMutiBarrkey60: TAutoIncField;
    cdsMutiBarbarid: TStringField;
    cdsMutiBarpostNote: TStringField;
    adsbarInfopostSucc: TBooleanField;
    cdsMutiBarpostSucc: TBooleanField;
    cdsWOinfocanstockpcs: TIntegerField;
    cdsWOinfocanstockpnl: TIntegerField;
    adsWOInfocanstockpcs: TIntegerField;
    adsWOInfocanstockpnl: TIntegerField;
    qrytmp: TADOQuery;
    adsbarInfoHXRK: TFloatField;
    cdsMutiBarHXRK: TFloatField;
    pm1: TPopupMenu;
    N1: TMenuItem;
    strngfldWOinfosales_order: TStringField;
    lbl15: TLabel;
    adsbarInforeport_unit_value1: TBCDField;
    edtPcsWeight: TEdit;
    adsbarInforkey25: TAutoIncField;
    mniN2: TMenuItem;
    fltfldInfoPcsweight: TFloatField;
    cdsMutiBarreport_unit_value1: TBCDField;
    cdsMutiBarrkey25: TAutoIncField;
    fltfldMutiBarPcsweight: TFloatField;
    procedure edtbarKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ehMutiPostGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure adsWOInfoCalcFields(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure ehMutiPostDblClick(Sender: TObject);
    procedure edtPcsWeightKeyPress(Sender: TObject; var Key: Char);
    procedure edtPcsWeightExit(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AllClear;
    function GetBarInfo(Abar: string): Boolean;
    function GetWOInfo(): Boolean;
    function SelectWO(): Boolean;
    function IsHasChildWO(AWO_PTR: string): Boolean;
    function IsInPD: Boolean;
    function Now56Check: Boolean;
    function TotalPostNumCheck: Boolean;
    function UpdatePost: Boolean;
    function SqlExec(ASql: string): Boolean;
    function SqlOpen(ASql: string): Boolean;
    procedure SetCdsMutibar(AField: string;value: Variant);
    function SetMutiBarCdsInfo: Boolean;
    procedure SingleGetBarIno(ABarID: string);
  public
    { Public declarations }
    FUserPtr: string;
    class function CheckPOOrder(AMan_part_Number,APO: string ): Integer;
    class function CheckPO(AMan_part_Number,APO: string): Boolean;
  end;

var
  frmScanBar: TfrmScanBar;

implementation

uses
  WZ_gUnit;


{$R *.dfm}

procedure TfrmScanBar.AllClear;
begin
  adsbarInfo.Close;
  adsWOInfo.Close;
  cdsWOinfo.Close;
  edtBZ.Text := '';
  edtPcsWeight.Text := '0';
end;

procedure TfrmScanBar.edtbarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if rg1.ItemIndex = 0 then
    begin
      cdsMutiBar.Append;
      cdsMutiBar.FieldByName('barid').AsString := edtbar.Text;
      cdsMutiBar.Post;
    end else
    if rg1.ItemIndex = 1 then
    begin
      SingleGetBarIno(edtbar.Text);
    end;
    edtbar.Text := '';
    Key := #0;    
  end;

end;

function TfrmScanBar.GetBarInfo(Abar: string): Boolean;
var
  s1,s2: string;
  k1,k2: Integer;
begin
  s1 := Copy(ABar,1,Pos('-',ABar)-1);
  s2 := Copy(ABar,Pos('-',ABar)+1,Length(ABar)-Pos('-',ABar)+1);
  k1 := StrToIntDef(s1,0);
  k2 := StrToIntDef(s2,0);
  adsbarInfo.Close;
  adsbarInfo.Parameters[0].Value := k1;
  adsbarInfo.Parameters[1].Value := k2;
  adsbarInfo.Open;
  if adsbarInfo.IsEmpty then
  begin
    Result := False;
    adsbarInfo.Close;
    if rg1.ItemIndex = 0 then
      SetCdsMutibar('postNote','没有查找到相关数据')
    else
      ShowMessage('没有查找到相关数据');
  end else
  begin
    edtPcsWeight.Text := FloatToStr(adsbarInfo.fieldbyname('report_unit_value1').AsFloat);
    Result := True;
  end;
end;

function TfrmScanBar.GetWOInfo: Boolean;
begin
  Result := False;
  adsWOInfo.Close;
  adsWOInfo.Parameters[0].Value := adsbarInfo.fieldbyname('manu_part_number').asstring;//(Copy(adsbarInfo.fieldbyname('manu_part_number').asstring,1,length(adsbarInfo.fieldbyname('manu_part_number').asstring)-2)+'%');
  adsWOInfo.Parameters[1].value := adsbarInfo.fieldbyname('SALES_ORDER').AsString;
  adsWOInfo.Open;
  if adsWOInfo.IsEmpty then
  begin
    Result := False;
    if rg1.ItemIndex = 0 then
      SetCdsMutibar('postNote','没有相关的作业单')
    else
      ShowMessage('没有相关的作业单');
    Exit;
  end else
  begin
    cdsWOinfo.Data := dspWOInfo.Data;
    Result := True;
  end;

//  cdsWOinfo.Data := dspWOInfo.Data;
//  cdsWOinfo.First;
//  while not cdsWOinfo.Eof do
//  begin
//    if (cdsWOinfo.FieldByName('TO_BE_STOCKED').AsInteger > 0) and
//      (cdsWOinfo.FieldByName('UNIT_PTR').AsInteger <> adsbarInfo.FieldByName('rkey60').AsInteger)
//    then
//    begin
//      cdsWOinfo.Delete;
//    end;
//    cdsWOinfo.Next;
//  end;
//  if cdsWOinfo.IsEmpty then
//  begin
//    Result := False;
//    if rg1.ItemIndex = 0 then
//      SetCdsMutibar('没有相关的作业单')
//    else
//      ShowMessage('没有相关的作业单');
//    Exit;
//  end else
//    Result := True;
end;

class function TfrmScanBar.CheckPOOrder(AMan_part_Number,
  APO: string): Integer;
var
  LQry1,LQry2: TADOQuery;
  LSqlStr: string;
  pono1,pono2: Integer;
  I: Integer;
begin
  LQry1 := TADOQuery.Create(nil);
  LQry2 := TADOQuery.Create(nil);
  LQry1.Connection := DM1.con1;
  LQry2.Connection := DM1.con1;
  try
    //查出当前已选订单的信息
    LQry1.Close;
    LQry1.SQL.Clear;
    LQry1.SQL.Add('SELECT * FROM Data0060 WHERE SALES_ORDER = ' + QuotedStr(APO));
    LQry1.Open;
//    if LQry1.FieldByName('REPUT_QTY').AsInteger >= (LQry1.FieldByName('PARTS_ORDERED').AsInteger + LQry1.FieldByName('PARTS_RETURNED').AsInteger) then
//    begin
//      Result := 4;
//      Exit;
//    end;
    //查找本厂编号相同的订单
    LQry2.Close;
    LQry2.SQL.Clear;
    LSqlStr :=
      ' select D60.SALES_ORDER, D60.SCH_DATE,D60.PARTS_ORDERED,D60.REPUT_QTY,D60.PARTS_RETURNED from data0060 D60 ' +
      ' inner join data0025 d25 on d25.rkey = d60.CUST_PART_PTR ' +
      ' where d25.MANU_PART_NUMBER = ' + QuotedStr(AMan_part_Number) +' and (D60.REPUT_QTY < (D60.PARTS_RETURNED + D60.PARTS_ORDERED)) ' +
      ' and d60.SALES_ORDER <> ' + QuotedStr(APO)  +
      ' and d60.status = 1 ' +
      ' and D60.REPUT_APPR_BY < (d60.PARTS_ORDERED + D60.PARTS_RETURNED)' +
      ' order by D60.SCH_DATE asc' ;
    LQry2.SQL.Add(LSqlStr);
    LQry2.Open;
    //回复交期对比
    while not LQry2.Eof do
    begin
      if LQry2.FieldByName('SCH_DATE').AsDateTime < LQry1.FieldByName('SCH_DATE').AsDateTime then
      begin
        Result := 2;
        Exit;
      end;
      LQry2.Next;
    end;
    for I := length(LQry1.fieldbyname('SALES_ORDER').AsString) downto 1 do
    begin
      if LQry1.fieldbyname('SALES_ORDER').AsString[I] = '_' then
      begin
        Break;
      end;
    end;
    pono1 := StrToIntDef(Copy(LQry1.fieldbyname('SALES_ORDER').AsString,I+1,length(LQry1.fieldbyname('SALES_ORDER').AsString)-I),0);
    LQry2.First;
    while not LQry2.Eof do
    begin
      for I := length(LQry2.fieldbyname('SALES_ORDER').AsString) downto 1 do
      begin
        if LQry2.fieldbyname('SALES_ORDER').AsString[I] = '_' then
        begin
          Break;
        end;
      end;
      pono2 := StrToIntDef(Copy(LQry2.fieldbyname('SALES_ORDER').AsString,I+1,length(LQry2.fieldbyname('SALES_ORDER').AsString)-I),0);
      if pono2 > pono1 then
      begin
        Result := 3;
        Exit;
      end;
      LQry2.Next;
    end;
    Result := 1;
  finally
    LQry1.Close;
    LQry2.Close;
    LQry1.Free;
    LQry2.Free;
  end;
end;

class function TfrmScanBar.CheckPO(AMan_part_Number, APO: string): Boolean;
begin
  Result := False;
  //0= 失败,1=通过，2=有回复交期更早的，3=同交期有订单号在前的，4=打印超过订单数量
  case CheckPOOrder(AMan_part_Number,APO) of
    0,1,4:
    begin
      Result := True;
    end;
    2:
    begin
      ShowMessage('有回复交期更早的订单，请选择更早对应的包装箱');
      Result := False;
    end;
    3:
    begin
      ShowMessage('有靠前的订单号没有入仓，请选择对应的包装箱');
      Result := False;
    end;
  end;
  if not Result then ShowMessage('销售订单不正确');
end;

function TfrmScanBar.SelectWO: Boolean;
var
  LToStock: Integer;
  WO_Arr: array of Integer;
  I: Integer;
begin
  Result := False;
  if adsbarInfo.FieldByName('hxrk').AsInteger < adsbarInfo.FieldByName('qty').AsInteger then
  begin
    if rg1.ItemIndex = 0 then
      SetCdsMutibar('postnote','本箱数量大于包装欠数')
    else
      ShowMessage('本箱数量大于包装欠数');
    exit;
  end;

  //先查看是否有子工单
  LToStock := 0;
  cdsWOinfo.First;
  while not cdsWOinfo.Eof do
  begin
    if LToStock < adsbarInfo.FieldByName('qty').AsInteger then
    begin
      if (cdsWOinfo.FieldByName('canstockpcs').AsInteger + LToStock) <= adsbarInfo.FieldByName('qty').AsInteger then
      begin
        SetLength(WO_Arr,Length(WO_Arr) + 1);
        WO_Arr[High(WO_Arr)] := cdsWOinfo.fieldbyname('rkey06').AsInteger;
        LToStock := cdsWOinfo.FieldByName('canstockpcs').AsInteger + LToStock;
        cdsWOinfo.Edit;
        cdsWOinfo.FieldByName('selected').AsBoolean := True;
        cdsWOinfo.FieldByName('postpcs').AsInteger := cdsWOinfo.FieldByName('canstockpcs').AsInteger;
        cdsWOinfo.FieldByName('postpnl').AsInteger := cdsWOinfo.FieldByName('canstockpnl').AsInteger;
        cdsWOinfo.Post;
      end else
      begin
        SetLength(WO_Arr,Length(WO_Arr) + 1);
        WO_Arr[High(WO_Arr)] := cdsWOinfo.fieldbyname('rkey06').AsInteger;      
        cdsWOinfo.Edit;
        cdsWOinfo.FieldByName('selected').AsBoolean := True;
        cdsWOinfo.FieldByName('postpcs').AsInteger := adsbarInfo.FieldByName('qty').AsInteger - LToStock;
        cdsWOinfo.Post;
        LToStock := adsbarInfo.FieldByName('qty').AsInteger;
      end;
    end else
      Break;
    cdsWOinfo.Next;
  end;
  if LToStock < adsbarInfo.FieldByName('qty').AsInteger then
  begin
    if rg1.ItemIndex = 0 then
      SetCdsMutibar('postNote','在线数量小于包装箱数量')
    else
      ShowMessage('在线数量小于包装箱数量');
    Exit;
  end;
  
  for I := 0 to Length(WO_Arr) - 1 do
  begin
    if not IsHasChildWO(IntToStr(WO_Arr[I])) then
    begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function TfrmScanBar.IsHasChildWO(AWO_PTR: string): Boolean;
var
  lQry: TADOQuery;
begin
  lQry := TADOQuery.Create(Self);
  try
    lQry.Connection := DM1.con1;
    lQry.SQL.Add('select WORK_ORDER_NUMBER from data0006 where wtype in(2,4) and ( RKEY = ' + AWO_PTR);
    lQry.SQL.Add(' OR from_wo_ptr = ' + AWO_PTR + ')');
    lQry.Open;
    Result := lQry.IsEmpty;
    if not Result then
    begin
      ShowMessage('作业单状态为待返工或待报废！暂不允许提交入库');
    end;
  finally
    lQry.Close;
    lQry.Free;
  end;
end;

function TfrmScanBar.IsInPD: Boolean;
var
  lQry: TADOQuery;
begin
  lQry := TADOQuery.Create(Self);
  try
    lQry.Connection := DM1.con1;
    lQry.SQL.Add('select * from data0400 where status=0');
    lQry.Open;
    Result := not lQry.IsEmpty;
    if Result then
    begin
      if rg1.ItemIndex = 0 then
        SetCdsMutibar('postNote','在线产品正在盘点,当前不能提交入库')
      else
        ShowMessage('在线产品正在盘点,当前不能提交入库');
    end;
  finally
    lQry.Close;
    lQry.Free;
  end;
end;

procedure TfrmScanBar.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmScanBar.btnOKClick(Sender: TObject);
var
  b: Boolean;
begin
  if rg1.ItemIndex = 0 then
  begin
    cdsWOinfo.DisableControls;
    try
    cdsMutiBar.First;
    while not cdsMutiBar.Eof do
    begin
      if not cdsMutiBar.FieldByName('postsucc').AsBoolean then
      begin
        b := False;
        while True do
        begin
          if IsInPD then Break;
          if not GetBarInfo(Trim(cdsMutiBar.fieldbyname('barid').AsString)) then Break;
          if not SetMutiBarCdsInfo then Break;
          //if not CheckPO(adsbarInfo.fieldbyname('MANU_PART_NUMBER').AsString,adsbarInfo.fieldbyname('SALES_ORDER').AsString) then Break;
          if not GetWOInfo then Break;
          if not SelectWO then Break;
          if not Now56Check then Break;
          if not TotalPostNumCheck then Break;
          if not UpdatePost then Break;
          b := True;
          Break;
        end;
        cdsMutiBar.Edit;
        cdsMutiBar.FieldByName('postSucc').AsBoolean := b;
        cdsMutiBar.Post;
        if b then
          SetCdsMutibar('postNote','成功');
        AllClear;
      end;
      cdsMutiBar.Next;
    end;
    finally
    cdsWOinfo.EnableControls;
    end;
  end else
  if rg1.ItemIndex = 1 then
  begin
    while True do
    begin
      if IsInPD then Break;
      if not Now56Check then Break;
      if not TotalPostNumCheck then Break;
      if not UpdatePost then Break;
      Break;
    end;
    AllClear;
    edtbar.SetFocus;
  end;
end;

function TfrmScanBar.Now56Check: Boolean;
begin
  Result := False;
  cdsWOinfo.First;
  while not cdsWOinfo.Eof do
  begin
    qryNow56.Close;
    qryNow56.Parameters[0].Value := cdsWOinfo.fieldbyname('rkey06').AsString;
    qryNow56.Open;
    if qryNow56.IsEmpty then
    begin
      if rg1.ItemIndex = 0 then
        SetCdsMutibar('postNote','在线作业单改变，请重新扫描')
      else
        ShowMessage('在线作业单改变，请重新扫描');
      Exit;
    end;
    if qryNow56.FieldByName('qty_backlog').AsInteger <> cdsWOinfo.FieldByName('qty_backlog').AsInteger then
    begin
      if rg1.ItemIndex = 0 then
        SetCdsMutibar('postnote','在线作业单改变，请重新扫描')
      else
        ShowMessage('在线作业单改变，请重新扫描');
      Exit;
    end;
    cdsWOinfo.Next;
  end;
  Result := True;
end;

function TfrmScanBar.TotalPostNumCheck: Boolean;
var
  LPostNum: Integer;
begin
  Result := False;
  LPostNum := 0;
  cdsWOinfo.First;
  while not cdsWOinfo.Eof do
  begin
    LPostNum := LPostNum + cdsWOinfo.fieldbyname('postPcs').AsInteger;
    cdsWOinfo.Next;
  end;
  if adsbarInfo.FieldByName('hxrk').AsInteger < adsbarInfo.FieldByName('qty').AsInteger then
  begin
    if rg1.ItemIndex = 0 then
      SetCdsMutibar('postNote','本箱数量大于订单 已经入库数 加 入库待审核数')
    else
      ShowMessage('本箱数量大于订单 已经入库数 加 入库待审核数');
    exit;
  end;  
  if (LPostNum <> adsbarInfo.FieldByName('qty').AsInteger) then
  begin
    if rg1.ItemIndex = 0 then
      SetCdsMutibar('postnote','入库数量不等于包装箱数量')
    else
      ShowMessage('入库数量不等于包装箱数量');
    Exit;
  end;
  Result := True;
end;

function TfrmScanBar.UpdatePost: Boolean;
var
  LSql: string;
  LTotalPostNum: Integer;
begin
  Result := False;
  //总提交数不能大于 订单数
  cdsWOinfo.First;
  LTotalPostNum := 0;
  while not cdsWOinfo.Eof do
  begin
    LTotalPostNum := LTotalPostNum + cdsWOinfo.fieldbyname('postPcs').AsInteger;
    cdsWOinfo.Next;
  end;
  LSql := 'select * from data0060 where rkey = ' + adsbarInfo.fieldbyname('rkey60').AsString;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add(LSql);
  qrytmp.Open;
  if qrytmp.IsEmpty then Exit;
  if ((qrytmp.FieldByName('PARTS_ORDERED').AsInteger + qrytmp.FieldByName('PARTS_RETURNED').AsInteger) -
    qrytmp.FieldByName('REPUT_APPR_BY').AsInteger) < LTotalPostNum
  then
  begin
    if rg1.ItemIndex = 1 then
      ShowMessage('提交数量 大于 订单数 + 退货数')
    else
      SetCdsMutibar('postNote','提交数量 大于 订单数 + 退货数');
    Exit;
  end;
  if UpperCase(qrytmp.FieldByName('COMMISION_ON_TOOLING').AsString) = 'Y' then
  begin
    if rg1.ItemIndex = 1 then
    begin
      if StrToFloatDef(edtPcsWeight.Text,0) <= 0 then
      begin
        ShowMessage('请填写提交数量');
        Exit;
      end;
    end else
    begin
      if cdsMutiBar.FieldByName('pcsweight').AsFloat <= 0 then
      begin
        SetCdsMutibar('postNote','请填写pcs重量');
        Exit;
      end;
    end;
  end;


  //开始提交
  DM1.con1.BeginTrans;
  try
    if rg1.ItemIndex = 1 then
    begin
      if StrToFloat(edtPcsWeight.Text) <> adsbarInfo.FieldByName('REPORT_UNIT_VALUE1').AsFloat then
      begin
         dm1.qrytmp.Close;
         dm1.qrytmp.SQL.Text := 'update data0025 set report_unit_value1='+ edtPcsWeight.Text +' where manu_part_number='+
           QuotedStr(adsbarInfo.fieldbyname('MANU_PART_NUMBER').AsString);
         dm1.qrytmp.ExecSQL;

         //写日志
         dm1.qrytmp.Close;
        dm1.qrytmp.SQL.Text:='INSERT INTO Data0318 '+#13+
                           '       (CUSTOMER_PART_PTR, TRANS_TYPE, TRANS_DESCRIPTION, FROM_STRING, TO_STRING, USER_PTR, TRANS_DATE, PROGRAM_SOURCE) '+#13+
                           'VALUES ('+ adsbarInfo.fieldbyname('rkey25').AsString +', 25, ''变更产品单重'','''+ adsbarInfo.FieldByName('report_unit_value1').AsString +''', '''+ edtPcsWeight.Text +''', '+gUser.User_Longin_Ptr+', GETDATE(), 22)';
        //ShowMessage(dm.aqtmp.SQL.Text);
        dm1.qrytmp.ExecSQL;
      end;
    end else
    begin
      if (cdsMutiBar.FieldByName('pcsweight').AsFloat <> adsbarInfo.FieldByName('REPORT_UNIT_VALUE1').AsFloat) and (not cdsMutiBar.FieldByName('pcsweight').IsNull) then
      begin
         dm1.qrytmp.Close;
         dm1.qrytmp.SQL.Text := 'update data0025 set report_unit_value1='+ cdsMutiBar.fieldbyname('pcsweight').AsString +' where manu_part_number='+
           QuotedStr(adsbarInfo.fieldbyname('MANU_PART_NUMBER').AsString);
         dm1.qrytmp.ExecSQL;

         //写日志
         dm1.qrytmp.Close;
        dm1.qrytmp.SQL.Text:='INSERT INTO Data0318 '+#13+
                           '       (CUSTOMER_PART_PTR, TRANS_TYPE, TRANS_DESCRIPTION, FROM_STRING, TO_STRING, USER_PTR, TRANS_DATE, PROGRAM_SOURCE) '+#13+
                           'VALUES ('+ adsbarInfo.fieldbyname('rkey25').AsString +', 25, ''变更产品单重'','''+ adsbarInfo.FieldByName('report_unit_value1').AsString +''', '''+ cdsMutiBar.fieldbyname('pcsweight').AsString +''', '+guser.User_Longin_Ptr+', GETDATE(), 22)';
        //ShowMessage(dm.aqtmp.SQL.Text);
        dm1.qrytmp.ExecSQL;      
      end;
    end;

    cdsWOinfo.First;
    while not cdsWOinfo.Eof do
    begin
      LSql := 'update data0056 set to_be_stocked = to_be_stocked + ' + cdsWOinfo.fieldbyname('postpcs').AsString +
        ' , qty_backlog = qty_backlog - ' + cdsWOinfo.fieldbyname('postpcs').AsString +
        ' , TO_BE_CANCD = TO_BE_CANCD + ' + cdsWOinfo.fieldbyname('postpnl').AsString +
        ' , PANELS = PANELS - ' + cdsWOinfo.fieldbyname('postpnl').AsString +
        ' , employee_ptr = ' + FUserPtr +
        ' , tobestock_date = getdate() ' +
        ' , REFERENCE = ' + QuotedStr(Trim(edtBZ.Text)) +
        ' , UNIT_PTR = ' + adsbarInfo.fieldbyname('rkey60').AsString +
        ' , PO_NUMBER = ' + QuotedStr(adsbarInfo.fieldbyname('PO_NUMBER').AsString) +
        ' where rkey = ' + cdsWOinfo.fieldbyname('rkey56').AsString;
      if not SqlExec(LSql) then
      begin
        if rg1.ItemIndex = 0 then
          SetCdsMutibar('postNote','提交入库失败')
        else
          ShowMessage('提交入库失败');
        Exit;
      end;
      LSql := 'update data0060 set REPUT_APPR_BY=isnull(REPUT_APPR_BY,0)+ ' + cdsWOinfo.fieldbyname('postpcs').AsString +
        ' where rkey = ' + adsbarInfo.fieldbyname('rkey60').AsString;
      if not SqlExec(LSql) then
      begin
        if rg1.ItemIndex = 0 then
          SetCdsMutibar('postnote','提交入库失败')
        else
          ShowMessage('提交入库失败');
        Exit;
      end;
      cdsWOinfo.Next;
    end;
    dm1.con1.CommitTrans;
    Result := True;
  finally
    if DM1.con1.InTransaction then
    begin
      Result := False;
      DM1.con1.RollbackTrans;
    end;
  end;
end;

function TfrmScanBar.SqlExec(ASql: string): Boolean;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(Self);
  try
    try
      LQry.Connection := DM1.con1;
      LQry.Close;
      LQry.SQL.Add(ASql);
      LQry.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

procedure TfrmScanBar.rg1Click(Sender: TObject);
begin
  pgc1.ActivePageIndex := rg1.ItemIndex;
  AllClear;
end;

procedure TfrmScanBar.FormShow(Sender: TObject);
begin
  adsbarInfo.Close;
  adsbarInfo.Parameters[0].Value := -1;
  adsbarInfo.Parameters[1].Value := -1;
  adsbarInfo.Open;
  cdsMutiBar.Data := dspMutiBar.Data;
  adsbarInfo.Close;
  dspMutiBar.DataSet := nil;
end;

procedure TfrmScanBar.SetCdsMutibar(AField: string;value: Variant);
begin
  cdsMutiBar.Edit;
  cdsMutiBar.FieldByName(AField).Value := value;
  cdsMutiBar.Post;
end;

procedure TfrmScanBar.ehMutiPostGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if cdsMutiBar.FieldByName('postsucc').AsBoolean then Background := clMoneyGreen;
end;

procedure TfrmScanBar.adsWOInfoCalcFields(DataSet: TDataSet);
begin
  //pcs
  if adsWOInfo.FieldByName('qty_backlog').AsInteger >= adsbarInfo.FieldByName('qty').AsInteger then
  begin
    adsWOInfo.FieldByName('canstockpcs').AsInteger := adsbarInfo.FieldByName('qty').AsInteger;
  end else
  begin
    adsWOInfo.FieldByName('canstockpcs').AsInteger := adsWOInfo.FieldByName('qty_backlog').AsInteger;
  end;
  if adsWOInfo.FieldByName('canstockpcs').AsInteger > adsbarInfo.FieldByName('hxrk').AsInteger then
    adsWOInfo.FieldByName('canstockpcs').AsInteger := adsbarInfo.FieldByName('hxrk').AsInteger;

  //pnl
  adsWOInfo.FieldByName('canstockpnl').AsInteger := adsWOInfo.FieldByName('PANELS').AsInteger;
end;

function TfrmScanBar.SetMutiBarCdsInfo: Boolean;
begin
  Result := True;
  try
    SetCdsMutibar('manu_part_number',adsbarInfo.fieldbyname('manu_part_number').Value);
    SetCdsMutibar('manu_part_desc',adsbarInfo.fieldbyname('manu_part_desc').Value);
    SetCdsMutibar('qty',adsbarInfo.fieldbyname('qty').Value);
    SetCdsMutibar('SALES_ORDER',adsbarInfo.fieldbyname('SALES_ORDER').Value);
    SetCdsMutibar('CUST_CODE',adsbarInfo.fieldbyname('CUST_CODE').Value);
    SetCdsMutibar('qty_ordered',adsbarInfo.fieldbyname('qty_ordered').Value);
    SetCdsMutibar('REPUT_APPR_BY',adsbarInfo.fieldbyname('REPUT_APPR_BY').Value);
    SetCdsMutibar('HXRK',adsbarInfo.fieldbyname('HXRK').Value);
    //SetCdsMutibar('pcsweight',adsbarInfo.fieldbyname('pcsweight').Value);
  except
    Result := False;
  end;
end;

function TfrmScanBar.SqlOpen(ASql: string): Boolean;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(Self);
  try
    try
      LQry.Connection := DM1.con1;
      LQry.Close;
      LQry.SQL.Add(ASql);
      LQry.Open;
      Result := True;
    except
      Result := False;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

procedure TfrmScanBar.N1Click(Sender: TObject);
begin
  while not cdsMutiBar.IsEmpty do cdsMutiBar.Delete;
end;

procedure TfrmScanBar.SingleGetBarIno(ABarID: string);
var
  b: Boolean;
begin
  AllClear;
  b := False;
  while True do
  begin
    if not GetBarInfo(ABarID) then Break;
    //if not CheckPO(adsbarInfo.fieldbyname('MANU_PART_NUMBER').AsString,adsbarInfo.fieldbyname('SALES_ORDER').AsString) then Break;
    if not GetWOInfo then Break;
    if not SelectWO then Break;
    b := True;
    Break;
  end;
  if not b then AllClear;
end;

procedure TfrmScanBar.ehMutiPostDblClick(Sender: TObject);
begin
  if (cdsMutiBar.RecNo <> -1) and (not cdsMutiBar.IsEmpty) then
  begin
    while True do
    begin
    if not GetBarInfo(Trim(cdsMutiBar.fieldbyname('barid').AsString)) then Break;
    if not SetMutiBarCdsInfo then Break;
    //if not CheckPO(adsbarInfo.fieldbyname('MANU_PART_NUMBER').AsString,adsbarInfo.fieldbyname('SALES_ORDER').AsString) then Break;
    if not GetWOInfo then Break;
    if not SelectWO then Break;
    if not Now56Check then Break;
    if not TotalPostNumCheck then Break;
    Break;
    end;
  end;
end;

procedure TfrmScanBar.edtPcsWeightKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','.',#8]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmScanBar.edtPcsWeightExit(Sender: TObject);
begin
  if StrToFloatDef(edtPcsWeight.Text,-1) = -1 then
  begin
    ShowMessage('重量不正确');
    edtPcsWeight.SetFocus;
    Abort;
  end;
end;

procedure TfrmScanBar.mniN2Click(Sender: TObject);
begin
  if (cdsMutiBar.RecNo <> -1) and (not cdsMutiBar.IsEmpty) then
  begin
    while True do
    begin
    if not GetBarInfo(Trim(cdsMutiBar.fieldbyname('barid').AsString)) then Break;
    if not SetMutiBarCdsInfo then Break;
    //if not CheckPO(adsbarInfo.fieldbyname('MANU_PART_NUMBER').AsString,adsbarInfo.fieldbyname('SALES_ORDER').AsString) then Break;
    if not GetWOInfo then Break;
    if not SelectWO then Break;
    if not Now56Check then Break;
    if not TotalPostNumCheck then Break;
    Break;
    end;
  end;
end;

end.
