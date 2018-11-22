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
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
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
  common,Main, damo,Pick_Item_Single,ConstVar, DB;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case ListBox3.ItemIndex of
    0,1:
      begin
        InputVar.Fields := 'FASSET_CODE/设备编码/180,FASSET_NAME/设备名称/250';
        InputVar.Sqlstr := 'select rKey,DATA0417.FASSET_CODE,DATA0417.FASSET_NAME from data0417  ORDER by FASSET_CODE';
        Inputvar.KeyField:='';
      end;
      7,9,10:
      begin
        InputVar.Fields := 'EMPL_CODE/人员代码/150,EMPLOYEE_NAME/人员名称/200';
        InputVar.Sqlstr := 'select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005 order by EMPL_CODE';
        Inputvar.KeyField:='EMPL_CODE';
      end;
    end;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      case ListBox3.ItemIndex of
      0: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('FASSET_CODE').AsString;
      1: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('FASSET_NAME').AsString;
      7,8,9:
         edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('EMPLOYEE_NAME').AsString;
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
    0,1,2,4:
    begin
      if rg1.ItemIndex=0 then
      begin
      sgrid1.Cells[1,sgrid_row]:=' like '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
      end
      else
      begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
      end;
    end;
    7,9,10:
    begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    end;
    3:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey from data0514 where fasset_type='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and Data0417.fasset_type_ptr='+IntToStr(DM.tmp.FieldValues['rkey']);
    end;
    5:
    begin
      SGrid1.Cells[1,sgrid_row]:=Label8.Caption+DateTimeToStr(dtpk1.Date)+Label1.Caption+DateTimeToStr(dtpk2.Date);
      SGrid1.Cells[2,sgrid_row]:=' and Data0417.purch_date>='+quotedstr(formatdatetime('YYYY-MM-DD',dtpk1.Date))+
                                ' and Data0417.purch_date<= '+quotedstr(formatdatetime('YYYY-MM-DD',dtpk2.Date+1));
    end;
    6:
    begin
      SGrid1.Cells[1,sgrid_row]:=Label8.Caption+DateTimeToStr(dtpk1.Date)+Label1.Caption+DateTimeToStr(dtpk2.Date);
      SGrid1.Cells[2,sgrid_row]:=' and Data0417.user_date>='+quotedstr(formatdatetime('YYYY-MM-DD',dtpk1.Date))+
                                ' and Data0417.user_date<= '+quotedstr(formatdatetime('YYYY-MM-DD',dtpk2.Date+1));
    end;
    8:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey from data0015 where abbr_name='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and Data0417.warehouse_ptr='+IntToStr(DM.tmp.FieldValues['rkey']);
    end;
    11:
    if rg1.ItemIndex=0 then
    begin
      sgrid1.Cells[1,sgrid_row]:=' = '+rg1.Items[rg1.ItemIndex];
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = 1';
    end
    else if rg1.ItemIndex=1 then
    begin
      sgrid1.Cells[1,sgrid_row]:=' = '+rg1.Items[rg1.ItemIndex];
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = 0';
    end
  end;

end;

