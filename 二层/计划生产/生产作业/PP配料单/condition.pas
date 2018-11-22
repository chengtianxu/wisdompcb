unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  TfrmCondition = class(TForm)
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
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    procedure ListBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  frmCondition: TfrmCondition;

implementation

uses uDM, common, Pick_Item_Single, ConstVar;

{$R *.dfm}

procedure TfrmCondition.ListBox3Click(Sender: TObject);
begin
  label8.Caption:= listbox3.Items[listbox3.itemindex];
  edit3.Text:= '';
  edit3.Visible:= true;
  edit3.ReadOnly:= false;
  button3.Enabled:= false;
  bitbtn6.Visible:= false;
  combobox1.Visible:= false;

  case listbox3.ItemIndex of
  0:begin
      bitbtn6.Visible:= true; //本厂编号
      RadioGroup1.ItemIndex:=0;
    end;
  1:begin
      bitbtn6.Visible:= true; //工序代码
      RadioGroup1.ItemIndex:=1;
    end;
  2:begin
      bitbtn6.Visible:= true; //作业单号
      RadioGroup1.ItemIndex:=0;
    end;
  end;
end;

procedure TfrmCondition.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
end;

procedure TfrmCondition.Edit3Change(Sender: TObject);
begin
  if trim(edit3.Text) <> '' then
    button3.Enabled:= true
  else
    button3.Enabled:= false;
end;

procedure TfrmCondition.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  column,row: LongInt;  //右键选择stringgrid控件的方法
begin
  if button = mbRight then
  begin
    SGrid1.MouseToCell(x,y,column,row);
    if row <> 0 then
      SGrid1.Row:= row;
  end
  else 
  if button3.Enabled then
    button3.OnClick(sender);
end;

procedure TfrmCondition.N1Click(Sender: TObject);
var
  i:byte;
begin
  for i:= sgrid1.Row to sgrid1.RowCount - 2 do
    sgrid1.Rows[i].Text:= sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:= sgrid1.RowCount - 1;
end;

procedure TfrmCondition.BitBtn2Click(Sender: TObject);
var
  i:byte;
begin
  for i:= 1 to sgrid1.RowCount - 2 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:= 2;
end;

procedure TfrmCondition.update_sgrid(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:= listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid_row]:= trim(edit3.Text);
  case listbox3.ItemIndex of
   0:begin  //本厂编号
       if RadioGroup1.ItemIndex=0 then
         sgrid1.Cells[2,sgrid_row]:=' and t25.MANU_PART_NUMBER like ''%' + edit3.Text + '%'''
       else
         sgrid1.Cells[2,sgrid_row]:=' and t25.MANU_PART_NUMBER = ''' + edit3.Text + '''';
     end;
   1:begin  //工序代码
       if RadioGroup1.ItemIndex=0 then
         sgrid1.Cells[2,sgrid_row]:=' and t34.DEPT_CODE like ''%' + edit3.Text + '%'''
       else
         sgrid1.Cells[2,sgrid_row]:=' and t34.DEPT_CODE = ''' + edit3.Text + '''';
     end;
   2:begin  //作业单号
       if RadioGroup1.ItemIndex=0 then
         sgrid1.Cells[2,sgrid_row]:=' and EXISTS(SELECT 1 FROM Data0732 t732 INNER JOIN Data0006 t6 ON t732.rkey06=t6.RKEY WHERE t731.rkey=t732.rkey731 AND t6.WORK_ORDER_NUMBER like ''%' + edit3.Text + '%'')'
       else
         sgrid1.Cells[2,sgrid_row]:=' and EXISTS(SELECT 1 FROM Data0732 t732 INNER JOIN Data0006 t6 ON t732.rkey06=t6.RKEY WHERE t731.rkey=t732.rkey731 AND t6.WORK_ORDER_NUMBER = ''' + edit3.Text + ''')';
     end;
  end;
end;

procedure TfrmCondition.Button3Click(Sender: TObject);
var
  i:byte;
begin
  for i:= 1 to sgrid1.RowCount - 2 do
  if sgrid1.Cells[0,i] = listbox3.Items[listbox3.itemindex] then
  begin
    self.update_sgrid(i);
    exit;
  end;
  self.update_sgrid(sgrid1.RowCount - 1);
  sgrid1.RowCount:= sgrid1.RowCount + 1;
end;

procedure TfrmCondition.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    if self.ListBox3.ItemIndex = 0 then
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/110,MANU_PART_DESC/客户型号/251';
      InputVar.Sqlstr :=
      'SELECT DISTINCT t25.MANU_PART_NUMBER,t25.MANU_PART_DESC'+#13+
      'FROM Data0025 t25 INNER JOIN Data0038 t38 ON t25.RKEY=t38.SOURCE_PTR'+#13+
      'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'+#13+
//      'INNER JOIN Data0006 t6 ON t25.RKEY=t6.BOM_PTR'+#13+
//      'INNER JOIN Data0056 t56 ON t6.RKEY=t56.WO_PTR'+#13+
      'WHERE t34.TTYPE=1 AND t34.DEPT_NAME LIKE ''%压%'''+#13+
      'ORDER BY t25.MANU_PART_NUMBER';     
      inputvar.InPut_value:=edit3.Text;
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
    if self.ListBox3.ItemIndex = 1 then
    begin
      InputVar.Fields := 'DEPT_CODE/工序代码/110,DEPT_NAME/工序名称/251';
      InputVar.Sqlstr :=
      'SELECT DEPT_CODE,DEPT_NAME FROM dbo.Data0034 WHERE TTYPE=1 AND DEPT_NAME LIKE ''%压%'''+#13+
      'order by DEPT_CODE';
      inputvar.InPut_value:=edit3.Text;
      inputvar.KeyField:='DEPT_CODE';
    end;
    if self.ListBox3.ItemIndex = 2 then
    begin
      InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/251';
      InputVar.Sqlstr :=
      'SELECT WORK_ORDER_NUMBER FROM Data0006 WHERE PROD_STATUS IN(2,3,4)'+#13+
      'UNION'+#13+
      'SELECT DISTINCT Data0006.WORK_ORDER_NUMBER'+#13+
      'FROM DATA0732 INNER JOIN Data0006 ON DATA0732.rkey06=Data0006.RKEY';
      InputVar.InPut_value:=edit3.Text;
      InputVar.KeyField:='WORK_ORDER_NUMBER';
    end;
    InputVar.AdoConn := DM.adoConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if self.ListBox3.ItemIndex = 0 then
        edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER'])
      else if self.ListBox3.ItemIndex = 1 then
        edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'])
      else if self.ListBox3.ItemIndex = 2 then
        edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['WORK_ORDER_NUMBER']);
      button3.SetFocus;
    end
    else
      edit3.SetFocus;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmCondition.SGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if SGrid1.Row = SGrid1.RowCount-1 then
    N1.Enabled:= False
  else
    N1.Enabled:= True;
end;

end.
