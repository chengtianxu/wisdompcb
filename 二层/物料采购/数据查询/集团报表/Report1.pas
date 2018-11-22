unit Report1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls, ComCtrls;

type
  TfrmReport1 = class(TfrmBaseForm)
    aqQueryREF457_NUMBER: TStringField;
    aqQueryGON_NUMBER: TStringField;
    aqQueryINV_PART_NUMBER: TStringField;
    aqQueryINV_PART_DESCRIPTION: TStringField;
    aqQueryGROUP_DESC: TStringField;
    aqQueryDEPT_NAME: TStringField;
    aqQueryQUANTITY: TBCDField;
    aqQueryRTN_QUANTITY: TFloatField;
    aqQueryCURR_CODE: TStringField;
    aqQuerySTANDARD_COST: TBCDField;
    aqQueryBARCODE_ID: TStringField;
    aqQueryTAX_2: TBCDField;
    aqQuerytax_price: TBCDField;
    aqQuerytotal_price: TBCDField;
    aqQuerytotal_notaxprice: TBCDField;
    aqQueryCODE: TStringField;
    aqQueryABBR_NAME: TStringField;
    aqQueryUNIT_NAME: TStringField;
    aqQueryTDATE: TDateTimeField;
    aqQueryEMPLOYEE_NAME: TStringField;
    aqQueryLOCATION: TStringField;
    aqQueryWAREHOUSE_CODE: TStringField;
    aqQueryv_type: TStringField;
    aqQueryFL_EMPLOYEE: TStringField;
    aqQueryANALYSIS_CODE1: TStringField;
    aqQueryANALYSIS_CODE2: TStringField;
    aqQueryANALYSIS_CODE3: TStringField;
    aqQueryWAREHOUSE_NAME: TStringField;
    aqQueryVDATE: TDateTimeField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport1: TfrmReport1;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport1.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport1.btnQueryClick(Sender: TObject);
var
  i:byte;
  vCondition: widestring;
begin
  inherited;
  with frmCondition do
  begin
    dtpk1.Date:= Now-7;
    dtpk2.Date:= Now;
    if ShowModal = mrok then
    begin
      with aqQuery do
      begin
        Close;
        Parameters[0].Value:= frmCondition.Link;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
          vCondition:= vCondition + frmCondition.SGrid1.Cells[2,i] + #13;
        Parameters[1].Value:= 'and t207.TDATE Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[2].Value:= 'Order By DEPT_NAME, inv_part_number';
        Open;
      end;
    end;
  end;
end;

end.