procedure TfrmQuerySet.btnAddClick(Sender: TObject);
var i:byte;
begin
  if (listbox3.itemindex<>3) and (listbox3.itemindex<>5) and (listbox3.itemindex<>6) and (listbox3.itemindex<>8) and (listbox3.itemindex<>11) and(Trim(edtValue.Text)='') then exit;
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
  BitBtn6.visible := (ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex = 1) or (ListBox3.ItemIndex = 7)
  or (ListBox3.ItemIndex = 9) or (ListBox3.ItemIndex = 10);
  edtValue.Visible := (ListBox3.ItemIndex <> 3) and (ListBox3.ItemIndex <> 5)
  and (ListBox3.ItemIndex <> 6) and (ListBox3.ItemIndex <> 8) and (ListBox3.ItemIndex <> 11);
  cbbconfirm.Visible := (ListBox3.ItemIndex=3) or (ListBox3.ItemIndex=8);
  if (ListBox3.ItemIndex=5) or (ListBox3.ItemIndex=6) then
    Label8.Caption :='从'
  else
    Label8.Caption := listbox3.Items[listbox3.ItemIndex]+':';
    Label1.Caption := '到';
  Label1.Visible :=(ListBox3.ItemIndex=5) or (ListBox3.ItemIndex=6);
  edtValue.ReadOnly := (ListBox3.ItemIndex = 7) or (ListBox3.ItemIndex = 9)or (ListBox3.ItemIndex = 10);
  rg1.Visible := (ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex = 1) or
  (ListBox3.ItemIndex = 2) or (ListBox3.ItemIndex = 4) or (ListBox3.ItemIndex = 11);
  if (ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex=1)or (ListBox3.ItemIndex = 4) then
  begin
    rg1.Items.Clear;
    rg1.Items.Add('相似');
    rg1.Items.Add('等于');
  end
  else if ListBox3.ItemIndex= 11 then
  begin
    rg1.Items.Clear;
    rg1.Items.Add('是组');
    rg1.Items.Add('不是组');
  end;

  dtpk1.Visible := (ListBox3.ItemIndex=5) or (ListBox3.ItemIndex = 6);
  dtpk2.Visible := (ListBox3.ItemIndex=5) or (ListBox3.ItemIndex = 6);
  rg1.ItemIndex :=0;
  dtpk1.Date:=common.getsystem_date(dm.tmp,1)-30;
  dtpk2.Date:=common.getsystem_date(dm.tmp,1);
  if ListBox3.ItemIndex=3 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,fasset_type from data0514');
      Open;
    end;
    DM.tmp.DisableControls;
    DM.tmp.First;
    cbbconfirm.Items.Clear;
    while not DM.tmp.Eof do
    begin
      cbbconfirm.Items.Add(DM.tmp.FieldValues['fasset_type']);
      DM.tmp.Next;
    end;
    DM.tmp.EnableControls;
    cbbconfirm.ItemIndex:=0;
  end
  else
  if ListBox3.ItemIndex=8 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,abbr_name from data0015');
      Open;
    end;
    DM.tmp.DisableControls;
    DM.tmp.First;
    cbbconfirm.Items.Clear;
    while not DM.tmp.Eof do
    begin
      cbbconfirm.Items.Add(DM.tmp.FieldValues['abbr_name']);
      DM.tmp.Next;
    end;
    DM.tmp.EnableControls;
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

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['设备编码','设备名称','规格型号','设备类别','具体位置','购入日期',
  '创建日期', '创建人员','工厂', '确认人员','安装人员','是否组']);
  v_Field_List_EN := VarArrayOf(['DATA0417.FASSET_CODE','DATA0417.FASSET_NAME','DATA0417.FASSET_DESC',
  'Data0514.FASSET_TYPE','DATA0417.LOCATION','DATA0417.PURCH_DATE','DATA0417.USER_DATE',
  'Data0005.EMPLOYEE_NAME','Data0015.ABBR_NAME','D05_1.EMPLOYEE_NAME','D05_2.EMPLOYEE_NAME','DATA0417.IsGroup']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
  listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  cbbconfirm.Visible := False;
  dtpk1.Visible := False;
  dtpk2.Visible := False;
end;

procedure TfrmQuerySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TfrmQuerySet.rg1Click(Sender: TObject);
begin
 // if ListBox3.ItemIndex <> 11 then
  if rg1.ItemIndex=1 then
  begin
    edtValue.ReadOnly :=(ListBox3.ItemIndex = 0)or (ListBox3.ItemIndex = 1)
                   {  or (ListBox3.ItemIndex = 7) or (ListBox3.ItemIndex = 9)
                     or (ListBox3.ItemIndex = 10)};
    edtValue.Text:='';
  end
  else
  begin
   edtValue.ReadOnly :=False;
   edtValue.ReadOnly := (ListBox3.ItemIndex = 7) or (ListBox3.ItemIndex = 9)
                     or (ListBox3.ItemIndex = 10) ;
  end;
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
