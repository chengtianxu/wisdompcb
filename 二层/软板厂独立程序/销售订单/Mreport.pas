unit Mreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppPrnabl, ppCache, ppStrtch, ppSubRpt, ppVar,
  ppModule, raCodMod, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, ppMemo,
  Menus;

type
  TForm_Mreport = class(TForm)
    ADO12: TADOQuery;
    DataSource1: TDataSource;
    ADO12CUST_CODE: TStringField;
    ADO12CUSTOMER_NAME: TStringField;
    ADO12SHIP_TO_ADDRESS_1: TStringField;
    ADO12SHIP_TO_CONTACT: TStringField;
    ADO12SHIP_TO_PHONE: TStringField;
    ADO12SHIP_TO_FAX: TStringField;
    ADO12ZIP: TStringField;
    ADO12SHIP_TO_ADDRESS_3: TStringField;
    ADO12SHP_ADDR2_FOR_FORM: TStringField;
    ADO12SHP_ADDR3_FOR_FORM: TStringField;
    ADO12EMAIL_FOR_CONTACT: TStringField;
    ADO12SHIP_TO_ADDRESS_2: TStringField;
    DataSource2: TDataSource;
    ADO60: TADOQuery;
    DataSource3: TDataSource;
    ADO60SALES_ORDER: TStringField;
    ADO60ANALYSIS_CODE_1: TStringField;
    ADO60ANALYSIS_CODE_2: TStringField;
    ADO60PARTS_ORDERED: TFloatField;
    ADO60set_ordered: TIntegerField;
    ADO60PART_PRICE: TFloatField;
    ADO60set_price: TFloatField;
    ADO60TOTAL_ADD_L_PRICE: TFloatField;
    ADO60EXCH_RATE: TFloatField;
    ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO60FOB: TStringField;
    ADO60REFERENCE_NUMBER: TStringField;
    DataSource4: TDataSource;
    ADO97: TADOQuery;
    ADO97PO_NUMBER: TStringField;
    ADO97PO_DATE: TDateTimeField;
    ppDB97: TppDBPipeline;
    ppDB12: TppDBPipeline;
    ppDB60: TppDBPipeline;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    ADO60amount: TFloatField;
    ADO89: TADOQuery;
    DataSource5: TDataSource;
    ADO89PARAMETER_DESC: TStringField;
    ADO89tvalue: TStringField;
    ppDB89: TppDBPipeline;
    ADO50: TADOQuery;
    ADO50RKEY: TIntegerField;
    ADO50CAN_SHU: TWideStringField;
    DBGrid1: TDBGrid;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADO60CUST_PART_PTR: TIntegerField;
    ADO60MANU_PART_NUMBER: TStringField;
    ADO60MANU_PART_DESC: TStringField;
    ADO50MANU_PART_NUMBER: TStringField;
    ADO50MANU_PART_DESC: TStringField;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    ppDBText14: TppDBText;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppDBText20: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLine6: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine24: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel18: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape2: TppShape;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine31: TppLine;
    ppDetailBand2: TppDetailBand;
    ppLine27: TppLine;
    ppDBText19: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    function SmallTOBig(small:real):string;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ADO50CalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Mreport: TForm_Mreport;

implementation

uses damo;

{$R *.dfm}

procedure TForm_Mreport.ppReport1PreviewFormCreate(Sender: TObject);
begin
//ppReport1.PreviewForm.WindowState := wsMaximized;
end;

function Tform_Mreport.SmallTOBig(small:real):string;
var
SmallMonth,BigMonth:string;
wei1,qianwei1:string[2];
qianwei,dianweizhi,qian:integer;
begin
{------- 修改参数令值更精确 -------}
{小数点后的位数，需要的话也可以改动该值}
 qianwei:=-2;

{转换成货币形式，需要的话小数点后加多几个零}
 Smallmonth:=formatfloat('0.00',small);
 dianweizhi :=pos('.',Smallmonth);{小数点的位置}
{循环小写货币的每一位，从小写的右边位置到左边}
for qian:=length(Smallmonth) downto 1 do
begin
if qian<>dianweizhi then{如果读到的不是小数点就继续}
begin
case strtoint(copy(Smallmonth,qian,1)) of{位置上的数转换成大写}
 1:wei1:='壹'; 2:wei1:='贰';
 3:wei1:='三'; 4:wei1:='肆';
 5:wei1:='伍'; 6:wei1:='陆';
 7:wei1:='柒'; 8:wei1:='捌';
 9:wei1:='玖'; 0:wei1:='零';
