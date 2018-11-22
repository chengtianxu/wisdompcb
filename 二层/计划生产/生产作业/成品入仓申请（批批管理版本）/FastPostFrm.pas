unit FastPostFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, Buttons, DB, DBClient, ADODB,
  ExtCtrls;

type
  TfrmFastPost = class(TForm)
    lbl1: TLabel;
    eh1: TDBGridEh;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl2: TLabel;
    lblqtypcshas60: TLabel;
    lblqtypnlhas60: TLabel;
    lbl8: TLabel;
    lblqtypnlno60: TLabel;
    lblqtypostno60: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl6: TLabel;
    lbl15: TLabel;
    edtzhouqi: TEdit;
    edtbeizhu: TEdit;
    btnpost: TButton;
    cbxchaban: TCheckBox;
    cds60: TClientDataSet;
    ds60: TDataSource;
    intgrfldcds60rkey60: TIntegerField;
    strngfldcds60salesorder: TStringField;
    strngfldcds60POnumber: TStringField;
    intgrfldcds60qty60: TIntegerField;
    intgrfldcds60qtypost: TIntegerField;
    lbl4: TLabel;
    lbl7: TLabel;
    lblwork_order_number: TLabel;
    lblManu_part_number: TLabel;
    ads06: TADODataSet;
    intgrfldcds60qtypostpnl: TIntegerField;
    lbl9: TLabel;
    lblonlinepcs: TLabel;
    lblonlinepnl: TLabel;
    lbl17: TLabel;
    lbl10: TLabel;
    lblSumQty: TLabel;
    edtPostPcs: TEdit;
    lbl16: TLabel;
    lbl18: TLabel;
    cds60SCH_DATE: TDateTimeField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnpostClick(Sender: TObject);
    procedure edtPostPcsKeyPress(Sender: TObject; var Key: Char);
    procedure edtPostPcsExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FAll60Lst: TStringList;
    FRkey25: string;
    FNowrkey06: string;
    function Get56PCSOnLine(ARkey06: string): Integer;
    //取得本厂编号下面所有的工单
    procedure GetAll06By25(ARkey25: string);
    //获取同本厂编号的下一个可以提交的工单
    function GetNext06(): string;
    //判断工单是否满足提交条件
    function IS06CanPost(ARkey06: string): Boolean;
    //获取工单的当前信息
    function GetData06(ARkey06: string): Boolean;
    //自动计算订单的提交数量
    function AutoFillPostNumByQty(AEdtQty: string): Boolean;
    //提交入库操作
    function PostToStock: Boolean;
  end;


implementation

uses
  DM, WZ_gUnit;

{$R *.dfm}

{ TfrmFastPost }



function TfrmFastPost.GetNext06(): string;
begin
  if FAll60Lst.Count > 0 then
  begin
    Result := FAll60Lst[0];
    FAll60Lst.Delete(0);
    edtPostPcs.Text := IntToStr(Get56PCSOnLine(Result));
  end;
end;

procedure TfrmFastPost.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if not edtPostPcs.Focused then
    begin
      if btnpost.Enabled then
        btnpostClick(btnpost);
    end;
  end;
end;

function TfrmFastPost.IS06CanPost(ARkey06: string): Boolean;
var
  LSql: string;
  LtmpQry: TADOQuery;
