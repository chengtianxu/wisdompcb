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

{$R *.dfm}

procedure TfrmQuery.FormShow(Sender: TObject);
var
   i:Integer;
begin
  field_cn:= VarArrayOf(['统计编号','工序代码','工序名称','状态']);
  field_en:=VarArrayOf(['DATA0570.number','Data0034.DEPT_CODE','Data0034.DEPT_NAME','DATA0570.status']);
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
    3:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ rgStatus.Items[rgStatus.itemIndex];
      case rgStatus.ItemIndex of
        0: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 0';
        1: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 1';
      end;
    end;
  end;
end;
procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemIndex];
  edtCondition.Visible:= not (ltbConditon.ItemIndex=3);
  rgCondition.Visible:= not (ltbConditon.ItemIndex=3);
  rgStatus.Visible:= ltbConditon.ItemIndex=3;
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
