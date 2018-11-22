unit PrintFrm_Mod623;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, Datasnap.DBClient, frxClass,
  frxDBSet,frxChBox, Datasnap.Provider, Data.Win.ADODB, frxDesgn;

type
  TfrmPrint_Mod623 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    lbl1: TLabel;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    lbl2: TLabel;
    lbl3: TLabel;
    btnQuery: TBitBtn;
    eh213: TDBGridEh;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    cds213: TClientDataSet;
    ds213: TDataSource;
    rep213: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    btnSearch: TBitBtn;
    edtCustomer: TEdit;
    cds493: TClientDataSet;
    frxDBDataset2: TfrxDBDataset;
    cds493Company_Icon: TBlobField;
    cds493Company_Name: TStringField;
    cds493Company_Name2: TStringField;
    cds213RKEY: TAutoIncField;
    cds213MANU_PART_NUMBER: TStringField;
    cds213PO_NUMBER: TStringField;
    cds213ANALYSIS_CODE_2: TStringField;
    cds213MANU_PART_DESC: TStringField;
    cds213ORIG_SCHED_SHIP_DATE: TDateTimeField;
    cds213ORIG_REQUEST_DATE: TDateTimeField;
    cds213PARTS_ORDERED: TIntegerField;
    cds213PART_PRICE: TFloatField;
    cds213CURR_CODE: TStringField;
    cds213PO_DATE: TDateTimeField;
    cds213status: TSmallintField;
    cds213user_ptr: TIntegerField;
    cds213submit_date: TDateTimeField;
    cds213total_case: TFloatField;
    cds213audit_ptr: TIntegerField;
    cds213audit_date: TDateTimeField;
    cds213so_oldnew: TStringField;
    cds213is_alter: TSmallintField;
    cds213lis_num: TStringField;
    cds213CUST_CODE: TStringField;
    cds213CUSTOMER_NAME: TStringField;
    cds213ABBR_NAME: TStringField;
    cds213sales_rep_name: TStringField;
    cds213employee_name: TStringField;
    cds213sstatus: TStringField;
    cds213soNew: TStringField;
    cds213soOld: TStringField;
    cds213soisalter: TStringField;
    cds213soisnotalter: TStringField;
    frxDesigner213: TfrxDesigner;
    procedure btnSearchClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure edtCustomerExit(Sender: TObject);
    procedure edtCustomerKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrintClick(Sender: TObject);
    procedure eh213DblClick(Sender: TObject);
  private
    { Private declarations }
    function GetCustomer:string;
  public
    { Public declarations }
    procedure GetData;
  end;

var
  frmPrint_Mod623: TfrmPrint_Mod623;

implementation

uses uBaseSinglePickListFrm,uCommFunc,System.Generics.Collections,System.DateUtils;

{$R *.dfm}

procedure TfrmPrint_Mod623.btnPrintClick(Sender: TObject);
var
  LFileName:string;
begin
  inherited;
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\市场销售_订单管理\', [rfReplaceAll]) +
      '订单生产申请单.fr3';
    rep213.LoadFromFile(LFileName, true);
    rep213.PrepareReport(True);
//    rep213.Print;
    rep213.ShowReport;

end;

procedure TfrmPrint_Mod623.btnQueryClick(Sender: TObject);
var
  LSql:string;
begin
  inherited;
  if Trim(edtCustomer.Text) = '' then
  begin
    ShowMessage('请先选择客户！');
    exit;
  end;
  LSql:= cds213.CommandText + ' and  Data0213.submit_date BETWEEN ' + QuotedStr(DateToStr(dtpBegin.Date)) +
      ' AND ' + QuotedStr(DateToStr(IncDay(dtpEnd.Date,1))) + ' AND Data0010.rkey = ' +
      IntToStr(edtCustomer.Tag) + GetCustomer + ' ORDER BY CUST_CODE ';
//  ShowMessage(LSql);
  if not gSvrIntf.IntfGetDataBySql(LSql,cds213) then Exit;
  if cds213.IsEmpty then btnPrint.Enabled:= False;
end;

procedure TfrmPrint_Mod623.btnSearchClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(623,5,' WHERE DATA0010.CUST_CODE LIKE ''%'+
                Trim(edtCustomer.Text) +'%''' + GetCustomer + ' ORDER BY CUST_CODE ');
    if LFrm.ShowModal= mrOk then
    begin
      edtCustomer.Text:= LFrm.cdsPick.FieldByName('CUST_CODE').AsString;
      edtCustomer.Tag:= LFrm.cdsPick.FieldByName('rkey').AsInteger;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmPrint_Mod623.edtCustomerExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if Trim(edtCustomer.Text) = '' then Exit;
  if btnPrint.Focused or btnClose.Focused then exit;

  LSql:='select rkey,CUST_CODE,ABBR_NAME,CUSTOMER_NAME from data0010' +#13+
        ' where cust_code = '+ QuotedStr(Trim(edtCustomer.Text))  + GetCustomer;
  LCds:= TClientDataSet.Create(nil);
  try
    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      if not LCds.IsEmpty then
      begin
        edtCustomer.Text:= LCds.FieldByName('CUST_CODE').AsString;
        edtCustomer.Tag:= LCds.FieldByName('rkey').AsInteger;
      end
      else
      begin
        ShowMessage('客户代码下正确或没有该客户的访问权限');
        exit;
      end;
    end
    else
    begin
      ShowMessage('检查客户代码失败，请重试');
      edtCustomer.SetFocus;
      Exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmPrint_Mod623.edtCustomerKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then edtCustomerExit(nil);
end;

procedure TfrmPrint_Mod623.eh213DblClick(Sender: TObject);
begin
  inherited;
  if not cds213.IsEmpty then cds213.Delete;
  if cds213.IsEmpty then  btnPrint.Enabled:=false;
end;

function TfrmPrint_Mod623.GetCustomer: string;
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

procedure TfrmPrint_Mod623.GetData;
begin
  gSvrIntf.IntfGetDataBySql(cds493.CommandText,cds493);
end;

end.
