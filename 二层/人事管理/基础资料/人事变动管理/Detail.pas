unit Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  Tfm_detail = class(TForm)
    lb_name: TLabel;
    dbt_name: TDBEdit;
    lb_type: TLabel;
    dbt_type: TDBEdit;
    lb_posit: TLabel;
    dbt_posit: TDBEdit;
    lb_dept: TLabel;
    dbt_dept: TDBEdit;
    lb_sex: TLabel;
    dbt_sex: TDBEdit;
    lb_oper: TLabel;
    lb_alt: TLabel;
    dbt_manager: TDBEdit;
    dbt_alt: TDBEdit;
    lb_in: TLabel;
    dbt_in: TDBEdit;
    lb_odept: TLabel;
    dbt_odept: TDBEdit;
    lb_ndept: TLabel;
    dbt_ndept: TDBEdit;
    lb_oposit: TLabel;
    dbt_oposit: TDBEdit;
    lb_nposit: TLabel;
    dbt_nposit: TDBEdit;
    lb_otype: TLabel;
    dbt_otype: TDBEdit;
    lb_ntype: TLabel;
    dbt_ntype: TDBEdit;
    btn_close: TButton;
    lb_code: TLabel;
    dbt_code: TDBEdit;
    lb_ocode: TLabel;
    dbt_ocode: TDBEdit;
    lb_ncode: TLabel;
    dbt_ncode: TDBEdit;
    procedure btn_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_detail: Tfm_detail;

implementation
uses damo;
{$R *.dfm}

procedure Tfm_detail.btn_closeClick(Sender: TObject);
begin
  close;
end;

end.
