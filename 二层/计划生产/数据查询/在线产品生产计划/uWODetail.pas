unit uWODetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh;

type
  TfrmWoDetail = class(TForm)
    eh1: TDBGridEh;
    qry1: TADOQuery;
    ds1: TDataSource;
    dtmfldqry1INTIME: TDateTimeField;
    dtmfldqry1OUTTIME: TDateTimeField;
    intgrfldqry1shours: TIntegerField;
    strngfldqry1dptname: TStringField;
    intgrfldqry1QTY_PROD: TIntegerField;
    intgrfldqry1QTY_REJECT: TIntegerField;
    intgrfldqry1panels: TIntegerField;
    strngfldqry1employee_name: TStringField;
    smlntfldqry1step_no: TSmallintField;
    strngfldqry1ACTION_REF: TStringField;
    strngfldqry1wtype: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
   procedure GetData(rkey06:integer);

  end;

var
  frmWoDetail: TfrmWoDetail;

implementation
          uses UDM;
{$R *.dfm}

{ TfrmWoDetail }

procedure TfrmWoDetail.GetData(rkey06: integer);
begin
 qry1.close;
 qry1.Parameters.ParamByName('rkey06').Value:=rkey06;
 qry1.open;
end;

end.
