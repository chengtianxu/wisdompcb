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
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValueKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
    FType:integer;
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common,dm,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
  var InputVar: PDlgInput ;
      s:string;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case ListBox3.ItemIndex of
      3: begin
          InputVar.Fields := 'PROD_code/产品编号/120,Product_name/产品名称/250';
          InputVar.Sqlstr := 'select rKey,PROD_code,Product_name from data0008 order by PROD_code';
          inputvar.KeyField:='PROD_code';
         end;
      6: begin
          InputVar.Fields := 'Cust_Code/客户编号/120,Customer_name/客户名称/250';
          InputVar.Sqlstr := 'select rKey,Cust_Code,Customer_name from data0010 order by Cust_Code';
          inputvar.KeyField:='Cust_Code';
         end;

      7:begin
          InputVar.Fields := 'warehouse_code/工厂编号/80,warehouse_name/工厂名称/200,ABBR_NAME/工厂简称/150';
          InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name,ABBR_NAME from data0015';
          inputvar.KeyField:='';
         end;
      8: begin
          InputVar.Fields := 'Dept_Code/工序代号/120,Dept_Name/工序名称/250';
          InputVar.Sqlstr := 'select rKey,Dept_Code,Dept_Name from data0034 where ttype=''1'' ORDER by dept_code';
          inputvar.KeyField:='Dept_Code';
         end;
    end;

    InputVar.AdoConn := Dmcon.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    case ListBox3.ItemIndex of
       3:edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('PROD_code').AsString;
       6:edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('Cust_Code').AsString;
       7:edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('warehouse_code').AsString;
       8:edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('Dept_Code').AsString;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
  {
  case ListBox3.ItemIndex of
    3 : tmpstr:= Pick_Prod_Type(edtValue.Text,dmcon.ADOConnection1,2);
    6 : tmpstr:=Pick_Cust_ID(edtValue.Text,dmcon.ADOConnection1,2);
    8:begin
        tmpstr:=Pick_Value(edtValue.Text, Dmcon.ADOConnection1, 2,1);
        edtValue.Text := tmpstr;
        Button3.Enabled:= trim(edtValue.Text) <> '';
      end;
    else
      tmpstr:='';
  end;
  if tmpstr <> '' then
    edtValue.Text := tmpstr;
  }

  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if trim(edtValue.Text)='' then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
    exit;
  end;

 if ListBox3.ItemIndex=7 then
 begin
    Dmcon.tmpQry.Close;
    Dmcon.tmpQry.SQL.Text:='select rkey from data0015 where warehouse_code='''+edtValue.Text+'''';
    Dmcon.tmpQry.Open;
    if Dmcon.tmpQry.IsEmpty then
    begin
      showmessage('工厂代码不存在...');
      edtValue.SetFocus;
      exit;
    end ;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and D492.whouse_ptr = '+Dmcon.tmpQry.fields[0].asstring;
 end  else
   sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.FormShow(Sender: TObject);
var
  i:integer;
begin
  if FType=1 then
    v_Field_List_CN := VarArrayOf(['作业单号','本厂编号','客户型号','产品类型','配料单号','订单编号','客户编号','投产工厂','工序'])
   else
    v_Field_List_CN := VarArrayOf(['作业单号','本厂编号','客户型号','产品类型','配料单号','订单编号','客户编号','投产工厂']);
  v_Field_List_EN := VarArrayOf(['d06.work_order_number','d25.MANU_PART_NUMBER','d25.Manu_Part_Desc','D08.Prod_Code','D06.CUT_NO','D492.SO_NO','D10.CUST_Code','D492.whouse_ptr','a.dept_code']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
//  dtpk1.Date := date;//Get_Month_First_Day(date);
//  dtpk2.Date := date;
end;

procedure TfrmQuerySet.edtValueKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edtValue.Text)<>'' then
   button3.Enabled:=true
  else
   button3.Enabled:=false;
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  edtValue.Text:='';
  BitBtn6.visible := listbox3.ItemIndex in [3,6,7,8];
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  Button3.Enabled:=false;
end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button3Click(sender);
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

procedure TfrmQuerySet.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if modalresult <> mrok then exit;
  if dtpk1.Date>dtpk2.Date then
  begin
    ShowMsg('开始日期不能大于结束日期',1);
    canclose:=false;
  end;
end;

end.
