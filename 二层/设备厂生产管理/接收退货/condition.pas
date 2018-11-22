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

uses common, Pick_Item_Single, ConstVar, damo;

{$R *.dfm}

procedure TfrmCondition.ListBox3Click(Sender: TObject);
begin
  label8.Caption:= listbox3.Items[listbox3.itemindex];
  edit3.Text:= '';
  edit3.Visible:= true;
  edit3.ReadOnly:= false;
  button3.Enabled:= false;
  bitbtn6.Visible:= false;

  case listbox3.ItemIndex of
  0:  ;                       //退货编号
  1:  bitbtn6.Visible:= true; //客户代码
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
   0:  //合同号
    sgrid1.Cells[2,sgrid_row]:=' and RMA_NUMBER like ''%' + edit3.Text + '%''';
   1:  //客户代码
    sgrid1.Cells[2,sgrid_row]:=' and CUST_CODE = ''' + edit3.Text + '''';
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
  if self.ListBox3.ItemIndex = 1 then  //客户代码
  begin
    try
      InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                          'abbr_name/简称/125';
      InputVar.Sqlstr :=
      'SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+#13+
      'data0010.abbr_name FROM dbo.Data0010'+#13+
      'order by cust_code';
      inputvar.InPut_value:=edit3.Text;
      inputvar.KeyField:='CUST_CODE';
      InputVar.AdoConn := dm.ADOConn;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
        button3.SetFocus;
      end
      else
        edit3.SetFocus;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free;
    end;
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
