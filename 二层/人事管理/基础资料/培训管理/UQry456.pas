unit UQry456;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, Buttons, StdCtrls, ComCtrls, ExtCtrls,DateUtils;

type
  TfrmQry456 = class(TForm)
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
    btn_add: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    btn_del: TButton;
    cbb1: TComboBox;
    btn_sel: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SGrid1: TStringGrid;
    btn_ok: TBitBtn;
    btn_cancel: TBitBtn;
    Bdate: TDateTimePicker;
    EDate: TDateTimePicker;
    Label3: TLabel;
    procedure ListBox3Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btn_selClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
       v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
    iNum,iType:Integer;
  end;

var
  frmQry456: TfrmQry456;

implementation
uses common,udm,  Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmQry456.ListBox3Click(Sender: TObject);
var
i:integer;
Lsql:string;
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3,4];
  btn_sel.Visible:=false;
  cbb1.Visible:=ListBox3.ItemIndex in [5,7];
  Bdate.Visible:=ListBox3.ItemIndex in [6];
  EDate.Visible:=ListBox3.ItemIndex in [6];
  Label3.Visible:=ListBox3.ItemIndex in [6];

  if  ListBox3.ItemIndex =5  then 
  begin
  Lsql:='select rkey,item  from datadetail where dictid=20 ';
  Dm.OpenQry(DM.qry_temp,Lsql);
  if not dm.qry_temp.IsEmpty  then
  begin
   cbb1.Items.Clear;
   while not dm.qry_temp.eof do
   begin
   cbb1.Items.Add(dm.qry_temp.fieldByName('item').AsString);
   DM.qry_temp.Next;
   end;
   cbb1.ItemIndex:=-1;
  end ;
  end;

  if  ListBox3.ItemIndex =7  then
  begin
    cbb1.Items.Clear;
    cbb1.Items.Add('未完成');
    cbb1.Items.Add('已完成');
  end;

  if (ListBox3.ItemIndex =6) then
  begin
    Bdate.Date:=Incmonth(Now,-1);
    EDate.Date:=now;
  end;
  edtValue.Text:='';

end;

procedure TfrmQry456.btn_addClick(Sender: TObject);
var
 i:Integer;
Lsql:string;
begin
  if ListBox3.ItemIndex in [0,1,2,3,4] then
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
  end ;

  if ListBox3.ItemIndex in [5] then    //培训类型
  begin

    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=cbb1.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+cbb1.Text+''' ';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=cbb1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+cbb1.Text+''' ';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;

  if ListBox3.ItemIndex in [6] then      //培训开始日期
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:='>='+DateToStr(BDate.Date)+' and <=' +DateToStr(EDate.Date);
        sgrid1.Cells[2,i]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(BDate.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(EDate.Date)+'''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:='>='+DateToStr(BDate.Date)+' and <=' +DateToStr(EDate.Date);
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(BDate.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(EDate.Date)+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;

  if ListBox3.ItemIndex in [7] then    //是否已完成
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=cbb1.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+cbb1.Text+''' ';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=cbb1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+cbb1.Text+''' ';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  
end;

procedure TfrmQry456.N1Click(Sender: TObject);
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

procedure TfrmQry456.btn_delClick(Sender: TObject);
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

procedure TfrmQry456.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TfrmQry456.btn_selClick(Sender: TObject);
var InputVar: PDlgInput ;
begin
//  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
//  try
//    case listbox3.ItemIndex of
//      3:
//      begin
//        InputVar.Fields := 'item/培训类型/450';
//        InputVar.Sqlstr :='select distinct dbo.datadetail.item from dbo.Employee_Train left join dbo.datadetail on Employee_Train.type_ptr=dbo.datadetail.Rkey';
//        inputvar.KeyField:='item';
//      end;
//    end;
//    InputVar.AdoConn:=DM.con;
//    frmPick_Item_Single.InitForm_New(InputVar);
//    if frmPick_Item_Single.ShowModal=mrok then
//    begin
//      edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['item']);
//    end;
//  finally
//    frmPick_Item_Single.Free ;
//  end;
end;

procedure TfrmQry456.FormShow(Sender: TObject);
var
  i:integer;
begin

  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['员工工号','姓名','部门名称','职务名称','课程名','培训类型','培训有效期','是否完成']);
  v_Field_List_EN := VarArrayOf(['b.employeecode','b.chinesename','e.departmentname','f.item','c.cname','f2.item','a.Bdate','a.isfinished']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;

    DateTimePicker1.Date:= IncMonth(Now,-1);
    DateTimePicker2.Date:= Now ;
    
end;

end.
