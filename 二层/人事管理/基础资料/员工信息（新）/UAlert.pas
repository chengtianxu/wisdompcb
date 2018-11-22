unit UAlert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, DB, ADODB;

type
  TFrmAlert = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    dbgrdh1: TDBGridEh;
    dbgrdh2: TDBGridEh;
    lbl1: TLabel;
    lbl2: TLabel;
    btnExcel: TBitBtn;
    btn1: TBitBtn;
    ds1: TDataSource;
    ds2: TDataSource;
    qry1: TADOQuery;
    qry2: TADOQuery;
    wdstrngfldqry1employeecode: TWideStringField;
    wdstrngfldqry1chinesename: TWideStringField;
    wdstrngfldqry1departmentname: TWideStringField;
    wdstrngfldqry1position_item: TWideStringField;
    dtmfldqry1ondutytime: TDateTimeField;
    dtmfldqry1adate: TDateTimeField;
    wdstrngfldqry2employeecode: TWideStringField;
    wdstrngfldqry2chinesename: TWideStringField;
    wdstrngfldqry2departmentname: TWideStringField;
    wdstrngfldqry2position_item: TWideStringField;
    dtmfldqry2ondutytime: TDateTimeField;
    dtmfldqry2adate: TDateTimeField;
    procedure btnExcelClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlert: TFrmAlert;

implementation
      uses udm,common;
{$R *.dfm}

procedure TFrmAlert.btnExcelClick(Sender: TObject);
begin
   if qry1.IsEmpty  then exit;
      Export_dbGridEH_to_Excel(dbgrdh1,'快过试用期人员名单');
end;

procedure TFrmAlert.btn1Click(Sender: TObject);
begin
    if qry2.IsEmpty  then exit;
      Export_dbGridEH_to_Excel(dbgrdh2,'已过试用期还未转正人员名单');
end;

procedure TFrmAlert.FormShow(Sender: TObject);
begin
 if not qry1.Active then qry1.Open;
 if not qry2.Active then qry2.Open;

end;

end.
