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
    ListBox2: TListBox;
    StaticText3: TStaticText;
    Label7: TLabel;
    dtpk4: TDateTimePicker;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    dtpk3: TDateTimePicker;
    Label2: TLabel;
    Label6: TLabel;
    BitBtn8: TBitBtn;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox3: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    whouse_ptr:integer;
    procedure update2_sgrid(sgrid_row:integer);
    procedure update_sgrid();
  public

  end;

var
  If_Form1: TIf_Form1;

implementation

uses
  common, DMUnit1,pick_item_single,constvar;

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

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;Rect: TRect; State: TGridDrawState);
begin
  bitbtn4.Enabled:=not (sgrid1.Row=sgrid1.RowCount-1);
end;

procedure TIf_Form1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
var column,row:longint;
begin
 if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if (row>0) and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
 end;
end;

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
var s,s1:string;
begin
 case listbox2.ItemIndex of
 0:begin
     sgrid1.Cells[1,sgrid_row]:=edit2.Text;
     sgrid1.Cells[2,sgrid_row]:=' and data0060.SALES_ORDER LIKE ''%'+trim(edit2.Text)+'%''';
   end;
 1:begin
     sgrid1.Cells[1,sgrid_row]:=edit2.Text;
     sgrid1.Cells[2,sgrid_row]:=' and data0492.CUT_NO LIKE ''%'+trim(edit2.Text)+'%''';
   end;
 2:begin
     sgrid1.Cells[1,sgrid_row]:=edit2.Text;
     sgrid1.Cells[2,sgrid_row]:=' and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit2.Text)+'%''' ;
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
     sgrid1.Cells[1,sgrid_row]:=ComboBox1.Text;
     sgrid1.Cells[2,sgrid_row]:=' and Data0060.STATUS = '+trim(inttostr(ComboBox1.ItemIndex + 1));
   end;
 7:begin //投产类型
    s1:= '';
    s := '';
    if CheckBox1.Checked then
    begin
      s1 := s1 + CheckBox1.Caption  + ';' ;
      if s='' then s := '0'
      else s := s + ',0';
    end;
    if CheckBox2.Checked then
    begin
      s1 := s1 + CheckBox2.Caption + ';'  ;
      if s='' then s := '1'
      else s := s + ',1';
    end;
    if CheckBox3.Checked then
    begin
      s1 := s1 + CheckBox3.Caption  + ';' ;
      if s = '' then s := '2'
      else s := s + ',2';
    end;
    if CheckBox4.Checked then
    begin
      s1 := s1 + CheckBox4.Caption + ';'  ;
      if s = '' then s := '3'
      else s := s + ',3';
    end;
    if CheckBox5.Checked then
    begin
      s1 := s1 + CheckBox5.Caption + ';'  ;
      if s = '' then s := '4'
      else s := s + ',4';
    end;
    s := '('+s+')';
    sgrid1.Cells[1,sgrid_row] := s1;
    sgrid1.Cells[2,sgrid_row]:=' and data0492.ttype in ' + s;
   end;
 8:begin //审核状态
    s1:= '';
    s := '';
    if CheckBox6.Checked then
    begin
      s1 := s1 + CheckBox6.Caption + ';'  ;
      if s = '' then  s := '0'
      else s := s + ',0';
    end;
    if CheckBox7.Checked then
    begin
      s1 := s1 + CheckBox7.Caption + ';'  ;
      if s = '' then s := '1'
      else s := s + ',1';
    end;
    if CheckBox8.Checked then
    begin
      s1 := s1 + CheckBox8.Caption + ';'  ;
      if s = '' then s := '2'
      else s := s + ',2';
    end;
    if CheckBox9.Checked then
    begin
      s1 := s1 + CheckBox9.Caption + ';'  ;
      if s = '' then s := '3'
      else s := s + ',3';
    end;
    s := '('+s+')';
    sgrid1.Cells[1,sgrid_row] := s1;
    sgrid1.Cells[2,sgrid_row]:=' and data0492.TSTATUS in ' + s;
 end;
 9:begin  //工厂代码
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:=' and Data0492.whouse_ptr = '+inttostr(whouse_ptr);
   end ;
 end;

end;

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
begin
  update_sgrid; //新增内容
end;

procedure TIf_Form1.update_sgrid;
var
 i:integer;
begin
 //检查是不是已有加在sgrid1中的内容，没有就增加
 for i:=1 to sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
     (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
   begin
     update2_sgrid(i);
     exit;
   end;
 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
 update2_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin
  label2.Visible:=not (listbox2.ItemIndex in [7,8]);
  label2.Caption:=listbox2.Items[listbox2.itemindex]+'：';
  label6.Visible:=listbox2.ItemIndex=4;
  label7.Visible:=listbox2.ItemIndex=4;
  dtpk3.Visible:=listbox2.ItemIndex=4;
  dtpk4.Visible:=listbox2.ItemIndex=4;
  edit2.Text:='';
  edit2.Visible:=not (listbox2.ItemIndex in [4,6,7,8]);
  bitbtn7.Visible:=listbox2.ItemIndex in [2,5,9];
  bitbtn8.Enabled:=listbox2.ItemIndex in [4,6,7,8];
  ComboBox1.Visible:=listbox2.ItemIndex=6;
  groupbox1.Visible:=listbox2.ItemIndex=7;
  groupbox3.Visible:=listbox2.ItemIndex=8;  
end;

procedure TIf_Form1.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);
end;

procedure TIf_Form1.BitBtn7Click(Sender: TObject);
var inputvar: PDlgInput; //搜索
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    case listbox2.ItemIndex of
    2:
     begin
      inputvar.Fields:='manu_part_number/本厂编号/130,manu_part_desc/客户型号/240';
      inputvar.Sqlstr:='select rkey,manu_part_number,manu_part_desc from data0025 order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
     end;
    5:
     begin
      inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240';
      inputvar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
     end;
    9:
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
    begin
     case listbox2.ItemIndex of
      2:edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['manu_part_number']);
      5:edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
      9:
       begin
         edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
         whouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
       end;
     end;
     Bitbtn8.SetFocus;
    end else edit2.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure TIf_Form1.Edit2Exit(Sender: TObject);
begin  //搜索输入的条件是否存在
  if (trim(edit2.Text)<>'') and (listbox2.ItemIndex in [5,9]) then
  with dm.tmp do
  begin
    Close;
    case listbox2.ItemIndex of
      5:sql.Text:='select cust_code from data0010 where cust_code='''+trim(edit2.text)+'''';
      9:sql.Text:='select rkey,warehouse_code from data0015 where warehouse_code='''+trim(edit2.text)+'''';
    end;
    open;
    if isempty then
    begin
      case listbox2.ItemIndex of
        5:showmessage('找不到您输入的客户代码，请重输！');
        9:showmessage('找不到您输入的工厂代码，请重输！');
      end; //case结束
      edit2.Text:='';
      edit2.SetFocus;
    end
    //else if listbox2.ItemIndex=9 then
      //whouse_ptr:=fieldvalues['rkey'];
  end;
end;
procedure TIf_Form1.Edit2Change(Sender: TObject);
begin
  bitbtn8.Enabled:=trim(edit2.Text)<>'';
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select rkey from data0015 where warehouse_code='''+edit2.Text+'''';
  dm.tmp.Open;
  if not dm.tmp.IsEmpty then
    whouse_ptr:=dm.tmp.FieldValues['rkey']
  else whouse_ptr:=0;
end;

procedure TIf_Form1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then Bitbtn8.SetFocus;
end;

end.

