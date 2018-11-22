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
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtpkFrom: TDateTimePicker;
    dtpkTo: TDateTimePicker;
    GroupBox2: TGroupBox;
    sgCondition: TStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    nDelete: TMenuItem;
    rgCondition: TRadioGroup;
    cbb: TComboBox;
    rgTempBy: TRadioGroup;
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
  field_cn:= VarArrayOf(['供应商代码','供应商名称','类别','物料名称','供应商物料型号','RoHS/无卤','测试日期', '有效日期','暂时通过']);
  field_en:=VarArrayOf(['Data0023.CODE','Data0023.SUPPLIER_NAME','data0805.INV_Type','data0805.INV_Name','data0805.Model','data0805.RoHsFree','data0805.TestDate','data0805.EffeDate','data0805.TemporBy']);
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
  if ((ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1) or (ltbConditon.ItemIndex=2) or (ltbConditon.ItemIndex=3) or (ltbConditon.ItemIndex=4)) and (Trim(edtCondition.Text)='') then
  begin
    ShowMessage('查询条件不能为空');
    edtCondition.SetFocus;
    Exit;
  end;
  if (ltbConditon.ItemIndex=5) and (cbb.Text='') then
  begin
    ShowMessage('请先选择或输入条件');
    cbb.SetFocus;
    Exit;
  end;
  for i:=1 to sgCondition.RowCount-2 do
  begin
    if sgCondition.Cells[0,i]=lbCondition.Caption then
    begin
      updatesg(i);
      if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1) or (ltbConditon.ItemIndex=2) or (ltbConditon.ItemIndex=3) or (ltbConditon.ItemIndex=4) or (ltbConditon.ItemIndex=5)then edtCondition.Text:='' ;
      Exit;
    end;
  end;
  updatesg(sgCondition.RowCount-1);
  sgCondition.RowCount:=sgCondition.RowCount+1;
  if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1) or (ltbConditon.ItemIndex=2) or (ltbConditon.ItemIndex=3) or (ltbConditon.ItemIndex=4) or (ltbConditon.ItemIndex=5) then edtCondition.Text:='';
end;

procedure TfrmQuery.updatesg(sgrow: Integer);
begin
  sgCondition.Cells[0,sgrow]:=lbCondition.Caption;
  case ltbConditon.ItemIndex of
    0,1,2,3,4:
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
    5:
    begin
      sgCondition.Cells[1,sgrow]:='相等于 '+ Trim(cbb.Text);
      sgCondition.Cells[2,sgrow]:=' and ' + field_en[ltbConditon.itemIndex] + ' = '+ QuotedStr(Trim(cbb.Text));
    end;
    6,7:
    begin
      sgCondition.Cells[1,sgrow]:='从 '+ DateToStr(dtpkFrom.Date)+ ' 到 ' + DateToStr(dtpkTo.Date);
      sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex] + ' between ' + QuotedStr(DateToStr(dtpkFrom.Date))+' and '+ QuotedStr(DateToStr(dtpkTo.Date));
    end;
    8:
    begin
      sgCondition.Cells[1,sgrow]:='相等于 '+ rgTempBy.Items[rgTempBy.itemindex];
      sgCondition.Cells[2,sgrow]:=' and ' + field_en[ltbConditon.itemIndex] + ' = '+ IntToStr(rgTempBy.ItemIndex);
    end;
  end;
end;

procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemIndex];
  edtCondition.Visible:= not ((ltbConditon.ItemIndex=5) or (ltbConditon.ItemIndex=6) or (ltbConditon.ItemIndex=7));
  pnl1.Visible:=(ltbConditon.ItemIndex=6) or (ltbConditon.ItemIndex=7);
  cbb.Visible:=ltbConditon.ItemIndex=5;
  rgCondition.Visible:= not ((ltbConditon.ItemIndex=5) or (ltbConditon.ItemIndex=6) or (ltbConditon.ItemIndex=7));
  rgTempBy.Visible:=ltbConditon.ItemIndex=8;
end;

end.
