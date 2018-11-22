unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  TForm_condition = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
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
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    procedure ListBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  Form_condition: TForm_condition;

implementation

uses common,Pick_Item_Single ,ConstVar, damo;

{$R *.dfm}

procedure TForm_condition.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
button3.Enabled:=false;
bitbtn6.Visible:=false;
radiogroup3.Visible:=true;

case listbox3.ItemIndex of
 0,1:bitbtn6.Visible:=true;

 2:;
 3:;
 4:;
 5:;
 6:bitbtn6.Visible:=true;

 end;
end;

procedure TForm_condition.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
end;

procedure TForm_condition.Edit3Change(Sender: TObject);
begin
  if trim(edit3.Text)<>'' then
    button3.Enabled:=true
  else button3.Enabled:=false;
end;

procedure TForm_condition.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) and (button3.Enabled=true) then
   button3.SetFocus;
end;

procedure TForm_condition.SGrid1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    SGrid1.MouseToCell(x,y,column,row);
    if row<>0 then SGrid1.Row:=row;
  end;
end;

procedure TForm_condition.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_condition.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TForm_condition.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit3.Text);
 case listbox3.ItemIndex of
 0:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE > '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE <> '''+edit3.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE like ''%'+edit3.Text+'%''';
  end;
 1:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_number = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_number > '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_number <> '''+edit3.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_number like ''%'+edit3.Text+'%''';
  end;
 2:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_desc = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_desc > '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_desc <> '''+edit3.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_desc like ''%'+edit3.Text+'%''';
  end;

 3:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0025.ANALYSIS_CODE_2 = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0025.ANALYSIS_CODE_2 > '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0025.ANALYSIS_CODE_2 <> '''+edit3.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0025.ANALYSIS_CODE_2 like ''%'+edit3.Text+'%''';
  end;
 4:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0153.PO_NUMBER = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0153.PO_NUMBER > '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0153.PO_NUMBER <> '''+edit3.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0153.PO_NUMBER like ''%'+edit3.Text+'%''';
  end;
 5:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0439.delivery_no = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0439.delivery_no > '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0439.delivery_no <> '''+edit3.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0439.delivery_no like ''%'+edit3.Text+'%''';
  end;

 6:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE = '''+edit3.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE > '''+edit3.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE <> '''+edit3.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE like ''%'+edit3.Text+'%''';
  end;

 end;  //end case

end;


procedure TForm_condition.Button3Click(Sender: TObject);
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


procedure TForm_condition.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
 try
  case self.ListBox3.ItemIndex of
  0:
  begin
    InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
    InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
    'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
    inputvar.KeyField:='CUST_CODE';
  end;
  1:
  begin
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
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
      'where data0025.PARENT_PTR is null'+#13+
      'order by dbo.Data0025.MANU_PART_NUMBER';

    inputvar.KeyField:='MANU_PART_NUMBER';
  end;

  6:
  begin
    InputVar.Fields:='EMPL_CODE/员工代码/110,EMPLOYEE_NAME/员工姓名/200,abbr_name/简称/100';
    InputVar.Sqlstr:='SELECT dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,'+
    'data0005.ABBR_NAME FROM dbo.Data0005 order  by empl_code';
    inputvar.KeyField:='EMPL_CODE';
  end;

  end;//end case
  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     1:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     6:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
    end;
    button3.SetFocus;
  end
  else edit3.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

end.
