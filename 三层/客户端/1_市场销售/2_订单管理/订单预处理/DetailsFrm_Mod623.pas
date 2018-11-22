unit DetailsFrm_Mod623;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.DBCtrls, RzPanel,
  RzRadGrp, RzDBRGrp, RzCmboBx, RzDBCmbo, Vcl.ComCtrls, RzDTP, RzDBDTP, Data.DB,
  Datasnap.DBClient;

type
  TfrmDetail_Mod623 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtCustomer: TRKeyRzBtnEdit;
    edtFactory: TRKeyRzBtnEdit;
    edtPoNO: TRKeyRzBtnEdit;
    edtPartNumber: TRKeyRzBtnEdit;
    edtRef: TRKeyRzBtnEdit;
    mnRemark: TDBMemo;
    rgRate: TRzDBRadioGroup;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    rgMode: TRzDBRadioGroup;
    cbxNewOrOld: TRzDBComboBox;
    rgType: TRzDBRadioGroup;
    dpkMake: TRzDBDateTimePicker;
    Label21: TLabel;
    Label22: TLabel;
    dpkPODate: TRzDBDateTimePicker;
    dpkSendDate: TRzDBDateTimePicker;
    Label23: TLabel;
    edtPrintType: TRKeyRzBtnEdit;
    Label24: TLabel;
    edtOriginalCus: TRKeyRzBtnEdit;
    cds213: TClientDataSet;
    ds213: TDataSource;
    edtQty: TRKeyRzBtnEdit;
    edtSq: TRKeyRzBtnEdit;
    edtOrderQty: TRKeyRzBtnEdit;
    edtOrderSq: TRKeyRzBtnEdit;
    edtNewNO: TRKeyRzBtnEdit;
    edtDesc: TRKeyRzBtnEdit;
    edtINVTNO: TRKeyRzBtnEdit;
    edtCurr: TRKeyRzBtnEdit;
    edtPrice: TRKeyRzBtnEdit;
    procedure edtPoNOButtonClick(Sender: TObject);
    procedure edtPartNumberButtonClick(Sender: TObject);
    procedure edtPrintTypeButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cbxNewOrOldChange(Sender: TObject);
    procedure edtOrderQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edtCustomerButtonClick(Sender: TObject);
    procedure edtCustomerKeyPress(Sender: TObject; var Key: Char);
    procedure edtCustomerExit(Sender: TObject);
    procedure edtPoNOKeyPress(Sender: TObject; var Key: Char);
    procedure edtOriginalCusKeyPress(Sender: TObject; var Key: Char);
    procedure edtOrderQtyChange(Sender: TObject);
    procedure edtPrintTypeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    LUnit_Sq: Double;
    LIsMulCustomer:string;
    LIsCheck:Boolean; //客户框退出是是否激活exit事件
    function CheckData:Boolean;
    function GetOrderType(ARkey25:Integer):Integer;
    function GetCustomer:string;
    function CheckCustomer(ACode10:string):Boolean;


  public
    { Public declarations }
    LDetailType:Integer;  //0新增 1编辑 2检查 3复制
    procedure GetData(ARkey:Integer);
    function Append213:Boolean;
    procedure GetData25(ANumber:string);
  end;

var
  frmDetail_Mod623: TfrmDetail_Mod623;

implementation

uses uCommFunc,uBaseSinglePickListFrm,System.Generics.Collections;

{$R *.dfm}

{ TfrmDetail_Mod623 }

