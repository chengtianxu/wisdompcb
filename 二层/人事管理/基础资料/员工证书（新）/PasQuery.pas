unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, ComCtrls, Menus;

type
  TfrmQuery = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lbCondition: TListBox;
    lbName: TLabel;
    edtCondition: TEdit;
    rgCondition: TRadioGroup;
    btnAdd: TBitBtn;
    btnClear: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    sgQuery: TStringGrid;
    Panel1: TPanel;
    StaticText1: TStaticText;
    dtpkBegin: TDateTimePicker;
    StaticText2: TStaticText;
    dtpkEnd: TDateTimePicker;
    rgStatus: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label1: TLabel;
    dtpkOn: TDateTimePicker;
    dtpkTo: TDateTimePicker;
    Label2: TLabel;
    procedure lbConditionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    field_list_en:Variant;
    procedure update_sg(sg_row:Integer);
  public
    { Public declarations }
  end;

var
  frmQuery: TfrmQuery;

implementation

{$R *.dfm}

procedure TfrmQuery.FormShow(Sender: TObject);
begin
//  field_list_cn:=VarArrayOf(['证书名称','证书编号','失效日期','入职日期','离职日期','状态']);
  field_list_en:=VarArrayOf(['datadetail_1.item','hrcertificate.code','hrcertificate.enddate','employeemsg.ondutytime','employeemsg.outdutytime','hrcertificate.status','datadepartment.departmentname','datadetail_3.item']);
  rgStatus.Visible:=False;
  Panel1.Visible:=False;
  sgQuery.Cells[0,0]:='条件名';
  sgQuery.Cells[1,0]:='条件值';
  lbConditionClick(nil);
end;

procedure TfrmQuery.lbConditionClick(Sender: TObject);
begin
  lbName.Caption:=lbCondition.Items[lbCondition.itemindex];
  Panel1.Visible:= (lbCondition.ItemIndex=2) or (lbCondition.ItemIndex=3)or (lbCondition.ItemIndex=4);
  rgCondition.Visible:=(lbCondition.ItemIndex=0) or (lbCondition.ItemIndex=1) or (lbCondition.ItemIndex=6) or (lbCondition.ItemIndex=7);
  edtCondition.Visible:=(lbCondition.ItemIndex=0) or (lbCondition.ItemIndex=1) or (lbCondition.ItemIndex=6) or (lbCondition.ItemIndex=7);
  rgStatus.Visible:=lbCondition.ItemIndex=5;
end;

procedure TfrmQuery.btnAddClick(Sender: TObject);
var
  i:Integer;
begin
  if ((lbCondition.ItemIndex=0) or (lbCondition.ItemIndex=1)) and (edtCondition.Text='') then
  begin
    ShowMessage('条件不能为空');
    Exit;
  end;
  if ((lbCondition.ItemIndex=2) or (lbCondition.ItemIndex=3) or (lbCondition.ItemIndex=4)) and (dtpkBegin.Date>dtpkEnd.Date) then
  begin
    ShowMessage('开始日期不能大于结束日期');
    Exit;
  end;

  for i:=1 to sgQuery.RowCount-1 do
  begin
    if sgQuery.Cells[0,i]=lbCondition.Items[lbCondition.ItemIndex] then
    begin
      update_sg(i);
      edtCondition.Text:='';
      Exit;
    end;
  end;
  update_sg(sgQuery.RowCount-1);
  edtCondition.Text:='';
  sgQuery.RowCount:=sgQuery.RowCount+1;
end;

procedure TfrmQuery.update_sg(sg_row: Integer);
begin
  sgQuery.Cells[0,sg_row]:=lbName.Caption;
  case lbCondition.ItemIndex of
    0,1,6,7:
    begin
      if rgCondition.ItemIndex=0 then
      begin
        sgQuery.Cells[1,sg_row]:= '相似 ' + Trim(edtCondition.Text);
        sgQuery.Cells[2,sg_row]:= 'and '+ field_list_en[lbCondition.itemindex]+' like ''%' + Trim(edtCondition.Text)+'%''';
      end
      else
      begin
        sgQuery.Cells[1,sg_row]:= '等于 ' + Trim(edtCondition.Text);
        sgQuery.Cells[2,sg_row]:= 'and '+ field_list_en[lbCondition.itemindex] +' = ''' + Trim(edtCondition.Text)+ '''';
      end;
    end;
    2,3,4:
    begin
      sgQuery.Cells[1,sg_row]:='从' +   DateToStr(dtpkBegin.Date)+ ' 到 '+ DateToStr(dtpkEnd.Date);
      sgQuery.Cells[2,sg_row]:='and '+ field_list_en[lbCondition.itemindex]+' between '''+ DateToStr(dtpkBegin.Date) +''' and '''+ DateToStr(dtpkEnd.Date)+'''';
    end;
    5:
    begin
      sgQuery.Cells[1,sg_row]:= '等于 '+ rgStatus.Items[rgStatus.itemIndex];
      if rgStatus.ItemIndex=0 then sgQuery.Cells[2,sg_row]:= 'and '+ field_list_en[lbCondition.itemindex] +' = 1'
      else sgQuery.Cells[2,sg_row]:= 'and '+ field_list_en[lbCondition.itemindex] +' = 0'
    end;
  end;
end;

procedure TfrmQuery.N1Click(Sender: TObject);
var
  i:Integer;
begin
  if (sgQuery.Row<>sgQuery.RowCount-1 ) and (sgQuery.RowCount>2) then
  begin
    for i:=sgQuery.Row to sgQuery.RowCount do
    begin
      sgQuery.Rows[i]:=sgQuery.Rows[i+1];     //把后面行覆盖前一行
    end;
    sgQuery.RowCount:=sgQuery.RowCount-1;
  end;
end;

procedure TfrmQuery.btnClearClick(Sender: TObject);
var
  i:Integer;
begin
  if sgQuery.RowCount>2 then
  for i:=1 to sgQuery.RowCount-2 do
  begin
  sgQuery.Rows[i].Text:='';
  end;
  sgQuery.RowCount:=2;
end;

end.
