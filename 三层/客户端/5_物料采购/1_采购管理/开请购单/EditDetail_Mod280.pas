unit EditDetail_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh,
  Data.DB, Datasnap.DBClient;

type
  TfrmDetailEdit_Mod280 = class(TfrmBaseEdit)
    Label9: TLabel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbl1: TLabel;
    DtpkYqdhrq: TDBDateTimeEditEh;
    BtnRqHis: TBitBtn;
    dbchkIF_urgency: TDBCheckBox;
    BtSave: TBitBtn;
    BtCan: TBitBtn;
    RedtNeedFac: TRKeyRzBtnEdit;
    RedtMaterCode: TRKeyRzBtnEdit;
    RedtMaterName: TRKeyRzBtnEdit;
    RedtMaterGuige: TRKeyRzBtnEdit;
    RedtPurUnit1: TRKeyRzBtnEdit;
    RedtPurUnit2: TRKeyRzBtnEdit;
    RedtPercent: TRKeyRzBtnEdit;
    RedtIfCheck: TRKeyRzBtnEdit;
    RedtIfMajor: TRKeyRzBtnEdit;
    RedtStock: TRKeyRzBtnEdit;
    RedtTranQty: TRKeyRzBtnEdit;
    RedtMaxStock: TRKeyRzBtnEdit;
    RedtSafeStock: TRKeyRzBtnEdit;
    RedtRqQty: TRKeyRzBtnEdit;
    RedtRqUnit: TRKeyRzBtnEdit;
    RedtRqNeedQty: TRKeyRzBtnEdit;
    RedtRqReason: TRKeyRzBtnEdit;
    RedtSpecReq: TRKeyRzBtnEdit;
    cds69: TClientDataSet;
    ds69: TDataSource;
    BtnSupp: TBitBtn;
    cds17: TClientDataSet;
    procedure RedtMaterCodeButtonClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure RedtRqQtyKeyPress(Sender: TObject; var Key: Char);
    procedure RedtRqNeedQtyKeyPress(Sender: TObject; var Key: Char);
    procedure RedtMaterCodeExit(Sender: TObject);
    procedure RedtStockButtonClick(Sender: TObject);
    procedure RedtTranQtyButtonClick(Sender: TObject);
    procedure BtnRqHisClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure BtnSuppClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure RedtRqQtyExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure getdata(Rkey:string);
    procedure GetQty;
    procedure Init(Ftype:Integer;AReason:string);
  end;


implementation
uses
  uCommFunc,System.StrUtils, uBaseSinglePickListFrm, System.DateUtils,
  MatStock_Mod280, MaterZt_Mod280, HistoryRq_Mod280, QrySupp_Mod280;
{$R *.dfm}

{ TfrmDetailEdit }

procedure TfrmDetailEdit_Mod280.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmDetailEdit_Mod280.BtnRqHisClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cds69.FieldByName('INVT_PTR').AsVariant=null then
  begin
   ShowMessage('没有指定相关材料编码');
   Exit;
  end;
  Lsql:='SELECT TOP (15) dbo.Data0068.PO_REQ_NUMBER as 请购单号,'+
  ' dbo.Data0005.EMPLOYEE_NAME as 请购人员, dbo.Data0069.REQ_DATE as 请购日期,'+
  ' dbo.Data0069.QUANTITY as 请购数量, dbo.Data0002.UNIT_NAME as 单位,'+
  ' dbo.Data0069.reason as 请购原因, dbo.Data0069.extra_req as 特别要求,'+
  ' dbo.Data0069.IF_urgency as 是否紧急, dbo.Data0023.ABBR_NAME as 供应商,'+
  ' CASE data0068.status WHEN 1 THEN ''待审批'' WHEN 2 THEN ''待采购'' WHEN 3 THEN ''已批准'' WHEN 4 THEN ''被退回'' WHEN 5 THEN ''已撤消'' WHEN 6 THEN ''已处理'''+
  ' WHEN 7 THEN ''未提交'' END AS 状态'+
  ' FROM dbo.Data0069 INNER JOIN'+
  ' dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo.Data0068.RKEY INNER JOIN'+
  ' dbo.Data0017 ON dbo.Data0069.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'+
  ' dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY INNER JOIN'+
  ' dbo.Data0002 ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN'+
  ' dbo.Data0023 ON dbo.Data0069.SUPP_PTR = dbo.Data0023.RKEY'+
  ' where Data0069.INVT_PTR ='+cds69.FieldByName('INVT_PTR').AsString+
  ' ORDER BY dbo.Data0069.REQ_DATE DESC';
  try
   frmHistoryRq_Mod280:=TfrmHistoryRq_Mod280.Create(nil);
   gSvrIntf.IntfGetDataBySql(Lsql,frmHistoryRq_Mod280.cds69);
   frmHistoryRq_Mod280.ShowModal;
  finally
   frmHistoryRq_Mod280.Free;
  end;
