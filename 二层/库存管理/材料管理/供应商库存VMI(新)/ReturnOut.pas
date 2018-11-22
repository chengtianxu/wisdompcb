unit ReturnOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus, DB, ADODB;

type
  TForm_ReturnOut = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    eh1: TDBGridEh;
    PM2: TPopupMenu;
    PM1: TPopupMenu;
    N1: TMenuItem;
    ADS134: TADODataSet;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ado148: TADOQuery;
    ado148RKEY: TAutoIncField;
    ado148GON_NUMBER: TStringField;
    ado148warehouse_ptr: TIntegerField;
    ado148TTYPE: TSmallintField;
    ado148CREATE_DATE: TDateTimeField;
    ado148CREATE_BY: TIntegerField;
    ado148RECD_BY: TIntegerField;
    ado148REF_NUMBER: TStringField;
    ADO149: TADOQuery;
    ADO149RKEY: TAutoIncField;
    ADO149GON_PTR: TIntegerField;
    ADO149D0134_PTR: TIntegerField;
    ADO149INVENTORY_PTR: TIntegerField;
    ADO149QUANTITY: TBCDField;
    ADO149RTN_QUANTITY: TBCDField;
    ADO149tax_price: TBCDField;
    ADO149TAX_2: TBCDField;
    ADS134RKEY: TAutoIncField;
    ADS134GRN_NUMBER: TStringField;
    ADS134DELIVER_NUMBER: TStringField;
    ADS134warehouse_ptr: TIntegerField;
    ADS134SUPP_PTR: TIntegerField;
    ADS134currency_ptr: TIntegerField;
    ADS134exch_rate: TBCDField;
    ADS134PO_PTR: TIntegerField;
    ADS134TTYPE: TSmallintField;
    ADS134CREATE_DATE: TDateTimeField;
    ADS134CREATE_BY: TIntegerField;
    ADS134ship_DATE: TDateTimeField;
    ADS134ship_BY: TStringField;
    ADS134REF_NUMBER: TStringField;
    ADS134RKEY_1: TAutoIncField;
    ADS134GRN_PTR: TIntegerField;
    ADS134INVENTORY_PTR: TIntegerField;
    ADS134SOURCE_PTR: TIntegerField;
    ADS134LOCATION_PTR: TIntegerField;
    ADS134UNIT_PTR: TIntegerField;
    ADS134QUANTITY: TBCDField;
    ADS134QUAN_ON_HAND: TBCDField;
    ADS134QUAN_RETURNED: TBCDField;
    ADS134tax_price: TBCDField;
    ADS134PRICE: TBCDField;
    ADS134TAX_2: TBCDField;
    ADS134BARCODE_ID: TStringField;
    ADS134SUPPLIER2: TStringField;
    ADS134EXPIRE_DATE: TDateTimeField;
    ADS134rohs: TStringField;
    ADS134INV_PART_NUMBER: TStringField;
    ADS134INV_NAME: TStringField;
    ADS134LOCATION: TStringField;
    ADS134EMPLOYEE_NAME: TStringField;
    ADS134UNIT_NAME: TStringField;
    ADS134WAREHOUSE_NAME: TStringField;
    ADS134SUPPLIER_NAME: TStringField;
    ADS134CODE: TStringField;
    ado148supplier_ptr: TIntegerField;
    ado148status: TWordField;
    ADS134stype: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    sql_text:string;
    precolumn:Tcolumneh;
    procedure item_click(sender:Tobject);
  public
    { Public declarations }
  end;

var
  Form_ReturnOut: TForm_ReturnOut;

implementation

uses demo, ReturnDetail, ReturnSearch;

{$R *.dfm}

procedure TForm_ReturnOut.FormShow(Sender: TObject);
begin
ads134.CommandText:=sql_text+' and data0134.quan_on_hand>0';
ADS134.Parameters.ParamByName('dtpk1').Value:=datetostr(now-90);
ADS134.Parameters.ParamByName('dtpk2').Value:=datetostr(now+1);
ads134.Open;
end;

procedure TForm_ReturnOut.FormCreate(Sender: TObject);
var i:byte;
    item:Tmenuitem;
begin
 self.Caption:=application.Title;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 sql_text:=ads134.CommandText;  //记录ads10默认sql语句
 precolumn:=eh1.Columns[0]; //给precolumn赋初始值

 for i:=1 to eh1.columns.Count do
 begin //动态增加列名到字段菜单中
  item:=Tmenuitem.Create(self);
  item.Caption:=eh1.columns[i-1].Title.caption;
  if eh1.Columns[i-1].Visible then
   item.Checked:=true;
  item.onClick:=item_click;
  self.PM2.Items.Add(item);
 end;
end;

procedure TForm_ReturnOut.N1Click(Sender: TObject);
begin
  form_ReturnDetail:=Tform_ReturnDetail.Create(application);
  form_ReturnDetail.ShowModal;
  ADS134.Close; //刷新
  ADS134.Open;
  form_ReturnDetail.Free;
end;

procedure TForm_ReturnOut.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    ads134.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else ads134.Filter:='';
end;

procedure TForm_ReturnOut.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
 showmessage(ADS134.CommandText);
end;


procedure TForm_ReturnOut.eh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker=smupeh then
 begin
  column.Title.SortMarker:=smdowneh;
  ads134.IndexFieldNames:=column.FieldName+' DESC';
 end
 else begin
  column.Title.SortMarker:=smupeh;
  ads134.IndexFieldNames:=column.FieldName;
 end;
 if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
 begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
  label1.Caption:='搜索：'+column.Title.Caption;
  precolumn.Title.Color:=clbtnface;
  column.Title.Color:=clred;
  precolumn:=column;
  edit1.Text:='';
 end;
 edit1.SetFocus;
end;
procedure TForm_ReturnOut.item_click(sender:TObject);
var i:byte;
begin
 (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
 if (sender as Tmenuitem).Checked then
  for i:=0 to eh1.Columns.Count-1 do
   if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
   begin
    eh1.Columns[i].Visible:=true;
    break;
   end;
 if not (sender as Tmenuitem).Checked then
  for i:=0 to eh1.Columns.Count-1 do
   if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
   begin
    eh1.Columns[i].Visible:=false;
    break;
   end;
end;

procedure TForm_ReturnOut.BitBtn4Click(Sender: TObject);
begin
pm2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm_ReturnOut.BitBtn2Click(Sender: TObject);
var rkey134:integer;
begin
 if ADS134.Active then
 begin
  rkey134:=ADS134rkey.Value;
  ADS134.Close;
  ADS134.Open;
  if rkey134>0 then ADS134.Locate('rkey',rkey134,[]);
 end;
end;

procedure TForm_ReturnOut.BitBtn3Click(Sender: TObject);
var i:byte;
begin
 form_returnsearch:=tform_returnsearch.Create(application);
 if form_returnsearch.ShowModal=mrok then
  with ads134 do
  begin
   close;
   commandtext:=sql_text; //恢复默认语句
   for i:=1 to form_returnsearch.SGrid1.RowCount-1 do
     CommandText:=CommandText+form_returnsearch.SGrid1.cells[2,i];
   if form_returnsearch.CheckBox1.Checked=true then
     CommandText:=CommandText+' and data0134.quan_on_hand>0';
   parameters.ParamByName('dtpk1').Value:=form_returnsearch.dtpk1.Date;
   parameters.ParamByName('dtpk2').Value:=form_returnsearch.dtpk2.Date+1;
   open;
  end;
end;

end.