begin
  Result := False;
  LtmpQry := TADOQuery.Create(Self);
  LtmpQry.Connection := dm1.con1;
  try
    //w开头的工单进行判断
    LSql := 'SELECT d06.WORK_ORDER_NUMBER,d56.QTY_BACKLOG,d56.PANELS,d06.CUT_NO,d06.FLOW_NO,d06.Panel_A_B,d06.wtype as wtype06,d56.wtype as wtype56 ' +
            ' from data0006 d06 INNER JOIN data0056 d56 on d56.WO_PTR = d06.RKEY WHERE d06.RKEY = ' + ARkey06 +
            ' and (d06.PROD_STATUS = 5) and (d06.wtype not in (2,4)) and (d56.QTY_BACKLOG - isnull(d06.QUAN_ALLREJ,0) > 0)';
    LtmpQry.Close;
    LtmpQry.SQL.Clear;
    LtmpQry.SQL.Add(LSql);
    LtmpQry.Open;

    if LtmpQry.IsEmpty then Exit;
    
    if UpperCase(ltmpqry.FieldByName('work_order_number').AsString[1]) = 'W' then
    begin
      LSql := 'select ppc_control3 from data0192';
      dm1.SqlOpen(LSql);
      if dm1.qrytmp.FieldByName('ppc_control3').AsInteger = 1 then
      begin
        LSql := ' SELECT d492.confirm_pack from data0006 d06 ' +
                ' INNER JOIN data0492 d492 on d06.CUT_NO = d492.CUT_NO ' +
                ' INNER JOIN data0414 d414 ON d414.rkey = d492.mrb_ptr ' +
                ' INNER JOIN data0415 d415 ON d414.d415_ptr = d415.rkey ' +
                ' INNER JOIN data0098 d98 ON d98.RKEY = d415.rma_ptr ' +
                ' WHERE d06.RKEY = ' + ARkey06;
        dm1.SqlOpen(LSql);
        if not dm1.qrytmp.IsEmpty then
        begin
          if dm1.qrytmp.FieldByName('confirm_pack').AsInteger <> 1 then
          begin
            //ShowMessage('W 开头的工单入仓必须要品质确认才可以');
            Exit;
          end;
        end;
      end;
    end;



//    dm1.SqlOpen('select 1 from data0006 where wtype in(2,4) and from_wo_ptr = ' + FNowrkey06);
//    if not dm1.qrytmp.IsEmpty then
//    begin
//      //ShowMessage('该工单存在待入库或待返工的子工单，不可以提交');
//      Exit;
//    end;
    LSql := ' SELECT d06.WORK_ORDER_NUMBER from data0006 d06 ' +
        ' INNER JOIN data0056 d56 ON d56.WO_PTR = d06.RKEY ' +
        ' WHERE d06.CUT_NO = ' + QuotedStr(ltmpqry.fieldbyname('CUT_NO').AsString) + ' and d06.FLOW_NO = ' + ltmpqry.fieldbyname('FLOW_NO').AsString +
        ' and D06.Panel_A_B='+ ltmpqry.fieldbyName('Panel_A_B').AsString +
        ' and D06.wtype = '+ ltmpqry.fieldbyName('wtype06').AsString+
        ' and D06.wtype<>3 '+
        ' and d56.wtype='+ltmpqry.fieldbyName('wtype56').AsString+
        ' and d06.PROD_STATUS = 5' +
        ' and d06.WORK_ORDER_NUMBER < ' + QuotedStr(ltmpqry.fieldbyname('WORK_ORDER_NUMBER').AsString) +
        ' and d56.QTY_BACKLOG > 0';
    dm1.SqlOpen(LSql);
    if not dm1.qrytmp.IsEmpty then
    begin
      //ShowMessage('请按工单顺序先提交 ' + dm1.qrytmp.fieldbyname('WORK_ORDER_NUMBER').AsString);
      Exit;
    end;

    Result := True;
  finally
    LtmpQry.Free;
  end;
end;

procedure TfrmFastPost.FormCreate(Sender: TObject);
begin
  FAll60Lst := TStringList.Create;
end;

procedure TfrmFastPost.FormDestroy(Sender: TObject);
begin
  FAll60Lst.Free;
end;

procedure TfrmFastPost.GetAll06By25(ARkey25: string);
var
  LSql: string;
begin
  FAll60Lst.Clear;
  LSql := ' SELECT d06.RKEY from data0006 d06 ' +
          ' INNER JOIN data0025 d25 ON d06.BOM_PTR = d25.RKEY ' +
          ' INNER JOIN data0056 d56 on d56.WO_PTR = d06.RKEY ' +
          ' WHERE (d06.PROD_STATUS = 5) AND (d06.wtype not in (2,4)) AND (d56.QTY_BACKLOG > 0) ' +
          ' AND d25.RKEY = ' + FRkey25 +
          ' order by d06.WORK_ORDER_NUMBER ASC ';
  dm1.SqlOpen(LSql);
  while not dm1.qrytmp.Eof do
  begin
    FAll60Lst.Add(dm1.qrytmp.fieldbyname('rkey').AsString);
    dm1.qrytmp.Next;
  end; 
