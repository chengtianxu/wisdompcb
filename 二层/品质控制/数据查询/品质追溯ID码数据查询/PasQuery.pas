unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TfrmQuery = class(TForm)
    gbCondition: TGroupBox;
    lbCondition: TLabel;
    ltbConditon: TListBox;
    btnAdd: TBitBtn;
    btnClear: TBitBtn;
    rgCondition: TRadioGroup;
    edtCondition: TEdit;
    GroupBox2: TGroupBox;
    sgCondition: TStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    nDelete: TMenuItem;
    Label1: TLabel;
    dtpkStartDate: TDateTimePicker;
    dtpkEndDate: TDateTimePicker;
    Label2: TLabel;
    btnSelect: TBitBtn;
    cbbWarehouse: TComboBox;
    dtpkStartTime: TDateTimePicker;
    dtpkEndTime: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure ltbConditonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    field_cn,field_en:Variant;
    procedure updatesg(sgrow:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuery: TfrmQuery;

implementation

uses DAMO,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmQuery.FormShow(Sender: TObject);
var
   i:Integer;
begin
  field_cn:= VarArrayOf(['工厂','工序代码','工序名称','设备组','设备线别','ID码','作业单号','本厂编号']);
  field_en:=VarArrayOf(['Y1417.warehouse_ptr','Data0034.DEPT_CODE','Data0034.DEPT_NAME','Y1417.FASSET_DESC'
              ,'Y1417.FASSET_NAME','Y1408.panel_id','Y1406.WORK_ORDER_NUMBER','Y1406.MANU_PART_NUMBER']);
  ltbConditon.Clear;
  for i:=VarArrayLowBound(field_cn,1) to VarArrayHighBound(field_cn,1) do
    ltbConditon.Items.Add(field_cn[i]);

  sgCondition.Cells[0,0]:='条件名';
  sgCondition.Cells[1,0]:='条件值';
  ltbConditon.ItemIndex:=0;
  ltbConditonClick(Self);
end;
procedure TfrmQuery.nDeleteClick(Sender: TObject);
var
  i:Integer;
begin
  if sgCondition.Row<>sgCondition.RowCount-1 then
  begin
    for i:= sgCondition.Row to sgCondition.RowCount-2 do
    begin
      sgCondition.Rows[i]:=sgCondition.Rows[i+1];
    end;
    sgCondition.RowCount:=sgCondition.RowCount-1;
  end;
end;

procedure TfrmQuery.btnClearClick(Sender: TObject);
var
  i:Integer;
begin
  if sgCondition.RowCount>2 then
  begin
    for i:=1 to sgCondition.RowCount-2 do
    begin
      sgCondition.Rows[i].Clear;
    end;
    sgCondition.RowCount:=2;
  end;
end;

procedure TfrmQuery.btnAddClick(Sender: TObject);
var
  i:Integer;
begin
  if ( not ltbConditon.ItemIndex=0) and (Trim(edtCondition.Text)='') then
  begin
    ShowMessage('查询条件不能为空');
    edtCondition.SetFocus;
    Exit;
  end;
  if (ltbConditon.ItemIndex=0) and (Trim(cbbWarehouse.Text)='') then
  begin
    ShowMessage('工厂不能为空');
    cbbWarehouse.SetFocus;
    Exit;
  end;
  for i:=1 to sgCondition.RowCount-2 do
  begin
    if sgCondition.Cells[0,i]=lbCondition.Caption then
    begin
      updatesg(i);
      if (ltbConditon.ItemIndex=0) then edtCondition.Text:='';
      Exit;
    end;
  end;
  updatesg(sgCondition.RowCount-1);
  sgCondition.RowCount:=sgCondition.RowCount+1;
  if not (ltbConditon.ItemIndex=0) then edtCondition.Text:='';
end;

procedure TfrmQuery.updatesg(sgrow: Integer);
begin
  sgCondition.Cells[0,sgrow]:=lbCondition.Caption;
  case ltbConditon.ItemIndex of
    1,2,3,4,5,6,7:
    begin
      if rgCondition.ItemIndex=0 then
      begin
        sgCondition.Cells[1,sgrow]:='相似于 '+ Trim(edtCondition.Text);
        sgCondition.Cells[2,sgrow]:=' and ' + field_en[ltbConditon.itemIndex] + ' like ''%'+ Trim(edtCondition.Text) + '%''';
      end
      else
      begin
        sgCondition.Cells[1,sgrow]:='相等于 '+ Trim(edtCondition.Text);
        sgCondition.Cells[2,sgrow]:=' and ' + field_en[ltbConditon.itemIndex] + ' = '+ QuotedStr(Trim(edtCondition.Text));
      end;
    end;
    0:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ cbbWarehouse.Text;
      sgCondition.Cells[2,sgrow]:=' AND ' + field_en[ltbConditon.itemIndex] + ' = ' + IntToStr(Integer(cbbWarehouse.Items.Objects[cbbWarehouse.ItemIndex]));
    end;
  end;
end;
procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  if edtCondition.Visible then edtCondition.Text:='';

  if ltbConditon.ItemIndex=0 then
  begin
    cbbWarehouse.Clear;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT RKEY,ABBR_NAME FROM DATA0015 ORDER BY RKEY';
      Open;
      First;
      while not Eof do
      begin
        cbbWarehouse.Items.AddObject(FieldByName('abbr_name').AsString,Pointer(FieldByName('rkey').AsInteger));
        Next;
      end;
    end;
  end;
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemIndex];
  edtCondition.Visible:= not (ltbConditon.ItemIndex=0) ;
  rgCondition.Visible:= not (ltbConditon.ItemIndex=0) ;
  cbbWarehouse.Visible:= ltbConditon.ItemIndex=0;
  btnSelect.Visible:= not ((ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=5) or (ltbConditon.ItemIndex=6) or (ltbConditon.ItemIndex=7));
