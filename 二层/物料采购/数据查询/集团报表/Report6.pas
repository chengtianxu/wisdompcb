unit Report6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport6 = class(TfrmBaseForm)
    aqQueryINV_PART_NUMBER: TStringField;
    aqQueryINV_PART_DESCRIPTION: TStringField;
    aqQueryGROUP_DESC: TStringField;
    aqQueryABBR_NAME: TStringField;
    aqQueryzaitu: TFloatField;
    aqQueryUNIT_NAME: TStringField;
    aqQuerytax_price: TFloatField;
    aqQueryTAX_2: TBCDField;
    aqQueryPO_DATE: TDateTimeField;
    aqQueryREQ_DATE: TDateTimeField;
    aqQueryPO_NUMBER: TStringField;
    aqQueryANALYSIS_CODE_1: TStringField;
    aqQueryreason: TStringField;
    aqQueryrohs: TStringField;
    aqQueryComNm: TStringField;
    aqQueryvType: TStringField;
    aqQueryANALYSIS_CODE1: TStringField;
    aqQueryEMPLOYEE_NAME: TStringField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport6: TfrmReport6;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport6.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport6.btnQueryClick(Sender: TObject);
var
  i:byte;
  vCondition: widestring;
begin
  inherited;
  with frmCondition do
  begin
    dtpk1.Date:= Now-365*20;
    dtpk2.Date:= Now;
    if ShowModal = mrok then
    begin
      with aqQuery do
      begin
        Close;
        Parameters[0].Value:= frmCondition.Link;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
          vCondition:= vCondition + frmCondition.SGrid1.Cells[2,i] + #13;
        Parameters[1].Value:= 'and t71.REQ_DATE Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[2].Value:= 'Order By PO_NUMBER';
        Open;
      end;
    end;
  end;
end;

end.