end;

function TfrmFastPost.GetData06(ARkey06: string): Boolean;
begin
  Result := False;
  //取得06的信息
  ads06.Close;
  ads06.Parameters[0].Value := ARkey06;
  ads06.Open;
  if ads06.IsEmpty  then
  begin
    ShowMessage('无效的作业单，请刷新');
    Exit;
  end;
  lblwork_order_number.Caption := ads06.fieldbyname('work_order_number').AsString;
  lblonlinepcs.Caption := ads06.fieldbyname('QTY_BACKLOG').AsString;
  lblonlinepnl.Caption := ads06.fieldbyname('PANELS').AsString;
  Result := True;
end;

procedure TfrmFastPost.btnpostClick(Sender: TObject);
var
  LGetNext: Boolean;
begin
  if dm1.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能提交入库');
    Exit;
  end;
  if (gUser.User_Permit = '1') or (gUser.User_Permit = '3') then
  begin
    ShowMessage('你只有检查权限，不能更改数数据！！');
    Exit;
  end;
  if Trim(edtzhouqi.Text) = '' then
  begin
    ShowMessage('周期不能为空');
    Exit;
  end;

  lblwork_order_number.Caption := '';
  lblqtypcshas60.Caption := '';
  lblqtypnlhas60.Caption := '';
  lblqtypnlno60.Caption := '';
  lblqtypostno60.Caption := '';
  lblonlinepcs.Caption := '';
  lblonlinepnl.Caption := '';
  while not cds60.IsEmpty do cds60.Delete;

  if FNowrkey06 = '' then
  begin
    ShowMessage('没有可以提交的作业单');
    Exit;
  end;

  if IS06CanPost(FNowrkey06) then
  begin
    if GetData06(FNowrkey06) then
    begin
      if AutoFillPostNumByQty(edtPostPcs.text) then
      begin
        if PostToStock then
        begin
          LGetNext := True;
        end else
        begin
          Exit;
        end;
      end else
        Exit;
    end else
    begin
      LGetNext := True;
    end;
  end else
    LGetNext := True;


  while LGetNext do
  begin
    FNowrkey06 := GetNext06();
    if FNowrkey06 = '' then
    begin
      lblwork_order_number.Caption := '';
      lblqtypcshas60.Caption := '';
      lblqtypnlhas60.Caption := '';
      lblqtypnlno60.Caption := '';
      lblqtypostno60.Caption := '';
      lblonlinepcs.Caption := '';
      lblonlinepnl.Caption := '';      
      while not cds60.IsEmpty do cds60.Delete;
      Break;
    end;
    if IS06CanPost(FNowrkey06) then
    begin
      if GetData06(FNowrkey06) then
      begin
        if AutoFillPostNumByQty(edtPostPcs.Text) then
          Break;
      end;
    end;
  end;


end;

