unit Report7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport7 = class(TfrmBaseForm)
    aqQuerycode: TStringField;
    aqQuerysupplier_name: TStringField;
    aqQueryabbr_name: TStringField;
    aqQuerystatus: TStringField;
    aqQuerybrother_flag: TStringField;
    aqQueryttype: TStringField;
    aqQuerysuppier_ent_date: TDateTimeField;
    aqQuerycontact_name_1: TStringField;
    aqQuerycont_phone_1: TStringField;
    aqQueryphone: TStringField;
    aqQueryfax: TStringField;
    aqQuerytelex: TStringField;
    aqQuerycurr_name: TStringField;
    aqQuerycountry_name: TStringField;
    aqQueryemployee_name: TStringField;
    aqQueryupdate_date: TDateTimeField;
    aqQuerybilling_address_1: TStringField;
    aqQuerytax_id_number: TStringField;
    aqQuerydeveloper: TWideStringField;
    aqQueryinvalid_explain: TWideStringField;
    aqQueryanalysis_code1: TStringField;
    aqQueryFacName: TStringField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport7: TfrmReport7;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport7.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport7.btnQueryClick(Sender: TObject);
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
//        Parameters[1].Value:= 'and d23.suppier_ent_date Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
//                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[1].Value:= vCondition;
        Parameters[2].Value:= 'Order By d23.code' + #13;
        Parameters[3].Value:= frmCondition.AreaName;
        Open;
      end;
    end;
  end;
end;

end.
