unit QuerySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TfrmQuerySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    rgType: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label3: TLabel;
    DTPD1: TDateTimePicker;
    DTPT1: TDateTimePicker;
    DTPD2: TDateTimePicker;
    DTPT2: TDateTimePicker;
    Label1: TLabel;
    Button4: TButton;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure edtValueExit(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_EN:Variant;
    warehouse_ptr:integer;
    procedure update_sgrid(sgrid_now:byte);
  public
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses main,common,constvar,pick_item_single;
{$R *.dfm}

procedure TfrmQuerySet.update_sgrid(sgrid_now:byte);
begin
  sgrid1.Cells[0,sgrid_now]:=listbox3.Items[listbox3.itemindex];
  case listbox3.itemindex of
  0,1,2,3,4:
   begin
    sgrid1.Cells[1,sgrid_now]:=edtValue.Text;
    sgrid1.Cells[2,sgrid_now]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+
                               ' LIKE ''%'+edtValue.Text+'%''';
   end;
  5:
   begin
    sgrid1.Cells[1,sgrid_now]:=rgType.Items[rgType.itemindex];
    sgrid1.Cells[2,sgrid_now]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+
                               ' = ' +IntToStr(rgType.ItemIndex);
   end;
  6:
   begin
    sgrid1.Cells[1,sgrid_now]:=edtValue.Text;
    sgrid1.Cells[2,sgrid_now]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+inttostr(warehouse_ptr);
   end;
  end; //case结束
end;

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var inputvar: PDlgInput; //搜索
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    case listbox3.ItemIndex of
    2:
     begin
      inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240';
      inputvar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
     end;
    4:
     begin
      inputvar.Fields:='prod_code/产品类型代码/130,product_name/产品类型名称/240';
      inputvar.Sqlstr:='select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField:='prod_code';
     end;
    6:
     begin
      inputvar.Fields:='warehouse_code/工厂代码/100,warehouse_name/工厂名称/200,ABBR_NAME/简称/100';
      inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name,ABBR_NAME from data0015 order by warehouse_code';
      inputvar.KeyField:='warehouse_code';
     end;
    end;
    inputvar.InPut_value:=edtvalue.Text;
    inputvar.AdoConn:=frmmain.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    begin
      case listbox3.ItemIndex of
      2:edtvalue.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
      4:edtvalue.Text:=trim(frmpick_item_single.adsPick.FieldValues['prod_code']);
      6:edtvalue.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
      end;
      button3.Enabled:=true;
      button3.SetFocus;
    end
    else edtvalue.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var i:byte;
begin
  if listbox3.itemindex in [0,1,2,3,4,6] then
    if trim(edtValue.Text)='' then exit;
  for i:=1 to sgrid1.RowCount-1 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      update_sgrid(i);
      exit;
    end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TfrmQuerySet.FormShow(Sender: TObject);
begin
  v_Field_List_EN := VarArrayOf(['D25.MANU_PART_NUMBER','D25.MANU_PART_DESC','D10.CUST_CODE',
                    'D10.CUSTOMER_Name','D08.Prod_Code','D25.TType','D25.prod_route_ptr']);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.ItemIndex:=0;
  self.ListBox3click(sender);
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  edtValue.Text:='';
  BitBtn6.visible :=listbox3.ItemIndex in [2,4,6];
  rgType.Visible :=listbox3.ItemIndex = 5;
  edtValue.Visible:= listbox3.ItemIndex in [0,1,2,3,4,6];
  Label8.Caption := listbox3.Items[listbox3.ItemIndex]+'：';
end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button3.SetFocus;
end;

procedure TfrmQuerySet.edtValueChange(Sender: TObject);
begin
  if (listbox3.ItemIndex=6) and (trim(edtvalue.Text)<>'') then
  with frmmain.aqtmp do
  begin
    sql.Text:='select rkey from data0015 where warehouse_code='''+trim(edtValue.Text)+'''';
    open;
    if not isempty then
      warehouse_ptr:=fieldvalues['rkey']
    else warehouse_ptr:=0;
    close;
  end;
end;

procedure TfrmQuerySet.edtValueExit(Sender: TObject);
begin
  if (trim(edtValue.Text)<>'') and (listbox3.ItemIndex in [2,4,6]) then
  with frmmain.AQTMP do
  begin
    case listbox3.itemindex of
     2:sql.Text:='select rkey from data0010 where cust_code='''+trim(edtValue.Text)+'''';
     4:sql.Text:='select rkey from data0008 where prod_code='''+trim(edtValue.Text)+'''';
     6:sql.Text:='select rkey from data0015 where warehouse_code='''+trim(edtValue.Text)+'''';
    end;
    open;
    if isempty then
    begin
      case listbox3.itemindex of
       2:showmessage('客户代码输入错误，请重新输入！');
       4:showmessage('产品类型输入错误，请重新输入！');
       6:showmessage('工厂代码输入错误，请重新输入！');
      end;
      edtValue.Text:='';
      edtValue.SetFocus;
    end;
    close;
  end;
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
   sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TfrmQuerySet.N1Click(Sender: TObject);
var i:byte;
begin
 if sgrid1.Row = sgrid1.RowCount-1 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-1 do
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 if sgrid1.RowCount <= 2 then exit;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

end.
