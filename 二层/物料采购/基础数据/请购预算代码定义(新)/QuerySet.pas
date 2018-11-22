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
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    rgType: TRadioGroup;
    SpinEdit1: TSpinEdit;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
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
uses common,Main,Pick_Item_Single,ConstVar, damo, DB;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    if ListBox3.ItemIndex = 3 then
       begin
          InputVar.Fields := 'USER_LOGIN_NAME/用户编号/120,USER_FULL_NAME/用户姓名/250';
          InputVar.Sqlstr := 'select rKey,USER_LOGIN_NAME,USER_FULL_NAME from data0073  ORDER by USER_LOGIN_NAME';
          inputvar.KeyField:='USER_LOGIN_NAME';
       end;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
     begin
       edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('USER_LOGIN_NAME').AsString;
       edtValue.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
     end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmQuerySet.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];

 case   ListBox3.ItemIndex of
  0,1:
  begin
    if  rgType.ItemIndex = 0 then
    begin
      sgrid1.Cells[1,sgrid_row]:=' like '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%'''
    end
     else
     begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''' ;
    end;
 end;

  2:
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+SpinEdit1.Text;
    sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+SpinEdit1.Text;
  end;

  3:
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
    sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in'+
     '(select BUDGET_PTR from data0363 where USER_PTR='+inttostr(edtValue.Tag)+' )';
  end;

 end;

end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var i:byte;
begin
  if (listbox3.itemindex<>2) and
    (Trim(edtValue.Text)='') then  exit;
    
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
  BitBtn6.visible := (listbox3.ItemIndex = 3) ;
  SpinEdit1.Visible := (listbox3.ItemIndex = 2) ;
  edtValue.Visible :=  (listbox3.ItemIndex <> 2) ;
  rgType.Visible := (ListBox3.ItemIndex =0) or (ListBox3.ItemIndex =1);
  Label8.Caption := listbox3.Items[listbox3.ItemIndex]+':';
  edtValue.ReadOnly := (listbox3.ItemIndex = 3);
end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button3Click(sender);
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
  if SGrid1.Row =SGrid1.RowCount-1 then
    SGrid1.Row :=1;      //如果删除的是最后一行，则选中第一行
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['预算代码','预算名称','预算年度','用户编码']);
  v_Field_List_EN := VarArrayOf(['data0362.CODE','data0362.DESCRIPTION','data0362.bud_year','data0362.RKEY']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  ListBox3.ItemIndex := 0;
  SpinEdit1.Value:=yearof(common.getsystem_date(dm.ADOQuery1,1));
   
end;

procedure TfrmQuerySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

end.
