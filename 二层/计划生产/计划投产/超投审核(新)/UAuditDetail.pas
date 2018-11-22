unit UAuditDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, DB, ADODB;

type
  TfrmAuditDetail = class(TForm)
    pnl1: TPanel;
    eh1: TDBGridEh;
    ds1: TDataSource;
    qry1: TADOQuery;
    wrdfldqry1DSDesigner: TWordField;
    strngfldqry1DSDesigner2: TStringField;
    dtmfldqry1DSDesigner3: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditDetail: TfrmAuditDetail;

implementation
   uses damo;
{$R *.dfm}

end.
