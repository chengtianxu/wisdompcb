unit Report8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport8 = class(TfrmBaseForm)
    aqQueryINV_PART_NUMBER: TStringField;
    aqQueryINV_PART_DESCRIPTION: TStringField;
    aqQueryunit_code: TStringField;
    aqQuerygroup_name: TStringField;
    aqQuerygroup_desc: TStringField;
    aqQueryMANUFACTURER_NAME: TStringField;
    aqQueryquan_alloc: TFloatField;
    aqQuerySTOCK_SELL: TFloatField;
    aqQuerySTOCK_BASE: TFloatField;
    aqQueryCONSIGN_ONHAND_QTY: TFloatField;
    aqQuerySTD_COST: TFloatField;
    aqQueryREPORT_VALUE1: TFloatField;
    aqQueryANALYSIS_CODE1: TStringField;
    aqQueryANALYSIS_CODE2: TStringField;
    aqQueryANALYSIS_CODE3: TStringField;
    aqQueryANALYSIS_CODE4: TStringField;
    aqQueryANALYSIS_CODE5: TStringField;
    aqQueryFacName: TStringField;
    aqQuerySTOP_PURCH: TStringField;
    aqQueryIES_PARAMETER_VALUE1: TStringField;
    aqQueryIES_PARAMETER_VALUE2: TStringField;
    aqQueryIES_PARAMETER_VALUE3: TStringField;
    aqQueryIES_PARAMETER_VALUE4: TStringField;
    aqQueryIES_PARAMETER_VALUE5: TStringField;
    aqQueryIES_PARAMETER_VALUE6: TStringField;
    aqQueryIES_PARAMETER_VALUE7: TStringField;
    aqQueryIES_PARAMETER_VALUE8: TStringField;
    aqQueryIES_PARAMETER_VALUE9: TStringField;
    aqQueryIES_PARAMETER_VALUE10: TStringField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport8: TfrmReport8;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport8.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport8.btnQueryClick(Sender: TObject);
var
  i:byte;
  vCondition: widestring;
begin
  inherited;
  with frmCondition do
  begin
    dtpk1.Date:= Now-3650;
    dtpk2.Date:= Now;
    if ShowModal = mrok then
    begin
      with aqQuery do
      begin
        Close;
        Parameters[0].Value:= frmCondition.Link;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
          vCondition:= vCondition + frmCondition.SGrid1.Cells[2,i] + #13;
        Parameters[1].Value:= vCondition;
        Parameters[2].Value:= 'Order By t496.group_name,t17.INV_PART_NUMBER' + #13;
        Parameters[3].Value:= frmCondition.AreaName;
        Open;
      end;
    end;
  end;
end;

end.