function TfrmDetail_Mod623.Append213: Boolean;
begin
  if LDetailType = 0 then
  begin
    cds213.Append;
    cds213.FieldByName('ORIG_SCHED_SHIP_DATE').Value:= gFunc.GetSvrDateTime(dtdate);
    cds213.FieldByName('ORIG_REQUEST_DATE').Value:= cds213.FieldByName('ORIG_SCHED_SHIP_DATE').Value;
    cds213.FieldByName('PO_DATE').Value:= cds213.FieldByName('ORIG_SCHED_SHIP_DATE').Value;
    cds213.FieldByName('so_oldnew').Value:= '旧单';
    cds213.FieldByName('is_alter').Value:= 0;
    cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 1;
    cds213.FieldByName('so_style').Value:= 0;
    cds213.FieldByName('status').Value:= 0;
    cds213.FieldByName('user_ptr').Value:= StrToInt(gVar.rkey05);
    cds213.FieldByName('PARTS_ORDERED').Value:= 0;
    cds213.FieldByName('PART_PRICE').Value:= 0;
    cds213.Post;
  end
  else if LDetailType = 3 then
  begin

  end;
end;

procedure TfrmDetail_Mod623.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not CheckData then Exit;    //检查输入
  cds213.Edit;
  cds213.FieldByName('submit_date').Value:= gFunc.GetSvrDateTime(dtdatetime);
  cds213.Post;
  if gSvrIntf.IntfPostDataByTable('Data0213',cds213.Delta) then
  begin
    ShowMessage('保存成功！');
    ModalResult:= mrOk;
  end;
end;

procedure TfrmDetail_Mod623.cbxNewOrOldChange(Sender: TObject);
begin
  inherited;
  if cbxNewOrOld.ItemIndex = 1 then
  begin
    rgMode.Enabled:= True;
    edtNewNO.ReadOnly:= False;
  end
  else
  begin
    rgMode.Enabled:= False;
    edtNewNO.ReadOnly:= True;
  end;
end;

function TfrmDetail_Mod623.CheckCustomer(ACode10:string):Boolean;
var
  LSql:string;
  LCds: TClientDataSet;
begin
  Result:= True;
  LSql:= 'select data0010.rkey,data0010.CUST_CODE,data0010.CUSTOMER_NAME,data0001.CURR_CODE '+#13+
         ' from data0010  '+#13+
         '    inner join data0001 on data0010.CURRENCY_PTR = data0001.rkey '+#13+
         ' WHERE CUSTOMER_TYPE<>4 and data0010.CUST_CODE = ' + QuotedStr(ACode10)
         + GetCustomer;
  LCds:= TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql(LSql,LCds);
    if LCds.IsEmpty then
    begin
      Result:= False;
      edtCustomer.SetFocus;
      ShowMessage('客户被停用或没有访问此客户的权限！！');
    end
    else
    begin
      cds213.Edit;
      cds213.FieldByName('cust_code').Value:= LCds.FieldByName('CUST_CODE').Value;
      cds213.FieldByName('CURR_CODE').Value:= LCds.FieldByName('CURR_CODE').Value;
      if (Trim(cds213.FieldByName('CURR_CODE').AsString) <> 'RMB') then      //rmb含税,其它不含税
      begin
        cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 0;
        rgRate.Visible:= False;
      end
      else
      begin
        cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 1;
        rgRate.Visible:= True;
      end;
      if LIsMulCustomer <> 'Y' then cds213.FieldByName('MANU_PART_NUMBER').Value :='';
      cds213.Post;
      LIsCheck:= True;
    end;
  finally
    LCds.Free;
  end;
end;

