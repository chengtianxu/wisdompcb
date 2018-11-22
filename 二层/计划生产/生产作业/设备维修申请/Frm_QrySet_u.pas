unit Frm_QrySet_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TFrm_QrySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;

  public
    { Public declarations }
  end;

var Frm_QrySet:TFrm_QrySet;
implementation

uses common,DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:byte;
 s:string;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex=2 then
  begin
    s:='';
    if CheckBox1.Checked then s:='0';
    if CheckBox2.Checked then begin if s='' then s:='1' else s:=s+',1'; end;
    if CheckBox3.Checked then begin if s='' then s:='2' else s:=s+',2'; end;
    if CheckBox4.Checked then begin if s='' then s:='3' else s:=s+',3'; end;
    if CheckBox5.Checked then begin if s='' then s:='4' else s:=s+',4'; end;
    if CheckBox6.Checked then begin if s='' then s:='5' else s:=s+',5'; end;
    if CheckBox7.Checked then begin if s='' then s:='8' else s:=s+',8'; end; //验收退回
    if s='' then exit;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=s;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s+') ';
  end else
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
var i:integer;
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [1,3,4] ;
  edtValue.Visible := listbox3.ItemIndex<>2 ;
  GroupBox1.Visible:= not edtValue.Visible;
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex=2;
end;

procedure TFrm_QrySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySet.ComboBox1Change(Sender: TObject);
begin
  Button3.Enabled:=true;
end;

procedure TFrm_QrySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QrySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['申请单号','部门代码','状态','申请员工','设备代码']);
  v_Field_List_EN := VarArrayOf(['data0567.number','data0034.dept_code','data0567.status','data0005.employee_name','data0417.FASSET_CODE']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-7; DateTimePicker2.Date:=date;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if ListBox3.ItemIndex=1 then
    begin
      InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/100';
      InputVar.Sqlstr:='SELECT DISTINCT Data0034.RKEY as rkey, Data0034.DEPT_CODE as DEPT_CODE, '
          + 'Data0034.DEPT_NAME, CASE WHEN ttype = 4 THEN ''部门'' WHEN ttype = 5 THEN ''班组'' '
          + 'ELSE ''工序'' END xz FROM dbo.Data0034 '
          + 'INNER JOIN dbo.DATA0417 ON dbo.Data0034.RKEY = dbo.DATA0417.DEPT_PTR '
          + 'WHERE (data0034.TTYPE IN (1, 4, 5)) OR (data0034.IS_COST_DEPT = 1)';
  //    InputVar.Sqlstr :='select rkey,dept_code,dept_name,case when ttype=4 then ''部门'' when ttype=5 then ''班组'' else ''工序'' end xz from data0034 where ttype in (4,5) or is_cost_dept=1';
    end else if ListBox3.ItemIndex=3 then begin
      InputVar.Fields := 'EMPL_CODE/员工代码/200,EMPLOYEE_NAME/员工姓名/200';
      InputVar.Sqlstr := 'select EMPL_CODE,EMPLOYEE_NAME from data0005';
    end else if ListBox3.ItemIndex=4 then begin
      InputVar.Fields :='FASSET_CODE/设备代码/100,FASSET_NAME/名  称/100,FASSET_DESC/说  明/150,LOCATION/位  置/80,BOOK_DATE/入帐日期/100' ;
      InputVar.Sqlstr :='SELECT dbo.Data0417.RKEY, dbo.Data0417.FASSET_CODE, dbo.Data0417.FASSET_NAME, dbo.Data0417.FASSET_DESC,'+
                        'dbo.Data0417.LOCATION, dbo.Data0417.BOOK_DATE, dbo.Data0417.USER_DATE '+
                        'FROM dbo.Data0417 '+
                        'order by FASSET_CODE';
    end;

    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if ListBox3.ItemIndex=1 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['dept_code']
      else if ListBox3.ItemIndex=3 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']
      else if ListBox3.ItemIndex=4 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['FASSET_CODE'];
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
