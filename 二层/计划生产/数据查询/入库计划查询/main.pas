unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  ComObj, Excel2000,ClipBrd, Mxstore, MXDB, MXGRID, MXPIVSRC,DateUtils,
  Menus,Mxarrays, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADO360: TADOQuery;
    ADO360SALES_ORDER: TStringField;
    ADO360CUST_CODE: TStringField;
    ADO360unit_sq: TFloatField;
    ADO360PO_NUMBER: TStringField;
    ADO360PARTS_ORDERED: TFloatField;
    ADO360qty_qianhuo: TFloatField;
    ADO360so_tp: TWordField;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ADOQuery1: TADOQuery;
    ADO360so_type: TStringField;
    ADOtotal_360: TADOQuery;
    DecisionGrid1: TDecisionGrid;
    DecisionSource1: TDecisionSource;
    DecisionCube1: TDecisionCube;
    ADOtotal_360sch_date: TDateTimeField;
    ADOtotal_360PRODUCT_NAME: TStringField;
    ADOtotal_360qty: TIntegerField;
    ADOtotal_360qty_mianji: TFloatField;
    DecisionPivot1: TDecisionPivot;
    UpDown1: TUpDown;
    Edit1: TEdit;
    UpDown2: TUpDown;
    ADO360RKEY: TIntegerField;
    SGrid1: TStringGrid;
    Edit2: TEdit;
    DataSource1: TDataSource;
    ADO360_sch: TADOQuery;
    ADO360_schquantity: TIntegerField;
    ADO360_schmianji: TFloatField;
    ADO360_schsch_date: TDateTimeField;
    RadioGroup1: TRadioGroup;
    Edit3: TEdit;
    ComboBox2: TComboBox;
    Edit4: TEdit;
    UpDown3: TUpDown;
    Edit5: TEdit;
    UpDown4: TUpDown;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ADO360PROD_CODE: TStringField;
    ADO360MANU_PART_NUMBER: TStringField;
    ADO360MANU_PART_DESC: TStringField;
    ComboBox3: TComboBox;
    Label7: TLabel;
    ComboBox4: TComboBox;
    Label8: TLabel;
    ADO360REFERENCE_NUMBER: TStringField;
    ADO360ENT_DATE: TDateTimeField;
    ADO360SCH_DATE: TDateTimeField;
    ADO360order_sq: TFloatField;
    ADO360ISSUED_QTY: TIntegerField;
    AQCOUNT25: TADOQuery;
    AQCOUNT25sch_date: TDateTimeField;
    AQCOUNT25number: TIntegerField;
    TabSheet3: TTabSheet;
    Chart1: TChart;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    UpDown5: TUpDown;
    Edit6: TEdit;
    Series1: TBarSeries;
    SavePictureDialog1: TSavePictureDialog;
    PrintDialog1: TPrintDialog;
    CheckBox0: TCheckBox;
    SpeedButton5: TSpeedButton;
    cbBackorder: TCheckBox;
    ADO360ORIG_SCHED_SHIP_DATE: TDateTimeField;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ADO360CalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ADOConnection1CommitTransComplete(Connection: TADOConnection; const Error: Error; var EventStatus: TEventStatus);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DecisionGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);

  private
    { Private declarations }
   sSQL:string;
   day:integer;
   sys_sortdate: tdatetime;
   file_name: string;
   function DaysInMonth(MyYear,MyMonth : Word):Integer;
   function Str360(rkey60:string):string;
   procedure SaveOpLog(Rkey60,FromStr,ToStr:string);
  public
    { Public declarations }
    whouse_ptr:array[1..100] of integer; //记录工厂指针
  end;

var
  Form1: TForm1;
  function GetAvailableMem: Integer;
  
implementation
uses schmodify,viewlog,common;
{$R *.dfm}

function TForm1.DaysInMonth(MyYear,MyMonth : Word):Integer;
var MyDayTable : TDayTable;
begin
 MyDayTable := MonthDays[IsLeapYear(MyYear)];
 Result := MyDayTable[MyMonth];
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j:integer;
    dtpk1,dtpk2:string;
    total_amount:array of double;
    dSum:Double;
    sValues:string;
