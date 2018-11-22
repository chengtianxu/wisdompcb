unit QueFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmQue = class(TForm)
    GroupBox6: TGroupBox;
    Label2: TLabel;
    lblSelectName: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button3: TButton;
    Button4: TButton;
    edtQue: TEdit;
    StaticText2: TStaticText;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    SGrid1: TStringGrid;
    DateTimePicker3: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker4: TDateTimePicker;
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

uses damo;

{$R *.dfm}

procedure  TFrmQue.update2_sgrid(sgrid_row: integer);
begin
  sgrid1.Cells[0, sgrid_row] := listbox3.Items[listbox3.itemindex];
  case listbox3.ItemIndex of
    0:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and employeemsg.employeecode = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row]:='and employeemsg.employeecode like ''%' + edtQue.Text + '%''';
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
      sgrid1.Cells[1, sgrid_row] := ComboBox1.Text;
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select rkey from salaryAccount where accountName = ' + QuotedStr(ComboBox1.Text);
        Open;
      end;
      if ComboBox1.ItemIndex = 0 then
        sgrid1.Cells[2, sgrid_row] := ''
      else
        sgrid1.Cells[2, sgrid_row] := ' and accountid = ' + IntToStr(DM.qrytemp.FieldValues['rkey']);
    end;
    4:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row] := 'and itemname = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row] := 'and itemname like ''%' + edtQue.Text + '%''';
      end;
    end;
    5:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup2.ItemIndex of
          0: sgrid1.Cells[2, sgrid_row] := 'and originaldata = ''' + edtQue.Text + '''';
          1: sgrid1.Cells[2, sgrid_row] := 'and originaldata > ''' + edtQue.Text + '''';
          2: sgrid1.Cells[2, sgrid_row] := 'and originaldata < ''' + edtQue.Text + '''';
          3: sgrid1.Cells[2, sgrid_row] := 'and originaldata like ''%' + edtQue.Text + '%''';
      end;
    end;
    6:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup2.ItemIndex of
          0: sgrid1.Cells[2, sgrid_row] := 'and newdata = ''' + edtQue.Text + '''';
          1: sgrid1.Cells[2, sgrid_row] := 'and newdata > ''' + edtQue.Text + '''';
          2: sgrid1.Cells[2, sgrid_row] := 'and newdata < ''' + edtQue.Text + '''';
          3: sgrid1.Cells[2, sgrid_row] := 'and newdata like ''%' + edtQue.Text + '%''';
      end;
    end;
    7:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row] := 'and EMPLOYEE_NAME = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row] := 'and EMPLOYEE_NAME like ''%' + edtQue.Text + '%''';
      end;
    end;
    8:
    begin
      sgrid1.Cells[1, sgrid_row] := '从 '+datetostr(DateTimePicker3.Date) + ' 到 ' + datetostr(DateTimePicker4.Date);
      sgrid1.Cells[2, sgrid_row] := 'and operate_date >= ''' + datetostr(DateTimePicker3.Date)
        + ''' and operate_date <= ''' + datetostr(DateTimePicker4.Date) + '''';
    end;
    9:
    begin
      sgrid1.Cells[1, sgrid_row] := ComboBox1.Text;
      if ComboBox1.ItemIndex = 0 then
        sgrid1.Cells[2, sgrid_row] := '';
      if ComboBox1.ItemIndex = 1 then
        sgrid1.Cells[2, sgrid_row] := ' and employeemsg.status = 1 ';
      if ComboBox1.ItemIndex = 2 then
        sgrid1.Cells[2, sgrid_row] := ' and employeemsg.status = 2 ';
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
  v_Field_List_CN := VarArrayOf(['员工工号', '姓名', '部门', '帐套类型',
    '项目名称', '原金额', '现金额', '操作人', '操作时间', '是否在职']);
  v_Field_List_EN := VarArrayOf(['employeecode', 'chinesename', 'departmentname', 'accountid',
    'itemname', 'originaldata', 'newdata', 'EMPLOYEE_NAME', 'operate_date', 'employeemsg.status']);
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
    SQL.Text := 'select (cast(year(getdate()) AS nvarchar) + ''-'' + cast(month(getdate()) AS nvarchar) + ''-1'') as endsysdate, '
      + 'dateadd(month,-2, cast(year(getdate()) AS nvarchar) '
      + '+ ''-'' + cast(month(getdate()) AS nvarchar) + ''-1'') as startsysdate';
    Open;
    DateTimePicker1.Date := StrToDate(FieldValues['startsysdate']);
    DateTimePicker2.Date := StrToDate(FieldValues['endsysdate']);
  end;
  ListBox3Click(nil);
end;

procedure TFrmQue.ListBox3Click(Sender: TObject);
var
  i: Integer;
begin
  lblSelectName.Caption := listbox3.Items[listbox3.itemindex]+'：';
  edtQue.Text := '';
  edtQue.Visible := False;
  DateTimePicker3.Visible := False;
  DateTimePicker4.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  RadioGroup1.Visible := False;
  RadioGroup2.Visible := False;
  ComboBox1.Visible := False;

  if ListBox3.ItemIndex = 8 then
  begin
    DateTimePicker3.Visible := True;
    DateTimePicker4.Visible := True;
    Label5.Visible := True;
    Label4.Visible := True;
  end;
  if ListBox3.ItemIndex = 9 then
  begin
    ComboBox1.Clear;
    ComboBox1.Visible := True;
    ComboBox1.Items.Add('----全部----');
    ComboBox1.Items.Add('是');
    ComboBox1.Items.Add('否');
    ComboBox1.Style := csDropDownList;
    ComboBox1.ItemIndex := 0;
  end;
  if ListBox3.ItemIndex = 3 then
  begin
    ComboBox1.Clear;
    ComboBox1.Visible := True;
    ComboBox1.Items.Add('----全部----');
    with dm.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey, accountName from salaryAccount';
      Open;
      First;
      for i := 0 to recordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['accountName']);
        Next;
      end;
    end;
    ComboBox1.Style := csDropDownList;
    ComboBox1.ItemIndex := 0;
  end;
  if ListBox3.ItemIndex in [0,1,2,4,7] then
  begin
    lblSelectName.Visible := True;
    edtQue.Visible := True;
    RadioGroup1.Visible := True;
  end;
  if ListBox3.ItemIndex in [5,6] then
  begin
    lblSelectName.Visible := True;
    edtQue.Visible := True;
    RadioGroup2.Visible := True;
  end;
end;

procedure TFrmQue.Button3Click(Sender: TObject);
begin
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
