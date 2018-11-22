unit Usel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, ComCtrls, Buttons, Menus;

type
  TForm_sel = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Panel5: TPanel;
    Panel4: TPanel;
    ListBox3: TListBox;
    Splitter1: TSplitter;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    SGrid1: TStringGrid;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label6: TLabel;
    BitBtn5: TBitBtn;
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_sel: TForm_sel;

implementation

uses damo,common,Pick_Item_Single,ConstVar, supp_search;

{$R *.dfm}

procedure TForm_sel.ListBox3Click(Sender: TObject);
begin
 Label4.Caption := listbox3.Items[listbox3.ItemIndex];
 Edit1.Text:='';
 Label5.Caption:='';
 if ListBox3.ItemIndex=4 then ComboBox1.Visible:=True else ComboBox1.Visible:=False;
 if ListBox3.ItemIndex=6 then
 begin
  ComboBox2.Visible:=True;
  Label6.Visible:=True;
 end
 else
 begin
  ComboBox2.Visible:=False;
  Label6.Visible:=False;
  end;
end;

procedure TForm_sel.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 case ListBox3.ItemIndex of
  0:
  begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'PO_NUMBER/采购单号/200,CONFIRMATION_NUMBER/确定人员/200';
    InputVar.Sqlstr := 'SELECT RKEY, PO_NUMBER, CONFIRMATION_NUMBER FROM data0070 ORDER BY RKEY DESC';
    InputVar.AdoConn :=DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['PO_NUMBER'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;

  1:
  begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'CODE/供应商代码/200,SUPPLIER_NAME/供应商名称/200';
    InputVar.Sqlstr := 'SELECT CODE,SUPPLIER_NAME FROM data0023';
    InputVar.AdoConn :=DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['SUPPLIER_NAME'];
     label5.Caption := frmPick_Item_Single.adsPick.FieldValues['SUPPLIER_NAME'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;

  2:
  begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'EMPL_CODE/创建人员工号/200,EMPLOYEE_NAME/创建人员姓名/200';
    InputVar.Sqlstr := 'SELECT  RKEY, EMPL_CODE, EMPLOYEE_NAME FROM Data0005 WHERE BUYER_FLAG=''y''';
    InputVar.AdoConn :=DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     Edit1.Text:= frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME'];
     Edit1.Tag:= frmPick_Item_Single.adsPick.FieldValues['RKEY']
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
  
  3:
  begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/200,ABBR_NAME/工厂名称/200';
    InputVar.Sqlstr := 'SELECT RKEY,WAREHOUSE_CODE, ABBR_NAME FROM Data0015 ';
    InputVar.AdoConn :=DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit1.tag := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
  5:
  begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'ANALYSIS_CODE_2/物料类型/400';
    InputVar.Sqlstr := 'SELECT DISTINCT ANALYSIS_CODE_2 FROM Data0070 ORDER BY ANALYSIS_CODE_2 DESC';
    InputVar.AdoConn :=DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['ANALYSIS_CODE_2'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
 end
end;

procedure TForm_sel.BitBtn2Click(Sender: TObject);
var
 i:byte;
 s:string;
begin
  if ListBox3.ItemIndex=4 then Edit1.Text:=ComboBox1.Text;
  if ListBox3.ItemIndex=6 then
  begin
    Edit1.Clear;
   if ComboBox2.Text='' then Exit;
   Label6.Visible:=True;
   Label6.Caption:='S:编码物料 '+#13+ 'M:非编码物料' ;
   if ComboBox2.Text='编码物料' then Edit1.Text:='S' else Edit1.Text:='M';
  end ;

 if  Edit1.Visible and (trim(Edit1.Text)='') then exit;

 for i:=1 to sgrid1.RowCount-2 do
 if  sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
 begin
  sgrid1.Cells[0,i]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,i]:=Edit1.Text;
  if (ListBox3.ItemIndex=4) or (ListBox3.ItemIndex=6 )then
    sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' + QuotedStr(Edit1.Text)+''
  else
  sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+Edit1.Text+'%''' ;
  if  sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then Exit;
 end;
 if  sgrid1.Cells[0,i]<>listbox3.Items[listbox3.itemindex] then
 begin
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=Edit1.Text;
  if (ListBox3.ItemIndex=4) or (ListBox3.ItemIndex=6 )then
  sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' + QuotedStr(Edit1.Text)+''
  else
  sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+Edit1.Text+'%''' ;
  sgrid1.RowCount:=sgrid1.RowCount+1;
 end;
end;

procedure TForm_sel.BitBtn1Click(Sender: TObject);
var i:Byte;
begin
  if SGrid1.row=SGrid1.RowCount-1 then Exit;
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_sel.N1Click(Sender: TObject);
var i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_sel.PopupMenu1Popup(Sender: TObject);
begin
 if SGrid1.row=SGrid1.RowCount-1 then N1.Enabled:=False else N1.Enabled:=True;
end;

procedure TForm_sel.FormCreate(Sender: TObject);
var i:integer;
begin
  SGrid1.ColWidths[2]:=-1;
  v_Field_List_CN := VarArrayOf(['采购单号','供应商', '创建人员', '工厂','是否VMI采购','物料类别','类型']);
  v_Field_List_EN := VarArrayOf(['data0070.po_number','SUPPLIER_NAME',
             'data0005.employee_name', 'data0015.abbr_name','STATE_INVT_TAX_FLAG','ANALYSIS_CODE_2','PO_TYPE']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
  listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-2; DateTimePicker2.Date:=date;
end;

procedure TForm_sel.BitBtn5Click(Sender: TObject);
begin
 Close;
end;

end.