function TfrmFastPost.PostToStock: Boolean;
var
  LErrCode: string;
  LNowTime: TDateTime;
  LPostPcs,LPostPnl: Integer;
  Lrkey06,LRkey60: Integer;
  LSql: string;
  LPO_Number: string;

  function InlinePostToStock: Boolean;
  begin
    Result := False;
    //251表插入
    LErrCode := '0';
    LSql := 'select * from data0251 where rkey = -1';
    if dm1.SqlOpen(LSql) then
    begin
      dm1.qrytmp.Append;
      dm1.qrytmp.FieldByName('wo_ptr').AsInteger := Lrkey06;
      if LRkey60 > 0 then
        dm1.qrytmp.FieldByName('po_ptr').AsInteger := LRkey60;
      dm1.qrytmp.FieldByName('ctime').AsDateTime := LNowTime;
      dm1.qrytmp.FieldByName('cuser_ptr').AsString := gUser.User_Ptr;
      dm1.qrytmp.FieldByName('cpcs').AsInteger := LPostPCS;
      dm1.qrytmp.FieldByName('cpnl').AsInteger := LPostPnl;
      dm1.qrytmp.FieldByName('status').AsInteger := 0;
      dm1.qrytmp.FieldByName('BKNote').AsString := edtbeizhu.Text;
      if cbxchaban.Checked then
        dm1.qrytmp.FieldByName('ischaban').AsInteger := 1
      else
        dm1.qrytmp.FieldByName('ischaban').AsInteger := 0;
      dm1.qrytmp.FieldByName('zhouqi').AsString := edtzhouqi.Text;
      dm1.qrytmp.Post;
    end else
      exit;

    //56表操作
    LErrCode := '1';
    if LRkey60 > 0 then
    begin
      LSql := 'select PO_Number from data0097 where rkey = (select PURCHASE_ORDER_PTR from data0060 where rkey = ' + IntToStr(LRkey60) + ')';
      if dm1.SqlOpen(LSql) then
      begin
        if not dm1.qrytmp.IsEmpty then
        begin
          LPO_Number := dm1.qrytmp.fieldbyname('PO_Number').AsString;
        end;
      end else
        Exit;
    end;

    LErrCode := '2';
    LSql := 'select * from data0056 where wo_ptr = ' + IntToStr(LRkey06);
    if dm1.SqlOpen(LSql) then
    begin
      if not dm1.qrytmp.IsEmpty then
      begin
        dm1.qrytmp.Edit;
        dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger := dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger + LPostPCS;
        dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger := dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger + LPostPnl;
        dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger := dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger - LPostPCS;
        dm1.qrytmp.FieldByName('PANELS').AsInteger := dm1.qrytmp.FieldByName('PANELS').AsInteger - LPostPnl;
        dm1.qrytmp.FieldByName('employee_ptr').AsString := gUser.User_Ptr;
        dm1.qrytmp.FieldByName('tobestock_date').AsDateTime := LNowTime;
        dm1.qrytmp.FieldByName('REFERENCE').AsString := Trim(edtbeizhu.Text);
        if LRkey60 > 0 then
        begin
          dm1.qrytmp.FieldByName('PO_NUMBER').AsString := LPO_Number ;
          dm1.qrytmp.FieldByName('UNIT_PTR').AsInteger := LRkey60;
        end;
        dm1.qrytmp.Post;
      end else
      begin
        Exit;
      end;
    end else
      Exit;


    //60表操作
    if LRkey60 > 0 then
    begin
      LErrCode := '3';
      LSql := 'select * from data0060 where rkey = ' + IntToStr(LRkey60);
      if dm1.SqlOpen(LSql) then
      begin
        if not dm1.qrytmp.IsEmpty then
        begin
          dm1.qrytmp.Edit;
          dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger := dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger + LPostPCS;
          dm1.qrytmp.Post;
        end else
        begin
          Exit;
        end;
      end else
        Exit;
    end;
    Result := True;
  end;
begin
  Result := False;

  dm1.SqlOpen(' select getdate() as nowtime');
  LNowTime := DM1.qrytmp.fieldbyname('nowtime').AsDateTime;

  dm1.con1.BeginTrans;
  try
    Lrkey06 := StrToInt(FNowrkey06);
    cds60.First;
    while not cds60.Eof do
    begin
       LRkey60 := cds60.fieldbyname('rkey60').AsInteger;
      LPostPcs := StrToInt(cds60.fieldbyname('qtypostpcs').AsString);
      LPostPnl := StrToIntDef(cds60.fieldbyname('qtypostpnl').AsString,0);
      if not InlinePostToStock then Exit;
      lblSumQty.Caption := IntToStr(StrToInt(lblSumQty.Caption) + LPostPcs);
      cds60.Next;
    end;
    if StrToIntDef(lblqtypostno60.Caption,0) > 0 then
    begin
      LRkey60 := 0;
      LPostPcs := StrToInt(lblqtypostno60.Caption);
      LPostPnl := StrToIntDef(lblqtypnlno60.Caption,0);
      if not InlinePostToStock then Exit;
      lblSumQty.Caption := IntToStr(StrToInt(lblSumQty.Caption) + LPostPcs);
    end;
    dm1.con1.CommitTrans;
    Result := True;
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('提交失败' + ' 错误代码: ' + LErrCode);
    end;
  end;