end;

procedure TfrmDetailEdit_Mod280.btnSaveClick(Sender: TObject);
begin
  inherited;
  if (RedtMaterCode.Text='') then
  begin
    showmessage('请输入材料编码...');
    abort;
  end;
  if (StrToFloat(RedtRqQty.Text)<=0) then
  begin
    showmessage('请输入数量...');
    abort;
  end;
  if (RedtRqReason.Text='') then
  begin
    showmessage('请输入请购原因...');
    abort;
  end;
  ModalResult := mrOk;
end;

procedure TfrmDetailEdit_Mod280.BtnSuppClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cds69.FieldByName('INVT_PTR').AsVariant=null then
  begin
   ShowMessage('没有指定相关材料编码');
   Exit;
  end;
  Lsql:='select data0023.abbr_name,case data0023.status when 0 then ''有效'' when 1 then ''无效'' end as supper_statu,'+
       ' data0028.SUPPLIER_PART_NO,data0028.avl_flag,data0028.TDATE'+
       ' from data0028 inner join'+
       ' data0017 on data0028.inventory_ptr=data0017.rkey inner join'+
       ' data0023 on data0028.supplier_ptr=data0023.rkey'+
       ' where data0028.inventory_ptr='+cds69.FieldByName('INVT_PTR').AsString+' order by ABBR_NAME';
  try
   frmQrySupp_Mod280:=TfrmQrySupp_Mod280.Create(nil);
   gSvrIntf.IntfGetDataBySql(Lsql,frmQrySupp_Mod280.cdsMain);
   frmQrySupp_Mod280.ShowModal;
  finally
   frmQrySupp_Mod280.Free;
  end;
end;

procedure TfrmDetailEdit_Mod280.BtSaveClick(Sender: TObject);
begin
  inherited;
  if (RedtMaterCode.Text='') then
  begin
    showmessage('请输入材料编码...');
    abort;
  end;
  if (StrToFloat(RedtRqQty.Text)<=0) then
  begin
    showmessage('请输入数量...');
    abort;
  end;
  if (RedtRqReason.Text='') then
  begin
    showmessage('请输入请购原因...');
    abort;
  end;
  ModalResult := mrOk;
end;

procedure TfrmDetailEdit_Mod280.FormShow(Sender: TObject);
begin
  //inherited;
 if Trim(RedtMaterCode.Text)<>'' then
 GetQty;
end;

procedure TfrmDetailEdit_Mod280.getdata(Rkey: string);
var
  lSQL:string;
begin
  lSQL := ' select d69.*,d17.inv_part_number,d17.inv_description,d17.inv_name,'
          +'d17.STOCK_PURCH,d17.PURCH_UNIT_PTR,d17.STOCK_UNIT_PTR,'
          +'case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL,'
          +'d2.unit_code,d2.unit_name,d2a.unit_code st_nu_code ,d2a.unit_name st_un_name,d17.inspect,'
          +'d17. REPORT_VALUE2, d17.CONSIGN_ONHAND_QTY from Data0069 d69 ' +
          ' inner join data0017 d17 on d69.INVT_PTR = d17.RKEY ' +
          ' inner join  data0002  d2 on d17.PURCH_UNIT_PTR=d2.rkey inner join  '+
          ' data0002 d2a on d17.STOCK_UNIT_PTR=d2a.rkey '+
          ' where d69.Rkey = ' +Rkey;
  gSvrIntf.IntfGetDataBySql(lSQL,cds69);
