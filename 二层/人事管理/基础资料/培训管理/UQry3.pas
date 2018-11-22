unit UQry3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, Buttons, StdCtrls, ComCtrls, ExtCtrls,DateUtils;

type
  TfrmQry3 = class(TForm)
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
  frmQry3: TfrmQry3;

implementation
uses common,udm,  Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmQry3.ListBox3Click(Sender: TObject);
var
i:integer;
Lsql:string;
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3];
 // btn_sel.Visible:=false;

  Bdate.Visible:=ListBox3.ItemIndex in [4];
  EDate.Visible:=ListBox3.ItemIndex in [4];
  Label3.Visible:=ListBox3.ItemIndex in [4];


  if (ListBox3.ItemIndex =4) then
  begin
    Bdate.Date:=Now;
    EDate.Date:=Incmonth(Now,1);
  end;
  edtValue.Text:='';

end;

procedure TfrmQry3.btn_addClick(Sender: TObject);
var
 i:Integer;
Lsql:string;
begin
  if ListBox3.ItemIndex in [0,1,2,3] then
  begin
    if edtValue.Visible and (trim(edtValue.Text)='') then exit;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end ;

//  if ListBox3.ItemIndex in [4] then    //培训类型
//  begin
////
////    for i:=1 to sgrid1.RowCount-2 do
////      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
////      begin
////        sgrid1.Cells[1,i]:=cbb1.Text;
////        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+cbb1.Text+''' ';
////        exit;
////      end;
//    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
//    sgrid1.Cells[1,sgrid1.RowCount-1]:=cbb1.Text;
//    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+cbb1.Text+''' ';
//    sgrid1.RowCount:=sgrid1.RowCount+1;
//  end;

  if ListBox3.ItemIndex in [4] then      //培训开始日期
  begin
//    for i:=1 to sgrid1.RowCount-2 do
//      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
//      begin
//        sgrid1.Cells[1,i]:='>='+DateToStr(BDate.Date)+' and <=' +DateToStr(EDate.Date);
//        sgrid1.Cells[2,i]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(BDate.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(EDate.Date)+'''';
//        exit;
//      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:='>='+DateToStr(BDate.Date)+' and <=' +DateToStr(BDate.Date);
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)>='''+DatetoStr(BDate.Date)+''' and convert(char(10),'+v_Field_List_EN[ListBox3.ItemIndex]+',120)<='''+DatetoStr(EDate.Date)+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;


  
end;

procedure TfrmQry3.N1Click(Sender: TObject);
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

procedure TfrmQry3.btn_delClick(Sender: TObject);
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

procedure TfrmQry3.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TfrmQry3.btn_selClick(Sender: TObject);
var InputVar: PDlgInput ;
begin


end;

procedure TfrmQry3.FormShow(Sender: TObject);
var
  i:integer;
begin

  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['培训月份','部门名称','课程名','培训计划日期']);
  v_Field_List_EN := VarArrayOf(['a.pmonth','e.departmentname','c.cname','a.pdate']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;

    DateTimePicker1.Date:= IncMonth(Now,-1);
    DateTimePicker2.Date:= Now ;
    
end;

end.
