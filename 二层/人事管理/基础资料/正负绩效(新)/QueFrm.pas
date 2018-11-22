unit QueFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, ComCtrls, StdCtrls, ExtCtrls, Damo;

type
  TFrmQue = class(TForm)
    GroupBox6: TGroupBox;
    lblSelectName: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button3: TButton;
    Button4: TButton;
    edtQue: TEdit;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN, v_Field_List_EN: Variant;
    procedure update_sgrid;
    procedure update2_sgrid(sgrid_row: integer);
  public
    { Public declarations }
  end;

var
  FrmQue: TFrmQue;

implementation

{$R *.dfm}

procedure  TFrmQue.update2_sgrid(sgrid_row: integer);
begin
  sgrid1.Cells[0, sgrid_row] := listbox3.Items[listbox3.itemindex];
  case listbox3.ItemIndex of
    0:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and employeecode = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row]:='and employeecode like ''%' + edtQue.Text + '%''';
      end;
    end;
    1:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and chinesename = ''' + edtQue.Text+'''';
        1:sgrid1.Cells[2, sgrid_row]:='and chinesename like ''%' + edtQue.Text + '%''';
      end;
    end;
    2:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and departmentname = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row]:='and departmentname like ''%' + edtQue.Text + '%''';
      end;
    end;
    3:
    begin
      SGrid1.Cells[1, sgrid_row] := ComboBox1.Text;
      SGrid1.Cells[2, sgrid_row] := ' and flag = ' + IntToStr(ComboBox1.ItemIndex);
    end;
    4:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup2.ItemIndex of
          0: sgrid1.Cells[2, sgrid_row] := 'and money = ''' + edtQue.Text + '''';
          1: sgrid1.Cells[2, sgrid_row] := 'and money > ''' + edtQue.Text + '''';
          2: sgrid1.Cells[2, sgrid_row] := 'and money < ''' + edtQue.Text + '''';
          3: sgrid1.Cells[2, sgrid_row] := 'and money like ''%' + edtQue.Text + '%''';
      end;
    end;
  end;
end;

procedure TFrmQue.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
  begin
    if (sgrid1.Cells[0,i] = listbox3.Items[listbox3.ItemIndex]) and (sgrid1.Cells[1,i] <> listbox3.Items[listbox3.ItemIndex])
    then
    begin
      update2_sgrid(i);
      exit;
    end;
  end;
  //更新0列记录
  sgrid1.Cells[0, sgrid1.RowCount-1] := listbox3.Items[listbox3.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount := sgrid1.RowCount +1;
end;

procedure TFrmQue.FormCreate(Sender: TObject);
var
  i: Integer;
begin

  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['员工工号', '姓名', '部门', '绩效指向',
     '绩效得分']);
  v_Field_List_EN := VarArrayOf(['employeecode', 'chinesename', 'departmentname', 'detailrkey',
    'money']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  sgrid1.ColWidths[2]:= -1;
  ListBox3.ItemIndex := 0;
  with DM.qrytemp do
  begin
    Close;
    SQl.Clear;
    SQL.Text := 'select convert(varchar(8),getdate(),120)+''01'' as startsysdate, '
      + 'convert(varchar(10), dateadd(day,-1,convert(varchar(8), dateadd(m,1,getdate()),120)+''1''),120) as endsysdate';
    Open;
    DateTimePicker1.Date := StrToDate(FieldValues['startsysdate']);
    DateTimePicker2.Date := StrToDate(FieldValues['endsysdate']);

  end;
  ListBox3Click(nil);
end;

procedure TFrmQue.ListBox3Click(Sender: TObject);
begin
  lblSelectName.Caption := listbox3.Items[listbox3.itemindex]+'：';
  edtQue.Text := '';
  edtQue.Visible := False;
  RadioGroup1.Visible := False;
  RadioGroup2.Visible := False;
  ComboBox1.Visible := False;
  if ListBox3.ItemIndex in [0,1,2] then
  begin
    lblSelectName.Visible := True;
    edtQue.Visible := True;
    RadioGroup1.Visible := True;
  end;
  if ListBox3.ItemIndex in [3] then
  begin
    lblSelectName.Visible := True;
    edtQue.Visible := True;
    ComboBox1.Visible := True;
  end;
  if ListBox3.ItemIndex in [4] then
  begin
    lblSelectName.Visible := True;
    edtQue.Visible := True;
    RadioGroup2.Visible := True;
  end;
end;

procedure TFrmQue.Button3Click(Sender: TObject);
begin
  if  ((trim(self.edtQue.Text)='')  and (edtque.Visible=true) ) then  exit;


  update_sgrid;
end;

procedure TFrmQue.Button4Click(Sender: TObject);
var
  i: byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i := sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text := sgrid1.Rows[i+1].Text;
  sgrid1.RowCount := sgrid1.RowCount-1;
end;

procedure TFrmQue.BitBtn4Click(Sender: TObject);
var
 i: byte;
begin
 for i := 1 to sgrid1.RowCount-1 do sgrid1.Rows[i].Clear;
 sgrid1.RowCount := 2;
end;

end.