function TfrmDetail_Mod623.CheckData: Boolean;
begin
  Result:= False;
  if Trim(edtCustomer.Text) = '' then
  begin
    ShowMessage('客户不能为空!');
    edtCustomer.SetFocus;
    Exit;
  end;
  if Trim(edtPoNO.Text) = '' then
  begin
    ShowMessage('合同号不能为空!');
    edtPoNO.SetFocus;
    Exit;
  end;
  if (Trim(edtOrderQty.Text) = '') or (Trim(edtOrderQty.Text) = '0') then
  begin
    ShowMessage('订单数量不能为0或空!');
    edtQty.SetFocus;
    Exit;
  end;
  if Trim(edtPrice.Text) = '' then
  begin
    ShowMessage('价格不能为空!');
    edtPrice.SetFocus;
    Exit;
  end;
  if (cbxNewOrOld.ItemIndex = 1) and (Trim(edtNewNO.Text) = '') then
  begin
    ShowMessage('新单认可号码不能为空!');
    edtNewNO.SetFocus;
    Exit;
  end;
  if Trim(edtPartNumber.Text) = '' then
  begin
    ShowMessage('本厂编号不能为空!');
    edtPartNumber.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmDetail_Mod623.edtCustomerButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(623,StrToInt(edtCustomer.DisplayPickID),' AND DATA0010.CUST_CODE LIKE ''%'+
                Trim(edtCustomer.Text) +'%''' + GetCustomer + ' ORDER BY CUST_CODE ');
    if LFrm.ShowModal= mrOk then
    begin

      cds213.Edit;
      cds213.FieldByName('cust_code').Value:= LFrm.cdsPick.FieldByName('CUST_CODE').Value;
      cds213.FieldByName('CURR_CODE').Value:= LFrm.cdsPick.FieldByName('CURR_CODE').Value;
      if (Trim(cds213.FieldByName('CURR_CODE').AsString) <> 'RMB') then      //rmb含税,其它不含税
      begin
        cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 0;
        rgRate.Visible:= False;
      end
      else
      begin
        cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 1;
        rgRate.Visible:= True;
      end;
      if LIsMulCustomer <> 'Y' then cds213.FieldByName('MANU_PART_NUMBER').Value :='';
      cds213.Post;
      LIsCheck:= True;
      edtPoNO.SetFocus;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod623.edtCustomerExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
//  inherited;
  if btnClose.Focused then Exit;

  if (Trim(edtCustomer.Text) <> '') and (not LIsCheck) then
  begin
    CheckCustomer(Trim(edtCustomer.Text));
//    edtPoNO.SetFocus;
//    LSql:= 'select data0010.rkey,data0010.CUST_CODE,data0010.CUSTOMER_NAME,data0001.CURR_CODE '+#13+
//           ' from data0010  '+#13+
//           '    inner join data0001 on data0010.CURRENCY_PTR = data0001.rkey '+#13+
//           ' WHERE CUSTOMER_TYPE<>4 and CUST_CODE = ' + QuotedStr(Trim(edtCustomer.Text))
//           + GetCustomer;
////    ShowMessage(LSql);
//    LCds:= TClientDataSet.Create(nil);
//    try
//      gSvrIntf.IntfGetDataBySql(LSql,LCds);
//      if not LCds.IsEmpty then
//      begin
//        cds213.Edit;
//        cds213.FieldByName('cust_code').Value:= LCds.FieldByName('CUST_CODE').Value;
//        cds213.FieldByName('CURR_CODE').Value:= LCds.FieldByName('CURR_CODE').Value;
//        if (Trim(cds213.FieldByName('CURR_CODE').AsString) <> 'RMB') then      //rmb含税,其它不含税
//        begin
//          cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 0;
//          rgRate.Visible:= False;
//        end
//        else
//        begin
//          cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 1;
//          rgRate.Visible:= True;
//        end;
//        if LIsMulCustomer <> 'Y' then cds213.FieldByName('MANU_PART_NUMBER').Value :='';
//        cds213.Post;
//        LIsCheck:= True;
//        edtPoNO.SetFocus;
//      end
//      else
//      begin
//        ShowMessage('客户不存在或客户被信用或没有权限访问此客户!!');
//        edtCustomer.SetFocus;
//        exit;
//      end;
//    finally
//      LCds.Free;
//    end;
  end
  else
  begin
//    edtCustomer.Tag:= 0;
//    cds213.Edit;
//    cds213.FieldByName('cust_code').Value:= '';
//    cds213.FieldByName('CURR_CODE').Value:= '';
//    cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value:= 1;
//    cds213.Post;
  end;
end;

procedure TfrmDetail_Mod623.edtCustomerKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then edtPoNO.SetFocus;
end;

