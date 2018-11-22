unit Uqry5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, CheckLst, StdCtrls, Buttons, ExtCtrls, ComCtrls,common, Menus,
  DB, ADODB;

type
  Tfrmqry5 = class(TForm)
    gbCondition: TGroupBox;
    lbCondition: TLabel;
    ltbConditon: TListBox;
    btnAdd: TBitBtn;
    btnClear: TBitBtn;
    rgStatus: TRadioGroup;
    edtCondition: TEdit;
    GroupBox2: TGroupBox;
    sgCondition: TStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cbbType: TComboBox;
    pnl1: TPanel;
    lbl1: TLabel;
    dtpkFrom: TDateTimePicker;
    lbl2: TLabel;
    dtpkTo: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label2: TLabel;
    dtpkqueryStart: TDateTimePicker;
    Label3: TLabel;
    dtpkqureyEnd: TDateTimePicker;
    qrytemp: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure ltbConditonClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
    field_cn,field_en:Variant;
    procedure updatesg(sg_row:Integer);
  public
    { Public declarations }
  end;

var
  frmqry5: Tfrmqry5;

implementation

uses udm,DateUtils;

{$R *.dfm}

procedure Tfrmqry5.FormShow(Sender: TObject);
var
  i:Integer;
begin
   dtpkqueryStart.Date:= IncMonth(getsystem_date(qrytemp,1),-1);
   dtpkqureyEnd.Date:=getsystem_date(qrytemp,1);
  field_cn:= VarArrayOf(['员工工号','员工姓名','员工部门','培训类型','是否结清费用','是否引用'
        ,'有效期时间','结案时间','是否完成','培训编号','操作时间']);
  field_en:= VarArrayOf(['v_employeemsg.employeecode','v_employeemsg.chinesename',
        'v_employeemsg.departmentname','Employee_Train.type_ptr','Employee_Train.feels_payed',
        'Employee_Train.flag','Employee_Train.effective_date','Employee_Train.oprate_time',
        'Employee_Train.Train_status','Employee_Train.train_no','Employee_Train.oprate_time']);
  ltbConditon.Clear;
  for i:=VarArrayLowBound(field_cn,1) to VarArrayHighBound(field_en,1) do
    ltbConditon.Items.Add(field_cn[i]);

  cbbType.ItemIndex:=0;
  rgStatus.ItemIndex:=0;
  ltbConditon.ItemIndex:=0;
  ltbConditonClick(nil);
  with sgCondition do
  begin
    Cells[0,0]:='条件名';
    Cells[1,0]:='条件值';
  end;
  cbbType.Clear;
  with qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,item from datadetail where dictid=20');
    Open;
    First;
    while not Eof do
    begin
      cbbType.Items.AddObject(FieldByName('item').AsString,Pointer(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;

end;
procedure Tfrmqry5.ltbConditonClick(Sender: TObject);
begin
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemindex];
  edtCondition.Visible:=(ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1)
              or (ltbConditon.ItemIndex=2) or (ltbConditon.ItemIndex=9);
  cbbType.Visible:=ltbConditon.ItemIndex=3;
  rgStatus.Visible:=(ltbConditon.ItemIndex=4) or (ltbConditon.ItemIndex=5) or (ltbConditon.ItemIndex=8);
  pnl1.Visible:=(ltbConditon.ItemIndex=6) or (ltbConditon.ItemIndex=7) or (ltbConditon.ItemIndex=10);
  if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1)
         or (ltbConditon.ItemIndex=2) or (ltbConditon.ItemIndex=9) then
  begin
    edtCondition.Text:='';
  end;
  if (ltbConditon.ItemIndex=3) then
  begin
    cbbType.ItemIndex:=-1;
  end;
  if ltbConditon.ItemIndex=4 then
  begin
    rgStatus.Items[0]:='未结清';
    rgStatus.Items[1]:='已结清';
  end;
  if ltbConditon.ItemIndex=5 then
  begin
    rgStatus.Items[0]:='未用';
    rgStatus.Items[1]:='引用';
  end;
  if ltbConditon.ItemIndex=8 then
  begin
    rgStatus.Items[0]:='未完成';
    rgStatus.Items[1]:='已完成';
  end;
