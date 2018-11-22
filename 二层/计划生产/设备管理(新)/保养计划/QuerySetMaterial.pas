unit QuerySetMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus, Spin,DateUtils;

type
  TfrmQuerySetMaterial = class(TForm)
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
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
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
  frmQuerySetMaterial: TfrmQuerySetMaterial;

implementation
uses
  common,Main, damo,Pick_Item_Single,ConstVar, DB;
{$R *.dfm}

procedure TfrmQuerySetMaterial.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['设备代码','设备名称','材料代码','材料名称','保养类型','保养周期',
  '工厂简称','计划保养时间','更换日期','更换材料人员','是否必须更换材料']);
  v_Field_List_EN := VarArrayOf(['data0417.FASSET_CODE','data0417.FASSET_NAME', 'Data0017.INV_PART_NUMBER',
  'Data0017.INV_NAME','data0831.DeviType','data0831.MainCycl','data0015.abbr_name','data0831.PlanMainDate',
  'Data0821.ReplaceDate','Data0073.USER_Login_NAME','Data0821.IfmustReplace']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
  listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
//  DateTimePicker1.Date:=common.getsystem_date(dm.tmp,0)-7;
//  DateTimePicker2.Date:=common.getsystem_date(dm.tmp,0);
//  BitBtn6.Visible := False;
  rg1.Visible := False;
end;

procedure TfrmQuerySetMaterial.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case ListBox3.ItemIndex of
      0,1:
      begin
        InputVar.Fields :='FASSET_CODE/设备代码/100,FASSET_NAME/名  称/100,FASSET_DESC/说  明/150,LOCATION/位  置/80,BOOK_DATE/入帐日期/100' ;
        InputVar.Sqlstr :='SELECT Data0417.RKEY,Data0417.FASSET_CODE,Data0417.FASSET_NAME,Data0417.FASSET_DESC,'+
        'Data0417.LOCATION,Data0417.BOOK_DATE,Data0417.USER_DATE FROM Data0417 order by FASSET_CODE';
      end;
      2,3:
      begin
        InputVar.Fields := 'INV_PART_NUMBER/材料代码/100,INV_NAME/名  称/150,INV_DESCRIPTION/描述/250' ;
        InputVar.Sqlstr := 'SELECT  RKEY, INV_PART_NUMBER, INV_PART_DESCRIPTION, INV_NAME, INV_DESCRIPTION '+
                          ' FROM   dbo.Data0017 order by INV_PART_NUMBER'  ;
      end;
      9:
      begin
        InputVar.Fields := 'USER_LOGIN_NAME/人员代码/120,USER_FULL_NAME/人员名称/250';
        InputVar.Sqlstr := 'select rKey,USER_LOGIN_NAME,USER_FULL_NAME from data0073  ORDER by USER_LOGIN_NAME';
        inputvar.KeyField:='USER_LOGIN_NAME';
      end;
    end;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      case ListBox3.ItemIndex of
      0: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('FASSET_CODE').AsString;
      1: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('FASSET_NAME').AsString;
      2: edtValue.Text := frmPick_Item_Single.adsPick.fieldbyname('INV_PART_NUMBER').AsString;
      3: edtValue.Text := frmPick_Item_Single.adsPick.fieldbyname('INV_NAME').AsString;
      9: edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('USER_LOGIN_NAME').AsString;
      end;
      //edtValue.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmQuerySetMaterial.update_sgrid(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  case ListBox3.ItemIndex of
    1,3:
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
    0,2,9:
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
        SQL.Add('select DeviType from data0811 where DeviType='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+Trim(cbbconfirm.Text)+'''';
    end;
    5:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select MainCycl from data0816 where MainCycl='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+Trim(cbbconfirm.Text)+'''';
    end;
    6:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey,abbr_name from data0015 where abbr_name='''+Trim(cbbconfirm.Text)+'''');
        Open;
      end;
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+Trim(cbbconfirm.Text)+'''';
    end;
    7:
    begin
      SGrid1.Cells[1,sgrid_row]:=Label8.Caption+DateToStr(DateTimePicker3.Date)+
      Label3.Caption+DateToStr(DateTimePicker5.Date);
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'>=('+quotedstr(DateToStr(DateTimePicker3.Date))+
      ') and '+v_Field_List_EN[ListBox3.ItemIndex]+'<=('+quotedstr(DateToStr(DateTimePicker5.Date))+')';
    end;
    8:
    begin
      SGrid1.Cells[1,sgrid_row]:=Label8.Caption+DateToStr(DateTimePicker3.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker4.Time)+
      Label3.Caption+DateToStr(DateTimePicker5.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker6.Time);
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'>=('+quotedstr(DateToStr(DateTimePicker3.Date)+
      FormatDateTime(' HH:mm:ss',DateTimePicker4.Time))+ ') and '+v_Field_List_EN[ListBox3.ItemIndex]+'<=('+
      quotedstr(DateToStr(DateTimePicker5.Date)+ FormatDateTime(' HH:mm:ss',DateTimePicker6.Time))+')';
    end;
    10:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(cbbconfirm.Text);
//      with DM.tmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('select rkey,Location from data0840 where Location='''+Trim(cbbconfirm.Text)+'''');
//        Open;
//      end;
      SGrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+IntToStr(cbbconfirm.Items.IndexOf(cbbconfirm.Text))+'''';
    end;

  end;

end;

procedure TfrmQuerySetMaterial.btnAddClick(Sender: TObject);
var i:byte;
begin
  if (listbox3.itemindex<>4) and (listbox3.itemindex<>5)and (listbox3.itemindex<>6)
  and (listbox3.itemindex<>7) and (listbox3.itemindex<>8) 
  and (listbox3.itemindex<>10) and (Trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
     update_sgrid(i);
     exit;
  end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TfrmQuerySetMaterial.ListBox3Click(Sender: TObject);
begin
  edtValue.Text:='';
  BitBtn6.visible := (ListBox3.ItemIndex <> 4) and (ListBox3.ItemIndex <> 5) and (ListBox3.ItemIndex <> 6)
                   and (ListBox3.ItemIndex <> 7) and (ListBox3.ItemIndex <> 8) and (ListBox3.ItemIndex <> 10);
  edtValue.ReadOnly := (ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex = 2) or (ListBox3.ItemIndex = 9)
                        or (ListBox3.ItemIndex = 1) or (ListBox3.ItemIndex = 3);
  edtValue.Visible:= (ListBox3.ItemIndex <> 4) and (ListBox3.ItemIndex <> 5) and (ListBox3.ItemIndex <> 6)
  and (ListBox3.ItemIndex <> 7) and (ListBox3.ItemIndex <> 8)   and (ListBox3.ItemIndex <> 10);
  cbbconfirm.Visible:= (ListBox3.ItemIndex = 4) or (ListBox3.ItemIndex = 5) or (ListBox3.ItemIndex = 6)
                        or (ListBox3.ItemIndex = 7) or (ListBox3.ItemIndex = 8) or (ListBox3.ItemIndex = 10);
  rg1.Visible := (ListBox3.ItemIndex = 1) or (ListBox3.ItemIndex = 3) ;
  rg1.ItemIndex :=1;
  DateTimePicker3.Date := getsystem_date(DM.tmp,1);
  DateTimePicker4.Time := getsystem_date(DM.tmp,0);
  DateTimePicker5.Date := getsystem_date(DM.tmp,1);
  DateTimePicker6.Time := getsystem_date(DM.tmp,0);
  DateTimePicker3.Visible := (ListBox3.ItemIndex=7) or (ListBox3.ItemIndex=8) ;
  DateTimePicker4.Visible := (ListBox3.ItemIndex=7) or (ListBox3.ItemIndex=8) ;
  DateTimePicker5.Visible := (ListBox3.ItemIndex=7) or (ListBox3.ItemIndex=8);
  DateTimePicker6.Visible := (ListBox3.ItemIndex=7) or (ListBox3.ItemIndex=8);
  if (ListBox3.ItemIndex=7) or (ListBox3.ItemIndex=8) then
    Label8.Caption :='从'
  else
    Label8.Caption := listbox3.Items[listbox3.ItemIndex]+':';
  Label3.Caption := '到';
  Label3.Visible :=(ListBox3.ItemIndex=7) or (ListBox3.ItemIndex=8) ;
  if ListBox3.ItemIndex=4 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select DeviType from data0811');
      Open;
    end;
    DM.tmp.DisableControls;
    DM.tmp.First;
    cbbconfirm.Items.Clear;
    while not DM.tmp.Eof do
    begin
      cbbconfirm.Items.Add(DM.tmp.FieldValues['DeviType']);
      DM.tmp.Next;
    end;
    DM.tmp.EnableControls;
    cbbconfirm.ItemIndex:=0;
  end
  else
  if ListBox3.ItemIndex=5 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select MainCycl from data0816');
      Open;
    end;
    DM.tmp.DisableControls;
    DM.tmp.First;
    cbbconfirm.Items.Clear;
    while not DM.tmp.Eof do
    begin
      cbbconfirm.Items.Add(DM.tmp.FieldValues['MainCycl']);
      DM.tmp.Next;
    end;
    DM.tmp.EnableControls;
    cbbconfirm.ItemIndex:=0;
  end
  else
  if ListBox3.ItemIndex=6 then
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
  end
  else
  if ListBox3.ItemIndex=10 then
  begin
//    with DM.tmp do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('select rkey,fasset_type from data0514');
//      Open;
//    end;
//    DM.tmp.DisableControls;
//    DM.tmp.First;
//    cbbconfirm.Items.Clear;
//    while not DM.tmp.Eof do
//    begin
//      cbbconfirm.Items.Add(DM.tmp.FieldValues['fasset_type']);
//      DM.tmp.Next;
//    end;
//    DM.tmp.EnableControls;
    cbbconfirm.Items.Clear;
    cbbconfirm.Items.Add('否');
    cbbconfirm.Items.Add('是');
    cbbconfirm.ItemIndex:=0;
  end;
end;

procedure TfrmQuerySetMaterial.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  btnAddClick(Sender);
end;

procedure TfrmQuerySetMaterial.btnClearClick(Sender: TObject);
var i:integer;
begin
  for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
  SGrid1.Row := 1;
  sgrid1.RowCount:=2;
end;

procedure TfrmQuerySetMaterial.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TfrmQuerySetMaterial.rg1Click(Sender: TObject);
begin
 // if ListBox3.ItemIndex <> 11 then
  if rg1.ItemIndex=1 then
  begin
//    edtValue.ReadOnly :=(ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex = 2);
    edtValue.ReadOnly := True;
    edtValue.Text:='';
  end
  else
  begin
    edtValue.ReadOnly :=False;
    edtValue.ReadOnly :=(ListBox3.ItemIndex = 0) or (ListBox3.ItemIndex = 2) ;
  end;
end;

procedure TfrmQuerySetMaterial.N1Click(Sender: TObject);
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
