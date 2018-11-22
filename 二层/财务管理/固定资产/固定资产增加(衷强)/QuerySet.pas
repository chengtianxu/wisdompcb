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
    edtValue: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox1: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValueKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
    FAc:array[0..5] of integer;
  public
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common, DM;
{$R *.dfm}

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if listbox3.itemindex <4 then
    if trim(edtValue.Text)='' then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
    exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex <4 then
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end
  else
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:= ComboBox1.Text;
    if listbox3.itemindex=6 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+inttostr(FAc[ComboBox1.ItemIndex])
    else
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' +QuotedStr(ComboBox1.Text);
  end; 
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.FormShow(Sender: TObject);
var
  i:integer;
begin
  v_Field_List_CN := VarArrayOf(['固定资产卡号','固定资产名称','存放位置','规格','资产类别','增加方式','工厂']);
  v_Field_List_EN := VarArrayOf(['Data0517.FASSET_CODE','Data0517.FASSET_NAME','Data0517.LOCATION','Data0517.FASSET_DESC','Data0514.FASSET_TYPE','Data0515.FASSET_ALT_TYPE','d15.rkey']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
end;

procedure TfrmQuerySet.edtValueKeyUp(Sender: TObject; var Key: Word;
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
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex <4;
  ComboBox1.Visible := not edtValue.Visible;
  if listbox3.ItemIndex = 4 then
  begin
    dmcon.qryTmp2.close;
    dmcon.qryTmp2.SQL.Clear;
    dmcon.qryTmp2.SQL.Add('select Fasset_Type from data0514 ');
    dmcon.qryTmp2.open;
    Add_ComBox_List(dmcon.qryTmp2,'Fasset_Type',comboBox1);
  end
  else if listbox3.ItemIndex = 5 then
  begin
    dmcon.qryTmp2.close;
    dmcon.qryTmp2.SQL.Clear;
    dmcon.qryTmp2.SQL.Add('select Fasset_ALT_Type from data0515 where Alt_Flag=0 ');
    dmcon.qryTmp2.open;
    Add_ComBox_List(dmcon.qryTmp2,'Fasset_ALT_Type',comboBox1);
  end else if listbox3.ItemIndex = 6 then
  begin
    ComboBox1.Items.Clear; 
    dmcon.tmp.close;
    dmcon.tmp.sql.text:='select rkey,abbr_name from data0015 order by 1';
    dmcon.tmp.open;
    i:=0 ;
    while not dmcon.tmp.eof do
    begin
      ComboBox1.Items.Append(dmcon.tmp.fields[1].asstring);
      FAc[i]:=dmcon.tmp.fields[0].asinteger;
      inc(i);
      dmcon.tmp.next;
    end;
    if i>0 then ComboBox1.itemindex:=0;
  end;
end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
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