end;

procedure Tfrmqry5.btnClearClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to sgCondition.RowCount-1 do
    sgCondition.Rows[i].Clear;
  sgCondition.RowCount:=2;
end;

procedure Tfrmqry5.N1Click(Sender: TObject);
var
  i:Integer;
begin
  if (sgCondition.Row<>sgCondition.RowCount-1) and (sgCondition.RowCount>2) then
    begin
      for i:=sgCondition.Row to sgCondition.RowCount-1 do
      begin
        sgCondition.Rows[i]:=sgCondition.Rows[i+1];
      end;
      sgCondition.RowCount:=sgCondition.RowCount-1;
    end;
end;

procedure Tfrmqry5.btnAddClick(Sender: TObject);
var
  i:Integer;
begin
  if ((ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex= 1) or (ltbConditon.ItemIndex= 2) or (ltbConditon.ItemIndex=9))
        and (edtCondition.Text='') then
  begin
    ShowMessage('请先输入查询条件');
    edtCondition.SetFocus;
    exit;
  end;

  for i:=1 to sgCondition.RowCount-1 do
  begin
    if ltbConditon.Items[ltbConditon.ItemIndex]=sgCondition.Cells[0,i] then
    begin
      updatesg(i);
      if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=2) then
        edtCondition.Text:='';
      Exit;
    end;
  end;
  updatesg(sgCondition.RowCount-1);
  edtCondition.Text:='';
  sgCondition.RowCount:=sgCondition.RowCount+1;
end;

procedure Tfrmqry5.updatesg(sg_row: Integer);
begin
  sgCondition.Cells[0,sg_row]:=ltbConditon.Items[ltbConditon.itemindex];
  case ltbConditon.ItemIndex of
    0,1,2,9:
    begin
      sgCondition.Cells[1,sg_row]:='相似于 ' + edtCondition.Text;
      sgCondition.Cells[2,sg_row]:=' and '+ field_en[ltbConditon.ItemIndex]+' like ''%'+ Trim(edtCondition.Text)+ '%''';
//      ShowMessage(sgCondition.Cells[2,sg_row]);
    end;

    3:
    begin
      sgCondition.Cells[1,sg_row]:='等于 '+ cbbType.Items[cbbType.itemindex];
        sgCondition.Cells[2,sg_row]:=' and '+ field_en[ltbConditon.ItemIndex]+ ' = ' + IntToStr(Integer(cbbType.Items.Objects[cbbType.ItemIndex]));
//      ShowMessage(sgCondition.Cells[2,sg_row]);
    end;

    4,5,8:
    begin
      sgCondition.Cells[1,sg_row]:='等于 '+ rgStatus.Items[rgStatus.itemindex];
      if rgStatus.ItemIndex=0 then
        sgCondition.Cells[2,sg_row]:=' and '+ field_en[ltbConditon.itemindex]+ ' = 0'
      else
        sgCondition.Cells[2,sg_row]:=' and '+ field_en[ltbConditon.itemindex]+ ' = 1';
//      ShowMessage(sgCondition.Cells[1,sg_row]);
//      ShowMessage(sgCondition.Cells[2,sg_row]);
    end;

    6,7,10:
    begin
      sgCondition.Cells[1,sg_row]:='从：'+ DateToStr(dtpkFrom.Date)+ '到：'+ DateToStr(dtpkTo.Date);
      sgCondition.Cells[2,sg_row]:=' and '+ field_en[ltbConditon.itemindex]+ ' between ' + QuotedStr(DateToStr(dtpkFrom.Date)) + ' and ' + QuotedStr(DateToStr(dtpkTo.Date));
//      ShowMessage(sgCondition.Cells[1,sg_row]);
//      ShowMessage(sgCondition.Cells[2,sg_row]);
    end;
  end;
end;

end.