end;
case qianwei of {判断大写位置，可以继续增大到real类型的最大值}
 -3:qianwei1:='厘';
 -2:qianwei1:='分';
 -1:qianwei1:='角';
 0 :qianwei1:='元';
 1 :qianwei1:='拾';
 2 :qianwei1:='佰';
 3 :qianwei1:='千';
 4 :qianwei1:='万';
 5 :qianwei1:='拾';
 6 :qianwei1:='佰';
 7 :qianwei1:='千';
 8 :qianwei1:='亿';
 9 :qianwei1:='十';
 10:qianwei1:='佰';
 11:qianwei1:='千';
end;
 inc(qianwei); //自动加1
 BigMonth :=wei1+qianwei1+BigMonth;{组合成大写金额}
end;
end;
 SmallTOBig:=BigMonth;
end;

procedure TForm_Mreport.ppReport1BeforePrint(Sender: TObject);
var
 v_money:double;
begin
v_money:=0;
ado60.First;
while not ado60.Eof do
 begin
  v_money:=v_money+self.ADO60amount.Value;
  ado60.Next;
 end;
ado60.First;
 pplabel18.Caption:=self.SmallTOBig(v_money);
end;

procedure TForm_Mreport.ADO50CalcFields(DataSet: TDataSet);
begin
ado89.Close;
ado89.Parameters[0].Value:=self.ADO50RKEY.Value;
ado89.Open;
While not ado89.Eof do
 begin
  ado50can_shu.Value:=ado50can_shu.Value+
                      trim(ADO89PARAMETER_DESC.Value)+':'+
                      trim(ADO89tvalue.Value)+'       ';
  ado89.Next;
 end;
end;

procedure TForm_Mreport.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm_Mreport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
self.ADO60.CancelBatch();
self.ADO50.CancelBatch();
end;

procedure TForm_Mreport.Button1Click(Sender: TObject);
begin
ppReport1.Print;
end;

procedure TForm_Mreport.FormActivate(Sender: TObject);
begin
stringgrid1.Cells[0,0]:='订单编号';
stringgrid1.Cells[1,0]:='本厂编号';
stringgrid1.Cells[2,0]:='客户型号';
stringgrid1.Cells[3,0]:='版本';
stringgrid1.Cells[4,0]:='订单数量pcs';
stringgrid1.Cells[5,0]:='客户交期';
end;

procedure TForm_Mreport.N1Click(Sender: TObject);
var
 rkey50:integer;
begin
 rkey50 := ADO60CUST_PART_PTR.Value;
 stringgrid1.Cells[0,stringgrid1.RowCount-1] := self.ADO60SALES_ORDER.Value;
 stringgrid1.Cells[1,stringgrid1.RowCount-1] := self.ADO60MANU_PART_NUMBER.Value;
 stringgrid1.Cells[2,stringgrid1.RowCount-1] := self.ADO60MANU_PART_DESC.Value;
 stringgrid1.Cells[3,stringgrid1.RowCount-1] := '';
 stringgrid1.Cells[4,stringgrid1.RowCount-1] := self.ADO60PARTS_ORDERED.AsString;
 stringgrid1.Cells[5,stringgrid1.RowCount-1] := self.ADO60ORIG_SCHED_SHIP_DATE.AsString;
 stringgrid1.RowCount := stringgrid1.RowCount+1;
 ado60.Delete;

 if ado60.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
   
 if not ado60.Locate('cust_part_ptr',rkey50,[]) then
  begin
   if ADO50.Locate('rkey',rkey50,[]) then
    ado50.Delete;
  end;
  
end;

procedure TForm_Mreport.PopupMenu1Popup(Sender: TObject);
begin
if ado60.IsEmpty then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

procedure TForm_Mreport.DBGrid1DblClick(Sender: TObject);
begin
if not ADO60.IsEmpty then  N1Click(Sender);
end;

end.
