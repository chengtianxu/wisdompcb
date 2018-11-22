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
    rgCondition: TRadioGroup;
    dtpkFrom: TDateTimePicker;
    dtpkTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure ltbConditonClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
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

uses Pick_Item_Single,ConstVar, DAMO;

{$R *.dfm}

procedure TfrmQuery.FormShow(Sender: TObject);
var
   i:Integer;
//   tmp_date:TDateTime;
begin
  field_cn:= VarArrayOf(['IQC报告编号','供应商代码','供应商名称','材料名称','材料规格','型号','订单号','材料编码','材料类别']);
  field_en:=VarArrayOf(['Data0391.iqc_number','Data0023.CODE','Data0023.ABBR_NAME','Data0017.INV_NAME','Data0017.INV_DESCRIPTION',
                'data0391.supplier_model','data0070.PO_Number','Data0017.INV_PART_NUMBER','DATA0496.GROUP_NAME']);
  ltbConditon.Clear;
  for i:=VarArrayLowBound(field_cn,1) to VarArrayHighBound(field_cn,1) do
    ltbConditon.Items.Add(field_cn[i]);

  sgCondition.Cells[0,0]:='条件名';
  sgCondition.Cells[1,0]:='条件值';
  rgStatus.Visible:=False;
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
  if (ltbConditon.ItemIndex<>6) and (Trim(edtCondition.Text)='') then
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
    0,1,2,3,4,5,6,7,8:
    begin
      if rgCondition.ItemIndex=0 then
      begin
        sgCondition.Cells[1,sgrow]:='相似于 '+ Trim(edtCondition.Text);
        sgCondition.Cells[2,sgrow]:=' and ' + field_en[ltbConditon.itemIndex] + ' like ''%'+ Trim(edtCondition.Text) + '%''';
      end
      else
      begin
        sgCondition.Cells[1,sgrow]:='相等于 '+ Trim(edtCondition.Text);
        sgCondition.Cells[2,sgrow]:=' and ' + field_en[ltbConditon.itemIndex] + '='+ QuotedStr(Trim(edtCondition.Text));
      end;
    end;
//    8:
//    begin
//      sgCondition.Cells[1,sgrow]:='等于 '+ rgStatus.Items[rgStatus.itemIndex];
//      case rgStatus.ItemIndex of
//        0: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 1';
//        1: sgCondition.Cells[2,sgrow]:=' and '+ field_en[ltbConditon.itemIndex]+' = 2';
//        2: sgCondition.Cells[2,sgrow]:=' and ('+ field_en[ltbConditon.itemIndex]+' = 2 '+ ' or '+  field_en[ltbConditon.itemIndex]+' = 1)';
//      end;
//    end;
  end;
end;

procedure TfrmQuery.ltbConditonClick(Sender: TObject);
begin
  lbCondition.Caption:=ltbConditon.Items[ltbConditon.itemindex];
  btn1.Visible:= (ltbConditon.ItemIndex = 8);
//  edtCondition.Visible:=(ltbConditon.ItemIndex<>6);
//  rgCondition.Visible:=edtCondition.Visible;
//  rgStatus.Visible:= ltbConditon.ItemIndex=6;
  if (Trim(edtCondition.Text)<>'') then edtCondition.Text:='';
  edtCondition.SetFocus;
end;

procedure TfrmQuery.btn1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'GROUP_NAME/类别编号/120,GROUP_DESC/类别名称/250';
    InputVar.Sqlstr := 'select rKey,GROUP_NAME,GROUP_DESC from data0496 order by GROUP_NAME';
    inputvar.KeyField:='GROUP_NAME';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
       edtCondition.Text:=frmPick_Item_Single.adsPick.fieldbyname('GROUP_NAME').AsString;
  finally
    frmPick_Item_Single.Free;
  end;
end;

end.
