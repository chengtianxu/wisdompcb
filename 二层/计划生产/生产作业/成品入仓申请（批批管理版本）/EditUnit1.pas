unit EditUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh, Mask, Menus,
  DBCtrls, DM, ADODB;

type
  TEditForm1 = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edtWORK_ORDER_NUMBER: TDBEdit;
    edtCanUsePCS: TDBEdit;
    edtTO_BE_STOCKED: TDBEdit;
    edtCanUsePNL: TDBEdit;
    edtTO_BE_CA: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit7: TEdit;
    Label12: TLabel;
    edtPARTS_PER_PANEL: TDBEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    edt9: TEdit;
    Label8: TLabel;
    edt10: TEdit;
    Label9: TLabel;
    Edit11: TEdit;
    DBGridEh1: TDBGridEh;
    Label2: TLabel;
    Label13: TLabel;
    Edit13: TEdit;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    edtcut_no: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label15: TLabel;
    Edit14: TEdit;
    SpeedButton1: TSpeedButton;
    Label26: TLabel;
    edtORD_REQ_QTY: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Edit17: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtWeight: TEdit;
    ads1: TADODataSet;
    ads2: TADODataSet;
    ds1: TDataSource;
    ds2: TDataSource;
    ads1work_order_number: TStringField;
    ads1manu_part_number: TStringField;
    ads1manu_part_desc: TStringField;
    ads1report_unit_value1: TBCDField;
    ads1STEP: TSmallintField;
    ads1DEPT_NAME: TStringField;
    ads1INTIME: TDateTimeField;
    ads1CanUsePCS: TFloatField;
    ads1TO_BE_STOCKED: TFloatField;
    ads1SALES_ORDER: TStringField;
    ads1cust_code: TStringField;
    ads1PO_NUMBER: TStringField;
    ads1NeedPcs: TFloatField;
    ads1CanUsePNL: TIntegerField;
    ads1OnlineSQ: TFloatField;
    ads1TO_BE_CANCD: TIntegerField;
    ads1ABBR_NAME: TStringField;
    ads1REFERENCE: TStringField;
    ads1rkey06: TAutoIncField;
    ads1PARTS_PER_PANEL: TFloatField;
    ads1cut_no: TStringField;
    ads1ORD_REQ_QTY: TIntegerField;
    ads1issued_qty: TIntegerField;
    ads1WIP_QTY: TIntegerField;
    ads1FG_QTY: TIntegerField;
    ads1waitfor_release: TIntegerField;
    ads1QTY_reject: TIntegerField;
    edtBZ: TEdit;
    ads2CODE: TStringField;
    ads2LOCATION: TStringField;
    ads2WAREHOUSE_code: TStringField;
    ads2qTY: TFloatField;
    procedure btnCancelClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit17DblClick(Sender: TObject);
    procedure edtWeightKeyPress(Sender: TObject; var Key: Char);
    procedure edtWeightExit(Sender: TObject);
  private
    { Private declarations }

  public
    procedure InitData;
  end;

implementation

uses
  Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TEditForm1.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TEditForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then Exit;
  if trim(edit1.Text) = '' then edit1.Text := ads1.FieldByName('CanUsePCS').AsString;
end;


procedure TEditForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure TEditForm1.Edit1Exit(Sender: TObject);
begin
  if strtointdef(edit1.Text,0) > ads1.FieldByName('CanUsePCS').AsInteger then
  begin
    ShowMessage('提交数不能大于当前数量,请更改');
    edit1.SetFocus ;
    exit;
  end;
  if ads1.FieldByName('canusepnl').AsInteger > 0 then
    edit7.Text:=inttostr(ads1.FieldByName('canusepnl').AsInteger -
      round((ads1.FieldByName('CanUsePCS').AsInteger - strtointdef(edit1.Text,0)) / ads1.fieldbyname('PARTS_PER_PANEL').AsInteger + 0.49999));
end;

procedure TEditForm1.btnOKClick(Sender: TObject);
var
  PRIOR_DAYS: Single;
  LSql: string;
