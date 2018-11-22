unit rece_put_stock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, Buttons, DB, ADODB, DBGrids;

type
  TForm_date = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label17: TLabel;
    Label16: TLabel;
    DTpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ADO15: TADOQuery;
    ADO15rkey: TIntegerField;
    ADO15ABBR_NAME: TStringField;
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
 dtpk2.Date:=strtodate(form1.ADOserver_datedate1.Value);
 dtpk1.Date:=dtpk2.Date-30;

 ado15.Open;
 while not ado15.Eof do
  begin
   combobox1.Items.Add(self.ADO15ABBR_NAME.Value);
   ado15.Next;
  end;
 combobox1.Items.Add('全部...');
 combobox1.ItemIndex:=combobox1.Items.Count-1;
end;

procedure TForm_date.BitBtn1Click(Sender: TObject);
var
 beg_money,rec_money,ext_money,stock_money,returen_money,scrap_money:double;
begin
 form8:=tform8.Create(application);
 Screen.Cursor := crHourglass;
 with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('Alter VIEW received_total');
   sql.Add('AS');
   sql.Add('SELECT data0017.RKEY,Data0017.INV_PART_NUMBER,data0017.inv_name,');
   sql.Add('Data0017.INV_DESCRIPTION, Data0002.UNIT_NAME,');
   sql.Add('Data0496.GROUP_NAME,dbo.data0019.inv_group_name,');
   sql.Add('ROUND(Data0017.STD_COST, 3) AS std_cost,');
   sql.Add('SUM(Data0022.QUANTITY) AS received,');
   sql.Add('ROUND(SUM((Data0022.QUANTITY)* Data0022.PRICE / Data0022.EXCHANGE_RATE), 3) AS received_money,');
   sql.Add('Data0023.ABBR_NAME,Data0022.SUPPLIER_PTR AS rkey23,');
   sql.Add('data0017.STOCK_SELL,Data0017.STOCK_BASE');
   sql.Add('FROM Data0022 INNER JOIN Data0023 ON');
   sql.Add('Data0022.SUPPLIER_PTR = Data0023.RKEY RIGHT OUTER JOIN');
   sql.Add('Data0002 INNER JOIN Data0017 ON');
   sql.Add('Data0002.RKEY = Data0017.STOCK_UNIT_PTR INNER JOIN');
   sql.Add('Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN');
   sql.Add('data0019 ON Data0496.GROUP_PTR = data0019.rkey ON');
   sql.Add('Data0022.INVENTORY_PTR = Data0017.RKEY');
   sql.Add('where  Data0022.tdate >= '''+datetostr(dtpk1.date)+''' and Data0022.tdate <= '''+datetostr(dtpk2.date+1)+'''');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   sql.Add('and data0022.WHOUSE_PTR='+self.ADO15rkey.AsString);
   sql.Add('GROUP BY all Data0017.RKEY,Data0017.INV_PART_NUMBER,data0017.inv_name,');
   sql.Add('Data0017.INV_DESCRIPTION, Data0017.STD_COST,');
   sql.Add('Data0002.UNIT_NAME, Data0496.GROUP_DESC,');
   sql.Add('Data0496.GROUP_NAME,data0019.inv_group_name,');
   sql.Add('Data0023.ABBR_NAME,Data0022.SUPPLIER_PTR,');
   sql.Add('Data0017.STOCK_SELL,Data0017.STOCK_BASE');
   ExecSQL;
  end;

 with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('alter VIEW received_extend_total');
   sql.Add('AS');
   sql.Add('SELECT received_total.RKEY,received_total.INV_PART_NUMBER,');
   sql.Add('received_total.INV_name,received_total.INV_DESCRIPTION, received_total.UNIT_NAME,');
   sql.Add('received_total.GROUP_NAME,dbo.received_total.inv_group_name,');
   sql.Add('received_total.STD_COST,received_total.received,');
   sql.Add('received_total.received_money,SUM(Data0207.QUANTITY) AS extend,');
   sql.Add('ROUND(SUM(Data0207.QUANTITY * Data0022.PRICE / Data0022.EXCHANGE_RATE), 3) AS extend_money,');
   sql.Add('received_total.ABBR_NAME,received_total.rkey23,');
   sql.Add('received_total.STOCK_SELL,received_total.STOCK_BASE');
   sql.Add('FROM dbo.Data0207 INNER JOIN dbo.Data0022 ON');
   sql.Add('dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY RIGHT OUTER JOIN');
   sql.Add('dbo.received_total ON');
   sql.Add('dbo.Data0022.SUPPLIER_PTR = dbo.received_total.rkey23 AND');
   sql.Add('dbo.Data0207.INVENTORY_PTR = dbo.received_total.RKEY');
   sql.Add('where  Data0207.tdate >= '''+datetostr(DTPK1.Date)+''' and Data0207.tdate <= '''+datetostr(dtpk2.date+1)+'''');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   sql.Add('and data0022.WHOUSE_PTR='+self.ADO15rkey.AsString);
   sql.Add('GROUP BY all received_total.RKEY,received_total.INV_PART_NUMBER,received_total.INV_name,');
   sql.Add('received_total.INV_DESCRIPTION, received_total.STD_COST,');
   sql.Add('received_total.received, received_total.received_money,');
   sql.Add('received_total.UNIT_NAME,received_total.GROUP_NAME,received_total.inv_group_name,');
   sql.Add('received_total.ABBR_NAME,received_total.rkey23,');
   sql.Add('received_total.STOCK_SELL,received_total.STOCK_BASE');
   ExecSQL;
  end;

 with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('alter VIEW  stock');
   sql.Add('AS');
   sql.Add('SELECT Data0022.INVENTORY_PTR, SUM(Data0022.QUAN_ON_HAND) AS stock,');
   sql.Add('ROUND(SUM(Data0022.QUAN_ON_HAND * Data0022.PRICE / Data0022.EXCHANGE_RATE),3) AS amount,');
   sql.Add('supplier_ptr');
   sql.Add('FROM Data0022 ');
   sql.Add('where  Data0022.tdate <= '''+datetostr(dtpk2.date+1)+'''');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
   sql.Add('and data0022.WHOUSE_PTR='+self.ADO15rkey.AsString);
   sql.add('GROUP BY Data0022.INVENTORY_PTR,supplier_ptr');
   execsql;
  end;

 with ADOQuery1 do
  begin                         //本期材料退回汇总
   close;
   sql.Clear;
   sql.Add('alter VIEW invt_returen');
   sql.Add('AS');
   sql.Add('SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,');
   sql.Add('SUM(Data0096.QUAN_REJD) AS quan_returen,');
   sql.Add('ROUND(SUM(Data0096.QUAN_REJD * Data0022.PRICE / Data0022.EXCHANGE_RATE),3) AS amount_returen');
   sql.Add('FROM Data0096 INNER JOIN');
   sql.Add('Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY');
   sql.Add('where (Data0096.FLAG = ''2'') and');
   sql.Add('(Data0096.tdate >= '''+datetostr(DTPK1.Date)+''') and');
   sql.Add('(Data0096.tdate <= '''+datetostr(dtpk2.date+1)+''')');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
    sql.Add('and data0022.WHOUSE_PTR='+self.ADO15rkey.AsString);
   sql.add('GROUP BY Data0096.INVT_PTR, Data0022.SUPPLIER_PTR');
   execsql;
  end;

 with ADOQuery1 do
  begin                         //本期材料报废汇总
   close;
   sql.Clear;
   sql.Add('alter VIEW invt_scrap');
   sql.Add('AS');
   sql.Add('SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,');
   sql.Add('SUM(Data0096.QUAN_REJD) AS quan_scrap,');
   sql.Add('ROUND(SUM(Data0096.QUAN_REJD * Data0022.PRICE / Data0022.EXCHANGE_RATE),3) AS amount_csrap');
   sql.Add('FROM Data0096 INNER JOIN');
   sql.Add('Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY');
   sql.Add('where (Data0096.FLAG = ''1'') and');
   sql.Add('(Data0096.tdate >= '''+datetostr(DTPK1.Date)+''') and');
   sql.Add('(Data0096.tdate <= '''+datetostr(dtpk2.date+1)+''')');
   if combobox1.ItemIndex<>combobox1.Items.Count-1 then
    sql.Add('and data0022.WHOUSE_PTR='+self.ADO15rkey.AsString);
   sql.add('GROUP BY Data0096.INVT_PTR, Data0022.SUPPLIER_PTR');
   execsql;
  end;


 form8.ADOTable1.Close;
 form8.ADOTable1.Open;
 beg_money:=0;
 rec_money:=0;
 ext_money:=0;
 stock_money:=0;
 returen_money:=0;
 scrap_money:=0;
 if form8.ADOTable1.IsEmpty then
  begin
   Screen.Cursor := crDefault;
   messagedlg('没有找到符合条件的记录!',mtinformation,[mbok],0);
  end
 else
  begin
   form8.DBGrid1.DataSource.DataSet.DisableControls;
   while not form8.ADOTable1.Eof do
    begin
     beg_money:=beg_money+form8.ADOTable1begstock_money.Value;
     rec_money:=rec_money+form8.ADOTable1received_money.Value;
     ext_money:=ext_money+form8.ADOTable1extend_money.Value;
     stock_money:=stock_money+form8.ADOTable1amount.Value;
     returen_money:= returen_money+form8.ADOTable1amount_returen.Value;
     scrap_money:= scrap_money+form8.ADOTable1amount_csrap.Value;
     form8.ADOTable1.Next;
    end;
   form8.Edit1.Text:=formatfloat('0.000',beg_money);
   form8.Edit2.Text:=formatfloat('0.000',rec_money);
   form8.Edit3.Text:=formatfloat('0.000',ext_money);
   form8.Edit4.Text:=formatfloat('0.000',stock_money);
   form8.Edit5.Text:=formatfloat('0.000',returen_money);
   form8.Edit6.Text:=formatfloat('0.000',scrap_money);
   form8.ADOTable1.First;
   form8.DBGrid1.DataSource.DataSet.EnableControls;
   Screen.Cursor := crDefault;
   if dtpk2.Date<strtodate(form1.ADOserver_datedate1.Value) then    //如果是查过去一段时间的进出
    begin                         //那么库存将无效
     form8.DBGrid1.Columns[8].Visible:=false;
     form8.DBGrid1.Columns[9].Visible:=false;//期初
     form8.DBGrid1.Columns[18].Visible:=false;
     form8.DBGrid1.Columns[19].Visible:=false; //库存
     form8.DBGrid1.Columns[21].Visible:=false;
     form8.DBGrid1.Columns[22].Visible:=false;
     form8.Edit1.Visible:=false;
     form8.Edit4.Visible:=false;
     form8.Label2.Visible:=false;
     form8.Label4.Visible:=false;
    end;   
   form8.ShowModal;
   self.ModalResult:=mrok;
  end;
  form8.Free;
end;

procedure TForm_date.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ado15.Close;
form1.show;
end;

procedure TForm_date.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 ado15.MoveBy(combobox1.ItemIndex+1-ado15.RecNo);
end;

end.