end;

function TfrmFastPost.Get56PCSOnLine(ARkey06: string): Integer;
var
  LQrytmp: TADOQuery;
begin
  LQrytmp := TADOQuery.Create(Self);
  try
    LQrytmp.Connection := dm1.con1;
    LQrytmp.SQL.Add('select QTY_BACKLOG from data0056 where wo_ptr = ' + ARkey06);
    LQrytmp.Open;
    Result := LQrytmp.fieldbyname('QTY_BACKLOG').AsInteger;
  finally
    LQrytmp.Free;
  end;
end;

function TfrmFastPost.AutoFillPostNumByQty(AEdtQty: string): Boolean;
var
  LSql: string;
  LWillPostPcs,LWillPostPnl: Integer;
  LSelfRkey60: Integer;
  AQty: integer;
begin
  LWillPostPnl := 0;
  LWillPostPcs := 0;
  LSelfRkey60 := 0;
  while not cds60.IsEmpty do cds60.Delete;

  AQty := StrToIntDef(AEdtQty,-1);
  if (AQty > ads06.FieldByName('QTY_BACKLOG').AsInteger) or (AQty <=0) then
  begin
    AQty := ads06.FieldByName('QTY_BACKLOG').AsInteger;
    edtPostPcs.Text := IntToStr(AQty);
  end;
  //取得06的订单信息
  // 尝试取得自己绑定的订单
  LSql := ' SELECT d60.SCH_DATE,d60.RKEY,d60.SALES_ORDER,d97.PO_NUMBER,d60.PARTS_ORDERED + d60.PARTS_RETURNED - ISNULL(d60.REPUT_APPR_BY, 0) as qty60 FROM data0006 d06 ' +
          ' LEFT JOIN data0492 d492 ON d06.CUT_NO = d492.CUT_NO ' +
          ' left join data0060 d60 ON d492.SO_NO = d60.SALES_ORDER ' +
          ' left join data0097 d97 on d60.PURCHASE_ORDER_PTR = d97.RKEY ' +
          ' WHERE d06.RKEY = ' + ads06.fieldbyname('rkey').AsString;
  dm1.SqlOpen(LSql);
  if not dm1.qrytmp.IsEmpty then
  begin
    LSelfRkey60 := dm1.qrytmp.fieldbyname('RKEY').AsInteger;
    if dm1.qrytmp.fieldbyname('qty60').AsInteger > 0 then
    begin
      cds60.Append;
      cds60.FieldByName('rkey60').AsInteger := dm1.qrytmp.fieldbyname('rkey').AsInteger;
      cds60.FieldByName('salesorder').AsString := dm1.qrytmp.fieldbyname('SALES_ORDER').AsString;
      cds60.FieldByName('POnumber').AsString := dm1.qrytmp.fieldbyname('PO_NUMBER').AsString;
      cds60.FieldByName('qty60').AsInteger := dm1.qrytmp.fieldbyname('qty60').AsInteger;
      cds60.FieldByName('SCH_DATE').AsDateTime := dm1.qrytmp.fieldbyname('SCH_DATE').AsDateTime;
      if dm1.qrytmp.fieldbyname('qty60').AsInteger > AQty then
      begin
        cds60.FieldByName('qtypostpcs').AsInteger := AQty;
        cds60.FieldByName('qtypostpnl').AsInteger := ads06.FieldByName('PANELS').AsInteger;
      end else
      begin
        cds60.FieldByName('qtypostpcs').AsInteger := cds60.FieldByName('qty60').AsInteger;
        cds60.FieldByName('qtypostpnl').AsInteger := ads06.FieldByName('PANELS').AsInteger;
      end;
      LWillPostPnl := ads06.FieldByName('PANELS').AsInteger;
      LWillPostPcs := LWillPostPcs + cds60.FieldByName('qtypostpcs').AsInteger;
      cds60.Post;
    end;
  end ;

  //如果没有06自己的订单或者数量不足，则开始选订单
  if cds60.IsEmpty or (LWillPostPcs < AQty) then
  begin
    LSql := ' SELECT d60.SCH_DATE,d60.SALES_ORDER, d60.PARTS_ORDERED + d60.PARTS_RETURNED - ISNULL(d60.REPUT_APPR_BY, 0) AS qty60, ' +
                ' d60.RKEY AS rkey60, d97.PO_NUMBER ' +
                ' FROM data0060 d60 ' +
                ' inner join data0025 d25 on d60.CUST_PART_PTR = d25.rkey ' +
                ' left join data0097 d97 on d97.RKEY = d60.PURCHASE_ORDER_PTR ' +
                ' where (d60.so_tp <> 1) and (d60.status in (1,4)) and (ISNULL(d60.REPUT_APPR_BY, 0) < (d60.PARTS_ORDERED + d60.PARTS_RETURNED)) ' +
                ' and d25.rkey = ' + FRkey25 + ' and d60.rkey <> ' + IntToStr(LSelfRkey60) +
                //' AND d25.MANU_PART_NUMBER LIKE  ' + QuotedStr(Copy(lblManu_part_number.Caption,1,Length(ads06.fieldbyname('manu_part_number').AsString) - 2) + '%') +
                ' order by d60.SALES_ORDER asc,d60.SCH_DATE asc ';
    dm1.SqlOpen(LSql);
    while not dm1.qrytmp.Eof do
    begin
      if dm1.qrytmp.fieldbyname('qty60').AsInteger > 0 then
      begin
        cds60.Append;
        cds60.FieldByName('rkey60').AsInteger := dm1.qrytmp.fieldbyname('rkey60').AsInteger;
        cds60.FieldByName('salesorder').AsString := dm1.qrytmp.fieldbyname('SALES_ORDER').AsString;
        cds60.FieldByName('POnumber').AsString := dm1.qrytmp.fieldbyname('PO_NUMBER').AsString;
        cds60.FieldByName('qty60').AsInteger := dm1.qrytmp.fieldbyname('qty60').AsInteger;
        cds60.FieldByName('SCH_DATE').AsDateTime := dm1.qrytmp.fieldbyname('SCH_DATE').AsDateTime;
        if dm1.qrytmp.fieldbyname('qty60').AsInteger > (AQty - LWillPostPcs) then
        begin
          cds60.FieldByName('qtypostpcs').AsInteger := AQty - LWillPostPcs;
          cds60.FieldByName('qtypostpnl').AsInteger := ads06.FieldByName('PANELS').AsInteger - LWillPostPnl;
        end else
        begin
          cds60.FieldByName('qtypostpcs').AsInteger := cds60.FieldByName('qty60').AsInteger;
          cds60.FieldByName('qtypostpnl').AsInteger := ads06.FieldByName('PANELS').AsInteger - LWillPostPnl;
        end;
        if LWillPostPnl = 0 then LWillPostPnl := ads06.FieldByName('PANELS').AsInteger;
        LWillPostPcs := LWillPostPcs + cds60.FieldByName('qtypostpcs').AsInteger;
        cds60.Post;
        if LWillPostPcs = AQty then Break;
        dm1.qrytmp.Next;
      end;
    end
  end;

  lblqtypcshas60.Caption := IntToStr(LWillPostPcs);
  lblqtypnlhas60.Caption := IntToStr(LWillPostPnl);

  lblqtypostno60.Caption := IntToStr(AQty - LWillPostPcs);
  lblqtypnlno60.Caption := IntToStr(ads06.FieldByName('PANELS').AsInteger - LWillPostPnl);
  Result := True;
end;

procedure TfrmFastPost.edtPostPcsKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8,#13]) then
  begin
    Key := #0;
    Exit;
  end;
  if Key = #13 then
  begin
    AutoFillPostNumByQty(edtPostPcs.Text);
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmFastPost.edtPostPcsExit(Sender: TObject);
begin
  if StrToIntdef(edtPostPcs.Text,-1) <> StrToInt(lblqtypcshas60.Caption) + StrToInt(lblqtypostno60.Caption) then
    AutoFillPostNumByQty(edtPostPcs.Text);
end;

end.
