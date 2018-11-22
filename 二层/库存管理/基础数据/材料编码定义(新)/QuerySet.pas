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
    ComboBox2: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;

    group_ptr:integer;
    procedure update_sgrid(sgrid_row:byte);
  public
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common,invtype_search,damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TfrmQuerySet.Button3Click(Sender: TObject);
//-----------------2017-
var
 i:byte;
begin
  if (listbox3.itemindex<=6) and
     (Trim(edtValue.Text)='') then  exit;

  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
   {
  if ListBox3.ItemIndex<=6 then
    if trim(edtValue.Text)='' then exit;
  for i:=1 to sgrid1.RowCount-1 do
  begin
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    if ListBox3.ItemIndex<=6 then
      sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text
    else
      SGrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
    if ListBox3.ItemIndex=8 then SGrid1.Cells[1,sgrid1.RowCount-1]:=Trim(ComboBox2.Text);
    if listbox3.itemindex <5 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
    if (ListBox3.ItemIndex=5) or (ListBox3.ItemIndex=6) then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+inttostr(group_ptr);
    if ListBox3.ItemIndex=7 then
    begin
      if Trim(ComboBox1.Text)='是' then
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and isnull('+ v_Field_List_En[ListBox3.ItemIndex]+',0)=1'
      else
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and isnull('+v_Field_List_En[ListBox3.ItemIndex]+',0)=0';
    end;
    if ListBox3.ItemIndex=8 then
    begin
      if Trim(ComboBox2.Text)='A' then
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and '+ v_Field_List_En[ListBox3.ItemIndex]+'=''A'''
      else if Trim(ComboBox2.Text)='B' then
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''B'''
      else if Trim(ComboBox2.Text)='C' then
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''C'''
      else if Trim(ComboBox2.Text)='D' then
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''D'''
      else if Trim(ComboBox2.Text)='E' then
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''E''';
    end;
    if ListBox3.ItemIndex>8 then
    begin
      if Trim(ComboBox1.Text)='是' then
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and isnull('+ v_Field_List_En[ListBox3.ItemIndex]+',''N'')=''Y'''
      else
        SGrid1.Cells[2,SGrid1.RowCount-1]:=' and isnull('+ v_Field_List_En[ListBox3.ItemIndex]+',''N'')=''N''';
    end;
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  }

end;


procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  edtValue.Text:='';
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  if (ListBox3.ItemIndex=5) or (ListBox3.ItemIndex=6) then
    BitBtn6.Visible:=True
  else
    BitBtn6.Visible:=False;
  ComboBox1.Visible:=ListBox3.ItemIndex in[7,9,10,11,12];
  ComboBox2.Visible:=ListBox3.ItemIndex=8;
  edtValue.Visible:=ListBox3.ItemIndex<=6;
  edtValue.Enabled := listbox3.ItemIndex<5;
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
  if  sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
      sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
      sgrid1.RowCount:=sgrid1.RowCount-1;
  if  SGrid1.Row =SGrid1.RowCount-1 then
      SGrid1.Row :=1;      //如果删除的是最后一行，则选中第一行
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var
 InputVar: PDlgInput ;
begin
if listbox3.ItemIndex=5 then
 try
 Form_invtype:=TForm_invtype.Create(nil);
 Form_invtype.ShowModal;
 if Form_invtype.ModalResult=mrok then
 begin
   if  not Form_invtype.ADOQuery1.IsEmpty then
   begin
     edtValue.Text:=Form_invtype.ADOQuery1.fieldbyname('group_desc').AsString;
     group_ptr:=Form_invtype.ADOQuery1.fieldbyname('rkey').AsInteger;
   end;
 end;
 finally
    Form_invtype.Free;
 end
else
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='inv_group_name/组别代码/110,inv_group_desc/组别名称/251';
  InputVar.Sqlstr:='SELECT data0019.rkey,Data0019.inv_group_name, Data0019.inv_group_desc'+#13+
  'FROM dbo.Data0019 order by Data0019.inv_group_name';
  inputvar.KeyField:='inv_group_name';
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
     edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('inv_group_name').AsString;
     group_ptr:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
  end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure TfrmQuerySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<>SGrid1.RowCount-1);
end;

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var
  i:integer;
begin
  v_Field_List_CN := VarArrayOf(['材料编码','材料名称','原材料描述',
                                 '规格','制造商代码','材料类别','材料组别','是否重要材料','材料重要性分类','是否检验','是否停止采购','是否要认可供应商','是否需要环保测试报告']);
  v_Field_List_EN := VarArrayOf(['Data0017.INV_PART_NUMBER','Data0017.INV_NAME',
   'Data0017.INV_PART_DESCRIPTION','Data0017.INV_DESCRIPTION',
   'Data0017.MANUFACTURER_CODE','Data0017.group_ptr','data0496.group_ptr',
   'Data0017.CRITICAL_MATL_FLAG','Data0017.MODIFY_ENGG_RTE_CODE','Data0017.INSPECT','Data0017.STOP_PURCH','Data0017.AVL_FLAG','Data0017.CATALOG_NUM']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible:=True;
  ComboBox1.Visible:=False;
  ComboBox2.Visible:=False;
end;

procedure TfrmQuerySet.update_sgrid(sgrid_row: byte);
begin

 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];

 case   ListBox3.ItemIndex of
//  0,1:
//  begin
//    if  rgType.ItemIndex = 0 then
//    begin
//      sgrid1.Cells[1,sgrid_row]:=' like '+edtValue.Text;
//      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%'''
//    end
//     else
//     begin
//      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
//      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''' ;
//    end;
// end;
  0,1,2,3,4:
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
    sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+ ' LIKE ''%'+edtValue.Text+'%''';
  end;

  5,6:
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
    sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+ IntToStr(group_ptr);
  end;


  7:
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+ComboBox1.Text;
      if Trim(ComboBox1.Text)='是' then
      SGrid1.Cells[2,sgrid_row]:=' and isnull('+ v_Field_List_En[ListBox3.ItemIndex]+',0)=1'
    else
      SGrid1.Cells[2,sgrid_row]:=' and isnull('+v_Field_List_En[ListBox3.ItemIndex]+',0)=0';
  end;

  8:
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+ComboBox2.Text;
    if Trim(ComboBox2.Text)='A' then
      SGrid1.Cells[2,sgrid_row]:=' and '+ v_Field_List_En[ListBox3.ItemIndex]+'=''A'''
    else if Trim(ComboBox2.Text)='B' then
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''B'''
    else if Trim(ComboBox2.Text)='C' then
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''C'''
    else if Trim(ComboBox2.Text)='D' then
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''D'''
    else if Trim(ComboBox2.Text)='E' then
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_En[ListBox3.ItemIndex]+'=''E''';
  end;

  9,10,11,12:
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+ComboBox1.Text;
    if Trim(ComboBox1.Text)='是' then
      SGrid1.Cells[2,sgrid_row]:=' and isnull('+ v_Field_List_En[ListBox3.ItemIndex]+',''N'')=''Y'''
    else
      SGrid1.Cells[2,sgrid_row]:=' and isnull('+ v_Field_List_En[ListBox3.ItemIndex]+',''N'')=''N''';
  end;
 end;


end;

end.