end;

procedure TfrmQuery.FormCreate(Sender: TObject);
begin
  rgCondition.Items.Add('相似于');
  rgCondition.Items.Add('相等于');
  rgCondition.ItemIndex:=0;
end;

procedure TfrmQuery.btnSelectClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case ltbConditon.ItemIndex of
      1:
      begin
        InputVar.Fields := 'dept_code/工序代码/180,dept_name/工序名称/250';
        InputVar.Sqlstr := 'select data0034.rkey,data0034.dept_code,data0034.dept_name '+
                          ' from data0034';
        Inputvar.KeyField:='';
      end;
      2:
      begin
        InputVar.Fields := 'dept_code/工序代码/180,dept_name/工序名称/250';
        InputVar.Sqlstr := 'select data0034.rkey,data0034.dept_code,data0034.dept_name '+
                          ' from data0034';
        Inputvar.KeyField:='';
      end;
      3:
      begin
        InputVar.Fields := 'FASSET_DESC/设备组别/400';
        InputVar.Sqlstr := 'select distinct FASSET_DESC from y1417';
        Inputvar.KeyField:='';
      end;
      4:
      begin
        InputVar.Fields := 'FASSET_NAME/设备线别/200,FASSET_DESC/设备组别/200';
        InputVar.Sqlstr := 'select FASSET_DESC,FASSET_name from y1417';
        Inputvar.KeyField:='';
      end;
    end;
    InputVar.AdoConn := dm.con1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
    case ltbConditon.ItemIndex of
      1:
        edtCondition.Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_code').AsString;
      2:
        edtCondition.Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_name').AsString;
      3:
        edtCondition.Text:= frmPick_Item_Single.adsPick.fieldbyname('FASSET_DESC').AsString;
      4:
        edtCondition.Text:= frmPick_Item_Single.adsPick.fieldbyname('FASSET_name').AsString;
    end;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

end.
