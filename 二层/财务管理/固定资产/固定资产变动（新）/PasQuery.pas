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
    edtCondition: TEdit;
    GroupBox2: TGroupBox;
    sgCondition: TStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    nDelete: TMenuItem;
    Label1: TLabel;
    dtpk1: TDateTimePicker;
    Label2: TLabel;
    dtpk2: TDateTimePicker;
    cbbcondition: TComboBox;
    rgStatus: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure ltbConditonClick(Sender: TObject);
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

uses DAMO;

{$R *.dfm}

procedure TfrmQuery.FormShow(Sender: TObject);
var
   i:Integer;
begin
  field_cn:= VarArrayOf(['卡片号','资产编号','资产名称','资产类别','工厂','变更类型']);
  field_en:=VarArrayOf(['d517.fasset_code','d517.id_code','d517.fasset_name','d517.FASSET_TYPE_PTR','d517.warehouse_ptr','d327.alter_type']);
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
  if ((ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1)) and (Trim(edtCondition.Text)='') then
  begin
    ShowMessage('查询条件不能为空');
    edtCondition.SetFocus;
    Exit;
  end;
  for i:=1 to sgCondition.RowCount-2 do
  begin
    if sgCondition.Cells[0,i]=lbCondition.Caption then
    begin
      updatesg(i);
      if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1) then edtCondition.Text:='';
      Exit;
    end;
  end;
  updatesg(sgCondition.RowCount-1);
  sgCondition.RowCount:=sgCondition.RowCount+1;
  if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1) then edtCondition.Text:='';
end;

procedure TfrmQuery.updatesg(sgrow: Integer);
begin
  sgCondition.Cells[0,sgrow]:=lbCondition.Caption;
  case ltbConditon.ItemIndex of
    0,1,2:
    begin
      if rgStatus.ItemIndex=0 then
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
    3,4:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ rgStatus.Items[rgStatus.itemIndex];
      sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = ' + IntToStr(Integer(cbbcondition.Items.Objects[cbbcondition.ItemIndex]));
    end;
    5:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ rgStatus.Items[rgStatus.itemIndex];
      sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = ' + IntToStr(cbbcondition.ItemIndex + 1);
    end;
  end;
end;
procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemIndex];
  if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1) or (ltbConditon.ItemIndex=2) then
  begin
    rgStatus.Items.Clear;
    rgStatus.Items.Add('相似于');
    rgStatus.Items.Add('相等于');
    rgStatus.ItemIndex:=0;
  end;
  edtCondition.Visible:= not ((ltbConditon.ItemIndex=3) or (ltbConditon.ItemIndex=4) or (ltbConditon.ItemIndex=5));
  rgStatus.Visible:= edtCondition.Visible;
  cbbcondition.Visible:= not edtCondition.Visible;
  if ltbConditon.ItemIndex=3 then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:='select RKEY,FASSET_TYPE from data0514';
      Open;
      if not IsEmpty then
      begin
        cbbcondition.Clear;
        First;
        while not Eof do
        begin
          cbbcondition.Items.AddObject(FieldByName('FASSET_TYPE').AsString,Pointer(FieldByName('RKEY').AsInteger));
          Next;
        end;
      end;
    end;
  end;
  if ltbConditon.ItemIndex=4 then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:='select RKEY,ABBR_NAME from data0015';
      Open;
      if not IsEmpty then
      begin
        cbbcondition.Clear;
        First;
        while not Eof do
        begin
          cbbcondition.Items.AddObject(FieldByName('ABBR_NAME').AsString,Pointer(FieldByName('RKEY').AsInteger));
          Next;
        end;
      end;
    end;
  end;
  if ltbConditon.ItemIndex=5 then
  begin
    cbbcondition.Clear;
    cbbcondition.Items.Add('原值变更');
    cbbcondition.Items.Add('部门变更');
    cbbcondition.Items.Add('其它变更');
  end;
end;

end.
