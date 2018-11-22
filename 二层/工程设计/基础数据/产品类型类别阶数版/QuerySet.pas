unit QuerySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus, Spin,DateUtils;

type
  TfrmQuerySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    btnAdd: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    btnOK: TButton;
    btnCancel: TButton;
    btnClear: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cbbconfirm: TComboBox;
    rg1: TRadioGroup;
    procedure BitBtn6Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure rg1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
     procedure update_sgrid(sgrid_row:byte);
  public
    { Public declarations }
    selecttrue :Boolean;
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses
  common,Main, demo,Pick_Item_Single,ConstVar, DB;
{$R *.dfm}

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['类型代码','分组代码','产品类别','阶数','层数']);
  v_Field_List_EN := VarArrayOf(['data0008.PROD_CODE','data0007.PR_GRP_CODE','data0008.category',
  'data0008.difficulty_grade_value','data0008.PROD_INCREMENTBY']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
  listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  cbbconfirm.Visible := False;

end;

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case ListBox3.ItemIndex of
      0:
      begin
        InputVar.Fields := 'PROD_CODE/类型代码/180,PRODUCT_NAME/类型名称/250';
        InputVar.Sqlstr := 'select rkey,PROD_CODE,PRODUCT_NAME,active from data0008  ORDER by PROD_CODE';
        Inputvar.KeyField:='';
      end;
      1:
      begin
        InputVar.Fields := 'pr_grp_code/分组代码/180,product_group_name/分组名称/250';
        InputVar.Sqlstr := 'select rkey,pr_grp_code,product_group_name,active from data0007  ORDER by pr_grp_code';
        Inputvar.KeyField:='';
      end;
      2:
      begin
        InputVar.Fields := 'category/产品类别代码/180,category_name/产品类别名称/250';
        InputVar.Sqlstr := 'select category,category_name from data0619  ORDER by category';
        Inputvar.KeyField:='';
      end;
//      7,9,10:
//      begin
//        InputVar.Fields := 'EMPL_CODE/人员代码/150,EMPLOYEE_NAME/人员名称/200';
//        InputVar.Sqlstr := 'select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005 order by EMPL_CODE';
//        Inputvar.KeyField:='EMPL_CODE';
//      end;
    end;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      case ListBox3.ItemIndex of
      0: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('PROD_CODE').AsString;
      1: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('pr_grp_code').AsString;
      2: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('category').AsString;
      end;
      //edtValue.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmQuerySet.update_sgrid(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  case ListBox3.ItemIndex of
//    0,1,2,4:
//    begin
//      if rg1.ItemIndex=0 then
//      begin
//      sgrid1.Cells[1,sgrid_row]:=' like '+edtValue.Text;
//      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
//      end
//      else
//      begin
//      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
//      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
//      end;
//    end;
    0,1,2:
    begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    end;
    4:
    begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+edtValue.Text;
    end;
    3:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
//      with DM.tmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('select rkey from data0514 where fasset_type='''+Trim(cbbconfirm.Text)+'''');
//        Open;
//      end;
      SGrid1.Cells[2,sgrid_row]:=' and Data0008.difficulty_grade_value='+ IntToStr(cbbconfirm.ItemIndex);
    end;
//    5:
//    begin
//      SGrid1.Cells[1,sgrid_row]:=Label8.Caption+DateTimeToStr(dtpk1.Date)+Label1.Caption+DateTimeToStr(dtpk2.Date);
//      SGrid1.Cells[2,sgrid_row]:=' and Data0417.purch_date>='+quotedstr(formatdatetime('YYYY-MM-DD',dtpk1.Date))+
//                                ' and Data0417.purch_date<= '+quotedstr(formatdatetime('YYYY-MM-DD',dtpk2.Date+1));
//    end;
//    6:
//    begin
//      SGrid1.Cells[1,sgrid_row]:=Label8.Caption+DateTimeToStr(dtpk1.Date)+Label1.Caption+DateTimeToStr(dtpk2.Date);
//      SGrid1.Cells[2,sgrid_row]:=' and Data0417.user_date>='+quotedstr(formatdatetime('YYYY-MM-DD',dtpk1.Date))+
//                                ' and Data0417.user_date<= '+quotedstr(formatdatetime('YYYY-MM-DD',dtpk2.Date+1));
//    end;

//    11:
//    if rg1.ItemIndex=0 then
//    begin
//      sgrid1.Cells[1,sgrid_row]:=' = '+rg1.Items[rg1.ItemIndex];
//      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = 1';
//    end
//    else if rg1.ItemIndex=1 then
//    begin
//      sgrid1.Cells[1,sgrid_row]:=' = '+rg1.Items[rg1.ItemIndex];
//      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = 0';
//    end
  end;

end;

procedure TfrmQuerySet.btnAddClick(Sender: TObject);
var i:byte;
begin
  if (listbox3.itemindex<>3)  and (Trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
     update_sgrid(i);
     exit;
  end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  edtValue.Text:='';
  BitBtn6.visible := (ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex = 1) or (ListBox3.ItemIndex = 2);
  edtValue.Visible := (ListBox3.ItemIndex <> 3) ;
  cbbconfirm.Visible := (ListBox3.ItemIndex=3) ;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex]+':';
  edtValue.ReadOnly := (ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex = 1)or
                       (ListBox3.ItemIndex = 2) ;
//  rg1.Visible := (ListBox3.ItemIndex = 4) ;
//  if (ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex=1)or (ListBox3.ItemIndex = 4) then
//  begin
//    rg1.Items.Clear;
//    rg1.Items.Add('相似');
//    rg1.Items.Add('等于');
//  end
//  else if ListBox3.ItemIndex= 11 then
//  begin
//    rg1.Items.Clear;
//    rg1.Items.Add('是组');
//    rg1.Items.Add('不是组');
//  end;


//  rg1.ItemIndex :=1;
  rg1.Visible := False;
  if ListBox3.ItemIndex=3 then
  begin
    cbbconfirm.Items.Clear;
    cbbconfirm.Items.AddObject('零阶',Pointer(0));
    cbbconfirm.Items.AddObject('一阶',Pointer(1));
    cbbconfirm.Items.AddObject('二阶',Pointer(2));
    cbbconfirm.Items.AddObject('三阶',Pointer(3));
    cbbconfirm.Items.AddObject('四阶',Pointer(4));
    cbbconfirm.Items.AddObject('五阶',Pointer(5));
    cbbconfirm.Items.AddObject('六阶',Pointer(6));
    cbbconfirm.ItemIndex:=0;
  end;

end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  btnAddClick(Sender);
end;

procedure TfrmQuerySet.btnClearClick(Sender: TObject);
var i:integer;
begin
  for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
  SGrid1.Row := 1;
  sgrid1.RowCount:=2;
end;

procedure TfrmQuerySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TfrmQuerySet.rg1Click(Sender: TObject);
begin
 // if ListBox3.ItemIndex <> 11 then
//  if rg1.ItemIndex=1 then
//  begin
//    edtValue.ReadOnly :=(ListBox3.ItemIndex = 0)or (ListBox3.ItemIndex = 1)
//                   {  or (ListBox3.ItemIndex = 7) or (ListBox3.ItemIndex = 9)
//                     or (ListBox3.ItemIndex = 10)};
//    edtValue.Text:='';
//  end
//  else
//  begin
//   edtValue.ReadOnly :=False;
//   edtValue.ReadOnly := (ListBox3.ItemIndex = 7) or (ListBox3.ItemIndex = 9)
//                     or (ListBox3.ItemIndex = 10) ;
//  end;
end;

procedure TfrmQuerySet.N1Click(Sender: TObject);
var
  i:integer;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
  if SGrid1.Row =SGrid1.RowCount-1 then
  SGrid1.Row :=1;      //如果删除的是最后一行，则选中第一行
end;

end.
