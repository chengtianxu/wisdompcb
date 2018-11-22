unit contion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ExtCtrls, StdCtrls, Buttons, ComCtrls,DateUtils;

type
  TForm_contion = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    RadioGroup3: TRadioGroup;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure update_sgrid(sgrid_row: byte);
  public
    { Public declarations }
  end;

var
  Form_contion: TForm_contion;

implementation
uses Pick_Item_Single ,ConstVar,common, main, DB;
{$R *.dfm}

procedure TForm_contion.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;
procedure TForm_contion.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);

end;

procedure TForm_contion.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';

edit3.Visible:=not ((listbox3.itemindex=2) or (listbox3.itemindex=3)
   or (listbox3.itemindex=10));

RadioGroup3.Visible:=Edit3.Visible;
groupbox1.Visible:=(listbox3.itemindex=2) or (listbox3.itemindex=3);

ComboBox1.Visible:=(listbox3.itemindex=10);

button3.Enabled:=not edit3.Visible;


end;

procedure TForm_contion.Edit3Change(Sender: TObject);
begin
  if trim(edit3.Text)<>'' then
    button3.Enabled:=true
  else
    button3.Enabled:=false;
end;

procedure TForm_contion.BitBtn4Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:= 'EMPLOYEE_NAME/截数人员/100,cut_date/期末日期/180,ent_date/操作日期/180';
  InputVar.Sqlstr:= 'SELECT  dbo.DATA0162.cut_date, dbo.Data0005.EMPLOYEE_NAME,'+
  ' dbo.DATA0162.ent_date, dbo.DATA0162.rkey '+
  'FROM         dbo.DATA0162 INNER JOIN'+
  '   dbo.Data0005 ON dbo.DATA0162.user_ptr = dbo.Data0005.RKEY '+
  'order by  DATA0162.cut_date';

  InputVar.AdoConn := Form_main.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('cut_date').AsString;
   Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
   label2.Caption:=frmPick_Item_Single.adsPick.fieldbyname('EMPLOYEE_NAME').AsString;
  end
  else
   begin

   end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure TForm_contion.BitBtn1Click(Sender: TObject);
begin
 if Edit1.Tag < 1 then
   ShowMsg('请确定查询的期末日期!',1)
 else
  ModalResult:=mrOk;
end;

procedure TForm_contion.N1Click(Sender: TObject);
var i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_contion.SGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   SGrid1.MouseToCell(x,y,column,row);
   if row<>0 then SGrid1.Row:=row;
 end;
end;

procedure TForm_contion.PopupMenu1Popup(Sender: TObject);
begin
if SGrid1.Row = SGrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;

procedure TForm_contion.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit3.Text);
 case listbox3.ItemIndex of
 0:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and CUST_CODE = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and DCUST_CODE <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and CUST_CODE like ''%'+edit3.Text+'%''';
  end;

 1:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and invoice_number = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and invoice_number <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and invoice_number like ''%'+edit3.Text+'%''';
  end;

 2:
  begin
    sgrid1.Cells[1,sgrid_row]:='从'+
    formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+'到'+
    formatdatetime('yyyy-mm-dd ',self.dtpk2.Date);
    sgrid1.Cells[2,sgrid_row]:=
    ' and POSTED_DATE >= '+
    quotedstr(formatdatetime('yyyy-mm-dd ',self.dtpk1.Date))+
    ' and POSTED_DATE <= '+
    quotedstr(formatdatetime('yyyy-mm-dd ',self.dtpk2.Date));
  end;

 3:
  begin
    sgrid1.Cells[1,sgrid_row]:='从'+
    formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+'到'+
    formatdatetime('yyyy-mm-dd ',self.dtpk2.Date);
    sgrid1.Cells[2,sgrid_row]:=
    ' and INVOICE_TOTAL >= '+
    quotedstr(formatdatetime('yyyy-mm-dd ',self.dtpk1.Date))+
    ' and INVOICE_TOTAL <= '+
    quotedstr(formatdatetime('yyyy-mm-dd ',self.dtpk2.Date));
  end;

 4:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and PO_NUMBER = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and PO_NUMBER <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and PO_NUMBER like ''%'+edit3.Text+'%''';
  end;

 5:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and MANU_PART_NUMBER = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and MANU_PART_NUMBER <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and MANU_PART_NUMBER like ''%'+edit3.Text+'%''';
  end;

 6:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and MANU_PART_DESC = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and MANU_PART_DESC <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and MANU_PART_DESC like ''%'+edit3.Text+'%''';
  end;

 7:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and ANALYSIS_CODE_2 = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and ANALYSIS_CODE_2 <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and ANALYSIS_CODE_2 like ''%'+edit3.Text+'%''';
  end;

 8:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and delivery_no = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and delivery_no <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and delivery_no like ''%'+edit3.Text+'%''';
  end;

 9:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and SALES_ORDER = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and SALES_ORDER <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and SALES_ORDER like ''%'+edit3.Text+'%''';
  end;
 10:
  begin
   sgrid1.Cells[1,sgrid_row]:=ComboBox1.Items[ComboBox1.itemindex];
   sgrid1.Cells[2,sgrid_row]:='and invoicetype = '''+ComboBox1.Items[ComboBox1.itemindex]+'''';
  end;
 11:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and ORIG_CUSTOMER = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and ORIG_CUSTOMER <> '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and ORIG_CUSTOMER like ''%'+edit3.Text+'%''';
  end;

 end;  //end case

end;

procedure TForm_contion.Button3Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
   begin
    self.update_sgrid(i);
    exit;
   end;
 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm_contion.FormCreate(Sender: TObject);
begin
  dtpk2.Date:=Date();
  dtpk1.Date:=StartOfTheMonth(dtpk2.Date);
end;

end.
