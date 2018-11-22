unit QuerySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TfrmQuerySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    edtValue: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValue1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValue1KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
    FAc:array[0..5] of integer;
    FAcNm:array[0..5] of string;
  public
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses  common,uMD;
{$R *.dfm}

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if trim(edtValue.Text)='' then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
    exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
  if ListBox3.ItemIndex = 6 then
  begin
    if edtValue.Text = '计提折旧' then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' =1 '
    else
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' =0 ';
  end else if ListBox3.ItemIndex = 8 then
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+inttostr(FAc[edtValue.ItemIndex])
  else
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.FormShow(Sender: TObject);
var
  i:integer;
begin
  DM.Qery.Close;
  DM.Qery.SQL.Text:='select rkey,abbr_name from data0015 order by 1';
  DM.Qery.Open;
  i:=0;
  while not DM.Qery.Eof do
  begin
    FAc[i]:=DM.Qery.Fields[0].AsInteger;
    FAcNm[i]:=DM.Qery.Fields[1].AsString;
    DM.Qery.Next;
    inc(i);
  end;

  v_Field_List_CN := VarArrayOf(['固定资产卡号','固定资产名称','存放位置','资产类别','规格','使用状态','折旧状态','折旧科目代码','工厂','供应商']);
  v_Field_List_EN := VarArrayOf(['Data0517.FASSET_CODE','Data0517.FASSET_NAME','Data0517.LOCATION','Data0514.FASSET_TYPE','Data0517.FASSET_DESC','Data0516.FASSET_STATUS','Data0516.IN_DEPRECIATION','Data0103.GL_Acc_Number','data0517.warehouse_ptr','data0517.supplier_name']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
end;

procedure TfrmQuerySet.edtValue1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if trim(edtValue.Text)<>'' then
   button3.Enabled:=true
  else
   button3.Enabled:=false;}
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
var i:integer;
begin
//  BitBtn6.visible := (listbox3.ItemIndex = 3) or (listbox3.ItemIndex = 6);
  if (ListBox3.ItemIndex =3) then
  begin
    edtValue.Style := csDropDownList;
    Add_ComBox_List(dm.ads0514,'FASSET_TYPE',edtValue);
  end
  else if ListBox3.ItemIndex = 5 then
  begin
    edtValue.Style := csDropDownList;
    Add_ComBox_List(dm.ads0516,'FASSET_STATUS',edtValue);
  end
  else if ListBox3.ItemIndex = 6 then
  begin
    edtValue.Style := csDropDownList;
    edtValue.Items.Clear;
    edtValue.Items.Add('计提折旧');
    edtValue.Items.Add('不计提折旧');
    edtValue.ItemIndex :=0;
  end else if ListBox3.ItemIndex = 8 then
  begin
    edtValue.Style := csDropDownList;
    edtValue.Items.Clear;
    for i:=0 to 5 do
      if FAcNm[i]<>'' then edtValue.Items.Add(FAcNm[i]) else break;
    edtValue.ItemIndex :=0;
  end
  else
  begin
    if edtValue.Style = csDropDownList then
      edtValue.Items.Clear;
    edtValue.Style := csSimple;
  end;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
end;

procedure TfrmQuerySet.edtValue1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button3Click(sender);
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

end.
