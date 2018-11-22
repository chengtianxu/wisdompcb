unit Report10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport10 = class(TfrmBaseForm)
    aqQueryPO_REQ_NUMBER: TStringField;
    aqQueryDEPARTMENT_NAME: TStringField;
    aqQueryREQ_DATE: TDateTimeField;
    aqQueryEMPLOYEE_NAME: TStringField;
    aqQuerywarehouse_name: TStringField;
    aqQueryDESCRIPTION_1: TStringField;
    aqQueryDESCRIPTION_2: TStringField;
    aqQueryabbr_name: TStringField;
    aqQueryAUTH_DATE: TDateTimeField;
    aqQueryQUANTITY_REQUIRED: TFloatField;
    aqQuerytax_PRICE: TFloatField;
    aqQueryrohs: TStringField;
    aqQueryCURR_CODE: TStringField;
    aqQuerygui_ge: TStringField;
    aqQueryreason: TStringField;
    aqQuerytotal: TFloatField;
    aqQueryENT_DATE: TDateTimeField;
    aqQueryEDITED_DATE: TDateTimeField;
    aqQueryunit_name: TStringField;
    aqQueryv_status: TStringField;
    aqQueryDEPT_NAME: TStringField;
    aqQueryBackReason: TStringField;
    aqQueryBuyer: TStringField;
    aqQueryPO_Do_Hour: TIntegerField;
    aqQueryBackType: TStringField;
    aqQueryPM_GG: TStringField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport10: TfrmReport10;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport10.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport10.btnQueryClick(Sender: TObject);
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
