unit discount_rate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Grids, DBGridEh, ADODB, DBClient,
  Provider, Buttons, ComCtrls;

type
  TForm_discountrate = class(TForm)
    DataSource1: TDataSource;
    ads114: TADODataSet;
    ads64: TADODataSet;
    DBGridEh1: TDBGridEh;
    ads114delivery_no: TStringField;
    ads114invoice_number: TStringField;
    ads114SALES_ORDER: TStringField;
    ads114MANU_PART_NUMBER: TStringField;
    ads114MANU_PART_DESC: TStringField;
    ads114PO_NUMBER: TStringField;
    ads114DATE_SHIPPED: TDateTimeField;
    ads114QUAN_SHIPPED: TIntegerField;
    ads114part_price: TFloatField;
    ads114CURR_NAME: TStringField;
    ads114EXCH_RATE: TFloatField;
    ads114amount: TFloatField;
    ads114MARKUP: TFloatField;
    ads114TNUMBER: TStringField;
    ads64delivery_no: TStringField;
    ads64invoice_number: TStringField;
    ads64SALES_ORDER: TStringField;
    ads64MANU_PART_NUMBER: TStringField;
    ads64MANU_PART_DESC: TStringField;
    ads64PO_NUMBER: TStringField;
    ads64DATE_SHIPPED: TDateTimeField;
    ads64QUAN_SHIPPED: TIntegerField;
    ads64part_price: TFloatField;
    ads64CURR_NAME: TStringField;
    ads64EXCH_RATE: TFloatField;
    ads64amount: TFloatField;
    ads64MARKUP: TFloatField;
    ads64TNUMBER: TStringField;
    RadioGroup1: TRadioGroup;
    ads64isSel: TBooleanField;
    ads114isSel: TBooleanField;
    cds114: TClientDataSet;
    dsp114: TDataSetProvider;
    dsp64: TDataSetProvider;
    cds64: TClientDataSet;
    Panel1: TPanel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    ads114LAYERS: TWordField;
    ads114PRODUCT_NAME: TStringField;
    ads64LAYERS: TWordField;
    ads64PRODUCT_NAME: TStringField;
    procedure ads114AfterOpen(DataSet: TDataSet);
    procedure ads64AfterOpen(DataSet: TDataSet);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGridEh1Columns0UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   invice_disc,partout_disc:currency;
   tmp_Value, tmp_Rate,partout_value,partout_rate: double;
   procedure update_114(check:boolean);
   procedure update_64(check:boolean);
  public
    { Public declarations }
  end;

var
  Form_discountrate: TForm_discountrate;

implementation
 uses DM_u,common;
{$R *.dfm}

procedure TForm_discountrate.ads114AfterOpen(DataSet: TDataSet);
begin
cds114.Data:=dsp114.Data;
end;

procedure TForm_discountrate.ads64AfterOpen(DataSet: TDataSet);
begin
cds64.Data:=dsp64.Data;
end;

procedure TForm_discountrate.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 begin
  panel2.Visible:=false;
  datasource1.DataSet:=cds114;
  edit1.Text:=FloatToStr(invice_disc);
 end
else
 begin
  panel2.Visible:=true;
  datasource1.DataSet:=cds64;
  edit1.Text:=FloatToStr(partout_disc);
 end;
end;

procedure TForm_discountrate.DBGridEh1Columns0UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
if radiogroup1.ItemIndex=0 then
begin
if cds114.FieldByName('issel').AsBoolean then
 begin
   if cds114.FieldByName('MARKUP').asfloat>0 then
   begin
   tmp_Value:=tmp_Value - cds114.FieldValues['amount'];
   tmp_rate := tmp_rate - cds114.FieldByName('Amount').AsFloat /
                         cds114.FieldByName('MARKUP').asfloat; //理论销售金额
   end;
 end
else
 begin
   if cds114.FieldByName('MARKUP').asfloat>0 then
   begin
   tmp_Value:=tmp_Value + cds114.FieldValues['amount'];
   tmp_rate := tmp_rate + cds114.FieldByName('Amount').AsFloat /
                         cds114.FieldByName('MARKUP').asfloat; //理论销售金额
   end;                      
 end;

 if tmp_Rate <> 0 then
  begin
    invice_disc:= ExRoundTo(tmp_value / tmp_Rate,2);
    edit1.Text := FloatToStr(invice_disc);
  end
 else
  begin
   edit1.Text := '0.00';
   invice_disc := 0;
  end;