procedure TfrmDetail_Mod623.edtOrderQtyChange(Sender: TObject);
begin
  inherited;
  if (Trim(edtPartNumber.Text) <> '') and (Trim(edtOrderQty.Text) <> '') then
  edtOrderSq.Text:= FormatFloat('0.0000',LUnit_Sq * StrToInt(Trim(edtOrderQty.Text)));
end;

procedure TfrmDetail_Mod623.edtOrderQtyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',edtQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmDetail_Mod623.edtOriginalCusKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Abort;
end;

procedure TfrmDetail_Mod623.edtPartNumberButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if (Trim(edtCustomer.Text) <> '') and (LIsMulCustomer <> 'Y') then
    begin
      LFrm.InitWithPickID(623, StrToInt(edtPartNumber.DisplayPickID), ' and MANU_PART_NUMBER LIKE ''%'+
          Trim(edtPartNumber.Text) +'%'' data0010.CUST_CODE = '+ QuotedStr(Trim(edtCustomer.Text))
           + ' ORDER BY MANU_PART_NUMBER ');
    end
    else
      LFrm.InitWithPickID(623, StrToInt(edtPartNumber.DisplayPickID), ' and MANU_PART_NUMBER LIKE ''%'+
          Trim(edtPartNumber.Text) +'%'' ORDER BY MANU_PART_NUMBER ');

    if LFrm.ShowModal= mrOk then
    begin
      if Trim(edtCustomer.Text) = '' then
      if not CheckCustomer(trim(LFrm.cdsPick.FieldByName('CUST_CODE').AsString)) then Exit;

      cds213.Edit;
      cds213.FieldByName('MANU_PART_NUMBER').Value:= LFrm.cdsPick.FieldByName('MANU_PART_NUMBER').Value;
      cds213.FieldByName('ANALYSIS_CODE_2').Value:= LFrm.cdsPick.FieldByName('ANALYSIS_CODE_2').Value;
      cds213.FieldByName('MANU_PART_DESC').Value:= LFrm.cdsPick.FieldByName('MANU_PART_DESC').Value;
//      cds213.FieldByName('WAREHOUSE_CODE').Value:= LFrm.cdsPick.FieldByName('WAREHOUSE_CODE').Value;
      if Trim(edtOriginalCus.Text) = '' then
      cds213.FieldByName('orig_customer').Value:= LFrm.cdsPick.FieldByName('ORIG_CUSTOMER').Value;
      cds213.Post;

      LUnit_Sq:= LFrm.cdsPick.FieldByName('unit_sq').Value;
      edtFactory.Text:= LFrm.cdsPick.FieldByName('abbr_name').AsString;
      edtQty.Text:= IntToStr(LFrm.cdsPick.FieldByName('QTY_ON_HAND').Value);
      edtSq.Text:= FloatToStr(LFrm.cdsPick.FieldByName('mianji').Value);
      cbxNewOrOld.ItemIndex:= GetOrderType(LFrm.cdsPick.FieldByName('rkey').Value);
      cbxNewOrOldChange(nil);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod623.edtPoNOButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  if Trim(edtCustomer.Text) = '' then
  begin
    ShowMessage('请先选择客户!!');
    Exit;
  end;

  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(623,StrToInt(edtPoNO.DisplayPickID),' where Data0010.CUST_CODE = '
                + QuotedStr(Trim(cds213.FieldByName('cust_code').AsString)));
    if LFrm.ShowModal= mrOk then
    begin
      cds213.Edit;
      cds213.FieldByName('po_number').Value:= LFrm.cdsPick.FieldByName('po_number').Value;
      cds213.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod623.edtPoNOKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Abort;
end;

procedure TfrmDetail_Mod623.edtPrintTypeButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
  LCode:string;
