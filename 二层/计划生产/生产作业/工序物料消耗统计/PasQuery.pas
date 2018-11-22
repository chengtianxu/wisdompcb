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
    rgStatus: TRadioGroup;
    Label1: TLabel;
    dtpkStartDate: TDateTimePicker;
    dtpkEndDate: TDateTimePicker;
    Label2: TLabel;
    cbbWarehouse: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure ltbConditonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  field_cn:= VarArrayOf(['统计编号','公式代码','工序代码','工序名称','状态','工厂']);
  field_en:=VarArrayOf(['DATA0570.number','DATA0570.formula_number','Data0034.DEPT_CODE','Data0034.DEPT_NAME','DATA0570.status','data0570.warehouse_ptr']);
  ltbConditon.Clear;
  for i:=VarArrayLowBound(field_cn,1) to VarArrayHighBound(field_cn,1) do
    ltbConditon.Items.Add(field_cn[i]);

  cbbWarehouse.ItemIndex:=0;
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
  if ((ltbConditon.ItemIndex=0)) and (Trim(edtCondition.Text)='') then
  begin
    ShowMessage('查询条件不能为空');
    edtCondition.SetFocus;
    Exit;
  end;
  if ((ltbConditon.ItemIndex=1) or (ltbConditon.ItemIndex=5))
              and (cbbWarehouse.ItemIndex=-1) then
  begin
    ShowMessage('查询条件不能为空');
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
  if (ltbConditon.ItemIndex=0) then edtCondition.Text:='';
end;

procedure TfrmQuery.updatesg(sgrow: Integer);
begin
  sgCondition.Cells[0,sgrow]:=lbCondition.Caption;
  case ltbConditon.ItemIndex of
    0,2,3:
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
    4:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ rgStatus.Items[rgStatus.itemIndex];
      case rgStatus.ItemIndex of
        0: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 0';
        1: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 1';
      end;
    end;
    5:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ cbbWarehouse.Text;
//      ShowMessage(IntToStr(Integer(cbbWarehouse.Items.Objects[cbbWarehouse.ItemIndex])));
      sgCondition.Cells[2,sgrow]:=' AND ' + field_en[ltbConditon.itemIndex] + ' = ' + IntToStr(Integer(cbbWarehouse.Items.Objects[cbbWarehouse.ItemIndex]));
    end;
    1:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ cbbWarehouse.Text;
//      ShowMessage(IntToStr(Integer(cbbWarehouse.Items.Objects[cbbWarehouse.ItemIndex])));
      sgCondition.Cells[2,sgrow]:=' AND ' + field_en[ltbConditon.itemIndex] + ' = ' + QuotedStr(cbbWarehouse.Text);
    end;
  end;
end;
procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  if edtCondition.Visible then edtCondition.Text:='';
  cbbWarehouse.Clear;
  if ltbConditon.ItemIndex=5 then
  begin
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
  end
  else
  if ltbConditon.ItemIndex=1 then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT FORMULA_NUMBER FROM DATA0569 WHERE ttype=0';
      Open;
      First;
      while not Eof do
      begin
        cbbWarehouse.Items.Add(FieldByName('FORMULA_NUMBER').AsString);
        Next;
      end;
    end;
  end;
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemIndex];
  edtCondition.Visible:= not ((ltbConditon.ItemIndex=4) or (ltbConditon.ItemIndex=5) or (ltbConditon.ItemIndex=1)) ;
  rgCondition.Visible:= not ((ltbConditon.ItemIndex=4) or (ltbConditon.ItemIndex=5) or (ltbConditon.ItemIndex=1)) ;
  rgStatus.Visible:= ltbConditon.ItemIndex=4;
  cbbWarehouse.Visible:=(ltbConditon.ItemIndex=5) or (ltbConditon.ItemIndex=1);
end;

procedure TfrmQuery.FormCreate(Sender: TObject);
begin
  rgCondition.Items.Add('相似于');
  rgCondition.Items.Add('相等于');
  rgCondition.ItemIndex:=0;
  rgStatus.Items.Add('有效');
  rgStatus.Items.Add('已审核');
  rgStatus.ItemIndex:=0;
end;

end.
