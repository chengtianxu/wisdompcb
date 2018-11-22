unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, Buttons, StdCtrls, ComCtrls, ExtCtrls,DateUtils;

type
  TFrmQuery = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StaticText2: TStaticText;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn7: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label3: TLabel;
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iNum,iType:Integer;
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses common,myclass,dmo, PasPublic, Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrmQuery.ListBox3Click(Sender: TObject);
var i:integer;
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3];
  BitBtn7.Visible:=listbox3.ItemIndex in [3];
  ComboBox2.Visible:=listbox3.ItemIndex in [4];
  ComboBox1.Visible:=ListBox3.ItemIndex in [5];
  DateTimePicker3.Visible:=ListBox3.ItemIndex in [6,7];
  DateTimePicker4.Visible:=ListBox3.ItemIndex in [6,7];
  Label3.Visible:=ListBox3.ItemIndex in [6,7];
  if (ListBox3.ItemIndex in [6,7]) then
  begin
    DateTimePicker3.Date:=Now;
    DateTimePicker4.Date:=IncYear(Now,3);
    if (ListBox3.ItemIndex=6) then Label3.Caption:='到有效期时间' else Label3.Caption:='到结案时间'
  end;
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex in [0,1,2,3,4,5,6,7];
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var i:Integer;
begin
  if ListBox3.ItemIndex in [0,1,2,3] then
  begin
    if edtValue.Visible and (trim(edtValue.Text)='') then exit;
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=edtValue.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox3.ItemIndex in [4] then
  begin
    if edtValue.Visible and (trim(edtValue.Text)='') then exit;
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=ComboBox2.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+intToStr(iNum)+'';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+intToStr(iNum)+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [5] then
  begin
    if edtValue.Visible and (trim(edtValue.Text)='') then exit;
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=ComboBox1.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+intToStr(iType)+'';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+intToStr(iType)+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [6] then
  begin
    if edtValue.Visible and (trim(edtValue.Text)='') then exit;
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=DateToStr(DateTimePicker3.Date);
        sgrid1.Cells[2,i]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(DateTimePicker3.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(DateTimePicker4.Date)+'''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=DateToStr(DateTimePicker3.Date);
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(DateTimePicker3.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(DateTimePicker4.Date)+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [7] then
  begin
    if edtValue.Visible and (trim(edtValue.Text)='') then exit;
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=DateToStr(DateTimePicker3.Date);
        sgrid1.Cells[2,i]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(DateTimePicker3.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(DateTimePicker4.Date)+''' and feels_payed=1';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=DateToStr(DateTimePicker3.Date);
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(DateTimePicker3.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(DateTimePicker4.Date)+''' and feels_payed=1';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
end;

procedure TFrmQuery.N1Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount = 2 then
  begin
    sgrid1.Rows[1].Clear;
    Exit;
  end else if sgrid1.RowCount < 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount = 2 then
  begin
    sgrid1.Rows[1].Clear;
    Exit;
  end else if sgrid1.RowCount < 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrmQuery.ComboBox2Change(Sender: TObject);
begin
  if (ComboBox2.ItemIndex=0) then iNum:=1;
  if (ComboBox2.ItemIndex=1) then iNum:=0;
end;

procedure TFrmQuery.ComboBox1Change(Sender: TObject);
begin
  if (ComboBox1.ItemIndex=0) then iType:=0;
  if (ComboBox1.ItemIndex=1) then iType:=1;
end;

procedure TFrmQuery.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case listbox3.ItemIndex of
      3:
      begin
        InputVar.Fields := 'item/培训类型/450';
        InputVar.Sqlstr :='select distinct dbo.datadetail.item from dbo.Employee_Train left join dbo.datadetail on Employee_Train.type_ptr=dbo.datadetail.Rkey';
        inputvar.KeyField:='item';
      end;
    end;
    InputVar.AdoConn:=DM.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['item']);
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

end.
