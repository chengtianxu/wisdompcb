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
    rgStatus: TRadioGroup;
    edtCondition: TEdit;
    GroupBox2: TGroupBox;
    sgCondition: TStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    nDelete: TMenuItem;
    cbbtype: TComboBox;
    dtpkFrom: TDateTimePicker;
    lbl2: TLabel;
    dtpkTo: TDateTimePicker;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure ltbConditonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    field_cn,field_en:Variant;
    lttype:TStringList;
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
  field_cn:= VarArrayOf(['房间编号','房间名称','类型','是否复核']);
  field_en:=VarArrayOf(['dbo.Bedroommsg.R_code','dbo.Bedroommsg.R_name',
          'dbo.Bedroom_equipment_record.type','dbo.Bedroom_equipment_record.ischecked']);
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
    0,1:
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
    2:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ cbbtype.Items[cbbtype.itemindex];
      sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = '+ QuotedStr(string(cbbtype.Items.Objects[cbbtype.ItemIndex]));
    end;
    3:
    begin
      sgCondition.Cells[1,sgrow]:='等于 '+ rgStatus.Caption;
      sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = '+ IntToStr(rgStatus.ItemIndex);
    end;
  end;
end;
procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemIndex];
  rgStatus.Items.Clear;
  if (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1) then
  begin
    rgStatus.Items.Add('相似于');
    rgStatus.Items.Add('相等于');
    rgStatus.ItemIndex:=0;
  end;
  if ltbConditon.ItemIndex=3 then
  begin
    rgStatus.Items.Add('否');
    rgStatus.Items.Add('是');
    rgStatus.ItemIndex:=0;
  end;
  edtCondition.Visible:= (ltbConditon.ItemIndex=0) or (ltbConditon.ItemIndex=1);
  rgStatus.Visible:= not (ltbConditon.ItemIndex=2);
  cbbtype.Visible:=ltbConditon.ItemIndex=2;
end;

procedure TfrmQuery.FormCreate(Sender: TObject);
begin
  lttype:=TStringList.Create;
  lttype.Add('E');
  lttype.Add('W');
  cbbtype.Items.AddObject('电费',TObject(lttype[0]));
  cbbtype.Items.AddObject('水费',TObject(lttype[1]));
  cbbtype.Style:=csDropDownList;
end;

procedure TfrmQuery.FormDestroy(Sender: TObject);
begin
  lttype.Free;
end;

end.
