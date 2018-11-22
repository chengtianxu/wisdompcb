unit Report3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport3 = class(TfrmBaseForm)
    aqQueryGRN_NUMBER: TStringField;
    aqQueryDELIVER_NUMBER: TStringField;
    aqQueryINV_PART_NUMBER: TStringField;
    aqQueryGROUP_DESC: TStringField;
    aqQueryWAREHOUSE_CODE: TStringField;
    aqQueryPO_NUMBER: TStringField;
    aqQuerycode_23: TStringField;
    aqQuerycode23: TStringField;
    aqQueryTAX_ID_NUMBER: TStringField;
    aqQueryQUANTITY: TFloatField;
    aqQueryQUAN_ON_HAND: TBCDField;
    aqQueryCURR_CODE: TStringField;
    aqQueryTAX_2: TBCDField;
    aqQuerytax_price: TBCDField;
    aqQueryDSDesigner: TBCDField;
    aqQueryDSDesigner2: TFloatField;
    aqQueryDSDesigner3: TFloatField;
    aqQueryDSDesigner4: TFloatField;
    aqQueryUNIT_NAME: TStringField;
    aqQueryPO_REV_NO: TStringField;
    aqQueryEMPLOYEE_NAME: TStringField;
    aqQueryLOCATION: TStringField;
    aqQueryship_DATE: TDateTimeField;
    aqQuerySUPPLIER2: TStringField;
    aqQueryrohs: TStringField;
    aqQueryBARCODE_ID: TStringField;
    aqQueryEXPIRE_DATE: TDateTimeField;
    aqQuerycust_decl: TStringField;
    aqQueryDSDesigner5: TFloatField;
    aqQueryDSDesigner6: TFloatField;
    aqQueryv_type: TStringField;
    aqQueryspec_place: TStringField;
    aqQueryANALYSIS_CODE1: TStringField;
    aqQueryINV_PART_DESCRIPTION: TStringField;
    aqQueryABBR_NAME: TStringField;
    aqQuerypo_emplname: TStringField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport3: TfrmReport3;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport3.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport3.btnQueryClick(Sender: TObject);
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
        Parameters[1].Value:= 'and t456.ship_DATE Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[2].Value:= 'Order By GROUP_DESC,inv_part_number';
        Open;
      end;
    end;
  end;
end;

end.
