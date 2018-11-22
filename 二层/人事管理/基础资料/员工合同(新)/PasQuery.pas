unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls, Menus;

type
  TfrmQuery = class(TForm)
    GroupBox1: TGroupBox;
    lbCondition: TListBox;
    lbName: TLabel;
    edtCondition: TEdit;
    sgCondition: TStringGrid;
    pndate: TPanel;
    dtpkFrom: TDateTimePicker;
    dtpkTo: TDateTimePicker;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    cbbType: TComboBox;
    btnAdd: TBitBtn;
    btnClear: TBitBtn;
    btnConfirm: TBitBtn;
    btnCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure lbConditionClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
    field_cn,field_en:Variant;
    procedure updatesg(sg_row:Integer);
  public
    { Public declarations }
  end;

var
  frmQuery: TfrmQuery;

implementation

uses DAMO,common,DateUtils;

{$R *.dfm}

procedure TfrmQuery.FormShow(Sender: TObject);
var
  i:Integer;
begin
  sgCondition.Cells[0,0]:='条件名';
  sgCondition.Cells[1,0]:='条件值';
  lbCondition.Clear;
  cbbType.Clear;
  dtpkFrom.Date:= IncYear(getsystem_date(DM.adoTime,1),-2);
  dtpkTo.Date:=getsystem_date(DM.adoTime,1);
  field_cn:= VarArrayOf(['员工工号','员工姓名','员工部门','合同编号','入职日期','合同结束日期','合同类型']);
  field_en:= VarArrayOf(['v_employeemsg.employeecode','v_employeemsg.chinesename','v_employeemsg.departmentname','employee_contract.code','v_employeemsg.ondutytime','employee_contract.enddate','employee_contract.type']);

  for i:= VarArrayLowBound(field_cn,1) to VarArrayHighBound(field_cn,1) do
    lbCondition.Items.Add(field_cn[i]);

  lbCondition.ItemIndex:=0;
  lbConditionClick(nil);


  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,item from datadetail where dictid=5 ');
    Open;
    First;
    while not Eof do
    begin
      cbbType.Items.AddObject(FieldByName('item').AsString,Pointer(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
end;

procedure TfrmQuery.lbConditionClick(Sender: TObject);
begin
  lbName.Caption:=lbCondition.Items[lbCondition.ItemIndex];
  edtCondition.Visible:=(lbCondition.ItemIndex=0) or (lbCondition.ItemIndex=1) or (lbCondition.ItemIndex=2) or (lbCondition.ItemIndex=3) ;
  pndate.Visible:=(lbCondition.ItemIndex=4) or (lbCondition.ItemIndex=5);
  cbbType.Visible:=lbCondition.ItemIndex=6;
end;

procedure TfrmQuery.N1Click(Sender: TObject);
var
  i:Integer;
begin
  if (sgCondition.Row<>sgCondition.RowCount-1) and (sgCondition.RowCount>2) then
    begin
      for i:=sgCondition.Row to sgCondition.RowCount-1 do
        sgCondition.Rows[i]:=sgCondition.Rows[i+1];
      sgCondition.RowCount:=sgCondition.RowCount-1;
    end;
end;

procedure TfrmQuery.btnClearClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to sgCondition.RowCount-1 do
    sgCondition.Rows[i].Clear;
  sgCondition.RowCount:=2;
end;

procedure TfrmQuery.btnAddClick(Sender: TObject);
var
  i:Integer;
begin
  if ((lbCondition.ItemIndex=0) or (lbCondition.ItemIndex=1)or (lbCondition.ItemIndex=3) or (lbCondition.ItemIndex=2)) and (edtCondition.Text='') then
  begin
    ShowMessage('条件为空，请先输入查询条件');
    Exit;
  end;
  if ((lbCondition.ItemIndex=4) or (lbCondition.ItemIndex=5)) and (dtpkFrom.Date>dtpkTo.Date) then
  begin
    ShowMessage('开始日期大于结束日期');
    Exit;
  end;
  if (lbCondition.ItemIndex=6) and (cbbType.ItemIndex=-1) then
  begin
    ShowMessage('合同类型为空，请先选择合同类型');
    exit;
  end;

  for i:=1 to sgCondition.RowCount-1 do
  begin
    if lbCondition.Items[lbCondition.ItemIndex]=sgCondition.Cells[0,i] then
    begin
      updatesg(i);
      if (lbCondition.ItemIndex=0) or (lbCondition.ItemIndex=3) or (lbCondition.ItemIndex=1) or (lbCondition.ItemIndex=2) then
        edtCondition.Text:='';
      Exit;
    end;
  end;
  updatesg(sgCondition.RowCount-1);
  edtCondition.Text:='';
  sgCondition.RowCount:=sgCondition.RowCount+1;
end;

procedure TfrmQuery.updatesg(sg_row: Integer);
begin
  sgCondition.Cells[0,sg_row]:=lbCondition.Items[lbCondition.itemindex];
  case lbCondition.ItemIndex of
    0,1,2,3:
    begin
      sgCondition.Cells[1,sg_row]:='相似于 ' + edtCondition.Text;
      sgCondition.Cells[2,sg_row]:=' and '+ field_en[lbCondition.ItemIndex]+' like ''%'+ Trim(edtCondition.Text)+ '%''';
//      ShowMessage(sgCondition.Cells[2,sg_row]);
    end;

    4,5:
    begin
      sgCondition.Cells[1,sg_row]:='从 '+ DateToStr(dtpkFrom.Date)+' 到：' + DateToStr(dtpkTo.Date);
      sgCondition.Cells[2,sg_row]:=' and '+ field_en[lbCondition.ItemIndex] +' between '+ QuotedStr(DateToStr(dtpkFrom.Date))+' and ' + QuotedStr(DateToStr(dtpkTo.Date));
//      ShowMessage(sgCondition.Cells[2,sg_row]);
    end;

    6:
    begin
      sgCondition.Cells[1,sg_row]:='等于 '+ cbbType.Items[cbbType.itemindex];
      sgCondition.Cells[2,sg_row]:=' and '+ field_en[lbCondition.itemindex]+' = '+ IntToStr(Integer(cbbType.Items.Objects[cbbType.itemindex]));
//      ShowMessage(sgCondition.Cells[1,sg_row]);
//      ShowMessage(sgCondition.Cells[2,sg_row]);
    end;

//    6:
//    begin
//      sgCondition.Cells[1,sg_row]:='等于 '+ rgState.Items[rgState.itemindex];
//      if rgState.ItemIndex=0 then sgCondition.Cells[2,sg_row]:=' and '+ field_en[lbCondition.itemindex]+' = 1'
//      else sgCondition.Cells[2,sg_row]:=' and '+ field_en[lbCondition.itemindex]+' = 2' ;
////      ShowMessage(sgCondition.Cells[1,sg_row]);
////      ShowMessage(sgCondition.Cells[2,sg_row]);
//    end;
  end;
end;

end.
