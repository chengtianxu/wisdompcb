unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils, DBGridEh;

type
  TFrm_main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    ADOConnection1: TADOConnection;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dtt1: TDateTimePicker;
    dtt2: TDateTimePicker;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    tmp: TADOQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private

   procedure update_sgrid(sgrid_row: byte);    
  public

  end;

var
  Frm_main: TFrm_main;

implementation

uses common,Frm_detail_u,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init_2(ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
    exit;
  end;
  caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  //user_ptr:='4';
  //vprev:='4';
  //ADOConnection1.Open;

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  dtpk2.Date:=getsystem_date(tmp,1);
  dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
  ListBox3.ItemIndex:=0;
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit3.Visible:=listbox3.ItemIndex in [1..3,7];

  button3.Enabled:=listbox3.ItemIndex in [0,4,5];
  combobox1.Visible:=listbox3.ItemIndex in [0,4,5];
  bitbtn6.Visible:=listbox3.ItemIndex in [1..3,7];
  GroupBox1.Visible:=listbox3.ItemIndex=6;

  case listbox3.ItemIndex of
   0:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('量产');
    combobox1.Items.Add('样板');
    combobox1.ItemIndex:=0;
   end;
   4:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('正式');
    combobox1.Items.Add('备品');
    combobox1.ItemIndex:=0;
   end;
   5:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('自制');
    combobox1.Items.Add('外发');
    combobox1.Items.Add('半制程');
    combobox1.ItemIndex:=0;
   end;
  end;
end;

procedure TFrm_main.Edit3Change(Sender: TObject);
begin
  button3.Enabled:=trim(edit3.Text)<>'' ;
end;

procedure TFrm_main.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TFrm_main.update_sgrid(sgrid_row: byte);
var i:integer;
    s:string;
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex in [1..3] then
    sgrid1.Cells[1,sgrid_row]:=edit3.Text
  else if listbox3.itemindex=6 then
  begin
    s:='';
    for i:=0 to 5 do
      if TCheckBox(GroupBox1.Controls[i]).Checked then s:=s+copy(TCheckBox(GroupBox1.Controls[i]).Caption,1,1)+',';
    sgrid1.Cells[1,sgrid_row]:=copy(s,1,length(s)-1);
  end else
    sgrid1.Cells[1,sgrid_row]:=ComboBox1.Text;

  case listbox3.ItemIndex of
   0:sgrid1.Cells[2,sgrid_row]:=' and data0025.ttype = '+inttostr(ComboBox1.ItemIndex);  //量/样
   1:sgrid1.Cells[2,sgrid_row]:=' and Data0010.CUST_CODE = '''''+Edit3.Text+'''''';
   2:sgrid1.Cells[2,sgrid_row]:='';
   3:sgrid1.Cells[2,sgrid_row]:=' and Data0025.MANU_PART_NUMBER like ''''%'+Edit3.Text+'%''''';
   4:sgrid1.Cells[2,sgrid_row]:=' and ISNULL(dbo.Data0060.so_style, 0) = '+inttostr(ComboBox1.ItemIndex); //正式,备品
   5:sgrid1.Cells[2,sgrid_row]:=' and data0060.so_tp = '+inttostr(ComboBox1.ItemIndex); //自制/外发/半制程0,1,2
   6: begin
        s:='';
        for i:=0 to 5 do
        if TCheckBox(GroupBox1.Controls[i]).Checked then
          s:=s+''''''+copy(TCheckBox(GroupBox1.Controls[i]).Caption,1,1)+''''',';
        sgrid1.Cells[2,sgrid_row]:=' and Data0010.LANGUAGE_FLAG in ('+copy(s,1,length(s)-1)+')';
      end;
   7:sgrid1.Cells[2,sgrid_row]:=' and Data0015.warehouse_CODE = '''''+Edit3.Text+'''''';
  end;
end;

procedure TFrm_main.Button3Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
    self.update_sgrid(i);
    exit;
  end;
 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    1:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                       'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
    2:
    begin
      InputVar.Fields:='group_name/类别代码/200,group_desc/类别名称/250';
      InputVar.Sqlstr:='select rkey,group_name,group_desc from data0496 order by group_name';
      inputvar.KeyField:='group_name';
    end;
    3:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/100,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
    7:
    begin
      InputVar.Fields:='warehouse_CODE/工厂代码/200,abbr_name/工厂简称/200';
      InputVar.Sqlstr:='SELECT rkey,warehouse_CODE, abbr_name from data0015 order by warehouse_CODE';
      inputvar.KeyField:='warehouse_CODE';
    end;
  end;   

  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     1:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     2:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['group_name']);
     3:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     7:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE']);
    end;
    button3.SetFocus;
  end else edit3.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;
 
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
var i:integer;
    select,where,group,order:string;
    sGroupName:string;
begin
 try
  where:='';
  sGroupName:='';
  for i:=1 to sgrid1.RowCount-2 do
     if sgrid1.Cells[2,i]<>'' then where:=where+sgrid1.Cells[2,i]+' ' else sGroupName:=sgrid1.Cells[1,i] ;

  where:='data0060.ENT_DATE >='+''''''+(formatdatetime('yyyy-mm-dd ',dtpk1.Date)+
         formatdatetime('hh:nn:ss',dtt1.DateTime))+''''''+
         ' and data0060.ENT_DATE <='+''''''+(formatdatetime('yyyy-mm-dd ',dtpk2.Date)+
         formatdatetime('hh:nn:ss',dtt2.DateTime))+''''''+where;

  screen.Cursor:=crSQLWait;
  Frm_detail:=TFrm_detail.Create(nil);
  Frm_detail.PageControl1.Pages[0].Caption:='统计类别-'+RadioGroup1.Items[RadioGroup1.ItemIndex];
  Frm_detail.DataSource1.DataSet:=self.tmp;
  tmp.SQL.Text:='exec WZCX026 '''+where+''','''+sGroupName+''','+inttostr(RadioGroup1.ItemIndex);
  tmp.Open;
  for i:=0 to tmp.FieldCount-1 do
     Frm_detail.Eh1.Columns[i].Field:=tmp.Fields[i];

  if RadioGroup1.ItemIndex<2 then  i:=2 else i:=3;
  Frm_detail.Eh1.Columns[i].Footer.fieldname:='总需求';
  Frm_detail.Eh1.Columns[i].Footer.valueType:=fvtSum;

  Frm_detail.Eh1.Columns[3].Visible:=RadioGroup1.ItemIndex<>0;
  Frm_detail.Eh1.Columns[4].Visible:=RadioGroup1.ItemIndex=2;

  Frm_detail.Eh1.Columns[1].Width:=180;
  if RadioGroup1.ItemIndex=2 then Frm_detail.Eh1.Columns[2].Width:=250;
  screen.Cursor:=crDefault;
  Frm_detail.ShowModal;
 finally
  Frm_detail.Free;
 end;
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
    b:boolean;
begin
  b:=false;
  for i:=0 to 5 do
    b:=TCheckBox(GroupBox1.Controls[i]).Checked or b;
  Button3.Enabled:=b;
end;

end.