begin
  ads1.Requery();

  if StrToFloatDef(edtWeight.Text, -1) < 0 then
  begin
    ShowMessage('请填写有效的重量');
    Exit;
  end;
  
  if strtointdef(edit1.Text,0) > ads1.FieldByName('CanUsePCS').AsInteger  then
  begin
    ShowMessage('提交PCS数不能大于当前PCS数量,请更改');
    edit1.SetFocus;
    Exit;
  end;

  if ads1.FieldByName('canusepnl').AsInteger > 0 then
  begin
    edit7.Text:=inttostr(ads1.FieldByName('canusepnl').AsInteger -
      round((ads1.FieldByName('CanUsePCS').AsInteger - strtointdef(edit1.Text,0)) / ads1.fieldbyname('PARTS_PER_PANEL').AsInteger + 0.49999));
    if StrToInt(Edit7.Text) > ads1.FieldByName('canusepnl').AsInteger then Edit7.Text := ads1.FieldByName('canusepnl').AsString;
  end;

  if Edit17.Tag > 0 then
  begin
    LSql := 'select ISNULL(d60.REPUT_APPR_BY, 0) as REPUT_APPR_BY, d60.PARTS_ORDERED + d60.PARTS_RETURNED AS qty_ordered from data0060 d60 where rkey = ' + IntToStr(Edit17.Tag);
    if dm1.SqlOpen(LSql) then
    begin
      if StrToIntDef(Edit1.Text,0) + dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger > dm1.qrytmp.FieldByName('qty_ordered').AsInteger then
      begin
        ShowMessage('按订单提交,本次提交数量加上已提交数量不能大于订单加退货数量');
        edit1.SetFocus;
        Exit;      
      end;
    end;

    if dm1.SqlOpen('select PRIOR_DAYS from data0192') then
    begin
      PRIOR_DAYS := dm1.qrytmp.fieldbyname('PRIOR_DAYS').AsCurrency;
    end else
      PRIOR_DAYS := 0;
    
    LSql := ' select d60.PARTS_ORDERED * d25.unit_sq as ordered_sq,d60.PARTS_ORDERED - d60.PARTS_SHIPPED + d60.PARTS_RETURNED - d60.RETURNED_SHIP AS parts_margin from data0060 d60 ' +
            ' inner join data0025 d25 on d60.CUST_PART_PTR = d25.rkey ' +
            ' where d25.ttype = 0 and d60.reg_tax_fixed_unused = 0 and d60.so_tp = 0 and '+
            ' d60.rkey = ' + IntToStr(Edit17.Tag);
    if dm1.SqlOpen(LSql) then
    begin
      if (not dm1.qrytmp.IsEmpty) and (dm1.qrytmp.fieldbyname('ordered_sq').AsCurrency < PRIOR_DAYS) and
        (StrToIntDef(edit1.Text, 0) < dm1.qrytmp.FieldByName('parts_margin').AsInteger) then
      begin
        ShowMessage('自制量产小批量订单要求一次性提交入库,请与计划部联系!');
        edit1.SetFocus;
        Exit;
      end;
    end;
    if dm1.SqlOpen('select COMMISION_ON_TOOLING from data0060 where rkey = ' + inttostr(Edit17.Tag)) then
    begin
      if not dm1.qrytmp.IsEmpty then
      begin
        if UpperCase(dm1.qrytmp.fieldbyname('COMMISION_ON_TOOLING').AsString) = 'Y' then
        begin
          if StrToFloatDef(edtWeight.Text, 0) <= 0 then
          begin
            ShowMessage('请填写重量');
            Exit;
          end;
        end;
      end;
    end;
  end;
  ModalResult := mrOk;
end;

