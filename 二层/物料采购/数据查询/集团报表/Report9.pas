unit Report9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport9 = class(TfrmBaseForm)
    aqQueryPO_REQ_NUMBER: TStringField;
    aqQueryDEPARTMENT_NAME: TStringField;
    aqQueryAUTH_DATE: TDateTimeField;
    aqQueryREQ_DATE: TDateTimeField;
    aqQueryEMPLOYEE_NAME: TStringField;
    aqQueryabbr_NAME: TStringField;
    aqQueryINV_PART_NUMBER: TStringField;
    aqQueryINV_PART_description: TStringField;
    aqQueryQUANTITY: TFloatField;
    aqQuerytax_PRICE: TFloatField;
    aqQuerycode: TStringField;
    aqQueryCURR_CODE: TStringField;
    aqQueryreason: TStringField;
    aqQueryENT_DATE: TDateTimeField;
    aqQuerytotal: TFloatField;
    aqQueryEDITED_DATE: TDateTimeField;
    aqQueryrohs: TStringField;
    aqQueryunit_name: TStringField;
    aqQueryANALYSIS_CODE1: TStringField;
    aqQueryv_status: TStringField;
    aqQueryDEPT_NAME: TStringField;
    aqQueryBackReason: TStringField;
    aqQueryBuyer: TStringField;
    aqQueryPO_Do_Hour: TIntegerField;
    aqQueryBackType: TStringField;
    aqQueryUndo_Day: TIntegerField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport9: TfrmReport9;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport9.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport9.btnQueryClick(Sender: TObject);
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
        Parameters[1].Value:= 'and t68.req_date Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[2].Value:= 'Order By t68.po_req_number';
        Open;
      end;
    end;
  end;
end;

end.
