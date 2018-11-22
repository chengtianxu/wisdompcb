unit rece_put_stock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, Buttons, DB, ADODB;

type
  TForm_date = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label17: TLabel;
    Label16: TLabel;
    DTpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1ABBR_NAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_date: TForm_date;

implementation

uses receputstock_total, main;

{$R *.dfm}

procedure TForm_date.FormActivate(Sender: TObject);
begin
  dtpk2.Date:={date()}form1.DateTimePicker7.Date;
  dtpk1.Date:={date()-30}form1.DateTimePicker5.Date;
  adoquery1.Open;
  while not adoquery1.Eof do
   begin
    combobox1.Items.Add(self.adoquery1ABBR_NAME.Value);
    adoquery1.Next;
   end;
   combobox1.Items.Add('全部...');
   combobox1.ItemIndex:=combobox1.Items.Count-1;  
end;

procedure TForm_date.BitBtn1Click(Sender: TObject);
var
 beg_money,rec_money,ext_money,stock_money:double;
begin
 form8:=tform8.Create(application);
 Screen.Cursor := crHourglass;
 with adoquery2 do
  begin
   close;
   sql.Clear;
   sql.Add('Alter VIEW partrece_total');
   sql.Add('AS');
   sql.Add('SELECT  TOP (100) PERCENT dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER,');
   sql.Add(' dbo.Data0025.MANU_PART_DESC, dbo.Data0010.ABBR_NAME,');
   sql.Add('  dbo.Data0008.PROD_CODE, dbo.Data0025.unit_sq,');
   sql.Add('SUM(dbo.Data0053.QUANTITY) AS rece_total,');
   sql.Add('ROUND(SUM(dbo.Data0053.QUANTITY * dbo.Data0025.unit_sq), 4) AS mianqi');
   sql.Add('FROM         dbo.Data0025 INNER JOIN');
   sql.Add('dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN');
   sql.Add('dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN');
   sql.Add('dbo.Data0053 ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR');
   sql.Add('WHERE     (dbo.Data0025.PARENT_PTR IS NULL)');
   sql.Add('and Data0053.mfg_date >= '''+datetostr(dtpk1.date)+''' and Data0053.mfg_date <= '''+datetostr(dtpk2.date+1)+'''');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   sql.Add('and data0053.WHSE_PTR='+self.ADOQuery1rkey.AsString);
   sql.Add('GROUP BY dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER,');
   sql.Add('dbo.Data0025.MANU_PART_DESC, dbo.Data0008.PROD_CODE, dbo.Data0010.ABBR_NAME,');
   sql.Add(' dbo.Data0025.unit_sq');
   ExecSQL;
  end;

 with adoquery2 do
  begin
   close;
   sql.Clear;
   sql.Add('alter VIEW partrece_ext_total');
   sql.Add('AS');
   sql.Add('SELECT partrece_total.RKEY, partrece_total.manu_PART_NUMBER,');
   sql.Add('partrece_total.manu_PART_DESC,');
   sql.Add('partrece_total.ABBR_NAME,partrece_total.PROD_CODE,');
   sql.Add('partrece_total.unit_sq,partrece_total.rece_total,');
   sql.Add('partrece_total.mianqi,');
   sql.Add('SUM(data0052.quan_shp) AS ext_total,');
   sql.Add('ROUND(SUM(data0052.quan_shp');
   sql.Add('* partrece_total.unit_sq), 4) AS ext_mianqi');
   sql.Add('FROM Data0064 INNER JOIN Data0052 ON');
   sql.Add('Data0064.RKEY = Data0052.SO_SHP_PTR INNER JOIN');
   sql.Add('Data0053 ON Data0052.DATA0053_PTR = Data0053.RKEY RIGHT OUTER JOIN');
   sql.Add('partrece_total ON Data0053.CUST_PART_PTR = partrece_total.RKEY');
   sql.Add('where  Data0064.date_assign >= '''+datetostr(DTPK1.Date)+''' and Data0064.date_assign <= '''+datetostr(dtpk2.date+1)+'''');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   sql.Add('and data0053.WHSE_PTR='+self.ADOQuery1rkey.AsString);
   sql.Add('GROUP BY partrece_total.RKEY, partrece_total.manu_PART_NUMBER,');
   sql.Add('partrece_total.manu_PART_DESC,');
   sql.Add('partrece_total.ABBR_NAME, partrece_total.PROD_CODE,');
   sql.Add('partrece_total.unit_sq, partrece_total.rece_total,');
   sql.Add('partrece_total.mianqi');
   ExecSQL;
  end;
 with adoquery2 do
  begin
   close;
   sql.Clear;
   sql.Add('alter VIEW partrece_jft_total');
   sql.Add('AS');
   sql.Add('SELECT     dbo.partrece_ext_total.RKEY, dbo.partrece_ext_total.manu_PART_NUMBER,');
   sql.Add('dbo.partrece_ext_total.manu_PART_DESC, dbo.partrece_ext_total.ABBR_NAME,');
   sql.Add('dbo.partrece_ext_total.PROD_CODE, dbo.partrece_ext_total.unit_sq,');
   sql.Add('dbo.partrece_ext_total.rece_total, dbo.partrece_ext_total.mianqi,');
   sql.Add('dbo.partrece_ext_total.ext_total, dbo.partrece_ext_total.ext_mianqi,');
   sql.Add('SUM(dbo.Data0465.QUANTITY) AS t_quantity,');
   sql.Add('ROUND(SUM(dbo.Data0465.QUANTITY * dbo.partrece_ext_total.unit_sq), 4) AS t_mianqi');
   sql.Add('FROM         dbo.Data0465 INNER JOIN');
   sql.Add('dbo.Data0053 ON dbo.Data0465.D0053_PTR = dbo.Data0053.RKEY INNER JOIN');
   sql.Add('dbo.data0415 ON dbo.Data0465.heard_ptr = dbo.data0415.rkey RIGHT OUTER JOIN');
   sql.Add('dbo.partrece_ext_total ON dbo.Data0053.CUST_PART_PTR = dbo.partrece_ext_total.RKEY');
   sql.Add('WHERE     (dbo.data0415.status IN (3, 4)) ');

   sql.Add('and  data0415.sys_date >= '''+datetostr(DTPK1.Date)+''' and data0415.sys_date <= '''+datetostr(dtpk2.date+1)+'''');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   sql.Add('and data0053.WHSE_PTR='+self.ADOQuery1rkey.AsString);
   sql.Add('GROUP BY dbo.partrece_ext_total.RKEY, dbo.partrece_ext_total.manu_PART_NUMBER,');
   sql.Add('dbo.partrece_ext_total.manu_PART_DESC, dbo.partrece_ext_total.ABBR_NAME,');
   sql.Add('dbo.partrece_ext_total.PROD_CODE,dbo.partrece_ext_total.ext_mianqi,');
   sql.Add('dbo.partrece_ext_total.unit_sq, dbo.partrece_ext_total.rece_total,');
   sql.Add('dbo.partrece_ext_total.mianqi, dbo.partrece_ext_total.ext_total');
   ExecSQL;
  end;

 with adoquery2 do
  begin
   close;
   sql.Clear;
   sql.Add('alter VIEW stock_total');
   sql.Add('AS');
   sql.Add('SELECT TOP 100 PERCENT CUST_PART_PTR, SUM(QTY_ON_HAND)');
   sql.Add('AS quantity_hand');
   sql.Add('FROM dbo.Data0053');
   sql.Add('where  Data0053.mfg_date <= '''+datetostr(dtpk2.date+1)+'''');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   sql.Add('and data0053.WHSE_PTR='+self.ADOQuery1rkey.AsString);
   sql.add('GROUP BY CUST_PART_PTR');
   execsql;
  end;

 form8.ADOTable1.Close;
 form8.ADOTable1.Open;
 beg_money:=0;
 rec_money:=0;
 ext_money:=0;
 stock_money:=0;
 if form8.ADOTable1.IsEmpty then
  begin
   Screen.Cursor := crDefault;
   messagedlg('没有找到符合条件的记录!',mtinformation,[mbok],0);
  end
 else
  begin
   form8.ADOTable1.DisableControls;
   while not form8.ADOTable1.Eof do
    begin
     beg_money:=beg_money+form8.ADOTable1begstock_mianqi.Value;
     rec_money:=rec_money+form8.ADOTable1mianqi.Value;
     ext_money:=ext_money+form8.ADOTable1ext_mianqi.Value;
     stock_money:=stock_money+form8.ADOTable1stock_mianqi.Value;
     form8.ADOTable1.Next;
    end;
   form8.Edit1.Text:=formatfloat('0.0000',beg_money);
   form8.Edit2.Text:=formatfloat('0.0000',rec_money);
   form8.Edit3.Text:=formatfloat('0.0000',ext_money);
   form8.Edit4.Text:=formatfloat('0.0000',stock_money);
   form8.ADOTable1.First;
   form8.ADOTable1.EnableControls;
   Screen.Cursor := crDefault;
   form8.ShowModal;
  end;

  form8.Free;

end;

procedure TForm_date.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.show;
end;

procedure TForm_date.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 adoquery1.MoveBy(combobox1.ItemIndex+1-adoquery1.RecNo);
end;

end.
