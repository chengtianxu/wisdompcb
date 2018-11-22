unit so_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  Tform_salesorder = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOStoredProc;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1SALES_ORDER: TStringField;
    ADOQuery1cust_part_ptr: TIntegerField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1customer_name: TStringField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1v_status: TStringField;
    ADOQuery1due_date: TDateTimeField;
    ADOQuery1abbr_name: TStringField;
    ADOQuery1parts_shipped: TFloatField;
    ADOQuery1PARTS_ORDERED: TFloatField;
    ADOQuery1sch_date: TDateTimeField;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    ADOQuery1ANALYSIS_CODE_1: TStringField;
    ADOQuery1REPORT_UNIT_VALUE1: TFloatField;
    CheckBox6: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    ADOQuery1weijao_qty: TIntegerField;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    ADOQuery1PARTS_RETURNED: TFloatField;
    ADOQuery1manu_part_desc: TStringField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1sotype: TStringField;
    ADOQuery1abbr_warehousename: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure checkvar();
    procedure CheckBox6Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   v_colwidth: array[0..10] of integer;
  public
    { Public declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);    
  end;

var
  form_salesorder: Tform_salesorder;

implementation
uses damo, main, edit_rma;
{$R *.dfm}

procedure Tform_salesorder.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure Tform_salesorder.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure Tform_salesorder.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  case radiogroup1.ItemIndex of
  0: Adoquery1.Filter :='sales_order like '''+Trim(Edit1.Text)+'%''';
  1: Adoquery1.Filter :='po_number like ''%'+Trim(Edit1.Text)+'%''';
  2: Adoquery1.Filter :='manu_part_number like '''+Trim(Edit1.Text)+'%''';
  3: Adoquery1.Filter :='manu_part_desc like ''%'+Trim(Edit1.Text)+'%''';
  end
 else
  Adoquery1.filter:='';

end;

procedure Tform_salesorder.DBGrid1DblClick(Sender: TObject);
begin
if (not adoquery1.IsEmpty) then
 ModalResult:=mrok;
end;

procedure Tform_salesorder.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then
 ModalResult:=mrok;
end;

procedure Tform_salesorder.RadioGroup1Click(Sender: TObject);
begin
 label1.Caption:=radiogroup1.Items[radiogroup1.ItemIndex];
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure Tform_salesorder.FormCreate(Sender: TObject);
var
 i:byte;
begin
dtpk1.Date:= form1.dtpk1.Date;
dtpk2.Date:= form1.dtpk2.Date;
  adoquery1.Close;
  adoquery1.Parameters[1].Value:=dtpk1.Date;
  adoquery1.Parameters[2].Value:=dtpk2.Date+1;
  adoquery1.Parameters[9].Value:=strtoint(form2.Label15.Caption);
  adoquery1.Open;

 for i:=0 to 10 do
  self.v_colwidth[i] := dbgrid1.Columns[i].Width;

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
 
end;

procedure Tform_salesorder.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 case adoquery1.FieldValues['status'] of
  1:adoquery1.FieldValues['v_status']:='有效的';
  2:adoquery1.FieldValues['v_status']:='暂缓';
  3:adoquery1.FieldValues['v_status']:='已关闭';
  4:adoquery1.FieldValues['v_status']:='已完成';
  5:adoquery1.FieldValues['v_status']:='已取消';
  6:adoquery1.FieldValues['v_status']:='未提交';
 end;
 self.ADOQuery1weijao_qty.Value:=
 self.ADOQuery1PARTS_ORDERED.AsInteger-
 self.ADOQuery1parts_shipped.AsInteger;
end;

procedure Tform_salesorder.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 10 do
 dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-795)*v_colwidth[i]/771);
end;

procedure Tform_salesorder.FormActivate(Sender: TObject);
begin
 radiogroup1.ItemIndex:=2;
end;

procedure tform_salesorder.checkvar();
begin
 ADOQuery1.Close;

if not checkbox1.Checked then
 ADOQuery1.Parameters[3].Value:=1      //有效的
else
 ADOQuery1.Parameters[3].Value:=0;
if not checkbox2.Checked then             //暂缓
 ADOQuery1.Parameters[4].Value:=2
else
 ADOQuery1.Parameters[4].Value:=0;
if not checkbox3.Checked then           //已结算
 ADOQuery1.Parameters[5].Value:=3
else
 ADOQuery1.Parameters[5].Value:=0;
if not checkbox4.Checked then           //已完成
 ADOQuery1.Parameters[6].Value:=4
else
 ADOQuery1.Parameters[6].Value:=0;
if not checkbox5.Checked then           //已取消
 ADOQuery1.Parameters[7].Value:=5
else
 ADOQuery1.Parameters[7].Value:=0;
if not checkbox6.Checked then           //未提交
 ADOQuery1.Parameters[8].Value:=6
else
 ADOQuery1.Parameters[8].Value:=0;

 adoquery1.open;
end;

procedure Tform_salesorder.CheckBox6Click(Sender: TObject);
begin
self.checkvar();
end;

procedure Tform_salesorder.dtpk1Exit(Sender: TObject);
begin
  adoquery1.Close;
  adoquery1.Parameters[1].Value:=dtpk1.Date;
  adoquery1.Parameters[2].Value:=dtpk2.Date+1;
  adoquery1.Open;
end;

procedure Tform_salesorder.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
