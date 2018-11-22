unit Post06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, ADODB, ExtCtrls, DM, Grids, DBGridEh;

type
  TfrmPost06 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    ads06: TADODataSet;
    ds06: TDataSource;
    ads06MANU_PART_NUMBER: TStringField;
    ads06MANU_PART_DESC: TStringField;
    ads06WORK_ORDER_NUMBER: TStringField;
    ads06QTY_BACKLOG: TFloatField;
    ads06PANELS: TIntegerField;
    ads06rkey06: TAutoIncField;
    ads06rkey56: TAutoIncField;
    ads06PARTS_PER_PANEL: TFloatField;
    eh1: TDBGridEh;
    eh2: TDBGridEh;
    ads60: TADODataSet;
    ds60: TDataSource;
    ads60MANU_PART_NUMBER: TStringField;
    ads60SALES_ORDER: TStringField;
    ads60allqty: TFloatField;
    ads60SCH_DATE: TDateTimeField;
    ads60REPUT_APPR_BY: TIntegerField;
    ads60MANU_PART_DESC: TStringField;
    lbl1: TLabel;
    edt1: TEdit;
    cbxweishu: TCheckBox;
    pnl3: TPanel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    ads60CanPost: TFloatField;
    lbl3: TLabel;
    edtBakNote: TEdit;
    lbl6: TLabel;
    lbl5: TLabel;
    edtPnl: TEdit;
    rg1: TRadioGroup;
    lbl4: TLabel;
    edtzhouqi: TEdit;
    strngfldads60PO_NUMBER: TStringField;
    lbl7: TLabel;
    edt2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure edt1Exit(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edtPnlExit(Sender: TObject);
    procedure edtPnlKeyPress(Sender: TObject; var Key: Char);
    procedure eh2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FRkey06: string;
    FRkey60: string;
    procedure Get06Data;
    procedure GetPoData;
  end;


implementation

uses
  Pick_Item_Single, ConstVar, WZ_gUnit;

{$R *.dfm}

procedure TfrmPost06.FormShow(Sender: TObject);
var
  LSql: string;
begin
  Get06Data;
  GetPoData;
  if ads60.IsEmpty then
  begin
    LSql := ' SELECT d60.RKEY AS rkey60 ' +
            ' FROM data0060 d60 ' +
            ' inner join data0025 d25 on d60.CUST_PART_PTR = d25.rkey ' +
            ' where (d60.so_tp <> 1) and (d60.status in (1,4)) and (ISNULL(d60.REPUT_APPR_BY, 0) < (d60.PARTS_ORDERED + d60.PARTS_RETURNED)) ' +
            ' AND d25.MANU_PART_NUMBER LIKE  ' + QuotedStr(Copy(ads06.fieldbyname('manu_part_number').AsString,1,Length(ads06.fieldbyname('manu_part_number').AsString) - 2) + '%') +
            ' order by d60.SCH_DATE asc,d60.SALES_ORDER asc ';
    dm1.SqlOpen(LSql);
    if not dm1.qrytmp.IsEmpty then
    begin
      FRkey60 := dm1.qrytmp.fieldbyname('rkey60').AsString;
      GetPoData;
    end;
  end;
end;

procedure TfrmPost06.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmPost06.Get06Data;
begin
  ads06.Close;
  ads06.Parameters[0].Value := FRkey06;
  ads06.Open;

  if gUser.User_Permit = '5' then
  begin
    edt2.Text := ads06.fieldbyname('rkey06').AsString;
  end;
end;

procedure TfrmPost06.GetPoData;
begin
  ads60.Close;                               
  ads60.Parameters[0].Value := FRkey60;
  ads60.Open;
end;

procedure TfrmPost06.btn1Click(Sender: TObject);
var
  Lfrm: TfrmPick_Item_Single;
  Linput: PDlgInput;
begin
  if dm1.GetServerRegion = '东莞' then
  begin
//    if edt2.Text <> IntToStr(ads06.FieldByName('rkey06').AsInteger) then
//    begin
//      ShowMessage('请输入解锁码');
//      Exit;
//    end;
  end;

  Lfrm := TfrmPick_Item_Single.Create(Self);
  try
    Linput.Fields := 'sales_order/销售订单/120,SCH_DATE/计划回复交期/120,manu_part_number/本厂编号/120,manu_part_desc/客户型号/100,PO_NUMBER/客户订单号/100,AlsoNeed/订单数/80,REPUT_APPR_BY/已经提交/80,canpost/可提交/80';
    Linput.KeyField := 'rkey60';
    Linput.Sqlstr := ' SELECT d60.SCH_DATE,d60.SALES_ORDER,d60.PARTS_ORDERED + d60.PARTS_RETURNED AS AlsoNeed,d60.COMMISION_ON_TOOLING, ' +
            ' d60.PARTS_ORDERED + d60.PARTS_RETURNED - ISNULL(d60.REPUT_APPR_BY, 0) AS CanPost,REPUT_APPR_BY,d25.manu_part_number,d25.manu_part_desc, ' +
            ' d60.RKEY AS rkey60, ' + 'd97.PO_NUMBER ' +
            ' FROM data0060 d60 ' +
            ' inner join data0025 d25 on d60.CUST_PART_PTR = d25.rkey ' +
            ' left join data0097 d97 on d97.RKEY = d60.PURCHASE_ORDER_PTR ' +
            ' where (d60.so_tp <> 1) and (d60.status in (1,4)) and (ISNULL(d60.REPUT_APPR_BY, 0) < (d60.PARTS_ORDERED + d60.PARTS_RETURNED)) ' +
            ' AND d25.MANU_PART_NUMBER LIKE  ' + QuotedStr(Copy(ads06.fieldbyname('manu_part_number').AsString,1,Length(ads06.fieldbyname('manu_part_number').AsString) - 2) + '%') +
            ' order by d60.SCH_DATE asc,d60.SALES_ORDER asc ';
    Linput.AdoConn := dm1.con1;
    Lfrm.InitForm_New(Linput,nil);
    if Lfrm.ShowModal = mrok then
    begin
      FRkey60 := Lfrm.Get_Rslt;
      GetPoData;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmPost06.edt1Exit(Sender: TObject);
begin
  if StrToIntDef(edt1.Text,-1) = -1 then
  begin
    edt1.Text := '0';
  end;
end;

procedure TfrmPost06.btn2Click(Sender: TObject);
var
  LErrCode: string;
  LNowTime: TDateTime;
  Lrkey06,LRkey60: Integer;
  LPostPcs,LPostPnl: Integer;
  LSql: string;
  LPO_Number: string;
begin
  if Trim(edtzhouqi.Text) = '' then
  begin
    ShowMessage('周期不能为空');
    Exit;
  end;

  if dm1.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能提交入库');
    Exit;
  end;

  Get06Data;
  if ads06.IsEmpty then
  begin
    ShowMessage('无效的作业单，请刷新');
    Exit;
  end;

  if ads60.Active then GetPoData; //双击取消订单
  if not cbxweishu.Checked and (ads60.Active) then
  begin
    if ads60.IsEmpty then
    begin
      ShowMessage('无效的订单，请刷新');
      Exit;
    end;
  end;

  if (StrToIntDef(edt1.Text,-1) <=0) or (StrToIntDef(edtPnl.Text,-1) < 0) then
  begin
    ShowMessage('无效的数量');
    Exit;
  end;

//  dm1.SqlOpen('select 1 from data0006 where wtype in(2,4) and from_wo_ptr = ' + ads06.fieldbyname('rkey06').AsString);
//  if not dm1.qrytmp.IsEmpty then
//  begin
//    ShowMessage('该工单存在待入库或待返工的子工单，不可以提交');
//    Exit;
//  end;

  if (StrToInt(edt1.Text) > ads06.FieldByName('QTY_BACKLOG').AsInteger) or
    (StrToInt(edtPnl.Text) > ads06.FieldByName('panels').AsInteger)
  then
  begin
    ShowMessage('提交数量不能大于在线的数量');
    Exit;
  end;

  if not cbxweishu.Checked and (ads60.Active) then
  begin
    if StrToInt(edt1.Text) > ads60.FieldByName('canpost').AsInteger then
    begin
      ShowMessage('提交数量不能大于订单数量');
      Exit;
    end;
  end;

  dm1.SqlOpen(' select getdate() as nowtime');
  LNowTime := DM1.qrytmp.fieldbyname('nowtime').AsDateTime;

  Lrkey06 := StrToInt(FRkey06);
  LRkey60 := StrToIntDef(FRkey60,0);

  LPostPcs := StrToInt(edt1.Text);
  LPostPnl := StrToInt(edtPnl.Text);

  dm1.con1.BeginTrans;
  try
    //251表插入
    LErrCode := '0';
    LSql := 'select * from data0251 where rkey = -1';
    if dm1.SqlOpen(LSql) then
    begin
      dm1.qrytmp.Append;
      dm1.qrytmp.FieldByName('wo_ptr').AsInteger := LRkey06;
      if not cbxweishu.Checked and ads60.Active then
        dm1.qrytmp.FieldByName('po_ptr').AsInteger := LRkey60;
      dm1.qrytmp.FieldByName('ctime').AsDateTime := LNowTime;
      dm1.qrytmp.FieldByName('cuser_ptr').AsString := gUser.User_Ptr;
      dm1.qrytmp.FieldByName('cpcs').AsInteger := LPostPCS;
      dm1.qrytmp.FieldByName('cpnl').AsInteger := LPostPnl;
      dm1.qrytmp.FieldByName('status').AsInteger := 0;
      dm1.qrytmp.FieldByName('BKNote').AsString := edtbaknote.Text;
      dm1.qrytmp.FieldByName('ischaban').AsInteger := rg1.ItemIndex;
      dm1.qrytmp.FieldByName('zhouqi').AsString := edtzhouqi.Text;
      dm1.qrytmp.Post;
    end else
      exit;

    //56表操作
    LErrCode := '1';
    if not cbxweishu.Checked and ads60.Active then
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
        dm1.qrytmp.FieldByName('REFERENCE').AsString := Trim(edtbaknote.Text);
        if not cbxweishu.Checked and ads60.Active then
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
    if not cbxweishu.Checked and ads60.Active then
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

    dm1.con1.CommitTrans;
    ModalResult := mrOk;
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('提交失败' + ' 错误代码: ' + LErrCode);
    end;
  end;
end;

procedure TfrmPost06.edtPnlExit(Sender: TObject);
begin
  if StrToIntDef(edtPnl.Text,-1) = -1 then
  begin
    edtPnl.Text := '0';
  end;
end;

procedure TfrmPost06.edtPnlKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmPost06.eh2DblClick(Sender: TObject);
begin
  ads60.Close;
end;

end.
