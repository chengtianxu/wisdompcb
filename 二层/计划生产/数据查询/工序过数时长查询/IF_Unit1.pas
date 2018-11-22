unit IF_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids,DateUtils;

type
  TIf_Form1 = class(TForm)
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    StaticText3: TStaticText;
    Label7: TLabel;
    dtpk4: TDateTimePicker;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    dtpk3: TDateTimePicker;
    Label2: TLabel;
    Label6: TLabel;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    dtpk1: TDateTimePicker;
    Label4: TLabel;
    dtpk2: TDateTimePicker;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    warehouse_ptr:integer;
    procedure update2_sgrid(sgrid_row:integer);
  public
    { Public declarations }
  end;

var
  If_Form1: TIf_Form1;

implementation

uses
dmunit1,constvar,pick_item_single;

{$R *.dfm}

procedure TIf_Form1.BitBtn5Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TIf_Form1.BitBtn4Click(Sender: TObject);
var i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then  //只允许删除倒数第一行之前的行
   bitbtn4.Enabled:=false
 else bitbtn4.Enabled:=true;
end;

procedure TIf_Form1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var column,row:longint;
begin
  if button=mbright then
  begin
    SGrid1.MouseToCell(x,y,column,row);
    if (row>0) and (row<sgrid1.RowCount-1) then
      SGrid1.Row:=row;
  end;
end;

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
begin
 case listbox1.ItemIndex of
 0:begin //订单号 //更新2列记录，用于向存取过程输入参数用的
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:=' and data0060.SALES_ORDER LIKE ''%'+trim(edit2.Text)+'%''';
   end;
 1:begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:=' and data0492.CUT_NO LIKE ''%'+trim(edit2.Text)+'%''';
   end;
 2:begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:=' and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
   end;
 3:begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:=' and Data0025.MANU_PART_DESC like ''%'+trim(edit2.Text)+'%''';
   end;
 4:begin
    sgrid1.Cells[1,sgrid_row]:='从'+datetostr(dtpk3.Date)+'到'+datetostr(dtpk4.Date);
    sgrid1.Cells[2,sgrid_row]:=' and Data0060.ENT_DATE >= '''+datetostr(dtpk3.date)+
                             ''' and Data0060.ENT_DATE <= '''+datetostr(dtpk4.date+1)+'''';
   end;
 5:begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:=' and Data0010.CUST_CODE like ''%'+trim(edit2.Text)+'%''';
   end;
 6:begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:=' and Data0492.whouse_ptr='+inttostr(warehouse_ptr);
   end;
 end;  //case结束
end;

procedure TIf_Form1.BitBtn2Click(Sender: TObject);
var i:integer;
begin  //检查是不是已有加在sgrid1中的内容，没有就增加
 for i:=1 to sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex]) and
     (sgrid1.Cells[1,i]<>listbox1.Items[listbox1.ItemIndex]) then
   begin
     update2_sgrid(i);
     exit;
   end;
 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox1.Items[listbox1.itemindex];
 update2_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TIf_Form1.ListBox1Click(Sender: TObject);
begin
 edit2.Text:='';
 label2.Caption:=listbox1.Items[listbox1.itemindex]+'：';
 label2.Visible:=not (listbox1.ItemIndex=4);
 label6.Visible:=listbox1.ItemIndex=4;
 label7.Visible:=listbox1.ItemIndex=4;
 dtpk3.Visible:=listbox1.ItemIndex=4;
 dtpk4.Visible:=listbox1.ItemIndex=4;
 edit2.Visible:=not (listbox1.ItemIndex=4);
 bitbtn1.Visible:=listbox1.ItemIndex in [5,6];
 bitbtn2.Enabled:=listbox1.ItemIndex=4;
end;

procedure TIf_Form1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit2.Text)<>'' then
    bitbtn2.Enabled:=true
  else bitbtn2.Enabled:=false;
end;

procedure TIf_Form1.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox1.ItemIndex:=0;
  listbox1click(sender);
end;

procedure TIf_Form1.BitBtn1Click(Sender: TObject);
var inputvar: PDlgInput; //搜索
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    case listbox1.ItemIndex of
    5:
     begin
      inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240';
      inputvar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
     end;
    6:
     begin
      inputvar.Fields:='warehouse_code/工厂代码/130,warehouse_name/工厂名称/240';
      inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name from data0015 order by warehouse_code';
      inputvar.KeyField:='warehouse_code';
     end;
    end;
    inputvar.InPut_value:=edit2.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    case listbox1.ItemIndex of
    5:
     begin
      edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
      bitbtn2.Enabled:=true;
      bitbtn2.SetFocus;
     end;
    6:
     begin
      edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
      warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
      bitbtn2.Enabled:=true;
      bitbtn2.SetFocus;
     end;
    end
    else edit2.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure TIf_Form1.FormCreate(Sender: TObject);
begin
  //self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  //self.BorderStyle  := bsSingle;
  //self.Position := poScreenCenter;
end;

procedure TIf_Form1.Edit2Change(Sender: TObject);
begin
  with dm.aqtmp do
  begin
    sql.Text:='select rkey from data0015 where warehouse_code='''+trim(edit2.Text)+'''';
    open;
    if not isempty then
      warehouse_ptr:=fieldvalues['rkey']
    else warehouse_ptr:=0;
    close;
  end;
end;

procedure TIf_Form1.Edit2Exit(Sender: TObject);
begin
  if (trim(edit2.Text)<>'') and (listbox1.ItemIndex in [5,6]) then
  with dm.aqtmp do
  begin
    case listbox1.itemindex of
     5:sql.Text:='select rkey from data0010 where cust_code='''+trim(edit2.Text)+'''';
     6:sql.Text:='select rkey from data0015 where warehouse_code='''+trim(edit2.Text)+'''';
    end;
    open;
    if isempty then
    begin
      case listbox1.itemindex of
       5:showmessage('客户代码输入错误，请重新输入！');
       6:showmessage('工厂代码输入错误，请重新输入！');
      end;
      edit2.Text:='';
      edit2.SetFocus;
      bitbtn2.Enabled:=false;
    end;
    close;
  end;
end;

procedure TIf_Form1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then bitbtn2.SetFocus;
end;

end.