begin
 if self.UpDown3.Position>self.UpDown4.Position  then
 showmessage('查询日期范围错误，请重新设置日期范围')
 else begin
  Screen.Cursor := crHourglass;
  self.ADO360.Close;
  self.AQCOUNT25.Close;
  if combobox4.ItemIndex<>0 then  //工厂条件
  begin
    ado360.SQL.Delete(ado360.SQL.Count-5);
    ado360.SQL.Insert(ado360.SQL.Count-4,'and data0060.ship_reg_tax_id='+inttostr(whouse_ptr[combobox4.itemindex]));

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-8);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-7,'and data0060.ship_reg_tax_id='+inttostr(whouse_ptr[combobox4.itemindex]));

  end
  else begin
    ado360.SQL.Delete(ado360.SQL.Count-5);
    ado360.SQL.Insert(ado360.SQL.Count-4,'');

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-8);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-7,'');
  end;

  if combobox3.ItemIndex<>combobox3.Items.Count-1 then   //如果查询产品类型不是全部
  begin
    ado360.SQL.Delete(ado360.SQL.Count-4);
    ado360.SQL.Insert(ado360.SQL.Count-3,'and data0025.ttype='+inttostr(combobox3.ItemIndex));
    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-7);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-6,'and data0025.ttype='+inttostr(combobox3.ItemIndex));
  end
  else begin
    ado360.SQL.Delete(ado360.SQL.Count-4);
    ado360.SQL.Insert(ado360.SQL.Count-3,'');
    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-7);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-6,'');
  end;

  if combobox1.ItemIndex<>combobox1.Items.Count-1 then   //如果查询订单类型不是全部
  begin
    ado360.SQL.Delete(ado360.SQL.Count-3);
    ado360.SQL.Insert(ado360.SQL.Count-2,'and data0060.so_tp='+inttostr(combobox1.ItemIndex));
    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-6);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-5,'and data0060.so_tp='+inttostr(combobox1.ItemIndex));
  end
  else begin
    ado360.SQL.Delete(ado360.SQL.Count-3);
    ado360.SQL.Insert(ado360.SQL.Count-2,'');
    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-6);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-5,'');
  end;

  if trim(edit3.Text)<>'' then    //输入了查询条件
   case combobox2.ItemIndex of
   0:    //按订单编号
   begin
    ado360.SQL.Delete(ado360.SQL.Count-2);
    ado360.SQL.Insert(ado360.SQL.Count-1,'and data0060.SALES_ORDER like ''%'+trim(edit3.Text)+'%''');
    ado360.SQL.Delete(ado360.SQL.Count-1);
    ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0060.SALES_ORDER');

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-5);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-4,'and data0060.SALES_ORDER like ''%'+trim(edit3.Text)+'%''');

   end;
   1:   //按客户代码
   begin
    ado360.SQL.Delete(ado360.SQL.Count-2);
    ado360.SQL.Insert(ado360.SQL.Count-1,'and Data0010.CUST_CODE like ''%'+trim(edit3.Text)+'%''');
    ado360.SQL.Delete(ado360.SQL.Count-1);
    ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0010.CUST_CODE');

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-5);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-4,'and Data0010.CUST_CODE like ''%'+trim(edit3.Text)+'%''');

   end;
   2:   //按本厂编号
   begin
    ado360.SQL.Delete(ado360.SQL.Count-2);
    ado360.SQL.Insert(ado360.SQL.Count-1,'and Data0025.MANU_PART_NUMBER like ''%'+trim(edit3.Text)+'%''');
    ado360.SQL.Delete(ado360.SQL.Count-1);
    ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0025.MANU_PART_NUMBER');

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-5);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-4,'and Data0025.MANU_PART_NUMBER like ''%'+trim(edit3.Text)+'%''');

   end;
   3:  //按客户型号
   begin
    ado360.SQL.Delete(ado360.SQL.Count-2);
    ado360.SQL.Insert(ado360.SQL.Count-1,'and Data0025.MANU_PART_DESC like ''%'+trim(edit3.Text)+'%''');
    ado360.SQL.Delete(ado360.SQL.Count-1);
    ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0025.MANU_PART_DESC');

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-5);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-4,'and Data0025.MANU_PART_DESC like ''%'+trim(edit3.Text)+'%''');

   end;
   4:  //按客户订单号
   begin
    ado360.SQL.Delete(ado360.SQL.Count-2);
    ado360.SQL.Insert(ado360.SQL.Count-1,'and Data0097.PO_NUMBER like ''%'+trim(edit3.Text)+'%''');
    ado360.SQL.Delete(ado360.SQL.Count-1);
    ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0097.PO_NUMBER');

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-5);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-4,'and Data0097.PO_NUMBER like ''%'+trim(edit3.Text)+'%''');

   end;
   end  //end case
  else begin   //没有输入查询条件
    ado360.SQL.Delete(ado360.SQL.Count-2);
    ado360.SQL.Insert(ado360.SQL.Count-1,'');

    AQCOUNT25.SQL.Delete(AQCOUNT25.SQL.Count-5);
    AQCOUNT25.SQL.Insert(AQCOUNT25.SQL.Count-4,'');

    case combobox2.ItemIndex of
     0:
     begin
      ado360.SQL.Delete(ado360.SQL.Count-1);
      ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0060.SALES_ORDER');
     end;
     1:
     begin
      ado360.SQL.Delete(ado360.SQL.Count-1);
      ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0010.CUST_CODE');
     end;
     2:
     begin
      ado360.SQL.Delete(ado360.SQL.Count-1);
      ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0025.MANU_PART_NUMBER');
     end;
     3:
     begin
      ado360.SQL.Delete(ado360.SQL.Count-1);
      ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0025.MANU_PART_DESC');
     end;
     4:
     begin
      ado360.SQL.Delete(ado360.SQL.Count-1);
      ado360.SQL.Insert(ado360.SQL.Count,'ORDER BY Data0097.PO_NUMBER');
     end;
    end;//end case
  end;
