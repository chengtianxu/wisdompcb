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
  v_Field_List_CN := VarArrayOf(['申请单号','申报人','设备编码','部门代码','责任小组','受理人','完工人','维修人','工厂','提交日期','受理日期','完工日期']);
  v_Field_List_EN := VarArrayOf(['data0567.number','data0005.employee_name','data0417.FASSET_CODE','data0034.dept_code',
  'Data0417.d840.Location','Data0005_1.EMPLOYEE_NAME','Data0005_2.EMPLOYEE_NAME','DATA0567.maintain_empl','data0015.abbr_name',
  'DATA0567.referring_date','DATA0567.disposal_date','DATA0567.complete_date']);
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
      1,5,6:
      begin
        InputVar.Fields := 'EMPL_CODE/人员代码/150,EMPLOYEE_NAME/人员名称/200';
        InputVar.Sqlstr := 'select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005 order by EMPL_CODE';
        Inputvar.KeyField:='EMPL_CODE';
      end;
      2:
      begin
        InputVar.Fields :='FASSET_CODE/设备代码/100,FASSET_NAME/名  称/100,FASSET_DESC/说  明/150,LOCATION/位  置/80,BOOK_DATE/入帐日期/100' ;
        InputVar.Sqlstr :='SELECT dbo.Data0417.RKEY,dbo.Data0417.FASSET_CODE,dbo.Data0417.FASSET_NAME,dbo.Data0417.FASSET_DESC,'+
        'dbo.Data0417.LOCATION,dbo.Data0417.BOOK_DATE,dbo.Data0417.USER_DATE FROM dbo.Data0417 order by FASSET_CODE';
      end;
      3:
      begin
        InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/150';
        InputVar.Sqlstr := 'select rkey,dept_code,dept_name,case when ttype=4 then ''部门'' when '+
        'ttype=5 then ''班组'' else ''工序'' end xz from data0034 where ttype in (4,5) or is_cost_dept=1';
      end;
    end;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      case ListBox3.ItemIndex of
      1,5,6:
         edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('EMPLOYEE_NAME').AsString;
      2: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('FASSET_CODE').AsString;
      3: edtValue.Text := frmPick_Item_Single.adsPick.fieldbyname('dept_code').AsString;
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
    0,1,2,5,6,7:
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
    3:
    begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    end;
    4:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey from data0840 where location='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and Data0567.D840_ptr='+IntToStr(DM.tmp.FieldValues['rkey']);
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
      SGrid1.Cells[2,sgrid_row]:=' and Data0567.whouse_ptr='+IntToStr(DM.tmp.FieldValues['rkey']);
    end;
    9,10,11:
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
  if (listbox3.itemindex<>4) and (listbox3.itemindex<>8) and (listbox3.itemindex<>9) and
  (listbox3.itemindex<>10) and (listbox3.itemindex<>11)and(Trim(edtValue.Text)='') then exit;
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
  BitBtn6.visible := (ListBox3.ItemIndex = 1) or (ListBox3.ItemIndex = 2) or
                   (ListBox3.ItemIndex = 3)or (ListBox3.ItemIndex = 5) or (ListBox3.ItemIndex = 6);
  edtValue.ReadOnly := (ListBox3.ItemIndex = 3);
  edtValue.Visible:= (ListBox3.ItemIndex <> 4) and (ListBox3.ItemIndex <> 8) and
  (ListBox3.ItemIndex <> 9) and (ListBox3.ItemIndex <> 10)and (ListBox3.ItemIndex <> 11);
  cbbconfirm.Visible:= (ListBox3.ItemIndex = 4) or (ListBox3.ItemIndex = 8);
  rg1.Visible := (ListBox3.ItemIndex <> 3) and (ListBox3.ItemIndex <> 4) and (ListBox3.ItemIndex <> 8) and
      (ListBox3.ItemIndex <> 9) and (ListBox3.ItemIndex <> 10) and (ListBox3.ItemIndex <> 11);
  rg1.ItemIndex :=0;
  DateTimePicker3.Date := getsystem_date(DM.tmp,1);
  DateTimePicker4.Time := getsystem_date(DM.tmp,0);
  DateTimePicker5.Date := getsystem_date(DM.tmp,1);
  DateTimePicker6.Time := getsystem_date(DM.tmp,0);
  DateTimePicker3.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=10) or (ListBox3.ItemIndex=11);
  DateTimePicker4.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=10) or (ListBox3.ItemIndex=11);
  DateTimePicker5.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=10) or (ListBox3.ItemIndex=11);
  DateTimePicker6.Visible := (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=10) or (ListBox3.ItemIndex=11);
  if (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=10) or (ListBox3.ItemIndex=11) then
    Label8.Caption :='从'
  else
    Label8.Caption := listbox3.Items[listbox3.ItemIndex]+':';
  Label3.Caption := '到';
  Label3.Visible :=(ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=10) or (ListBox3.ItemIndex=11);
  if ListBox3.ItemIndex=4 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,location from data0840');
      Open;
    end;
    DM.tmp.DisableControls;
    DM.tmp.First;
    cbbconfirm.Items.Clear;
    while not DM.tmp.Eof do
    begin
      cbbconfirm.Items.Add(DM.tmp.FieldValues['location']);
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
    edtValue.ReadOnly :=(ListBox3.ItemIndex = 1)or (ListBox3.ItemIndex = 2) or (ListBox3.ItemIndex = 5)
    or (ListBox3.ItemIndex = 6);
    edtValue.Text:='';
  end
  else
  begin
   edtValue.ReadOnly :=False;
   edtValue.ReadOnly := (ListBox3.ItemIndex = 3) ;
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
