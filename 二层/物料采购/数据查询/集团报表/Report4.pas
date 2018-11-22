unit Report4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport4 = class(TfrmBaseForm)
    aqQueryINV_PART_NUMBER: TStringField;
    aqQueryINV_PART_DESCRIPTION: TStringField;
    aqQueryGROUP_DESC: TStringField;
    aqQueryLOCATION: TStringField;
    aqQueryspec_place: TStringField;
    aqQuerycode_23: TStringField;
    aqQuerycode23: TStringField;
    aqQueryQUAN_ON_HAND: TBCDField;
    aqQueryquan_total: TBCDField;
    aqQueryCURR_CODE: TStringField;
    aqQuerytax_price: TBCDField;
    aqQueryPRICE: TBCDField;
    aqQueryTAX_2: TBCDField;
    aqQueryL_no_taxprice: TBCDField;
    aqQueryL_tax_price: TBCDField;
    aqQueryamount_notax: TBCDField;
    aqQueryamount_tax: TBCDField;
    aqQueryPO_NUMBER: TStringField;
    aqQuerypo_emplname: TStringField;
    aqQueryGRN_NUMBER: TStringField;
    aqQueryship_DATE: TDateTimeField;
    aqQueryEXPIRE_DATE: TDateTimeField;
    aqQueryTDATE: TDateTimeField;
    aqQueryhuoling: TIntegerField;
    aqQuerydqts: TIntegerField;
    aqQueryANALYSIS_CODE1: TStringField;
    aqQueryUNIT_NAME: TStringField;
    aqQuerytype: TStringField;
    aqQueryFactoryName: TStringField;
    aqQueryReqName: TStringField;
    aqQueryRecName: TStringField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport4: TfrmReport4;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport4.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport4.btnQueryClick(Sender: TObject);
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
//        Parameters[1].Value:= 'and ship_DATE Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
//                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[1].Value:= vCondition;
        Parameters[2].Value:= 'Order By GROUP_DESC,inv_part_number';
        Open;
      end;
    end;
  end;
end;

end.