end;

procedure TfrmDetailEdit_Mod280.GetQty;
var
  LcdsQUAN: TClientDataSet;
  Lsql: string;
begin
  LcdsQUAN:=TClientDataSet.Create(Self);
  try
    //--当前库存
    Lsql:='select isNull((data0017.quan_on_hand-data0017.QUAN_ASSIGN)+isnull(sum(data0134.QUAN_ON_HAND),0),0) as qty'
          +' from data0017 left outer join DATA0134 on data0017.RKEY=DATA0134.INVENTORY_PTR'
          +' where data0017.rkey='+cds69.FieldByName('INVT_PTR').AsString+''
          +' group by data0017.quan_on_hand,data0017.QUAN_ASSIGN';
    gSvrIntf.IntfGetDataBySql(Lsql,LcdsQUAN);
    RedtStock.Text:=LcdsQUAN.FieldByName('qty').AsString;
    //--在途数量
    Lsql:='select isnull(SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN),0) as qty_zaitu'
          +' FROM Data0071 INNER JOIN'
          +' Data0070 ON Data0071.PO_PTR = Data0070.RKEY'
          +' WHERE Data0070.STATUS = 5'
          +' and data0071.invt_ptr='+cds69.FieldByName('INVT_PTR').AsString+'';
    gSvrIntf.IntfGetDataBySql(Lsql,LcdsQUAN);
    RedtTranQty.Text:=LcdsQUAN.FieldByName('qty_zaitu').AsString;
  finally
    LcdsQUAN.Free;
  end;
end;

procedure TfrmDetailEdit_Mod280.RedtMaterCodeButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
//  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtMaterCode.Text)<>'' then
    LFrm.InitWithPickID(280,StrToInt(RedtMaterCode.DisplayPickID),' and d17.inv_part_number LIKE ''%'+Trim(RedtMaterCode.Text)+'%'' order by d17.inv_part_number')
    else
    LFrm.InitWithPickID(280,StrToInt(RedtMaterCode.DisplayPickID),' order by d17.inv_part_number');
    if LFrm.ShowModal = mrOk then
    begin
      cds69.Edit;
      cds69.FieldByName('INVT_PTR').AsInteger:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      cds69.FieldByName('UNIT_PTR').AsInteger:=LFrm.cdsPick.FieldByName('PURCH_UNIT_PTR').AsInteger;
      cds69.FieldByName('inv_part_number').AsString:=LFrm.cdsPick.FieldByName('inv_part_number').AsString;
      cds69.FieldByName('inv_name').AsString:=LFrm.cdsPick.FieldByName('inv_name').AsString;
      cds69.FieldByName('INV_DESCRIPTION').AsString:=LFrm.cdsPick.FieldByName('INV_DESCRIPTION').AsString;
      cds69.FieldByName('unit_code').AsString:=LFrm.cdsPick.FieldByName('unit_code').AsString;
      cds69.FieldByName('unit_name').AsString:=LFrm.cdsPick.FieldByName('unit_name').AsString;
      cds69.FieldByName('req_unit_ptr').Value:=LFrm.cdsPick.FieldByName('STOCK_UNIT_PTR').Value;
      cds69.FieldByName('CONVERSION_FACTOR').AsFloat:=LFrm.cdsPick.FieldByName('STOCK_PURCH').AsFloat;
      cds69.FieldByName('avl_flag').AsString:=LFrm.cdsPick.FieldByName('INSPECT').AsString;
      cds69.FieldByName('REPORT_VALUE2').AsFloat:=LFrm.cdsPick.FieldByName('REPORT_VALUE2').AsFloat;
      cds69.FieldByName('CONSIGN_ONHAND_QTY').AsFloat:=LFrm.cdsPick.FieldByName('CONSIGN_ONHAND_QTY').AsFloat;
      cds69.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
      cds69.FieldByName('tax').Value:=0;
      cds69.FieldByName('tax_price').Value:=0;
      cds69.FieldByName('status').Value:=0;
      cds69.FieldByName('IF_urgency').Value:=0;
      cds69.FieldByName('req_quantity').Value:=0;
      cds69.Post;
      RedtIfMajor.Text:=LFrm.cdsPick.FieldByName('CRITICAL_MATL').AsString;//重要物料标识
      GetQty;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetailEdit_Mod280.RedtMaterCodeExit(Sender: TObject);
