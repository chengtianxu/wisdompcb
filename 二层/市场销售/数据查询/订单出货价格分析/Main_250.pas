{******************************************************************************}
{                                                                              }
{Code Maker: Jacky Zhong                                                       }
{Date: FEB. 07. 2007                                                           }
{Comments:                                                                     }
{功能：1.查询窗体,分析订单数据                                                 }
{                                                                              }
{******************************************************************************}

unit Main_250;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Menus, ComCtrls, db,
  ADODB, Buttons, DBGridEh;

type

  TfrmMain_250 = class(TForm)
    Panel2: TPanel;
    ADOConnection1: TADOConnection;
    dsMaster: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtpFrom: TDateTimePicker;
    Label2: TLabel;
    dtpTo: TDateTimePicker;
    Label3: TLabel;
    edtSelfCode: TEdit;
    Label4: TLabel;
    edtCustCode: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    rgOrderType: TRadioGroup;
    edtProdtype: TEdit;
    edtCustId: TEdit;
    edtSales: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    adsMaster: TADOStoredProc;
    spBtnExit: TSpeedButton;
    spBtnExport: TSpeedButton;
    spbtnClear: TSpeedButton;
    spBtnQuery: TSpeedButton;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edtProdQty: TEdit;
    Label11: TLabel;
    edtProdValue: TEdit;
    rgSalesType: TRadioGroup;
    Label12: TLabel;
    edtRate: TEdit;
    adsMasterPROD_CODE: TStringField;
    adsMasterCUST_CODE: TStringField;
    adsMasterPART_PRICE: TFloatField;
    adsMasterTOTAL_COST: TFloatField;
    adsMasterPARTS_ORDERED: TFloatField;
    adsMasterDATE_SHIPPED: TDateTimeField;
    adsMasterCURR_CODE: TStringField;
    adsMasterquan_shipped: TIntegerField;
    adsMasteramount: TFloatField;
    adsMasterunit_sq: TFloatField;
    adsMasterTotalArea: TFloatField;
    adsMasterMANU_PART_NUMBER: TStringField;
    adsMasterMANU_PART_DESC: TStringField;
    DBGrid1: TDBGridEh;
    Label7: TLabel;
    edtWareHouse: TEdit;
    SpeedButton2: TSpeedButton;
    adsMasterABBR_NAME: TStringField;
    adsMasterSALES_REP_NAME: TStringField;
    adsMasterUNIT_LEN: TFloatField;
    adsMasterUNIT_WTH: TFloatField;
    adsMasterTUNITS: TIntegerField;
    adsMastersqft_price: TFloatField;
    adsMasterrate_margin: TBCDField;
    adsMasterSALES_DISCOUNT: TBCDField;
    adsMasterSALES_ORDER: TStringField;
    adsMasterTUSAGE: TBCDField;
    adsMasterstand_rate: TFloatField;
    adsMasterORIG_CUSTOMER: TStringField;
    Label13: TLabel;
    Edit1: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure spBtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure spbtnClearClick(Sender: TObject);
    procedure edtSelfCodeChange(Sender: TObject);
    procedure adsMasterAfterOpen(DataSet: TDataSet);
    procedure spBtnExportClick(Sender: TObject);
    procedure adsMasterMARKUP_RATEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure spBtnExitClick(Sender: TObject);
    procedure rgSalesTypeClick(Sender: TObject);
    procedure rgOrderTypeClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure AutoFitWidth(DBGridName:TDBGridEh);
    procedure DoFilte; //过滤数据
    function Pick_Cust_ID(Value: variant; AdoConn: TAdoconnection; PickType: byte; Rkey73:String): variant; //选择客户
    function Pick_WareHouse_ID(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择客户
    function Pick_Sales_Man(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择业务员
  public
    { Public declarations }
  end;

var
  frmMain_250: TfrmMain_250;

implementation
uses constVar, common, MyClass;
{$R *.dfm}

procedure TfrmMain_250.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain_250.FormShow(Sender: TObject);
begin
  MyDataClass := TMyDataClass.Create(ADOConnection1);
end;

procedure TfrmMain_250.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

procedure TfrmMain_250.FormCreate(Sender: TObject);
begin
 if not App_Init_2(ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！', '提示', 1);
    application.Terminate;
  end;
  self.Caption := Application.Title;
{  
   rkey73:='72';
   user_ptr:='3';
   vprev:='3';
}
  dtpFrom.Date := date;
  dtpTo.Date := date;
end;

procedure TfrmMain_250.SpeedButton1Click(Sender: TObject);
begin
  edtProdtype.Text := Pick_Prod_Type(edtProdtype.Text, ADOConnection1, 2);
end;

procedure TfrmMain_250.SpeedButton4Click(Sender: TObject);
begin
  edtCustId.Text := Pick_Cust_ID(edtCustId.Text, ADOConnection1, 2 , Rkey73);
end;

procedure TfrmMain_250.SpeedButton5Click(Sender: TObject);
begin
  edtSales.Text := Pick_Sales_Man(edtSales.Text, ADOConnection1, 2);
end;

procedure TfrmMain_250.spBtnQueryClick(Sender: TObject);
var
  spName: string;
  Params: array[0..10] of variant;
  Direction: array[0..10] of TParameterDirection;
begin
  self.edtSelfCode.SetFocus;
  adsMaster.close;
  adsMaster.Parameters.Clear;
  if rgSalesType.ItemIndex = 0 then     //出货
    begin
      if ((vprev = '2') or (vprev = '4')) then   //如果有可写权限则可以查全部客户
         spName := 'EP250;8'
      else
         spName := 'EP250;6';
    end
  else         //退货
    begin
      if ((vprev = '2') or (vprev = '4')) then   //如果有可写权限则可以查全部客户
        spName := 'EP250;9'
      else
        spName := 'EP250;7';
    end;
  Params[0] := 0;
{//  Params[1] := 0;
1 @vtp int,          订单类型
2@vprod varchar(10),  //产品类型
3@vcust varchar(10),  //客户编号
4@vproj varchar(20),  //本厂编号
5@vpart varchar(40),  //客户型号
6@vsales varchar(5),  //销售员
7@vdate1 datetime,
8@vdate2 datetime,
9@rkey73 varchar(10),}       //雇员指针


  Params[1] := rgOrderType.ItemIndex;
  Params[2] := '%' + trim(edtProdtype.Text) + '%';
  Params[3] := '%' + trim(edtCustId.Text) + '%';
  Params[4] := '%' + trim(edtSelfCode.text) + '%';
  Params[5] := '%' + trim(edtCustCode.text) + '%';
  Params[6] := '%' + trim(edtSales.Text) + '%';
  Params[7] := FloatToDatetime(trunc(dtpFrom.Date));
  Params[8] := FloatToDatetime(trunc(dtpTo.Date) + 1);
  Params[9] := rkey73;
  Params[10]:= trim(edtWareHouse.Text);

  Direction[0] := pdReturnValue;
  Direction[1] := pdInput;
  Direction[2] := pdInput;
  Direction[3] := pdInput;
  Direction[4] := pdInput;
  Direction[5] := pdInput;
  Direction[6] := pdInput;
  Direction[7] := pdInput;
  Direction[8] := pdInput;
  Direction[9] := pdInput;
  Direction[10]:= pdInput;

  MyDataClass.ExecProc(adsMaster, spName, Params, Direction, 2);
  adsMaster.Open;
end;

procedure TfrmMain_250.DBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if adsMaster.Active then
  begin
    if Column.Title.SortMarker = smDownEh then
    begin
      adsMaster.Sort := Column.FieldName + ' ASC';
      Column.Title.SortMarker := smUpEh;
    end
    else if Column.Title.SortMarker = smUpEh then
    begin
      adsMaster.Sort := '';
      Column.Title.SortMarker := smNoneEh;
    end
    else if Column.Title.SortMarker = smNoneEh then
    begin
      adsMaster.Sort := Column.FieldName + ' DESC';
      Column.Title.SortMarker := smDownEh;
    end;
  end;
end;

procedure TfrmMain_250.spbtnClearClick(Sender: TObject);
begin
  edtSelfCode.Text := '';
  edtCustCode.Text := '';
  edtProdtype.Text := '';
  edtCustId.Text := '';
  edtSales.Text := '';
  edtWareHouse.Text :='';
end;

procedure TfrmMain_250.edtSelfCodeChange(Sender: TObject);
begin
  DoFilte;
end;

procedure TfrmMain_250.adsMasterAfterOpen(DataSet: TDataSet);
var
  tmp_Qty, tmp_Value, {tmp_Rate,} tmp_TotalCost, tmp_Value1: double;
  stand_soamount,stand_TotalCost:double;
begin
  tmp_value := 0;
  tmp_Qty := 0;
  tmp_TotalCost := 0;
  tmp_Value1 := 0;
  stand_soamount := 0;
  stand_TotalCost := 0;
  try
   DataSet.DisableControls;
   DataSet.First;
   while not DataSet.Eof do
   begin
     tmp_Value1:= tmp_Value1 + DataSet.FieldByName('Amount').asfloat*(1- //实际销售金额*(1-佣金比)
       DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01);

     tmp_TotalCost:= tmp_TotalCost + DataSet.FieldByName('Amount').asfloat*(1- //总成本=实际销售金额*(1-佣金比-毛利率)
       DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01-
       DataSet.FieldByName('rate_margin').asfloat*0.01);

     tmp_value := tmp_value + DataSet.FieldByName('Amount').asfloat; //实际销售金额
     tmp_Qty := tmp_Qty + DataSet.FieldByName('TotalArea').asfloat;
     if DataSet.FieldByName('stand_rate').AsCurrency<>0 then
      begin
        stand_soamount:=stand_soamount+ DataSet.FieldByName('Amount').asfloat*(1-
           DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01);

        stand_TotalCost:=stand_TotalCost + DataSet.FieldByName('Amount').asfloat*
           (1- DataSet.FieldByName('SALES_DISCOUNT').asfloat*0.01-
                DataSet.FieldByName('stand_rate').asfloat*0.01);
      end;
    DataSet.Next;
   end;

   edtProdQty.Text := FloatToStr(ExRoundTo(tmp_Qty,2));     //销售面积
   edtProdValue.Text := FloatToStr(ExRoundTo(tmp_Value,2));  //实际销售金额

   if tmp_value <> 0 then                  //加权毛利率
     edtRate.Text:= FloatToStr(ExRoundTo(100*(tmp_Value1-tmp_TotalCost)/tmp_value,2))
   else
     edtRate.Text := '0.00';

   if stand_soamount <> 0 then                  //加权标准成本毛利率
     Edit1.Text:= FloatToStr(ExRoundTo(100*(stand_soamount-stand_TotalCost)/stand_soamount,2))
   else
     Edit1.Text := '0.00';

   AutoFitWidth(DBGrid1);
  finally
   DataSet.First;
   Dataset.EnableControls;
  end;
end;

procedure TfrmMain_250.spBtnExportClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGrid1, '订单价格分析');
end;

procedure TfrmMain_250.adsMasterMARKUP_RATEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    text := Format('%8.2f', [sender.AsFloat]) + '%';
end;

procedure TfrmMain_250.DoFilte;
var
  sSelfCode, sCustCode, sProdCode, sCustId, sSales, sFilter: string;
begin
  if not adsMaster.Active then exit;
  adsMaster.Filtered := false;
  sSelfCode := trim(edtSelfCode.Text);
  sCustCode := trim(edtCustCode.Text);
  sProdCode := trim(edtProdType.Text);
  sCustId   := trim(edtCustId.Text);
  sSales    := trim(edtSales.Text);
  if (sSelfCode = '') and (sCustCode = '') and (sProdCode = '') and (sCustId = '') and (sSales = '') then
    begin
      AutoFitWidth(DBGrid1);
      exit;
    end
  else
  begin
    if sSelfCode <> '' then
      sFilter := 'MANU_PART_NUMBER like ''*' + sSelfCode + '*''';

    if sCustCode <> '' then
      if sFilter <> '' then
        sFilter := sFilter + ' and MANU_PART_DESC like ''*' + sCustCode + '*'''
      else
        sFilter := ' MANU_PART_DESC like ''*' + sCustCode + '*''';

    if sProdCode <> '' then
      if sFilter <> '' then
        sFilter := sFilter + ' and PROD_CODE like ''*' +  sProdCode + '*'''
      else
        sFilter := sFilter + ' PROD_CODE like ''*' +  sProdCode + '*''';

    if sCustId   <> '' then
      if sFilter <> '' then
        sFilter := sFilter + ' and CUST_CODE like ''*' +  sCustId +'*'''
      else
        sFilter := sFilter + ' CUST_CODE like ''*' +  sCustId +'*''';

    if sSales   <> '' then
      if sFilter <> '' then
        sFilter := sFilter + ' and REP_CODE like ''*' +  sSales +'*'''
      else
        sFilter := sFilter + ' REP_CODE like ''*' +  sSales +'*''';

    if sFilter   <> '' then
    begin
      adsMaster.Filter := sFilter;
      adsMaster.Filtered := true;
    end;
  end;
  adsMasterAfterOpen(adsMaster);
end;

procedure TfrmMain_250.spBtnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain_250.rgSalesTypeClick(Sender: TObject);
begin
  adsMaster.Close;
  if rgSalesType.ItemIndex = 0 then
  begin
    Dbgrid1.Columns[11].Title.caption := '出货日期';
    Dbgrid1.Columns[12].Title.caption := '出货数量';
    Dbgrid1.Columns[13].Title.caption := '出货面积';
    Dbgrid1.Columns[14].Title.caption := '出货金额(本币不含税)';
  end
  else
  begin
    Dbgrid1.Columns[11].Title.caption := '退货日期';
    Dbgrid1.Columns[12].Title.caption := '退货数量';
    Dbgrid1.Columns[13].Title.caption := '退货面积';
    Dbgrid1.Columns[14].Title.caption := '退货金额(本币不含税)';
  end;
end;

procedure TfrmMain_250.rgOrderTypeClick(Sender: TObject);
begin
  adsMaster.Close;
end;

procedure TfrmMain_250.AutoFitWidth(DBGridName: TDBGridEh);
var
  col,maxWidth,FieldWidth:integer;
begin
  DBGridName.DataSource.Dataset.DisableControls;
  for col:=0 to DBGridName.Columns.Count-1 do
  begin
    DBGridName.DataSource.Dataset.First;
    maxWidth:=DBGridName.Canvas.TextWidth(trim(DBGridName.Columns[col].Title.Caption));
    while not DBGridName.DataSource.Dataset.Eof do
    begin
      FieldWidth:= DBGridName.Canvas.TextWidth(trim(DBGridName.DataSource.Dataset.fieldbyname(DBGridName.Columns[col].FieldName).AsString));

      if maxWidth<FieldWidth then
       maxWidth:=FieldWidth
      else
      DBGridName.DataSource.Dataset.Next;
    end;
      DBGridName.Columns[col].Width:=maxWidth+10;
  end;
  DBGridName.DataSource.Dataset.First;
  DBGridName.DataSource.Dataset.EnableControls;
end;

function TfrmMain_250.Pick_Cust_ID(Value: variant; AdoConn: TAdoconnection;
  PickType: byte; Rkey73: String): variant;
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Cust_Code/客户编号,Customer_name/客户名称';
  if ((vprev = '2') or (vprev = '4')) then   //如果有可写权限则可以查全部客户
    FDlgInput.Sqlstr := 'SELECT     TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                        'FROM         dbo.Data0010 '+
                        'ORDER BY dbo.Data0010.CUST_CODE'
  else
    FDlgInput.Sqlstr := 'SELECT     TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                        'FROM         dbo.Data0010 INNER JOIN  '+
                        'dbo.DATA0100 ON dbo.Data0010.RKEY = dbo.DATA0100.CUSTOMER_PTR '+
                        'WHERE     (dbo.DATA0100.CSI_PTR = '+ rkey73 + ') '+
                        'ORDER BY dbo.Data0010.CUST_CODE';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Cust_Code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取到记录
end;

function TfrmMain_250.Pick_WareHouse_ID(Value: variant;
  AdoConn: TAdoconnection; PickType: byte): variant;
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'WAREHOUSE_CODE/工厂代码,WAREHOUSE_NAME/工厂名称,ABBR_NAME/工厂简称';
  FDlgInput.Sqlstr := 'SELECT     WAREHOUSE_CODE, WAREHOUSE_NAME, ABBR_NAME '+
                      'FROM         Data0015 '+
                      'ORDER BY WAREHOUSE_CODE';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'WAREHOUSE_CODE';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取到记录
end;

procedure TfrmMain_250.SpeedButton2Click(Sender: TObject);
begin
  edtWareHouse.Text := Pick_WareHouse_ID(edtWareHouse.Text, ADOConnection1, 2);
end;

procedure TfrmMain_250.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(adsMaster.ProcedureName);
end;

function TfrmMain_250.Pick_Sales_Man(Value: variant;
  AdoConn: TAdoconnection; PickType: byte): variant;
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'EMPL_CODE/销售代表编号,EMPLOYEE_NAME/销售代表名称';
  FDlgInput.Sqlstr := 'select rKey,EMPL_CODE,EMPLOYEE_NAME from Data0005 order by EMPL_CODE';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'EMPL_CODE';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取到记录
end;

end.

