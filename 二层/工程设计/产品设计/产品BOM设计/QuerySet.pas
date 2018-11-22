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
    Edit1: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox1: TListBox;
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
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common,dm,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case listbox1.ItemIndex of
    0:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    1,2:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;
    3:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;

  end;
  InputVar.AdoConn := dmcon.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case listbox1.ItemIndex of
     0:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
     1:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
     2:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_desc']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
     3:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if (trim(Edit1.Text)='') and (listbox1.itemindex<>4) then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex] then
  begin
    exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox1.Items[listbox1.itemindex];
  if ListBox1.ItemIndex<>4 then
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=Edit1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[listbox1.ItemIndex]+' LIKE ''%'+Edit1.Text+'%''';
  end else begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup1.Items[RadioGroup1.itemindex];
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[listbox1.ItemIndex]+'='+inttostr(RadioGroup1.itemindex);
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(Edit1.Text)<>'' then
   button3.Enabled:=true
  else
   button3.Enabled:=false;
end;

procedure TfrmQuerySet.ListBox1Click(Sender: TObject);
begin
  Edit1.Text:='';
  Label8.Caption := listbox1.Items[listbox1.ItemIndex];
  RadioGroup1.Visible:=listbox1.ItemIndex=4;
  Button3.Enabled:=RadioGroup1.Visible;
end;

procedure TfrmQuerySet.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var
  i:integer;
begin
  v_Field_List_CN := VarArrayOf(['客户代码','本厂编号','客户型号','工厂代码','产品属性']);
  v_Field_List_EN := VarArrayOf(['D10.CUST_CODE','D25.MANU_PART_NUMBER','D25.MANU_PART_DESC','d15.WAREHOUSE_CODE','d25.ttype']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox1.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox1.ItemIndex := 2;
  listbox1.OnClick(sender);
end;

end.