end
else
 begin
  if cds64.FieldByName('issel').AsBoolean then
   begin
     if cds64.FieldByName('MARKUP').asfloat>0 then
     begin
     partout_value:= partout_value - cds64.FieldValues['amount'];
     partout_rate := partout_rate - cds64.FieldByName('Amount').AsFloat /
                           cds64.FieldByName('MARKUP').asfloat; //理论销售金额
     end;
   end
  else
   begin
     if cds64.FieldByName('MARKUP').asfloat>0 then
     begin
     partout_value:=partout_value + cds64.FieldValues['amount'];
     partout_rate := partout_rate + cds64.FieldByName('Amount').AsFloat /
                           cds64.FieldByName('MARKUP').asfloat; //理论销售金额
     end;
   end;

 if partout_rate <> 0 then
  begin
   partout_disc:= ExRoundTo(partout_value / partout_rate,2);
   edit1.Text := FloatToStr(partout_disc);
  end
 else
  begin
   edit1.Text := '0.00';
   partout_disc := 0;
  end;
 end;
end;

procedure TForm_discountrate.update_114(check:boolean);
begin
tmp_Value:=0;
tmp_Rate:=0;
cds114.First;
cds114.DisableControls;
while not cds114.Eof do
 begin
  cds114.Edit;
  if cds114.FieldByName('MARKUP').asfloat > 0 then
   cds114.FieldValues['issel']:=check
  else
   cds114.FieldValues['issel']:=false;
  if  cds114.FieldByName('issel').AsBoolean then
  begin
   tmp_Value:= tmp_Value + cds114.FieldValues['amount'];
   tmp_rate := tmp_rate + cds114.FieldByName('Amount').AsFloat /
                         cds114.FieldByName('MARKUP').asfloat; //理论销售金额
  end;
  cds114.Next;
 end;
cds114.First;
cds114.EnableControls;
 if tmp_Rate <> 0 then
   invice_disc:= ExRoundTo(tmp_value / tmp_Rate,2)
 else
   invice_disc:=0;
end;

procedure TForm_discountrate.update_64(check:boolean);
begin
partout_value:=0;
partout_rate:=0;
cds64.First;
cds64.DisableControls;
while not cds64.Eof do
 begin
  cds64.Edit;
  if cds64.FieldByName('MARKUP').asfloat>0 then
   cds64.FieldValues['issel']:=check
  else
   cds64.FieldValues['issel']:=false;
  if cds64.FieldByName('issel').AsBoolean then
  begin
   partout_value:=partout_value+cds64.FieldValues['amount'];
   partout_rate := partout_rate + cds64.FieldByName('Amount').AsFloat /
                                 cds64.FieldByName('MARKUP').asfloat; //理论销售金额
  end;
  cds64.Next;
 end;
cds64.First;
cds64.EnableControls;
 if partout_rate <> 0 then
   partout_disc := ExRoundTo(partout_value / partout_rate,2)
 else
   partout_disc := 0;
end;

procedure TForm_discountrate.FormActivate(Sender: TObject);
begin
dtpk1.Date:=ads64.Parameters.ParamValues['dtpk1'];
dtpk2.Date:=ads64.Parameters.ParamValues['dtpk2'];

self.update_114(true);
self.update_64(true);

edit1.Text:=FloatToStr(invice_disc);

end;

procedure TForm_discountrate.BitBtn4Click(Sender: TObject);
begin
if not datasource1.DataSet.IsEmpty then
 Export_dbGridEH_to_Excel(dbgrideh1,'出货记录');
end;

procedure TForm_discountrate.CheckBox1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
  begin
   self.update_114(checkbox1.Checked);
   edit1.Text:=FloatToStr(invice_disc);
  end
else
  begin
   self.update_64(checkbox1.Checked);
   edit1.Text:=FloatToStr(partout_disc);
  end;

end;


procedure TForm_discountrate.BitBtn1Click(Sender: TObject);
begin
ads64.Close;
ads64.Parameters.ParamValues['dtpk1']:=dtpk1.Date;
ads64.Parameters.ParamValues['dtpk2']:=dtpk2.Date;
ads64.Open;
 self.update_64(true);
 edit1.Text:=FloatToStr(partout_disc);

end;

procedure TForm_discountrate.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (datasource1.DataSet.RecNo=datasource1.DataSet.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
end;

end.
