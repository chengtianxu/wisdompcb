unit QueFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmQue = class(TForm)
    Label3: TLabel;
    Label1: TLabel;
    grp1: TGroupBox;
    LblSelectName: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    radiogroup1: TRadioGroup;
    radiogroup2: TRadioGroup;
    listbox3: TListBox;
    txt1: TStaticText;
    btn1: TButton;
    btn2: TButton;
    edtQue: TEdit;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    txt2: TStaticText;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    SGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure listbox3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
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

uses Damo;

{$R *.dfm}

procedure  TFrmQue.update2_sgrid(sgrid_row: integer);
begin
  sgrid1.Cells[0, sgrid_row] := listbox3.Items[listbox3.itemindex];
  case listbox3.ItemIndex of
    0:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and ExTernal_No = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row]:='and ExTernal_No like ''%' + edtQue.Text + '%''';
      end;
    end;
    1:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and Cut_no = ''' + edtQue.Text+'''';
        1:sgrid1.Cells[2, sgrid_row]:='and Cut_no like ''%' + edtQue.Text + '%''';
      end;
    end;
    2:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and PROD_CODE = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row]:='and PROD_CODE like ''%' + edtQue.Text + '%''';
      end;
    end;
    3:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row]:='and PRODUCT_NAME = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row]:='and PRODUCT_NAME like ''%' + edtQue.Text + '%''';
      end;
    end;
    4:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row] := 'and CUSTOMER_NAME = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row] := 'and CUSTOMER_NAME like ''%' + edtQue.Text + '%''';
      end;
    end;
    5:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row] := 'and Dept_Name = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row] := 'and Dept_Name like ''%' + edtQue.Text + '%''';
      end;
    end;
    6:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2, sgrid_row] := 'and SUPPLIER_NAME = ''' + edtQue.Text + '''';
        1:sgrid1.Cells[2, sgrid_row] := 'and SUPPLIER_NAME like ''%' + edtQue.Text + '%''';
      end;
    end;
    7:    
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtQue.Text);
      case radiogroup2.ItemIndex of
          0: sgrid1.Cells[2, sgrid_row] := 'and Price = ''' + edtQue.Text + '''';
          1: sgrid1.Cells[2, sgrid_row] := 'and Price > ''' + edtQue.Text + '''';
          2: sgrid1.Cells[2, sgrid_row] := 'and Price < ''' + edtQue.Text + '''';
          3: sgrid1.Cells[2, sgrid_row] := 'and Price like ''%' + edtQue.Text + '%''';
      end;
    end;
    8:
    begin
      sgrid1.Cells[1, sgrid_row] := '从 '+datetostr(DateTimePicker3.Date) + ' 到 ' + datetostr(DateTimePicker4.Date);
      sgrid1.Cells[2, sgrid_row] := 'and FinishDate >= ''' + datetostr(DateTimePicker3.Date)
        + ''' and FinishDate <= ''' + datetostr(DateTimePicker4.Date) + '''';
    end;
    9:
    begin

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
  v_Field_List_CN := VarArrayOf(['外发编号', '生产单号', '产品编码', '产品名称',
    '客户名称', '责任部门', '供应商名称', '外发价格',  '预计完工日期']);
  v_Field_List_EN := VarArrayOf(['ExTernal_No', 'Cut_no', 'PROD_CODE', 'PRODUCT_NAME',
    'CUSTOMER_NAME', 'Dept_Name', 'SUPPLIER_NAME', 'Price', 'FinishDate']);
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
    SQL.Text := 'select convert(varchar(100), getdate()-30,  23) as startsysdate, '
      + ' convert(varchar(100), getdate(),  23) as endsysdate';
    Open;
    DateTimePicker1.Date := StrToDate(FieldValues['startsysdate']);
    DateTimePicker2.Date := StrToDate(FieldValues['endsysdate']);
    DateTimePicker3.Date := StrToDate(FieldValues['startsysdate']);
    DateTimePicker4.Date := StrToDate(FieldValues['endsysdate']);
  end;
  ListBox3Click(nil);
end;

procedure TFrmQue.listbox3Click(Sender: TObject);
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

  if ListBox3.ItemIndex in [0,1,2,3,4,5,6] then
  begin
    lblSelectName.Visible := True;
    edtQue.Visible := True;
    RadioGroup1.Visible := True;
  end;

  if ListBox3.ItemIndex = 7 then
  begin
    lblSelectName.Visible := True;
    edtQue.Visible := True;  
    RadioGroup2.Visible := True;
  end;

  if ListBox3.ItemIndex = 8 then
  begin
    DateTimePicker3.Visible := True;
    DateTimePicker4.Visible := True;
    Label5.Visible := True;
    Label4.Visible := True;
  end;
end;

procedure TFrmQue.btn1Click(Sender: TObject);
begin
  update_sgrid;
end;

procedure TFrmQue.btn2Click(Sender: TObject);
var
  i: byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i := sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text := sgrid1.Rows[i+1].Text;
  sgrid1.RowCount := sgrid1.RowCount-1;
end;

procedure TFrmQue.btn4Click(Sender: TObject);
var
 i: byte;
begin
 for i := 1 to sgrid1.RowCount-1 do sgrid1.Rows[i].Clear;
 sgrid1.RowCount := 2;
end;

end.
