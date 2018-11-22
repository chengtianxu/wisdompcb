unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, Buttons, StdCtrls, ComCtrls, ExtCtrls;

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
    dtt1: TDateTimePicker;
    dtt2: TDateTimePicker;
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    iIndex:Integer;
    { Public declarations }
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses common,myclass,PasDM,PasPublic,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrmQuery.ListBox3Click(Sender: TObject);
var i:integer;
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,4];
  BitBtn7.Visible:=listbox3.ItemIndex in [0,1,2,4];
  edtValue.Text:='';
  ComboBox2.Visible:=ListBox3.ItemIndex in [3];
  Button3.Enabled:= listbox3.ItemIndex in [0,1,2,3,4];
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var
 i:byte;
 sTp:string;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  if listbox3.ItemIndex in [0,1,2,4] then
  begin
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
  end;
  if listbox3.ItemIndex in [3] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=ComboBox2.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+ComboBox2.Text+'%''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+ComboBox2.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrmQuery.N1Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrmQuery.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case listbox3.ItemIndex of
      0:
      begin
        InputVar.Fields := 'sName/产线类型/350';
        InputVar.Sqlstr :='select sName from data0198 order by Rkey';
        inputvar.KeyField:='sName';
      end;
      1:
      begin
        InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/150,MANU_PART_DESC/客户型号/200';
        InputVar.Sqlstr :='select rkey,MANU_PART_NUMBER '+
                          'from data0025 order by rkey';
        inputvar.KeyField:='MANU_PART_NUMBER';
      end;
      2:
      begin
        InputVar.Fields := 'DEPT_CODE/工序代码/150,DEPT_NAME/工序名称/250';
        InputVar.Sqlstr :='select rkey,DEPT_CODE,DEPT_NAME from data0034 where TTYPE=1 order by rkey';
        inputvar.KeyField:='DEPT_CODE';
      end;
      4:
      begin
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/150,ABBR_NAME/工厂简称/250';
        InputVar.Sqlstr :='select rkey,WAREHOUSE_CODE,ABBR_NAME from data0015 order by rkey';
        inputvar.KeyField:='WAREHOUSE_CODE';
      end;
    end;
    InputVar.AdoConn:=DM.ADOConnection;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if listbox3.ItemIndex in [0] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['sName']);
      if ListBox3.ItemIndex in [1] then                               
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
      if ListBox3.ItemIndex in [2] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']);
      if ListBox3.ItemIndex in [4] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmQuery.FormShow(Sender: TObject);
begin
  iIndex:=0;
end;

procedure TFrmQuery.BitBtn1Click(Sender: TObject);
begin
  iIndex:=ListBox3.ItemIndex;
end;

end.
