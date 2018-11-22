unit PasQuery578;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, ComCtrls, ExtCtrls, Menus,DateUtils;

type
  TFrmQuery578 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    lab_rkey15: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    ComboBox1: TComboBox;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup2: TRadioGroup;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
   v_Field_List_CN,v_Field_List_EN:Variant;
   sql_text,sql_text2,sql_text3,sql_text4:string;
   sWhere,sWhere2:string;
    { Private declarations }
    procedure update_sgrid(sgrid_row: byte);
    procedure update_sgrid2(sgrid_row: byte);
    procedure update_sgrid3(sgrid_row: byte);
    procedure update_sgrid4(sgrid_row: byte);
  public
    { Public declarations }
    iItem:Integer;
  end;

var
  FrmQuery578: TFrmQuery578;

implementation

uses common,Pick_Item_Single ,ConstVar,PasDM, PasShow578, PasShipment578,
  PasReturn, PasReceipts114;

{$R *.dfm}
procedure TFrmQuery578.update_sgrid4(sgrid_row: byte);
var sWhere,sTex:string;
begin
  sWhere:='';
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  if (listbox3.ItemIndex=0) then
  begin
    sgrid1.Cells[1,sgrid_row]:=trim(Edit1.Text);
    sgrid1.Cells[2,sgrid_row]:='and Data0010.cust_code = '''+Edit1.Text+'''';
//    sTex:='and Data0010.cust_code = '''+Edit1.Text+'''';
//    if (CheckBox1.Checked=True) then sWhere:='dbo.data0114.TTYPE=1';
//    if ((CheckBox2.Checked=True) and (sWhere<>'')) then sWhere:=sWhere+' or dbo.data0114.TTYPE=5' else sWhere:='dbo.data0114.TTYPE=5';
//    if (sWhere<>'') then sgrid1.Cells[2,sgrid_row]:=sTex+' and '+sWhere else sgrid1.Cells[2,sgrid_row]:=sTex;
  end;
end;

procedure TFrmQuery578.update_sgrid3(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex in [0,1,2,3,4,5,6,7] then
    sgrid1.Cells[1,sgrid_row]:=trim(Edit1.Text)
  else if listbox3.itemindex in [8,9,10] then
    sgrid1.Cells[1,sgrid_row]:=ComboBox1.Items[ComboBox1.ItemIndex]
  else
    sgrid1.Cells[1,sgrid_row]:=Edit1.Text+' - '+Edit1.Text;
  case listbox3.ItemIndex of
    0:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER like ''%'+Edit1.Text+'%''';
    end;
    1:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_DESC = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_DESC like ''%'+Edit1.Text+'%''';
    end;
    2:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0097.PO_NUMBER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0097.PO_NUMBER like ''%'+Edit1.Text+'%''';
    end;
    3:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0060.SALES_ORDER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0060.SALES_ORDER like ''%'+Edit1.Text+'%''';
    end;
    4:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE like ''%'+Edit1.Text+'%''';
    end;
    5:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0010.cust_code = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0010.cust_code like ''%'+Edit1.Text+'%''';
    end;
    6:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and d5b.EMPL_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and d5b.EMPL_CODE like ''%'+Edit1.Text+'%''';
    end;
    7:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_CODE like ''%'+Edit1.Text+'%''';
    end;
    8:sgrid1.Cells[2,sgrid_row]:=' and data0060.STATUS= '+InttoStr(ComboBox1.ItemIndex+1)+'';
    9:sgrid1.Cells[2,sgrid_row]:=' and data0025.ttype= '+InttoStr(ComboBox1.ItemIndex)+'';
    10:sgrid1.Cells[2,sgrid_row]:='and Data0098.RMA_STATUS = '+InttoStr(ComboBox1.ItemIndex+1)+'';
  end;
end;

procedure TFrmQuery578.update_sgrid2(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex in [0,1,2,3,4,5,6,7] then
    sgrid1.Cells[1,sgrid_row]:=trim(Edit1.Text)
  else if listbox3.itemindex in [8,9,10] then
    sgrid1.Cells[1,sgrid_row]:=ComboBox1.Items[ComboBox1.ItemIndex]
  else
    sgrid1.Cells[1,sgrid_row]:=Edit1.Text+' - '+Edit1.Text;
  case listbox3.ItemIndex of
    0:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER like ''%'+Edit1.Text+'%''';
    end;
    1:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_DESC = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_DESC like ''%'+Edit1.Text+'%''';
    end;
    2:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0097.PO_NUMBER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0097.PO_NUMBER like ''%'+Edit1.Text+'%''';
    end;
    3:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0060.SALES_ORDER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0060.SALES_ORDER like ''%'+Edit1.Text+'%''';
    end;
    4:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE like ''%'+Edit1.Text+'%''';
    end;
    5:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0010.cust_code = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0010.cust_code like ''%'+Edit1.Text+'%''';
    end;
    6:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and d5b.EMPL_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and d5b.EMPL_CODE like ''%'+Edit1.Text+'%''';
    end;
    7:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_CODE like ''%'+Edit1.Text+'%''';
    end;
    8:sgrid1.Cells[2,sgrid_row]:=' and data0060.STATUS= '+InttoStr(ComboBox1.ItemIndex+1)+'';
    9:sgrid1.Cells[2,sgrid_row]:=' and data0025.ttype= '+InttoStr(ComboBox1.ItemIndex)+'';
    10:sgrid1.Cells[2,sgrid_row]:='and Data0064.assign_type = '+InttoStr(ComboBox1.ItemIndex)+'';
  end;
end;

procedure TFrmQuery578.update_sgrid(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex in [0,1,2,3,4,5,6,7] then
    sgrid1.Cells[1,sgrid_row]:=trim(Edit1.Text)
  else if listbox3.itemindex in [8,9,10] then
    sgrid1.Cells[1,sgrid_row]:=ComboBox1.Items[ComboBox1.ItemIndex]
  else
    sgrid1.Cells[1,sgrid_row]:=Edit1.Text+' - '+Edit1.Text;
  case listbox3.ItemIndex of
    0:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER like ''%'+Edit1.Text+'%''';
    end;
    1:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_DESC = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_DESC like ''%'+Edit1.Text+'%''';
    end;
    2:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0097.PO_NUMBER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0097.PO_NUMBER like ''%'+Edit1.Text+'%''';
    end;
    3:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0060.SALES_ORDER = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0060.SALES_ORDER like ''%'+Edit1.Text+'%''';
    end;
    4:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE like ''%'+Edit1.Text+'%''';
    end;
    5:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0010.cust_code = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0010.cust_code like ''%'+Edit1.Text+'%''';
    end;
    6:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE like ''%'+Edit1.Text+'%''';
    end;
    7:
    begin
      if (RadioGroup2.ItemIndex=0) then
        sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_CODE = '''+Edit1.Text+''''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_CODE like ''%'+Edit1.Text+'%''';
    end;
    8:sgrid1.Cells[2,sgrid_row]:=' and data0060.STATUS= '+InttoStr(ComboBox1.ItemIndex+1)+'';
    9:sgrid1.Cells[2,sgrid_row]:=' and data0025.ttype= '+InttoStr(ComboBox1.ItemIndex)+'';
    10:sgrid1.Cells[2,sgrid_row]:='and Data0060.so_oldnew = '''+ComboBox1.Items[ComboBox1.ItemIndex]+'''';
  end;
end;

procedure TFrmQuery578.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQuery578.FormShow(Sender: TObject);
var i:integer;
begin
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['本厂编号','客户型号','采购单号','销售单号','产品类型','客户代码','销售代表','工厂代码','订单状态','产品属性','订单类型']);
  v_Field_List_EN := VarArrayOf(['Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0097.PO_NUMBER','Data0060.SALES_ORDER','Data0008.PROD_CODE','Data0010.cust_code','Data0005.EMPL_CODE','Data0015.WAREHOUSE_CODE','data0060.STATUS','data0025.ttype','Data0060.so_oldnew']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
  end else ListBox3.ItemIndex:=iItem;
  dtpk1.Date:=Now-1;
  dtpk2.Date:=Now;
  sql_text:=dm.Ado578.SQL.Text;
  sql_text2:=DM.Ado64.SQL.Text;
  sql_text3:=dm.Ado98.SQL.Text;
  sql_text4:=DM.Ado114.SQL.Text;
  sWhere:='';
  sWhere2:='';
end;

procedure TFrmQuery578.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then
  begin
   SGrid1.Rows[1].Clear;
   exit;
  end;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery578.ListBox3Click(Sender: TObject);
begin
  if (RadioButton1.Checked) then
  begin
    label8.Caption:=listbox3.Items[listbox3.itemindex];
    Edit1.Text:='';
    Edit1.Visible:=listbox3.ItemIndex in [0,1,2,3];
    BitBtn6.Visible:=listbox3.ItemIndex in [4,5,6,7];
    ComboBox1.Visible:=listbox3.ItemIndex in [8,9,10];
    if listbox3.ItemIndex=8 then
    begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('有效');
      ComboBox1.Items.Append('暂缓');
      ComboBox1.Items.Append('关闭');
      ComboBox1.Items.Append('完成');
      ComboBox1.Items.Append('取消');
      ComboBox1.Items.Append('未提交');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end else if listbox3.ItemIndex=9 then
    begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('量产');
      ComboBox1.Items.Append('样板');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end else if listbox3.ItemIndex=10 then begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('新单');
      ComboBox1.Items.Append('返单');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end;
    Edit1.Visible:= not ComboBox1.Visible;
    Button3.Enabled:=true;
    iItem:=ListBox3.ItemIndex;
  end;
  if (RadioButton2.Checked) then
  begin
    label8.Caption:=listbox3.Items[listbox3.itemindex];
    Edit1.Text:='';
    Edit1.Visible:=listbox3.ItemIndex in [0,1,2,3];
    BitBtn6.Visible:=listbox3.ItemIndex in [4,5,6,7];
    ComboBox1.Visible:=listbox3.ItemIndex in [8,9,10];
    if listbox3.ItemIndex=8 then
    begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('有效');
      ComboBox1.Items.Append('暂缓');
      ComboBox1.Items.Append('关闭');
      ComboBox1.Items.Append('完成');
      ComboBox1.Items.Append('取消');
      ComboBox1.Items.Append('未提交');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end else if listbox3.ItemIndex=9 then
    begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('量产');
      ComboBox1.Items.Append('样板');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end else if listbox3.ItemIndex=10 then begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('正常');
      ComboBox1.Items.Append('退货');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end;
    Edit1.Visible:= not ComboBox1.Visible;
    Button3.Enabled:=true;
    iItem:=ListBox3.ItemIndex;
  end;
  if (RadioButton3.Checked) then
  begin
    label8.Caption:=listbox3.Items[listbox3.itemindex];
    Edit1.Text:='';
    Edit1.Visible:=listbox3.ItemIndex in [0,1,2,3];
    BitBtn6.Visible:=listbox3.ItemIndex in [4,5,6,7];
    ComboBox1.Visible:=listbox3.ItemIndex in [8,9,10];
    if listbox3.ItemIndex=8 then
    begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('有效');
      ComboBox1.Items.Append('暂缓');
      ComboBox1.Items.Append('关闭');
      ComboBox1.Items.Append('完成');
      ComboBox1.Items.Append('取消');
      ComboBox1.Items.Append('未提交');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end else if listbox3.ItemIndex=9 then
    begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('量产');
      ComboBox1.Items.Append('样板');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end else if listbox3.ItemIndex=10 then begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Append('未提交');
      ComboBox1.Items.Append('待入仓');
      ComboBox1.Items.Append('已入仓');
      ComboBox1.Items.Append('已充帐');
      ComboBox1.ItemIndex:=0;
      Button3.Enabled:=true;
    end;
    Edit1.Visible:= not ComboBox1.Visible;
    Button3.Enabled:=true;
    iItem:=ListBox3.ItemIndex;
  end;
  if (RadioButton4.Checked) then
  begin
    label8.Caption:=listbox3.Items[listbox3.itemindex];
    Edit1.Text:='';
    Edit1.Visible:=True;
    BitBtn6.Visible:=True;
    ComboBox1.Visible:=False;
    Button3.Enabled:=true;
    iItem:=ListBox3.ItemIndex;
  end;
end;

procedure TFrmQuery578.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
    i:integer;
begin
  if ((RadioButton1.Checked=True) or (RadioButton2.Checked=True) or (RadioButton3.Checked=True))  then
  begin
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
    try
      case self.ListBox3.ItemIndex of
        4:
        begin
          InputVar.Fields := 'PROD_CODE/产品类型/100,PRODUCT_NAME/产品类型名称/250';
          InputVar.Sqlstr :='select Rkey,PROD_CODE,PRODUCT_NAME from dbo.data0008 order by PROD_CODE';
          inputvar.KeyField:='PROD_CODE';
        end;
        5:
        begin
          InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户名称/250';
          InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                            'from data0010 order by cust_code';
          inputvar.KeyField:='cust_code';
        end;
        6:
        begin
          InputVar.Fields := 'EMPL_CODE/销售代表/100,EMPLOYEE_NAME/销售代表名称/250';
          InputVar.Sqlstr :='select RKEY,EMPL_CODE,EMPLOYEE_NAME from dbo.data0005 where ACTIVE_FLAG=''Y'' order by EMPL_CODE';
          inputvar.KeyField:='EMPL_CODE';
        end;
        7:
        begin
          InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/250';
          InputVar.Sqlstr :='select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME from dbo.data0015 order by WAREHOUSE_CODE';
          inputvar.KeyField:='WAREHOUSE_CODE';
        end;
      end;

    inputvar.InPut_value:=Edit1.Text;
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if listbox3.ItemIndex in [4] then
      begin
        Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']);
      end else
      if listbox3.ItemIndex in [5] then
      begin
        Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
      end else
      if ListBox3.ItemIndex in [6] then
      begin
        Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
      end else
      if ListBox3.ItemIndex in [7] then
      begin
        Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
      end;
      lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
      button3.SetFocus;
    end
    else
      Edit1.SetFocus;
    finally
     frmPick_Item_Single.adsPick.Close;
     frmPick_Item_Single.Free ;
    end;
  end;
  if (RadioButton4.Checked=True) then
  begin
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
    try
      InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
      inputvar.InPut_value:=Edit1.Text;
      InputVar.AdoConn := DM.ADOConnection1;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
        lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
        button3.SetFocus;
      end
      else
        Edit1.SetFocus;
    finally
     frmPick_Item_Single.adsPick.Close;
     frmPick_Item_Single.Free ;
    end;

  end;
end;

procedure TFrmQuery578.Button3Click(Sender: TObject);
var i:Integer;
begin
  if (RadioButton1.Checked) then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      self.update_sgrid(i);
      exit;
    end;
    self.update_sgrid(sgrid1.RowCount-1);
    sgrid1.RowCount:=sgrid1.RowCount+1;
    SGrid1.Rows[SGrid1.RowCount-1].Clear;
  end;
  if (RadioButton2.Checked) then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      self.update_sgrid2(i);
      exit;
    end;
    self.update_sgrid2(sgrid1.RowCount-1);
    sgrid1.RowCount:=sgrid1.RowCount+1;
    SGrid1.Rows[SGrid1.RowCount-1].Clear;
  end;
  if (RadioButton3.Checked) then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      self.update_sgrid3(i);
      exit;
    end;
    self.update_sgrid3(sgrid1.RowCount-1);
    sgrid1.RowCount:=sgrid1.RowCount+1;
    SGrid1.Rows[SGrid1.RowCount-1].Clear;
  end;
  if (RadioButton4.Checked) then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      self.update_sgrid4(i);
      exit;
    end;
    self.update_sgrid4(sgrid1.RowCount-1);
    sgrid1.RowCount:=sgrid1.RowCount+1;
    SGrid1.Rows[SGrid1.RowCount-1].Clear;
  end;
end;

procedure TFrmQuery578.BitBtn1Click(Sender: TObject);
var i:Integer;
    Sqlstr:string;
    sD1,sD2:string;
begin
  sD1:=formatdatetime('yyyy-MM-dd',dtpk1.DateTime)+' 00:00:00';
  sD2:=formatdatetime('yyyy-MM-dd',dtpk2.DateTime)+' 23:59:59';
  if (RadioButton1.Checked=True) then
  begin
    with DM.Ado578 do
    begin
      close;
      DM.Ado578.SQL.Clear;
      DM.Ado578.SQL.Text:=sql_text;
      for i:=1 to SGrid1.RowCount-2 do
      if sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      SQL.Insert(sql.Count,Sqlstr);
      parameters.ParamByName('vDt1').Value :=sD1;
      parameters.ParamByName('vDt2').Value :=sD2;
      screen.Cursor:=crSQLWait;
      Prepared;
      open;
      screen.Cursor:=crDefault;
    end;
    if FrmShow578=nil then  FrmShow578:=TFrmShow578.Create(Application);
    with TFrmShow578.Create(nil) do
    begin
      if showmodal=mrok then
      begin

      end;
      Free;
    end;
  end;
  if (RadioButton2.Checked=True) then
  begin
    with DM.Ado64 do
    begin
      close;
      DM.Ado64.SQL.Clear;
      DM.Ado64.SQL.Text:=sql_text2;
      for i:=1 to SGrid1.RowCount-2 do
      if sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      SQL.Insert(sql.Count,Sqlstr);
      parameters.ParamByName('vDt1').Value :=sD1;
      parameters.ParamByName('vDt2').Value :=sD2;
      screen.Cursor:=crSQLWait;
      Prepared;
      open;
      screen.Cursor:=crDefault;
    end;
    if FrmShipment578=nil then  FrmShipment578:=TFrmShipment578.Create(Application);
    with TFrmShipment578.Create(nil) do
    begin
      if showmodal=mrok then
      begin

      end;
      Free;
    end;
  end;
  if (RadioButton3.Checked=True) then
  begin
    with DM.Ado98 do
    begin
      close;
      DM.Ado98.SQL.Clear;
      DM.Ado98.SQL.Text:=sql_text3;
      for i:=1 to SGrid1.RowCount-2 do
      if sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      SQL.Insert(sql.Count,Sqlstr);
      parameters.ParamByName('vDt1').Value :=sD1;
      parameters.ParamByName('vDt2').Value :=sD2;
      screen.Cursor:=crSQLWait;
      Prepared;
      open;
      screen.Cursor:=crDefault;
    end;
    if FrmReturn=nil then  FrmReturn:=TFrmReturn.Create(Application);
    with TFrmReturn.Create(nil) do
    begin
      if showmodal=mrok then
      begin

      end;
      Free;
    end;
  end;
  if (RadioButton4.Checked=True) then
  begin
    with DM.Ado114 do
    begin
      close;
      DM.Ado114.SQL.Clear;
      DM.Ado114.SQL.Text:=sql_text4;
//      ShowMessage(sgrid1.Cells[2,1]);
//      if (Trim(sgrid1.Cells[2,1])='') then
//      begin
//        ShowMsg('请选择客户！',1);
//        Exit;
//      end;
      if ((CheckBox1.Checked=false) and (CheckBox2.Checked=false)) then
      begin
        ShowMsg('请选择收款类型！',1);
        Exit;
      end;
      if (CheckBox1.Checked) then sWhere:='dbo.data0114.TTYPE=1' else sWhere:='';
      if (CheckBox2.Checked) then sWhere2:='dbo.data0114.TTYPE=5' else sWhere2:='';
      if ((sWhere<>'') and (sWhere2='')) then SQL.Insert(SQL.Count,' and '+sWhere);
      if ((sWhere2<>'') and (sWhere='')) then  SQL.Insert(SQL.Count,Sqlstr+' and '+sWhere2);
      if ((sWhere<>'') and (sWhere2<>'')) then SQL.Insert(SQL.Count,' and ('+sWhere);
      if ((sWhere2<>'') and (sWhere<>'')) then SQL.Insert(SQL.Count,Sqlstr+' or '+sWhere2+')');
      for i:=1 to SGrid1.RowCount-2 do
      if sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      SQL.Insert(sql.Count,Sqlstr);
      parameters.ParamByName('vDt1').Value :=sD1;
      parameters.ParamByName('vDt2').Value :=sD2;
      screen.Cursor:=crSQLWait;
      Prepared;
      open;
      screen.Cursor:=crDefault;
    end;
    if FrmReceipts=nil then  FrmReceipts:=TFrmReceipts.Create(Application);
    with TFrmReceipts.Create(nil) do
    begin
      if showmodal=mrok then
      begin

      end;
      Free;
    end;
  end;
end;

procedure TFrmQuery578.RadioGroup2Click(Sender: TObject);
begin
  Button3Click(Self);
end;

procedure TFrmQuery578.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

// rkey73:='851';
// user_ptr := '963';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrmQuery578.RadioButton1Click(Sender: TObject);
var i:integer;
begin
  SGrid1.RowCount:=2;
  SGrid1.Rows[1].Clear;
  dtpk1.Date:=Now-1;
  dtpk2.Date:=Now;
  RadioGroup2.Visible:=True;
  Label4.Caption:='订单日期从：';
  GroupBox2.Visible:=False;
  ListBox3.Height:=167;
    listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['本厂编号','客户型号','采购单号','销售单号','产品类型','客户代码','销售代表','工厂代码','订单状态','产品属性','订单类型']);
  v_Field_List_EN := VarArrayOf(['Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0097.PO_NUMBER','Data0060.SALES_ORDER','Data0008.PROD_CODE','Data0010.cust_code','Data0005.EMPL_CODE','Data0015.WAREHOUSE_CODE','data0060.STATUS','data0025.ttype','Data0060.so_oldnew']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
   ListBox3Click(nil);
end;

procedure TFrmQuery578.RadioButton2Click(Sender: TObject);
var i:integer;
begin
  SGrid1.RowCount:=2;
  SGrid1.Rows[1].Clear;
  dtpk1.Date:=Now-1;
  dtpk2.Date:=Now;
  RadioGroup2.Visible:=True;
  Label4.Caption:='指派日期从：';
  GroupBox2.Visible:=False;
  ListBox3.Height:=167;
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['本厂编号','客户型号','采购单号','销售单号','产品类型','客户代码','销售代表','工厂代码','订单状态','产品属性','指派类型']);
  v_Field_List_EN := VarArrayOf(['Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0097.PO_NUMBER','Data0060.SALES_ORDER','Data0008.PROD_CODE','Data0010.cust_code','d5b.EMPL_CODE','Data0015.WAREHOUSE_CODE','data0060.STATUS','data0025.ttype','Data0064.assign_type']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
   ListBox3Click(nil);
end;

procedure TFrmQuery578.RadioButton3Click(Sender: TObject);
var i:integer;
begin
  SGrid1.RowCount:=2;
  SGrid1.Rows[1].Clear;
  dtpk1.Date:=StartOfTheMonth(Now);
  dtpk2.Date:=EndOfTheMonth(Now);
  Label4.Caption:='退货日期从：';
  RadioGroup2.Visible:=True;
  GroupBox2.Visible:=False;
  ListBox3.Height:=167;
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['本厂编号','客户型号','采购单号','销售单号','产品类型','客户代码','销售代表','工厂代码','订单状态','产品属性','退货状态']);
  v_Field_List_EN := VarArrayOf(['Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0097.PO_NUMBER','Data0060.SALES_ORDER','Data0008.PROD_CODE','Data0010.cust_code','d5b.EMPL_CODE','Data0015.WAREHOUSE_CODE','data0060.STATUS','data0025.ttype','Data0098.RMA_STATUS']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
   ListBox3Click(nil);
end;

procedure TFrmQuery578.RadioButton4Click(Sender: TObject);
var i:integer;
begin
  SGrid1.RowCount:=2;
  SGrid1.Rows[1].Clear;
  dtpk1.Date:=StartOfTheMonth(Now);
  dtpk2.Date:=EndOfTheMonth(Now);
  RadioGroup2.Visible:=False;
  Label4.Caption:='票据日期从：';
  GroupBox2.Visible:=True;
  GroupBox2.Top:=90;
  GroupBox2.Left:=16;
  ListBox3.Height:=40;
  listbox3.Items.Clear;
  Label8.Caption:='客户代码';
  v_Field_List_CN := VarArrayOf(['客户代码']);
  v_Field_List_EN := VarArrayOf(['Data0010.cust_code']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
   ListBox3Click(nil);
end;

procedure TFrmQuery578.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) then sWhere:='dbo.data0114.TTYPE=1' else sWhere:='';
end;

procedure TFrmQuery578.CheckBox2Click(Sender: TObject);
begin
  if (CheckBox2.Checked) then sWhere2:='dbo.data0114.TTYPE=5' else sWhere2:='';
end;

end.