//20160507tang添甩期字段显示----暂时不显示20160509
  if (cbBackorder.Checked=True) and (radiogroup1.ItemIndex=0) then
    SGrid1.ColWidths[16]:=65
  else
    SGrid1.ColWidths[16]:=-1;

  dtpk1:=inttostr(updown2.Position)+'-'+edit1.Text+'-'+edit4.Text;
  dtpk2:=inttostr(updown2.Position)+'-'+edit1.Text+'-'+edit5.Text;
  ado360.Parameters[0].Value:=dtpk1;
  ado360.Parameters[1].Value:=dtpk2;

  AQCOUNT25.Parameters[0].Value:=dtpk1;
  AQCOUNT25.Parameters[1].Value:=dtpk2;
  AQCOUNT25.Parameters[2].Value:=dtpk1;
  AQCOUNT25.Parameters[3].Value:=dtpk2;

  self.AQCOUNT25.Open;
  self.ADO360.Open;
  ado360_sch.Close;
  ADO360_sch.SQL.Text:=sSQL;
  ado360_sch.SQL.Delete(ado360_sch.SQL.Count-1);
  ado360_sch.SQL.Add('and (data0360.sch_date>='''+dtpk1+''') and (data0360.sch_date<='''+dtpk2+''') order by sch_date desc');
  ADO360_sch.Open;

  sgrid1.ColCount:=18+updown4.Position-updown3.Position;//DaysInMonth(updown2.Position,updown1.Position);
  sgrid1.FixedCols:=6;
  setlength(total_amount,(updown4.Position-updown3.Position+3));

  for i:=updown3.Position to updown4.Position do {DaysInMonth(updown2.Position,updown1.Position)}
      sgrid1.Cells[17+i-updown3.Position,0]:= inttostr(i)+'号';

  sgrid1.RowCount := ado360.RecordCount+3;

  if trim(sgrid1.Rows[sgrid1.RowCount-2].Text)<>''
   then sgrid1.Rows[sgrid1.RowCount-2].Text:='';

  if trim(sgrid1.Rows[sgrid1.RowCount-1].Text)<>''
   then sgrid1.Rows[sgrid1.RowCount-1].Text:='';

  sgrid1.Cells[14,sgrid1.RowCount-2]:='合计：';
  sgrid1.Cells[15,sgrid1.RowCount-1]:='款数：';

  for i:=1 to ado360.RecordCount do
  begin
    if trim(sgrid1.Rows[i].Text)<>'' then sgrid1.Rows[i].Text:='';
    sgrid1.Cells[0,i]:=self.ADO360SALES_ORDER.Value;
    sgrid1.Cells[1,i]:=self.ADO360so_type.Value;
    sgrid1.Cells[2,i]:=self.ADO360CUST_CODE.Value;
    sgrid1.Cells[3,i]:=self.ADO360MANU_PART_NUMBER.Value;
    sgrid1.Cells[4,i]:=self.ADO360REFERENCE_NUMBER.Value;
    sgrid1.Cells[5,i]:=self.ADO360PROD_CODE.Value;
    sgrid1.Cells[6,i]:=self.ADO360MANU_PART_DESC.Value;
    sgrid1.Cells[7,i]:=self.ADO360unit_sq.AsString;
    sgrid1.Cells[8,i]:=self.ADO360PO_NUMBER.Value;
    sgrid1.Cells[9,i]:=self.ADO360ENT_DATE.AsString;
    sgrid1.Cells[10,i]:=self.ADO360SCH_DATE.AsString;
    sgrid1.Cells[11,i]:=self.ADO360ORIG_SCHED_SHIP_DATE.AsString;
    sgrid1.Cells[12,i]:=self.ADO360PARTS_ORDERED.AsString;
    sgrid1.Cells[13,i]:=self.ADO360ISSUED_QTY.AsString;
    sgrid1.Cells[14,i]:=self.ADO360order_sq.AsString;
    sgrid1.Cells[15,i]:=self.ADO360qty_qianhuo.AsString;
//    SGrid1.Cells[15,i]:=FloatToStr(ADO360PARTS_ORDERED.Value-ADO360_sch2.FieldBYName('quantity').Value-(ADO360PARTS_ORDERED.Value-ADO360qty_qianhuo.Value));
//    total_amount[1]:=total_amount[1]+ADO360_sch2.FieldBYName('quantity').Value;//甩期数量


    total_amount[0]:=total_amount[0]+ADO360qty_qianhuo.Value;//欠货数量
    dSum:=0;
    ado360_sch.First;
    while not ado360_sch.Eof do
    begin
     if (monthof(ado360_schsch_date.value) = UpDown1.Position) and
         (yearof(ado360_schsch_date.value) = updown2.Position) then
      if radiogroup1.ItemIndex=0  then   //显示数量
      begin
        if (cbBackorder.Checked=False) then
        begin
          sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=ADO360_schquantity.AsString;
          total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]:=
            total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]+ADO360_schquantity.Value;
    //2013-08-01修改入库计划安排添加欠货数量显示--------------------------------
        end else if (cbBackorder.Checked=True) then
        begin            //显示欠货数量
          if (ADO360_schquantity.AsString='') then ADO360_schquantity.AsString:='0';
          dSum:=dSum+ADO360_schquantity.Value;
          if (ado360_sch.RecordCount=1) then
          begin  //只有一条记录
            sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=ADO360qty_qianhuo.AsString
          end else if (dSum=ADO360qty_qianhuo.Value) then
          begin
            sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=ADO360_schquantity.AsString
          end else if (dSum<ADO360qty_qianhuo.Value) then
          begin
            sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=ADO360_schquantity.AsString
          end else if (dSum>ADO360qty_qianhuo.Value) then
          begin
            if ((dsum-ADO360qty_qianhuo.Value)<ADO360_schquantity.Value) then
              sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=FloatToStr(ADO360qty_qianhuo.Value-(dSum-ADO360_schquantity.Value))
            else if ((dsum-ADO360qty_qianhuo.Value)>ADO360_schquantity.Value) then
              sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:='';
          end;
          sValues:=sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i];
          if (sValues='') then sValues:='0';
          total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]:=
            total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]+StrToFloat(sValues);
        end;
    //-End-2013-08-01-----------------------------------------------------------
      end else if radiogroup1.ItemIndex=1  then
      begin            //显示面积
        if (cbBackorder.Checked=False) then
        begin
          sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=self.ADO360_schmianji.AsString;
          total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]:=
            total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]+ADO360_schmianji.Value;
        end else
    //2013-08-01修改入库计划安排添加欠货数量显示--------------------------------
        if (cbBackorder.Checked=True) then
        begin
          if (ADO360_schquantity.AsString='') then ADO360_schquantity.AsString:='0';
          dSum:=dSum+ADO360_schquantity.Value;
          if (ado360_sch.RecordCount=1) then
          begin  //只有一条记录
             sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=FormatFloat('0.000',ADO360qty_qianhuo.Value*self.ADO360unit_sq.Value);
          end else if (dSum=ADO360qty_qianhuo.Value) then
          begin
             sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=FormatFloat('0.000',ADO360_schquantity.Value*self.ADO360unit_sq.Value);
          end else if (dSum<ADO360qty_qianhuo.Value) then
          begin
             sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=FormatFloat('0.000',ADO360_schquantity.Value*self.ADO360unit_sq.Value);
          end else if (dSum>ADO360qty_qianhuo.Value) then
          begin
            if ((dsum-ADO360qty_qianhuo.Value)<ADO360_schquantity.Value) then
               sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:=FormatFloat('0.000',(ADO360qty_qianhuo.Value-(dSum-ADO360_schquantity.Value))*self.ADO360unit_sq.Value)
            else if ((dsum-ADO360qty_qianhuo.Value)>ADO360_schquantity.Value) then
               sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i]:='';
          end;
          sValues:=sgrid1.Cells[17+DayOf(ADO360_schsch_date.Value)-updown3.Position,i];
          if (sValues='') then sValues:='0';

          total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]:=
            total_amount[DayOf(ADO360_schsch_date.Value)-updown3.Position+2]+StrToFloat(sValues);
        end;
    //-End-2013-08-01-----------------------------------------------------------
      end;
     self.ADO360_sch.Next;
    end;
   ado360.next;
  end;
  Chart1.Title.Text.Clear;
  if RadioGroup1.ItemIndex = 0 then
      Chart1.Title.Text.Add('数量')
  else
      Chart1.Title.Text.Add('面积');

  Series1.Clear;
  j := updown3.Position;
  for i:= low(total_amount) to high(total_amount) do
  begin
        sgrid1.Cells[15+i,sgrid1.RowCount-2]:= floattostr(total_amount[i]);
        if j <= StrToInt(Trim(Edit5.Text)) then
        Series1.Add(total_amount[i+1],IntToStr(j)+'日');
        Inc(j);
  end;
  self.AQCOUNT25.First;
  while not self.AQCOUNT25.Eof do
   begin
    sgrid1.Cells[16+dayof(self.AQCOUNT25sch_date.Value)-updown3.Position+1,
    sgrid1.RowCount-1]:=self.AQCOUNT25number.AsString;
    self.AQCOUNT25.Next;
   end;
//20160509tang甩期数量----------------
   if (cbBackorder.Checked=True) and (radiogroup1.ItemIndex=0) then
   for i :=1  to SGrid1.RowCount-2 do
   begin
     dsum:=0;
     for j :=17  to SGrid1.ColCount-1 do
     begin
       sValues:=sgrid1.Cells[j,i];
       if (sValues='') then sValues:='0';
       dsum:=dsum+StrToFloat(sValues);
     end;
     SGrid1.Cells[16,i]:=FloatToStr(StrToFloat(sgrid1.Cells[15,i])-dsum);
   end;
//end 20160509----------------
  ADO360.Close;
  ADO360_sch.Close;
  self.AQCOUNT25.Close;

  try
   self.ADOtotal_360.Close;
   if combobox4.ItemIndex<>0 then
   begin
    ADOtotal_360.SQL.Delete(ADOtotal_360.SQL.Count-5);
    ADOtotal_360.SQL.Insert(ADOtotal_360.SQL.Count-4,'and data0060.ship_reg_tax_id='+inttostr(whouse_ptr[combobox4.itemindex]));
   end
   else begin
    ADOtotal_360.SQL.Delete(ADOtotal_360.SQL.Count-5);
    ADOtotal_360.SQL.Insert(ADOtotal_360.SQL.Count-4,'');
   end;

   if combobox3.ItemIndex<>combobox3.Items.Count-1 then
   begin
    ADOtotal_360.SQL.Delete(ADOtotal_360.SQL.Count-4);
    ADOtotal_360.SQL.Insert(ADOtotal_360.SQL.Count-3,'and data0025.ttype='+inttostr(combobox3.ItemIndex));
   end
   else begin
    ADOtotal_360.SQL.Delete(ADOtotal_360.SQL.Count-4);
    ADOtotal_360.SQL.Insert(ADOtotal_360.SQL.Count-3,'');
   end;
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   begin
    ADOtotal_360.SQL.Delete(ADOtotal_360.SQL.Count-3);
    ADOtotal_360.SQL.Insert(ADOtotal_360.SQL.Count-2,'and data0060.so_tp='+inttostr(combobox1.ItemIndex));
   end
   else begin
    ADOtotal_360.SQL.Delete(ADOtotal_360.SQL.Count-3);
    ADOtotal_360.SQL.Insert(ADOtotal_360.SQL.Count-2,'');
   end;
   ADOtotal_360.Parameters[0].Value:=dtpk1;
   ADOtotal_360.Parameters[1].Value:=dtpk2;
   self.ADOtotal_360.Open;
  except   //当统计数据为空时出错所以使用了except
  end;
  Screen.Cursor := crDefault;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
var i:byte;
begin
 if adoconnection1.Connected then
 begin
  self.file_name:='SALES_ORDER';
  with adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select year(getdate()) as sys_year,month(getdate()) as sys_month,');
   sql.Add('day(getdate()) as sys_day,getdate() as sys_date');
   open;
   self.sys_sortdate:=strtodate(datetostr(fieldvalues['sys_date']));
   updown2.Position:=fieldvalues['sys_year'];
   updown1.Position:= fieldvalues['sys_month'];
   updown3.Position:= fieldvalues['sys_day'];
   day:=fieldvalues['sys_day'];
  end;

  form1.updown4.Position:=DaysInMonth(updown2.Position,updown1.Position);
  sgrid1.Cells[0,0]:='订单编号';
  sgrid1.Cells[1,0]:='订单类型';
  sgrid1.Cells[2,0]:='客户代码';
  sgrid1.Cells[3,0]:='本厂编号';
  sgrid1.Cells[4,0]:='订单参考';
  sgrid1.Cells[5,0]:='产品类型';
  sgrid1.Cells[6,0]:='客户型号';
  sgrid1.Cells[7,0]:='单PCS面积';
  sgrid1.Cells[8,0]:='客户订单号';

  sgrid1.Cells[9,0]:='下单日期';
  sgrid1.Cells[10,0]:='回复交期';
  sgrid1.Cells[11,0]:='计划交期';

  sgrid1.Cells[12,0]:='订单数量';
  sgrid1.Cells[13,0]:='投产数量';

  sgrid1.Cells[14,0]:='订单面积';
  sgrid1.Cells[15,0]:='欠货数量';
  sgrid1.Cells[16,0]:='甩期数量';

  i:=1;
  with adoquery1 do  //加载数据库中所有工厂到combobox4
  begin
    combobox4.Items.Clear;
    combobox4.Items.Add('All-所有工厂');
    combobox4.ItemIndex:=0;
    close;
    sql.text:='select rkey,warehouse_code,abbr_name from data0015 order by rkey';
    open;
    first;
    while not Eof do
    begin
      combobox4.Items.Add(fieldvalues['warehouse_code']+'-'+fieldvalues['abbr_name']);
      whouse_ptr[i]:=fieldvalues['rkey'];
      i:=i+1;
      Next;
    end;
    close;
  end;
  Self.PageControl1.ActivePageIndex := 0;
 end;
 sSQL:=ado360_sch.SQL.Text;
end;

procedure TForm1.ADO360CalcFields(DataSet: TDataSet);
begin
  case self.ADO360so_tp.Value of
   0:self.ADO360so_type.Value:='自制';
   1:self.ADO360so_type.Value:='外发';
   2:self.ADO360so_type.Value:='半制程';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var col,row: Integer;
    ExcelApp: Variant;
    Sheet: Variant;
begin
  if pagecontrol1.ActivePageIndex=0 then
  begin
    if sgrid1.RowCount=2 then exit;
    Screen.Cursor := crHourglass;
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := tabsheet1.Caption;
     Sheet := ExcelApp.Workbooks[1].WorkSheets[tabsheet1.Caption];
    for col := 0 to sgrid1.ColCount-1 do
    Sheet.Cells[1, col + 1 ] := sgrid1.Cells[col,0];

    for row := 1 to sgrid1.RowCount-1 do
     for col := 0 to sgrid1.ColCount-1 do
     Sheet.Cells[row + 1, col + 1] := sgrid1.Cells[col,row];
   ExcelApp.Visible := true;
   Screen.Cursor := crDefault;
  end
  else begin
   if not adototal_360.Active then exit;
   Screen.Cursor := crHourglass;
   ExcelApp := CreateOleObject('Excel.Application');
   ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
   ExcelApp.WorkBooks[1].WorkSheets[1].Name := pagecontrol1.ActivePage.Caption;
   Sheet := ExcelApp.Workbooks[1].WorkSheets[pagecontrol1.ActivePage.Caption];

   for col := 0 to decisiongrid1.ColCount-2 do
     Sheet.Cells[1, col + 1 ] := decisiongrid1.Cells[col-1,-1];

    for row := 1 to decisiongrid1.RowCount-3 do
     for col := 0 to decisiongrid1.ColCount-2 do
      Sheet.Cells[row + 1, col + 1] := decisiongrid1.Cells[col-1,row];

   ExcelApp.Visible := true;
   Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.SGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssAlt in shift) and  (chr(key)='S') then
    showmessage(ado360.SQL.Text);
  if (ssAlt in shift) and  (chr(key)='V') then
    showmessage(ado360_sch.SQL.Text);
end;


procedure TForm1.Edit2Change(Sender: TObject);
begin
if (self.UpDown2.Position=2) then
 if IsLeapYear(self.UpDown2.Position) then
  begin
   if self.UpDown3.Position>29 then self.UpDown3.Position:=29;
   if self.UpDown4.Position>29 then self.UpDown4.Position:=29;
   self.UpDown3.Max:=29;
   self.UpDown4.Max:=29;
  end
 else begin
   if self.UpDown3.Position>28 then self.UpDown3.Position:=28;
   if self.UpDown4.Position>28 then self.UpDown4.Position:=28;
   self.UpDown3.Max:=28;
   self.UpDown4.Max:=28;
 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var days:integer;
begin
  days:=daysinmonth(self.UpDown2.Position,self.UpDown1.Position);
  if self.UpDown3.Position>days then  self.UpDown3.Position:=days;
  self.UpDown3.Max:=days;
  self.UpDown4.Max:=days;
  if self.UpDown1.Position<>day then
    self.UpDown3.Position:=1
  else self.UpDown3.Position:=day;
  self.UpDown4.Position:=days;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j:integer;
    total_amount: array of double;
    FromStr,tostr:string;
begin
 if (vprev='2') or (vprev = '4') then
 begin
  if sgrid1.Row<>sgrid1.RowCount-1 then
  begin
   application.CreateForm(TForm4,Form4);
   form4.aq06.Close;
   form4.aq06.Parameters[0].Value:=sgrid1.Cells[0,sgrid1.Row];
   form4.aq06.Open;
   form4.ADO360.Close;
   form4.ADO360.Parameters[0].Value:=form4.aq06RKEY.Value;
   form4.ADO360.Open;
   form4.Edit1.Text:=datetostr(sys_sortdate);
   FromStr:=Str360(form4.aq06RKEY.AsString);   //记录修改前的入库计划
   if form4.ShowModal=mrok then
   begin
    ToStr:=Str360(form4.aq06RKEY.AsString);    //记录修改后的入库计划
    SaveOpLog(form4.aq06RKEY.AsString,FromStr,ToStr);
    for i:=updown3.Position to updown4.Position do
     sgrid1.Cells[15+i-updown3.Position,sgrid1.Row]:= '';
    while not form4.ADO360.Eof do
    begin
     if (monthof(form4.ADO360sch_date.value)=UpDown1.Position) and (yearof(form4.ado360sch_date.value)=updown2.Position) then
     if radiogroup1.ItemIndex=0  then
       sgrid1.Cells[15+DayOf(form4.ADO360sch_date.Value)-updown3.Position,sgrid1.Row]:=
                                                 form4.ADO360quantity.AsString
     else
       sgrid1.Cells[15+DayOf(form4.ADO360sch_date.Value)-updown3.Position,sgrid1.Row]:=
                  formatfloat('0.000',form4.ADO360quantity.Value*form4.aq06unit_sq.Value);
     form4.ADO360.Next;
    end;
    setlength(total_amount,(updown4.Position-updown3.Position+2));

    for i:= 1 to sgrid1.RowCount-3 do
     for j:=14 to sgrid1.ColCount-1 do
      if trim(sgrid1.Cells[j,i])<>'' then
        total_amount[j-14]:=total_amount[j-14]+strtofloat(sgrid1.Cells[j,i]);

    for i:= low(total_amount) to high(total_amount) do
    begin
      sgrid1.Cells[14+i,sgrid1.RowCount-2]:='';
      sgrid1.Cells[14+i,sgrid1.RowCount-2]:=floattostr(total_amount[i]);
    end;

   sgrid1.Rows[sgrid1.RowCount-1].Text:='';
   sgrid1.Cells[14,sgrid1.RowCount-1]:='款数：';

    self.AQCOUNT25.Close;
    self.AQCOUNT25.Open;
    self.AQCOUNT25.First;
    while not self.AQCOUNT25.Eof do
     begin
      sgrid1.Cells[14+dayof(self.AQCOUNT25sch_date.Value)-updown3.Position+1,
      sgrid1.RowCount-1]:=self.AQCOUNT25number.AsString;
      self.AQCOUNT25.Next;
     end;
    self.AQCOUNT25.Close;
   end;
   form4.Free;
  end;
 end
 else showmessage('对不起，您没有权限修改入仓计划!');
end;

procedure TForm1.ADOConnection1CommitTransComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
  showmessage('数据保存成功!');
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 ADOQuery1.Close;
 ADOQuery1.SQL.Clear;
 ADOQuery1.SQL.Add('SELECT Data0318.TRANS_TYPE, Data0318.TRANS_DESCRIPTION,');
 ADOQuery1.SQL.Add('      Data0318.FROM_STRING, Data0318.TO_STRING, Data0318.TRANS_DATE,');
 ADOQuery1.SQL.Add('      Data0073.USER_FULL_NAME');
 ADOQuery1.SQL.Add('FROM Data0318 INNER JOIN');
 ADOQuery1.SQL.Add('      Data0060 ON Data0318.SALES_ORDER_PTR = Data0060.RKEY INNER JOIN');
 ADOQuery1.SQL.Add('      Data0073 ON Data0318.USER_PTR = Data0073.RKEY');
 ADOQuery1.SQL.Add('WHERE (Data0318.TRANS_TYPE = 360)');
 ADOQuery1.SQL.Add('      and Data0060.SALES_ORDER ='''+self.SGrid1.Cells[0,self.SGrid1.Row]+'''');
 ADOQuery1.Open;
 if not self.ADOQuery1.IsEmpty then
  begin
   self.ADOQuery1.First;
   application.CreateForm(TForm6,form6);
   while not self.ADOQuery1.Eof do
    begin
     self.ADOQuery1.FieldByName('USER_FULL_NAME').AsString;
     form6.Memo1.Lines.Add('操作员：'+self.ADOQuery1.FieldByName('USER_FULL_NAME').AsString);
     form6.Memo1.Lines.Add('于'+self.ADOQuery1.FieldByName('TRANS_DATE').AsString+' '+self.ADOQuery1.FieldByName('TRANS_DESCRIPTION').AsString);
     form6.Memo1.Lines.Add('原值： '+self.ADOQuery1.FieldByName('FROM_STRING').AsString);
     form6.Memo1.Lines.Add('新值： '+self.ADOQuery1.FieldByName('TO_STRING').AsString);
     form6.Memo1.Lines.Add('');
     self.ADOQuery1.Next;
    end;
   form6.ShowModal;
   form6.Free;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  begin
   self.N1.Enabled:=false;
   n2.Enabled:=false;
  end
 else begin
   self.N1.Enabled:=true;
   n2.Enabled:=true;
 end;
end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
 if button=mbright then
 begin
   sgrid1.MouseToCell(x,y,column,row);
   if (row<>0) and (column>4) then
    begin
     sgrid1.Row:=row;
     sgrid1.Col:=column;
    end;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if ADOConnection1.Connected then
  begin
    showmessage('程序在开发模式中运行，请在发布程序前关闭连接！');
    rkey73 := '1';
    vprev := '4';
  end
  else
    if not app_init_2(ADOConnection1) then
    begin
      showmsg('程序启动失败,请与系统管理员联系！',1);
      application.Terminate;
    end;
  self.Caption:=application.Title;

//   ADOConnection1.Open;
//  user_ptr := '100';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.DecisionGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssAlt in shift) and  (chr(key)='S') then
    showmessage(adototal_360.SQL.Text);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  application.Terminate;
end;

function GetAvailableMem: Integer;
const MaxInt: Int64 = High(Integer);
var MemStats: TMemoryStatus;
    Available: Int64;
begin
  GlobalMemoryStatus(MemStats);
  if (MemStats.dwAvailPhys > MaxInt) or (Longint(MemStats.dwAvailPhys) = -1) then
    Available := MaxInt
  else Available := MemStats.dwAvailPhys;
  if (MemStats.dwAvailPageFile > MaxInt) or (Longint(MemStats.dwAvailPageFile) = -1) then
    Inc(Available, MaxInt div 2)
  else Inc(Available, MemStats.dwAvailPageFile div 2);
  if Available > MaxInt then
    Result := MaxInt
  else Result := Available;
end;

function TForm1.Str360(rkey60: string): string;
var
  i:Integer;
  ResultStr:string;
begin
  ResultStr:='';
  try
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:='SELECT rkey, so_ptr, quantity, sch_date, planned_qty '+#13+
                        'FROM dbo.data0360 '+#13+
                        'WHERE so_ptr ='+rkey60;
    ADOQuery1.Open;
    ADOQuery1.First;
    ResultStr:=#13;
    for i:=1 to ADOQuery1.RecordCount do
    begin
      if (i mod 4)<>1  then ResultStr:=ResultStr+' | ';
      ResultStr:=ResultStr+ADOQuery1.FieldByName('sch_date').AsString+' '+
                 ADOQuery1.FieldByName('quantity').AsString;
      ADOQuery1.Next;
      if (i mod 4)=0 then ResultStr:=ResultStr+#13;
    end;
    ADOQuery1.Close;
    ResultStr:=ResultStr+#13;
  except
    on e:exception do
    begin
      showmessage('读取订单入库计划数据失败'+#13+#13+'出错原因：'+e.Message);
    end;
  end;
  Result:=ResultStr;
end;

procedure TForm1.SaveOpLog(Rkey60,FromStr,ToStr:string);
begin
  try
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:='INSERT INTO Data0318 '+#13+
                        '       (SALES_ORDER_PTR, TRANS_TYPE, TRANS_DESCRIPTION, FROM_STRING, TO_STRING, USER_PTR, TRANS_DATE, PROGRAM_SOURCE) '+#13+
                        'VALUES ('+Rkey60+',360,''修改订单入库计划'','''+FromStr+''','''+ToStr+''','+rkey73+',Getdate(),307)';
    ADOQuery1.ExecSQL;
  except
    on e:exception do
    begin
      showmessage('保存修改日志记录失败！'+#13+#13+'出错原因：'+e.Message);
    end;
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
chart1.NextPage;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TForm1.Edit6Change(Sender: TObject);
begin
  self.Chart1.MaxPointsPerPage:=updown5.Position;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
{if self.PrintDialog1.Execute then
begin
  try
     ChartPreview(Parent,chart1);
  except
      exit;
  end;
end;    }
end;

procedure TForm1.CheckBox0Click(Sender: TObject);
begin
    if CheckBox0.Checked = True then
      Self.Chart1.View3D := True
    else
      Self.Chart1.View3D := False;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
SetOptimalGridCellWidth(sgrid1,[]);
end;

initialization
  Mxarrays.SetMemoryCapacity(GetAvailableMem);

end.
