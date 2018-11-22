unit QFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ComCtrls, ADODB, Menus;

type
  TfrmQ = class(TForm)
    GroupBox6: TGroupBox;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    edtValue: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
     procedure update_sgrid;
     procedure update2_sgrid(sgrid_row: integer);
  public
    { Public declarations }
  end;

var
  frmQ: TfrmQ;

implementation

uses dm,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmQ.FormShow(Sender: TObject);
var
  i: Integer;
  QueryTmp: TADOQuery;
begin
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['生产单号','工时日期','输入日期','输入人员','部门']);
  v_Field_List_EN := VarArrayOf([' data0492.cut_no ', ' WZCP0072.work_date ', ' WZCP0072.ent_date ', ' data05ent.employee_name ','data0034.dept_code']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  sgrid1.ColWidths[2]:= -1;
  ListBox3.ItemIndex := 0;
  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := damo.ADOConnection1;
  with QueryTmp do
  begin
    close;
    SQL.Clear;
    sql.Text:='select (select dateadd(dd,-day(getdate())+1,getdate())) as startdate,  '
      + '(select   dateadd(dd,-day(getdate()),dateadd(m,1,getdate()))) as enddate ';
    open;
    DateTimePicker1.DateTime :=  StrToDateTime(fieldvalues['startdate']);
    DateTimePicker2.DateTime :=  StrToDateTime(fieldvalues['enddate']);
  end;
  QueryTmp.Free;
  DateTimePicker1.Visible := False;
  DateTimePicker2.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  edtValue.Visible := True;
  edtValue.Clear;
end;

procedure TfrmQ.ListBox3Click(Sender: TObject);
begin
  if ListBox3.ItemIndex in [0,3,4] then
  begin
    DateTimePicker1.Visible := False;
    DateTimePicker2.Visible := False;
    Label1.Visible := False;
    Label2.Visible := False;
    edtValue.Visible := True;
  end
  else
  begin
    DateTimePicker1.Visible := True;
    DateTimePicker2.Visible := True;
    Label1.Visible := True;
    Label2.Visible := True;
    edtValue.Visible := False;
  end;
  
  if ListBox3.ItemIndex = 4 then BitBtn1.Visible := True
  else BitBtn1.Visible := False;

end;

procedure TfrmQ.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
     if (sgrid1.Cells[0,i]=listbox3.Items[listbox3.ItemIndex]) and
        (sgrid1.Cells[1,i]<>listbox3.Items[listbox3.ItemIndex]) then
         begin
             update2_sgrid(i);
             exit;
         end;
  //更新0列记录
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure  TfrmQ.update2_sgrid(sgrid_row: integer);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  case listbox3.ItemIndex of
    0:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtValue.Text);
      sgrid1.Cells[2, sgrid_row]:=' and data0492.cut_no = '''+ edtValue.Text +'''';
    end;
    1:
    begin
      sgrid1.Cells[1,sgrid_row] := '从 ' + datetostr(DateTimePicker1.Date) + ' 到 ' + datetostr(DateTimePicker2.Date);
      sgrid1.Cells[2,sgrid_row] := ' and WZCP0072.work_date >= ''' + datetostr(DateTimePicker1.Date)
        +''' and WZCP0072.work_date <= ''' + datetostr(DateTimePicker2.Date) + '''';
    end;
    2:
    begin
      sgrid1.Cells[1,sgrid_row] := '从 ' + datetostr(DateTimePicker1.Date) + ' 到 ' + datetostr(DateTimePicker2.Date);
      sgrid1.Cells[2,sgrid_row] := ' and WZCP0072.ent_date >= ''' + DateTimetostr(DateTimePicker1.DateTime)
        +''' and WZCP0072.ent_date <= ''' + DateTimetostr(DateTimePicker2.Date) + '''';
    end;
    3:
    begin
      sgrid1.Cells[1,sgrid_row] := trim(edtValue.Text);
      sgrid1.Cells[2, sgrid_row]:= ' and data05ent.employee_name = '''+ edtValue.Text +'''';
    end;
    4:
    begin
      sgrid1.Cells[1, sgrid_row] := trim(edtValue.Text);
      sgrid1.Cells[2, sgrid_row] := ' and wzcp0072.rkey in '
        + ' (select wzcp0073.rkey_cp72 from wzcp0073 '
        + ' inner join data0005 on wzcp0073.usr_ptr=data0005.rkey '
        + ' inner join data0034 on data0005.employee_id=data0034.rkey where data0034.dept_code= '+ QuotedStr(edtValue.Text) +
          ' group by wzcp0073.rkey_cp72 )';
    end;
    5:
    begin
      sgrid1.Cells[1,sgrid_row] := trim(edtValue.Text);
      sgrid1.Cells[2, sgrid_row]:= ' and wzcp0072.status = '''+ edtValue.Text +'''';
    end;
  end;
end;

procedure TfrmQ.Button3Click(Sender: TObject);
begin
  update_sgrid;
end;

procedure TfrmQ.Button4Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQ.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TfrmQ.N1Click(Sender: TObject);
var
  i: byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQ.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'dept_code/产品编码/120,dept_name/产品名称/250,';
    InputVar.Sqlstr :='select rkey,dept_code,dept_name from data0034 where dept_code in(''05'',''07'',''21'',''37'',''31'',''44'')';
    InputVar.AdoConn := DM.damo.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['dept_code'];
      edtValue.Tag :=  frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmQ.FormCreate(Sender: TObject);
begin
  with damo.qryTemp do
  begin
    close;
    SQL.Clear;
    sql.Text:='select (select dateadd(dd,-day(getdate())+1,getdate())) as startdate,  '
      + '(select   dateadd(dd,-day(getdate()),dateadd(m,1,getdate()))) as enddate ';
    open;
    DateTimePicker1.DateTime :=  StrToDateTime(fieldvalues['startdate']);
    DateTimePicker2.DateTime :=  StrToDateTime(fieldvalues['enddate']);
  end;
end;

end.
