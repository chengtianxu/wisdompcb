unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, ExtCtrls, Buttons, Menus;

type
  TfrmQuery = class(TForm)
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    sgCondition: TStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    gbCondition: TGroupBox;
    lbCondition: TLabel;
    ltbConditon: TListBox;
    btnAdd: TBitBtn;
    btnClear: TBitBtn;
    rgStatus: TRadioGroup;
    edtCondition: TEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtpkFrom: TDateTimePicker;
    dtpkTo: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    nDelete: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ltbConditonClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
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
  field_cn:= VarArrayOf(['工号','卡号','发卡日期','失效日期','考勤卡状态']);
  field_en:=VarArrayOf(['employeemsg.employeecode','employeecardMsg.cardno_dec','employeecardMsg.begin_time','employeecardMsg.end_time','employeecardMsg.status']);
  ltbConditon.Clear;
  for i:=VarArrayLowBound(field_cn,1) to VarArrayHighBound(field_cn,1) do
    ltbConditon.Items.Add(field_cn[i]);

  sgCondition.Cells[0,0]:='条件名';
  sgCondition.Cells[1,0]:='条件值';
  ltbConditon.ItemIndex:=0;
  ltbConditonClick(Self);
end;

procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemIndex];
  edtCondition.Visible:=(ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1);
  rgStatus.Visible:=ltbConditon.ItemIndex=4;
  pnl1.Visible:=(ltbConditon.ItemIndex=2) or (ltbConditon.ItemIndex=3);

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
    0,1:
    begin
      sgCondition.Cells[1,sgrow]:='相似于 '+ Trim(edtCondition.Text);
      sgCondition.Cells[2,sgrow]:=' and ' + field_en[ltbConditon.itemIndex] + ' like ''%'+ Trim(edtCondition.Text) + '%''';
    end;
    2,3:
    begin
      sgCondition.Cells[1,sgrow]:='从 '+ DateToStr(dtpkFrom.Date)+ ' 到 ' + DateToStr(dtpkTo.Date);
      sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex] + ' between ' + QuotedStr(DateToStr(dtpkFrom.Date))+' and '+ QuotedStr(DateToStr(dtpkTo.Date));
    end;
    4:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ rgStatus.Items[rgStatus.itemIndex];
      case rgStatus.ItemIndex of
        0: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 1';
        1: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 2';
        2: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 3';
        3: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 4';
      end;
    end;
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

procedure TfrmQuery.nDeleteClick(Sender: TObject);
var
  i:Integer;
begin
  if sgCondition.Row<>sgCondition.RowCount-1then
  begin
    for i:= sgCondition.Row to sgCondition.RowCount-2 do
    begin
      sgCondition.Rows[i]:=sgCondition.Rows[i+1];
    end;
    sgCondition.RowCount:=sgCondition.RowCount-1;
  end;
end;

end.
