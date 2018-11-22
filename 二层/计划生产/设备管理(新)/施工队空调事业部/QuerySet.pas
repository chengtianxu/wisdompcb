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
    rg1: TRadioGroup;
    cbbconfirm: TComboBox;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    Label3: TLabel;
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

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['工作单号','任务','工作任务说明','部门名称','申请人','受理人','验收人','实际耗时','完成日期','验收时间','备注']);
  v_Field_List_EN := VarArrayOf(['Data0835.WorkOrder','data0836.WorkName','Data0835.WorkExpl','data0830.DeptName','data0073.USER_FULL_NAME',
  'd73_2.USER_FULL_NAME','d73_3.USER_FULL_NAME','Data0835.ActuCons','Data0835.CompTime','Data0835.AcceTime','Data0835.Remark']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
  listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
//  DateTimePicker1.Date:=common.getsystem_date(dm.tmp,0)-7;
//  DateTimePicker2.Date:=common.getsystem_date(dm.tmp,0);
  BitBtn6.Visible := False;
end;

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case ListBox3.ItemIndex of
      4,5,6:
      begin
        InputVar.Fields := 'USER_LOGIN_NAME/人员代码/150,USER_FULL_NAME/人员名称/200';
        InputVar.Sqlstr := 'select rkey,USER_LOGIN_NAME,USER_FULL_NAME from data0073 order by USER_LOGIN_NAME';
        Inputvar.KeyField:='USER_LOGIN_NAME';
      end;

    end;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      case ListBox3.ItemIndex of
      4,5,6:
         edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('USER_FULL_NAME').AsString;
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
    0,2,4,5,6,7,10:
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

    1:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey,WorkName from data0836 where WorkName='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and Data0835.Work_ptr='+IntToStr(DM.tmp.FieldValues['rkey']);
    end;
    3:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey,DeptName from data0830 where DeptName='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and Data0835.Dept_ptr='+IntToStr(DM.tmp.FieldValues['rkey']);
    end;
    8,9:
    begin
      SGrid1.Cells[1,sgrid_row]:=Label8.Caption+DateToStr(DateTimePicker3.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker4.Time)+
      Label3.Caption+DateToStr(DateTimePicker5.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker6.Time);
 
//      SGrid1.Cells[2,sgrid_row]:=' and Data0417.user_date>='+quotedstr(formatdatetime('YYYY-MM-DD',dtpk1.Date))+
//                                ' and Data0417.user_date<= '+quotedstr(formatdatetime('YYYY-MM-DD',dtpk2.Date+1));
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'>=('+quotedstr(DateToStr(DateTimePicker3.Date)+
      FormatDateTime(' HH:mm:ss',DateTimePicker4.Time))+ ') and '+v_Field_List_EN[ListBox3.ItemIndex]+'<=('+
      quotedstr(DateToStr(DateTimePicker5.Date)+ FormatDateTime(' HH:mm:ss',DateTimePicker6.Time))+')';

    end;
  end;
end;

procedure TfrmQuerySet.btnAddClick(Sender: TObject);
var i:byte;
begin
  if  (listbox3.itemindex<>8) and (listbox3.itemindex<>9) and
  (listbox3.itemindex<>1) and (listbox3.itemindex<>3)and(Trim(edtValue.Text)='') then exit;
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
  BitBtn6.visible := (ListBox3.ItemIndex = 4) or  (ListBox3.ItemIndex = 5) or (ListBox3.ItemIndex = 6);
  edtValue.Visible:= (ListBox3.ItemIndex <> 1) and (ListBox3.ItemIndex <> 8) and
  (ListBox3.ItemIndex <> 9) and (ListBox3.ItemIndex <> 3);
  cbbconfirm.Visible:= (ListBox3.ItemIndex = 1) or (ListBox3.ItemIndex = 3);
  rg1.Visible := (ListBox3.ItemIndex <> 1) and (ListBox3.ItemIndex <> 3) and (ListBox3.ItemIndex <> 8) and
      (ListBox3.ItemIndex <> 9)  ;
  rg1.ItemIndex :=0;
  DateTimePicker3.Date := getsystem_date(DM.tmp,1);
  DateTimePicker4.Time := getsystem_date(DM.tmp,0);
  DateTimePicker5.Date := getsystem_date(DM.tmp,1);
  DateTimePicker6.Time := getsystem_date(DM.tmp,0);
  DateTimePicker3.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=8) ;
  DateTimePicker4.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=8) ;
  DateTimePicker5.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=8) ;
  DateTimePicker6.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=8) ;
  if (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=8)  then
    Label8.Caption :='从'
  else
    Label8.Caption := listbox3.Items[listbox3.ItemIndex]+':';
  Label3.Caption := '到';
  Label3.Visible :=(ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=8) ;
  if ListBox3.ItemIndex=1 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,WorkName from data0836');
      Open;
    end;
    DM.tmp.DisableControls;
    DM.tmp.First;
    cbbconfirm.Items.Clear;
    while not DM.tmp.Eof do
    begin
      cbbconfirm.Items.Add(DM.tmp.FieldValues['WorkName']);
      DM.tmp.Next;
    end;
    DM.tmp.EnableControls;
    cbbconfirm.ItemIndex:=0;
  end
  else
  if ListBox3.ItemIndex=3 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,DeptName from data0830');
      Open;
    end;
    DM.tmp.DisableControls;
    DM.tmp.First;
    cbbconfirm.Items.Clear;
    while not DM.tmp.Eof do
    begin
      cbbconfirm.Items.Add(DM.tmp.FieldValues['DeptName']);
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
    edtValue.ReadOnly :=(ListBox3.ItemIndex = 4)or (ListBox3.ItemIndex = 5) or (ListBox3.ItemIndex = 6);
    edtValue.Text:='';
  end
  else
  begin
   edtValue.ReadOnly :=False;
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