var
Lsql17:string;
begin
 // inherited;
 if trim(RedtMaterCode.Text)<>'' then
  begin
   Lsql17:='select d17.rkey,d17.inv_part_number,d17.inv_description,'+
   ' d17.inv_name,d17.STOCK_PURCH,d17.PURCH_UNIT_PTR,d17.STOCK_UNIT_PTR,'+
   ' case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'''+
   ' end as CRITICAL_MATL,d17.CRITICAL_MATL_FLAG,'+
   ' d2.unit_code,d2.unit_name,d2a.unit_code st_nu_code,'+
   ' d2a.unit_name st_un_name,d17.inspect,d17.REPORT_VALUE2,'+
   ' d17.CONSIGN_ONHAND_QTY'+
   ' from  data0017 d17 inner join data0002 d2'+
   ' on d17.PURCH_UNIT_PTR=d2.rkey inner join'+
   ' data0002 d2a on d17.STOCK_UNIT_PTR=d2a.rkey'+
   ' where INV_PART_NUMBER='''+trim(RedtMaterCode.Text)+''' and STOP_PURCH=''N''';
    gSvrIntf.IntfGetDataBySql(Lsql17,cds17);
    if not cds17.IsEmpty then
    begin
      cds69.Edit;
      cds69.FieldByName('INVT_PTR').AsInteger:=cds17.FieldByName('Rkey').AsInteger;
      cds69.FieldByName('UNIT_PTR').AsInteger:=cds17.FieldByName('PURCH_UNIT_PTR').AsInteger;
      cds69.FieldByName('inv_part_number').AsString:=cds17.FieldByName('inv_part_number').AsString;
      cds69.FieldByName('inv_name').AsString:=cds17.FieldByName('inv_name').AsString;
      cds69.FieldByName('INV_DESCRIPTION').AsString:=cds17.FieldByName('INV_DESCRIPTION').AsString;
      cds69.FieldByName('unit_code').AsString:=cds17.FieldByName('unit_code').AsString;
      cds69.FieldByName('unit_name').AsString:=cds17.FieldByName('unit_name').AsString;
      cds69.FieldByName('req_unit_ptr').Value:=cds17.FieldByName('STOCK_UNIT_PTR').Value;
      cds69.FieldByName('CONVERSION_FACTOR').AsFloat:=cds17.FieldByName('STOCK_PURCH').AsFloat;
      cds69.FieldByName('avl_flag').AsString:=cds17.FieldByName('INSPECT').AsString;
      cds69.FieldByName('REPORT_VALUE2').AsFloat:=cds17.FieldByName('REPORT_VALUE2').AsFloat;
      cds69.FieldByName('CONSIGN_ONHAND_QTY').AsFloat:=cds17.FieldByName('CONSIGN_ONHAND_QTY').AsFloat;
      cds69.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
      cds69.FieldByName('tax').Value:=0;
      cds69.FieldByName('tax_price').Value:=0;
      cds69.FieldByName('status').Value:=0;
      cds69.FieldByName('IF_urgency').Value:=0;
      cds69.FieldByName('req_quantity').Value:=0;
      cds69.Post;
      RedtIfMajor.Text:=cds17.FieldByName('CRITICAL_MATL').AsString;//重要物料标识
      GetQty;
    end
    else
    begin
      messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
      RedtIfMajor.Text := '';
      cds69.Edit;
      cds69.FieldByName('INVT_PTR').AsVariant:=null;
      cds69.FieldByName('UNIT_PTR').AsVariant:=Null;
      cds69.FieldByName('inv_part_number').AsString:='';
      cds69.FieldByName('inv_name').AsString:='';
      cds69.FieldByName('INV_DESCRIPTION').AsString:='';
      cds69.FieldByName('unit_code').AsString:='';
      cds69.FieldByName('unit_name').AsString:='';
      cds69.FieldByName('req_unit_ptr').AsVariant:=null;
      cds69.FieldByName('CONVERSION_FACTOR').AsVariant:=null;
      cds69.FieldByName('avl_flag').AsString:='';
      cds69.FieldByName('REPORT_VALUE2').AsVariant:=Null;
      cds69.FieldByName('CONSIGN_ONHAND_QTY').AsVariant:=Null;
      cds69.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
      cds69.FieldByName('tax').Value:=0;
      cds69.FieldByName('tax_price').Value:=0;
      cds69.FieldByName('status').Value:=0;
      cds69.FieldByName('IF_urgency').Value:=0;
      cds69.FieldByName('req_quantity').Value:=0;
      cds69.Post;
      RedtMaterCode.SetFocus;
    end;
  end
 else
 if trim(RedtMaterCode.Text) = '' then
 begin
    RedtIfMajor.Text := '';
    cds69.Edit;
    cds69.FieldByName('INVT_PTR').AsVariant:=null;
    cds69.FieldByName('UNIT_PTR').AsVariant:=Null;
    cds69.FieldByName('inv_part_number').AsString:='';
    cds69.FieldByName('inv_name').AsString:='';
    cds69.FieldByName('INV_DESCRIPTION').AsString:='';
    cds69.FieldByName('unit_code').AsString:='';
    cds69.FieldByName('unit_name').AsString:='';
    cds69.FieldByName('req_unit_ptr').AsVariant:=null;
    cds69.FieldByName('CONVERSION_FACTOR').AsVariant:=null;
    cds69.FieldByName('avl_flag').AsString:='';
    cds69.FieldByName('REPORT_VALUE2').AsVariant:=Null;
    cds69.FieldByName('CONSIGN_ONHAND_QTY').AsVariant:=Null;
    cds69.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
    cds69.FieldByName('tax').Value:=0;
    cds69.FieldByName('tax_price').Value:=0;
    cds69.FieldByName('status').Value:=0;
    cds69.FieldByName('IF_urgency').Value:=0;
    cds69.FieldByName('req_quantity').Value:=0;
    cds69.Post;
 end;
