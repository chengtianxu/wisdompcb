unit DMUnit1;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODataSet2: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet2WORK_ORDER_NUMBER: TStringField;
    ADODataSet2QUAN_SCH: TFloatField;
    ADODataSet2QUAN_REJ: TFloatField;
    ADODataSet2QUAN_PROD: TFloatField;
    ADODataSet2FLOW_NO: TSmallintField;
    ADODataSet2wtype: TWordField;
    ADODataSet2put_type: TWordField;
    ADODataSet2ENGG_STATUS: TSmallintField;
    ADODataSet2PROD_STATUS: TSmallintField;
    ADODataSet2ENGG_PROD_FLAG: TSmallintField;
    ADODataSet2SCH_COMPL_DATE: TDateTimeField;
    ADODataSet2PROJ_START_DATE: TDateTimeField;
    ADODataSet2PROJ_COMPL_DATE: TDateTimeField;
    ADODataSet2CANCEL_HOLD_DATE: TDateTimeField;
    ADODataSet2ACT_COMPL_DATE: TDateTimeField;
    ADODataSet2PLANNED_QTY: TFloatField;
    ADODataSet2RELEASE_DATE: TDateTimeField;
    ADODataSet2DEPT_CODE: TStringField;
    ADODataSet2DEPT_NAME: TStringField;
    ADODataSet2PROD_CODE: TStringField;
    ADODataSet2PRODUCT_NAME: TStringField;
    ADODataSet2MANU_PART_NUMBER: TStringField;
    ADODataSet2My_PROD_STATUS: TStringField;
    ADODataSet2My_wtype: TStringField;
    ADODataSet2My_number1: TFloatField;
    ADODataSet2rkey06: TIntegerField;
    ADODataSet2BOM_PTR: TIntegerField;
    tmp: TADOQuery;
    ADODataSet1: TADODataSet;
    ADODataSet1rkey: TAutoIncField;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1ENT_DATE: TDateTimeField;
    ADODataSet1SCH_DATE: TDateTimeField;
    ADODataSet1ENAME60: TStringField;
    ADODataSet1ENAME492: TStringField;
    ADODataSet1PARTS_ORDERED: TFloatField;
    ADODataSet1set_ordered: TIntegerField;
    ADODataSet1PARTS_SHIPPED: TFloatField;
    ADODataSet1PARTS_RETURNED: TFloatField;
    ADODataSet1PARTS_ALLOC: TFloatField;
    ADODataSet1PARTS_INVOICED: TFloatField;
    ADODataSet1FOB: TStringField;
    ADODataSet1CUT_NO: TStringField;
    ADODataSet1ISSUE_DATE: TDateTimeField;
    ADODataSet1ISSUED_QTY: TIntegerField;
    ADODataSet1SALES_ORDER: TStringField;
    ADODataSet1STATUS: TWordField;
    ADODataSet1PO_NUMBER: TStringField;
    ADODataSet1CUST_CODE: TStringField;
    ADODataSet1CUSTOMER_NAME: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1PRODUCT_NAME: TStringField;
    ADODataSet1myStatus: TStringField;
    ADODataSet1ttype: TWordField;
    ADODataSet1tstatus: TWordField;
    ADODataSet1status492: TStringField;
    ADODataSet1type492: TStringField;
    procedure ADODataSet2CalcFields(DataSet: TDataSet);
    procedure ADODataSet1CalcFields(DataSet: TDataSet);
    procedure ADODataSet1AfterClose(DataSet: TDataSet);
    procedure ADODataSet1AfterScroll(DataSet: TDataSet);
    procedure ADODataSet1BeforeOpen(DataSet: TDataSet);
  private
    rkey06:integer;
    vfind:boolean;
    procedure Set_find1(const Value: boolean);
  public
    property find1:boolean write Set_find1;
  end;

var
  DM: TDM;
  sysDate:TDatetime;
implementation

{$R *.dfm}

procedure TDM.Set_find1(const Value: boolean);
begin
  vfind:=value;
end;

procedure TDM.ADODataSet2CalcFields(DataSet: TDataSet);
begin
  if ADODataSet2.Active then
  begin
    ADODataSet2My_number1.Value :=ADODataSet2QUAN_SCH.Value-ADODataSet2QUAN_REJ.Value
                                  -ADODataSet2QUAN_PROD.Value;
    case self.ADODataSet2wtype.Value of
      0:self.ADODataSet2My_wtype.Value:='';
      1:self.ADODataSet2My_wtype.Value:='';
      2:self.ADODataSet2My_wtype.Value:='';
    end;

    case self.ADODataSet2PROD_STATUS.Value of
      1:self.ADODataSet2My_PROD_STATUS.Value:='等待审核';
      2:self.ADODataSet2My_PROD_STATUS.Value:='待发放';
      3:self.ADODataSet2My_PROD_STATUS.Value:='生产中';
      4:self.ADODataSet2My_PROD_STATUS.Value:='外发生产';
      5:self.ADODataSet2My_PROD_STATUS.Value:='待入仓';
      6:self.ADODataSet2My_PROD_STATUS.Value:='待分配';
      9:self.ADODataSet2My_PROD_STATUS.Value:='生产结束';
      101:self.ADODataSet2My_PROD_STATUS.Value:='审核暂缓';
      102:self.ADODataSet2My_PROD_STATUS.Value:='生产前暂缓';
      103:self.ADODataSet2My_PROD_STATUS.Value:='生产中暂缓';
      201:self.ADODataSet2My_PROD_STATUS.Value:='已取消';
      202:self.ADODataSet2My_PROD_STATUS.Value:='取消';
      203:self.ADODataSet2My_PROD_STATUS.Value:='已取消';
    end;
  end;
end;

procedure TDM.ADODataSet1CalcFields(DataSet: TDataSet);
begin
  case ADODataSet1STATUS.Value of
    1: ADODataSet1MySTATUS.Value:='有效的';
    2: ADODataSet1MySTATUS.Value:='暂缓';
    3: ADODataSet1MySTATUS.Value:='已关闭';
    4: ADODataSet1MySTATUS.Value:='已完成';
    5: ADODataSet1MySTATUS.Value:='已取消';
    6: ADODataSet1MySTATUS.Value:='未提交';
  end;
  case ADODataSet1tstatus.Value of
    0:ADODataSet1status492.Value:='已审核';
    1:ADODataSet1status492.Value:='未审核';
    2:ADODataSet1status492.Value:='不审核';
    3:ADODataSet1status492.Value:='已取消';
  end;
  case ADODataSet1ttype.Value of
    0:ADODataSet1type492.Value:='正常投产';
    1:ADODataSet1type492.Value:='补料投产';
    2:ADODataSet1type492.Value:='按MRB重制';
    3:ADODataSet1type492.Value:='按MRB返修';
    4:ADODataSet1type492.Value:='按板号投产';
  end;
end;

procedure TDM.ADODataSet1AfterClose(DataSet: TDataSet);
begin
  vfind:=false;
end;

procedure TDM.ADODataSet1AfterScroll(DataSet: TDataSet);
begin
  ADODataSet2.Close;
  ADODataSet2.Parameters.ParamValues['cut_no'] := ADODataSet1CUT_NO.Value ;
  ADODataSet2.Open;
end;

procedure TDM.ADODataSet1BeforeOpen(DataSet: TDataSet);
begin
 vfind:=false;
end;

end.
