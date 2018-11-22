unit quote_price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm12 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    aq85s: TADOStoredProc;
    aq85sRKEY: TIntegerField;
    aq85sTNUMBER: TStringField;
    aq85sCUST_NAME: TStringField;
    aq85sCUST_PART_NO: TStringField;
    aq85sQuote_type: TSmallintField;
    aq85sttype: TStringField;
    aq85squote_price: TFloatField;
    aq85squote_taxprice: TFloatField;
    aq85sCURR_RATE: TFloatField;
    aq85sCURR_NAME: TStringField;
    aq85sEMPLOYEE_NAME: TStringField;
    aq85sQTE_UNIT_PTR: TIntegerField;
    aq85sTUNITS: TIntegerField;
    aq85svatax: TBCDField;
    aq85sqte_unit: TStringField;
    aq85sCURR_PTR: TIntegerField;
    aq85sref_part_no: TStringField;
    aq85: TADOQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    aq85RKEY: TAutoIncField;
    aq85TNUMBER: TStringField;
    aq85CUST_NAME: TStringField;
    aq85CUST_PART_NO: TStringField;
    aq85QUOTE_TYPE: TSmallintField;
    aq85vatax: TBCDField;
    aq85CURR_RATE: TFloatField;
    aq85CURR_NAME: TStringField;
    aq85EMPLOYEE_NAME: TStringField;
    aq85QTE_UNIT_PTR: TIntegerField;
    aq85TUNITS: TIntegerField;
    aq85CURR_PTR: TIntegerField;
    aq85ref_part_no: TStringField;
    aq85cost: TFloatField;
    aq85EDI_FLAG_FOR_INVOICE: TSmallintField;
    aq85V_tax: TFloatField;
    aq85ttype: TStringField;
    aq85qte_unit: TStringField;
    aq85quote_price: TFloatField;
    aq85quote_taxprice: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aq85sCalcFields(DataSet: TDataSet);
    procedure aq85CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses damo;

{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
 if (not aq85.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm12.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1click(sender);
end;

procedure TForm12.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  if radiogroup1.ItemIndex=0 then
   aq85.Filter := 'TNUMBER like '''+Trim(Edit1.Text)+'%'''
  else
   aq85.Filter := 'CUST_PART_NO like ''%'+trim(edit1.text)+'%'''
 ELSE
  aq85.FILTER:='';
if aq85.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;
end;

procedure TForm12.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption := '报价单号'
else
 label1.Caption := '产品型号';
 
edit1.SetFocus;
end;

procedure TForm12.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm12.FormActivate(Sender: TObject);
begin
if aq85.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;
end;

procedure TForm12.aq85sCalcFields(DataSet: TDataSet);
begin
//if self.aq85Quote_type.Value=0 then
// self.aq85ttype.Value:='标准报价'
//else
// self.aq85ttype.Value:='转厂报价';
//if self.aq85QTE_UNIT_PTR.Value=1 then
// self.aq85qte_unit.Value:='PCS'
//else
// self.aq85qte_unit.Value:='SET';
end;

procedure TForm12.aq85CalcFields(DataSet: TDataSet);
begin
if self.aq85Quote_type.Value=0 then
 self.aq85ttype.Value:='标准报价'
else
 self.aq85ttype.Value:='转厂报价';
if self.aq85QTE_UNIT_PTR.Value=1 then
 self.aq85qte_unit.Value:='PCS'
else
 self.aq85qte_unit.Value:='SET';
end;

end.
