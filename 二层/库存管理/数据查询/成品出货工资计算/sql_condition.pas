unit sql_condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, Buttons, ExtCtrls, DB, ADODB, Menus,
  DateUtils;

type
  TForm3 = class(TForm)
    GroupBox6: TGroupBox;
    Label18: TLabel;
    Button6: TButton;
    BitBtn9: TBitBtn;
    ListBox6: TListBox;
    Edit6: TEdit;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    StaticText7: TStaticText;
    DTPk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    dttm1: TDateTimePicker;
    dttm2: TDateTimePicker;
    Label17: TLabel;
    Label16: TLabel;
    RadioGroup4: TRadioGroup;
    RGp3: TRadioGroup;
    RadioGroup3: TRadioGroup;
    ComboBox4: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    AQ52: TADOQuery;
    ComboBox3: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    label_rkey15: TLabel;
    label_rkey16: TLabel;
    AQdate: TADOQuery;
    AQdatesys_datetime: TDateTimeField;
    AQ52RKEY: TIntegerField;
    AQ52MANU_PART_NUMBER: TStringField;
    AQ52MANU_PART_DESC: TStringField;
    AQ52PRODUCT_NAME: TStringField;
    AQ52ABBR_NAME: TStringField;
    AQ52putout_total: TFloatField;
    AQ52mianqi: TFloatField;
    AQ52weight: TFloatField;
    AQ52amount: TFloatField;
    procedure ListBox6Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo, prod_search, customer_search, warehouse_search, location_search;

{$R *.dfm}

procedure TForm3.ListBox6Click(Sender: TObject);
begin
label18.Caption:=listbox6.Items[listbox6.itemindex];
edit6.Text:='';
edit6.Visible:=true;
edit6.ReadOnly:=false;
button6.Enabled:=false;
bitbtn9.Visible:=true;
combobox3.Visible:=false;
case listbox6.ItemIndex of
0:bitbtn9.Visible:=false;
1:bitbtn9.Visible:=false;
2:;
3:;
4:edit6.ReadOnly:=true;
5:edit6.ReadOnly:=true;
6:
begin
 combobox3.Visible:=true;
 edit6.Visible:=false;
 button6.Enabled:=true;
 bitbtn9.Visible:=false;
end;

end;
end;

procedure TForm3.Edit6Change(Sender: TObject);
begin
if trim(edit6.Text)<>'' then
 button6.Enabled:=true
else
 button6.Enabled:=false;
end;

procedure TForm3.BitBtn9Click(Sender: TObject);
begin

case listbox6.ItemIndex of

 2:
 try
  form_prodcode:=tform_prodcode.Create(application);
  if form_prodcode.ShowModal=mrok then
   begin
    edit6.Text:=form_prodcode.ADOQuery1prod_code.Value;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_prodcode.free;
 end;

 3:
 try
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit6.Text:=form_customer.ADOQuery1cust_code.Value;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_customer.free;
 end;
 4:
 try
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit6.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_wh.free;
 end;
5:
 try
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit6.Text:=form_lo.ADOQuery1CODE.Value;
    label_rkey16.Caption := form_lo.ADOQuery1RKEY.AsString;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_lo.free;
 end;

end;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
 aqdate.Open;
 dtpk2.Date:=self.AQdatesys_datetime.Value;
 dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
end;

procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

procedure TForm3.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm3.Button6Click(Sender: TObject);
var
 i,j:byte;
 hasadded:boolean; //用于判断查询项目是否已添加
begin
 hasadded:=false;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox6.Items[listbox6.itemindex]  then
   begin
    hasadded:=true;  //查询项目已添加
    j:=i;            //记下已添加的查询项目的位置
    break;
   end;
 if hasadded=false then   //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox6.Items[listbox6.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit6.Text;
   case listbox6.ItemIndex of
   0:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0025.manu_PART_NUMBER LIKE '''+trim(edit6.Text)+'%''';
   1:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0025.manu_PART_DESC LIKE ''%'+trim(edit6.Text)+'%''';
   2:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0008.PROD_CODE LIKE '''+trim(edit6.Text)+'%''';
   3:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0010.cust_code LIKE '''+trim(edit6.Text)+'%''';
   4:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0053.whse_ptr = '+label_rkey15.Caption;
   5:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0053.LOC_PTR = '+label_rkey16.Caption;
   6:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox3.Text;
     sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.so_tp = '+inttostr(combobox3.ItemIndex);
    end;

   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else    //查询项目已添加则修改
  begin
   sgrid1.Cells[1,j]:=edit6.Text;
   case listbox6.ItemIndex of
   0:
    sgrid1.Cells[2,j] := 'and Data0025.MANU_PART_NUMBER LIKE '''+trim(edit6.Text)+'%''';
   1:
    sgrid1.Cells[2,j] := 'and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit6.Text)+'%''';
   2:
    sgrid1.Cells[2,j] := 'and Data0008.PROD_CODE LIKE '''+trim(edit6.Text)+'%''';
   3:
    sgrid1.Cells[2,j] := 'and data0010.cust_code LIKE '''+trim(edit6.Text)+'%''';
   4:
    sgrid1.Cells[2,j] := 'and data0053.whse_ptr = '+label_rkey15.Caption;
   5:
    sgrid1.Cells[2,j] := 'and data0053.LOC_PTR = '+label_rkey16.Caption;
   6:
    begin
     sgrid1.Cells[1,j]:=combobox3.Text;
     sgrid1.Cells[2,j]:='and Data0060.so_tp = '+inttostr(combobox3.ItemIndex);
    end;

   end;
  end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
   with aq52 do
   begin
    close;
    for i := 1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-4,sgrid1.Cells[2,i]);
    case rgp3.ItemIndex of
     0:sql.Insert(sql.Count-4,'and data0064.PACKING_SLIP_FLAG=''1''');
     1:sql.Insert(sql.Count-4,'and data0064.PACKING_SLIP_FLAG=''0''');
    end;
    if radiogroup3.ItemIndex<>2 then
     sql.Insert(sql.Count-4,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
    if radiogroup4.ItemIndex<>2 then
     sql.Insert(sql.Count-4,'and data0064.assign_type='+inttostr(radiogroup4.ItemIndex));
    if combobox4.ItemIndex<>combobox4.Items.Count-1 then
     sql.Insert(sql.Count-4,'and data0053.rma_ptr='+inttostr(combobox4.ItemIndex));

    Parameters[0].Value:=
    strtodatetime(datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',dttm1.Time));
    Parameters[1].Value:=
    strtodatetime(datetostr(dtpk2.date)+formatdatetime(' hh:nn:ss',dttm2.Time));    
    open;
   end;
  if aq52.IsEmpty then
   messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0)
  else
   ModalResult:=mrok;
end;

end.