begin
//  inherited;
  if cds213.FieldByName('orig_customer').AsString <> '' then
    LCode:= Trim(edtCustomer.DisplayNoteLabel.Caption)
  else if cds213.FieldByName('cust_code').AsString <> '' then
    LCode:= cds213.FieldByName('cust_code').AsString
  else
  begin
    ShowMessage('请先选择客户或原客户!');
    Exit;
  end;

  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(623,StrToInt(edtPoNO.DisplayPickID),' where DATA0010.CUST_CODE= ' + QuotedStr(LCode));
    if LFrm.ShowModal= mrOk then
    begin
      cds213.Edit;
      cds213.FieldByName('Print2DKey').Value:= LFrm.cdsPick.FieldByName('rkey').Value;
      cds213.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod623.edtPrintTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Abort;
end;

function TfrmDetail_Mod623.GetCustomer: string;
var
  LArr: TArray<Integer>;
  I,LNum: Integer;
  LSql,LRkeyList:string;
  LCds:TClientDataSet;
begin
  Result := '';
  LArr := gFunc.GetUserModAuthIDArr(StrToInt(gVar.rkey73),623);
  if TArray.BinarySearch<Integer>(LArr,7,LNum) then     //7为指定客户权限，在功能中定义
  begin
    Result := ' AND Data0010.rkey in ( SELECT customer_ptr from DATA0100 WHERE csi_ptr = ' + gVar.rkey73 + ') ';
//    LSql:= 'SELECT customer_ptr from DATA0100 WHERE csi_ptr = ' + gVar.rkey73;
//    LCds:= TClientDataSet.Create(nil);
//    try
//      gSvrIntf.IntfGetDataBySql(LSql,LCds);
//      if not LCds.IsEmpty then
//      begin
//        LRkeyList:= '0';
//        LCds.First;
//        while not LCds.Eof  do
//        begin
//          LRkeyList:= LCds.FieldByName('customer_ptr').AsString + ',' + LRkeyList ;
//          LCds.Next;
//        end;
//        Result := ' AND Data0010.rkey in (' + LRkeyList + ') ';
//      end
//      else  Result:= ' AND Data0010.rkey in (-1) ';
//    finally
//      LCds.Free;
//    end;
  end;
end;

procedure TfrmDetail_Mod623.GetData(ARkey: Integer);
var
  LSql,LSql192:string;
  LCds192:TClientDataSet;
begin
  LSql:= cds213.CommandText + ' WHERE RKEY = ' + IntToStr(ARkey);
  LSql192:= ' SELECT custcoTool FROM DATA0192';
  LCds192:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql192]),[cds213,LCds192]) then
    begin
      ShowMessage('取得数据失败!');
      Exit;
    end;
    LIsMulCustomer:= LCds192.FieldByName('custcoTool').AsString;
  finally
    LCds192.Free;
  end;
end;

function TfrmDetail_Mod623.GetOrderType(ARkey25: Integer): Integer;
var
  LSql: string;
  LCds: TClientDataSet;
begin
  Result:= 0;
  LSql:= 'SELECT 1 FROM DATA0060 WHERE cust_part_ptr = ' + IntToStr(ARkey25);
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then Result := 0
    else Result:= 1;
  finally
    LCds.Free;
  end;
end;

procedure TfrmDetail_Mod623.GetData25(ANumber: string);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  LSql:= ' SELECT data0025.unit_sq,data0025.QTY_ON_HAND,round(data0025.QTY_ON_HAND*data0025.unit_sq,4) as mianji,Data0015.ABBR_NAME '+#13 +
          ' FROM DATA0025   '+#13+
          '         INNER JOIN Data0015 ON Data0025.PROD_ROUTE_PTR = Data0015.rkey    '+#13 +
          ' WHERE MANU_PART_NUMBER = ' + QuotedStr(Trim(ANumber));
  LCds:= TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql(LSql,LCds);
    if not LCds.IsEmpty then
    begin
      LUnit_Sq:= LCds.FieldByName('unit_sq').Value;
      edtFactory.Text:= LCds.FieldByName('ABBR_NAME').Value;
      edtQty.Text:=LCds.FieldByName('QTY_ON_HAND').Value;
      edtSq.Text:=LCds.FieldByName('mianji').Value;
    end
    else LUnit_Sq:= 0
  finally
    LCds.Free;
  end;
end;

end.