procedure TEditForm1.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'sch_date/回复交期/130,SALES_ORDER/销售订单/100,MANU_PART_NUMBER/本厂编号/100,PO_NUMBER/客户订单/100,'+
       'CUST_CODE/客户代码/80,qty_ordered/订单加退货/100,REPUT_APPR_BY/已提交数/100';
    InputVar.Sqlstr :=
                        ' select d60.SCH_DATE,d60.SALES_ORDER,d25.MANU_PART_NUMBER,d97.PO_NUMBER,d10.CUST_CODE, ' +
                        ' d60.PARTS_ORDERED + d60.PARTS_RETURNED AS qty_ordered, ' +
                        ' d60.PARTS_ORDERED - d60.PARTS_SHIPPED + d60.PARTS_RETURNED - d60.RETURNED_SHIP AS parts_margin, ' +
                        ' ISNULL(d60.REPUT_APPR_BY, 0) AS REPUT_APPR_BY, d60.RKEY ' +
                        ' from data0060 d60 inner join data0097 d97 on d60.PURCHASE_ORDER_PTR = d97.RKEY ' +
                        ' inner join data0025 d25 on d60.CUST_PART_PTR = d25.rkey ' +
                        ' inner join data0010 d10 on d60.CUSTOMER_PTR = d10.rkey ' +
                        ' where (d60.STATUS in (1,4)) and (d60.so_tp <> 1) and (d25.MANU_PART_NUMBER like ' +
                        quotedstr(Copy(DM1.adsWOMANU_PART_NUMBER.AsString,1,length(DM1.adsWOMANU_PART_NUMBER.AsString)-2)+'%')+')' +
                        ' and (ISNULL(d60.REPUT_APPR_BY, 0) < (d60.PARTS_ORDERED + d60.PARTS_RETURNED)) ' +
                        ' order by d60.SCH_DATE asc, d60.sales_order asc ';
    inputvar.KeyField:='SALES_ORDER';

    InputVar.AdoConn := DM1.con1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    frmPick_Item_Single.adsPick.First;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit14.text:=frmPick_Item_Single.adsPick.Fieldbyname('PO_NUMBER').AsString;//客户订单号
      Edit17.Text:=frmPick_Item_Single.adsPick.Fieldbyname('SALES_ORDER').AsString;//销售订单号
      Edit17.Tag := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsInteger;//销售订单指针

      Label31.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('qty_ordered').AsString;//订单加退货数
      Label32.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('parts_margin').AsString;//欠货数
      Label33.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('REPUT_APPR_BY').AsString;//已提交数

      if dm1.SqlOpen('select sum(QTY_ON_HAND) from data0053 where po_number='''+Edit14.text+'''') then
      begin
        if DM1.qrytmp.Fields[0].IsNull then
          Label34.Caption:='0' //库存数
        else
         Label34.Caption:=DM1.qrytmp.Fields[0].AsString;      
      end;
    end ;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TEditForm1.Edit17DblClick(Sender: TObject);
begin
  Edit17.Text:='';
  Edit14.Text:='';
  label31.Caption:='';
  Label32.Caption:='';
  label33.Caption:='';
  label34.Caption:='';
  Edit17.Tag:=0;
end;

procedure TEditForm1.edtWeightKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','.',#8]) then
  begin
    Key := #0;
  end;
end;

procedure TEditForm1.edtWeightExit(Sender: TObject);
begin
  if StrToFloatDef(edtWeight.Text,-1) = -1 then
  begin
    ShowMessage('重量不正确');
    edtWeight.SetFocus;
  end;
end;

procedure TEditForm1.InitData;
var
  tmpS: string;
  LSql: string;
begin
  tmpS := trim(dm1.adsWOMANU_PART_NUMBER.AsString);
  tmpS := copy(tmpS, 1, length(tmpS) - 2);

  ads1.Close;
  ads1.Parameters[0].Value := dm1.adsWO.fieldbyname('rkey06').Value;
  ads1.Open;

  ads2.Close;
  ads2.Parameters[0].Value := tmpS + '%';
  ads2.Open;

  Label21.Caption := ads1.fieldbyname('issued_qty').AsString;
  Label22.Caption := ads1.fieldbyname('WIP_QTY').AsString;
  Label23.Caption := ads1.fieldbyname('FG_QTY').AsString;
  Label24.Caption := ads1.fieldbyname('waitfor_release').AsString;
  Label25.Caption := ads1.fieldbyname('QTY_reject').AsString;
  edtBZ.Text := ads1.fieldbyname('REFERENCE').AsString;
  Edit1.Text := ads1.fieldbyname('canusepcs').AsString;
  LSql := ' SELECT sum(dbo.Data0060.PARTS_ORDERED) Qty_ord,' +
          ' sum(dbo.Data0060.PARTS_ORDERED-dbo.Data0060.PARTS_SHIPPED+dbo.Data0060.PARTS_RETURNED-data0060.RETURNED_SHIP) Qty_own ' +
          ' FROM dbo.Data0060 INNER JOIN dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY ' +
          ' where (dbo.Data0025.MANU_PART_NUMBER LIKE ''' + tmpS +
          '%'') and DATA0060.STATUS=1';
  if dm1.SqlOpen(LSql) then
  begin
    edt9.Text := dm1.qrytmp.Fields[0].AsString; // 订单总数
    edt10.Text := dm1.qrytmp.Fields[1].AsString;
  end;
  LSql := ' SELECT  sum(dbo.Data0056.TO_BE_STOCKED) qTY FROM dbo.Data0025 INNER JOIN '
          + 'dbo.Data0006 ON dbo.Data0025.RKEY = dbo.Data0006.BOM_PTR INNER JOIN '
          + 'dbo.Data0056 ON dbo.Data0006.RKEY = dbo.Data0056.WO_PTR ' +
          'where (dbo.Data0025.MANU_PART_NUMBER LIKE ''' + tmpS + '%'')';
  if dm1.SqlOpen(LSql) then
  begin
    Edit11.Text := dm1.qrytmp.Fields[0].AsString; // 入库待审pcs
  end;
  LSql := 'SELECT SUM(dbo.Data0053.QTY_ON_HAND-data0053.QTY_ALLOC) QTY FROM dbo.Data0025 INNER JOIN '
          + 'dbo.Data0053 ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR ' +
          'where (dbo.Data0025.MANU_PART_NUMBER LIKE ''' + tmpS + '%'')';
  if dm1.SqlOpen(LSql) then
  begin
    Edit13.Text := dm1.qrytmp.Fields[0].AsString; // 当前库存
  end;
  edtWeight.Text := dm1.adsWO.FieldByName('REPORT_UNIT_VALUE1').AsString;


  LSql := ' select d60.SCH_DATE,d60.SALES_ORDER,d25.MANU_PART_NUMBER,d97.PO_NUMBER,d10.CUST_CODE, ' +
            ' d60.PARTS_ORDERED + d60.PARTS_RETURNED AS qty_ordered, ' +
            ' d60.PARTS_ORDERED - d60.PARTS_SHIPPED + d60.PARTS_RETURNED - d60.RETURNED_SHIP AS parts_margin, ' +
            ' ISNULL(d60.REPUT_APPR_BY, 0) AS REPUT_APPR_BY, d60.RKEY ' +
            ' from data0060 d60 inner join data0097 d97 on d60.PURCHASE_ORDER_PTR = d97.RKEY ' +
            ' inner join data0025 d25 on d60.CUST_PART_PTR = d25.rkey ' +
            ' inner join data0010 d10 on d60.CUSTOMER_PTR = d10.rkey ' +
            ' where (d60.STATUS in (1,4)) and (d60.so_tp <> 1) and (d25.MANU_PART_NUMBER like ' + quotedstr(tmpS+'%')+')' +
            ' and (ISNULL(d60.REPUT_APPR_BY, 0) < (d60.PARTS_ORDERED + d60.PARTS_RETURNED)) ' +
            ' order by d60.SCH_DATE asc, d60.sales_order asc ';

  if dm1.SqlOpen(LSql) then
  begin
    if not dm1.qrytmp.IsEmpty then
    begin
      Label31.Caption := dm1.qrytmp.FieldByName('qty_ordered').AsString; // 订单加退货数
      Label32.Caption := dm1.qrytmp.FieldByName('parts_margin').AsString; // 订单欠数
      Label33.Caption := dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsString; // 已提交数量
      edit14.Text := dm1.qrytmp.FieldByName('po_number').AsString; // 97客户订单号
      Edit17.Text := dm1.qrytmp.FieldByName('SALES_ORDER').AsString;
      Edit17.Tag := dm1.qrytmp.FieldByName('rkey').AsInteger;

      LSql := 'select sum(QTY_ON_HAND) from data0053 where po_number=' + QuotedStr(edit14.Text);
      if dm1.SqlOpen(LSql) then
      begin
        if dm1.qrytmp.Fields[0].IsNull then
          Label34.Caption := '0'
        else
          Label34.Caption := dm1.qrytmp.Fields[0].AsString; // 库存数
      end;
    end;
  end;

  
end;


end.