end;

procedure TfrmDetailEdit_Mod280.RedtRqNeedQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
  else if Key = Chr(46)  then
   if pos('.',RedtRqNeedQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmDetailEdit_Mod280.RedtRqQtyExit(Sender: TObject);
begin
  inherited;
  cds69.Edit;
  cds69.FieldByName('req_quantity').AsInteger := cds69.FieldByName('QUANTITY').AsInteger;
  cds69.Post;
end;

procedure TfrmDetailEdit_Mod280.RedtRqQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtRqQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmDetailEdit_Mod280.RedtStockButtonClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cds69.FieldByName('INVT_PTR').AsVariant=null then
  begin
   ShowMessage('没有指定相关材料编码');
   Exit;
  end;
  Lsql:=' SELECT  dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY,'+
        ' dbo.Data0496.GROUP_NAME, SUM(dbo.Data0022.QUAN_ON_HAND-data0022.QUAN_TO_BE_STOCKED) AS quan_total,'+
        ' dbo.Data0002.UNIT_CODE,dbo.Data0071.reason, dbo.Data0022.BARCODE_ID, dbo.Data0023.ABBR_NAME,''通用库存'' AS type'+
        ' FROM dbo.Data0022 INNER JOIN'+
        ' dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'+
        ' dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'+
        ' dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'+
        ' dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+
        ' dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'+
        ' dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+
        ' dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY left join'+
        ' dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY'+
        ' WHERE (dbo.Data0022.QUAN_ON_HAND > 0) AND (Data0022.INVENTORY_PTR='+cds69.FieldByName('INVT_PTR').AsString+')'+
        ' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data0002.UNIT_CODE,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY,dbo.Data0071.reason, dbo.Data0022.BARCODE_ID,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION'+
        ' union all'+
        ' SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY,'+
        ' dbo.Data0496.GROUP_NAME, SUM(dbo.DATA0134.QUAN_ON_HAND) AS quan_total,'+
        ' dbo.Data0002.UNIT_CODE,dbo.Data0071.reason, dbo.Data0134.BARCODE_ID, dbo.Data0023.ABBR_NAME,''VMI库存'' AS type'+
        ' FROM dbo.Data0017 INNER JOIN'+
        ' dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'+
        ' dbo.DATA0134 ON dbo.Data0017.RKEY = dbo.DATA0134.INVENTORY_PTR INNER JOIN'+
        ' dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'+
        ' dbo.DATA0133 INNER JOIN'+
        ' dbo.Data0015 ON dbo.DATA0133.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'+
        ' dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN'+
        ' dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY LEFT JOIN'+
        ' dbo.Data0071 ON dbo.DATA0134.SOURCE_PTR = dbo.Data0071.RKEY'+
        ' WHERE   (data0134.quan_on_hand>0)  and  (dbo.DATA0134.INVENTORY_ptr ='+cds69.FieldByName('INVT_PTR').AsString+')'+
        ' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data0002.UNIT_CODE,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY, dbo.Data0071.reason, dbo.Data0134.BARCODE_ID,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION';

    try
     frmMatStock_Mod280:=TfrmMatStock_Mod280.Create(Application);
     gSvrIntf.IntfGetDataBySql(Lsql,frmMatStock_Mod280.cdsStock);
     frmMatStock_Mod280.ShowModal;
    finally
     frmMatStock_Mod280.Free;
    end;
end;

procedure TfrmDetailEdit_Mod280.RedtTranQtyButtonClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cds69.FieldByName('INVT_PTR').AsVariant=null then
  begin
   ShowMessage('没有指定相关材料编码');
   Exit;
  end;
  Lsql:='SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0023.ABBR_NAME, dbo.Data0071.QUAN_ORD,  '+
        ' dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS zaitu, dbo.Data0002.UNIT_NAME, dbo.Data0071.tax_price,  '+
        ' dbo.Data0071.TAX_2, dbo.Data0071.REQ_DATE, dbo.Data0070.PO_NUMBER, '+
        ' ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS_CODE_1)  AS ANALYSIS_CODE_1,  '+
        ' ISNULL(Data0034_1.DEPT_NAME, dbo.Data0034.DEPT_NAME) AS dept_name,   '+
        ' ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB) AS PO_REQ_NUMBER, dbo.Data0071.reason, dbo.Data0071.rohs,  '+
        ' dbo.Data0015.ABBR_NAME AS ComNm, Data0005_1.EMPLOYEE_NAME, dbo.Data0017.QUAN_ON_HAND  '+
        ' FROM dbo.Data0034 RIGHT OUTER JOIN dbo.Data0071 INNER JOIN '+
        ' dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN '+
        ' dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN '+
        ' dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
        ' dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN '+
        ' dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN '+
        ' dbo.Data0005 AS Data0005_1 ON dbo.Data0070.EMPLOYEE_POINTER = Data0005_1.RKEY ON '+
        ' dbo.Data0034.DEPT_CODE = dbo.Data0070.PO_REV_NO FULL OUTER JOIN '+
        ' dbo.Data0068 LEFT OUTER JOIN '+
        ' dbo.Data0034 AS Data0034_1 ON dbo.Data0068.DEPARTMENT_NAME = Data0034_1.DEPT_CODE LEFT OUTER JOIN '+
        ' dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY FULL OUTER JOIN '+
        ' dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY '+
        ' WHERE (dbo.Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0) and (dbo.Data0071.INVT_PTR ='+cds69.FieldByName('INVT_PTR').AsString+')';
  try
   frmMaterZt_Mod280:=TfrmMaterZt_Mod280.Create(nil);
   gSvrIntf.IntfGetDataBySql(Lsql,frmMaterZt_Mod280.cdsMain);
   frmMaterZt_Mod280.ShowModal;
  finally
   frmMaterZt_Mod280.Free;
  end;
end;

procedure TfrmDetailEdit_Mod280.Init(Ftype: Integer;AReason:string);
begin
  if Ftype=0 then
  begin
    cds69.Append;
    cds69.FieldByName('QUANTITY').Value:=0;
    cds69.FieldByName('reason').Value:= AReason;
    cds69.Post;
  end;
end;

end.
