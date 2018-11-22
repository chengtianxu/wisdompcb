unit USelAuditCodeFrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm,
  uBaseSinglePickListFrm, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.StdCtrls, Vcl.ExtCtrls, uCommFunc;

type
  TFrmSelAuditCode = class(TfrmSinglePickList)
    eh2: TDBGridEh;
    ds275: TDataSource;
    cds275: TClientDataSet;
    procedure cdsPickAfterScroll(DataSet: TDataSet);
    procedure edtFilterChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelAuditCode: TFrmSelAuditCode;

implementation

{$R *.dfm}

procedure TFrmSelAuditCode.cdsPickAfterScroll(DataSet: TDataSet);
var
  ssql: string;
begin
  inherited;
  //
  ssql := 'SELECT   dbo.Data0073.USER_LOGIN_NAME as 人员代码 , dbo.Data0073.USER_FULL_NAME as 人员名称,  DATA0275.LOWER_LIMIT as 金额下限,DATA0275.UPPER_LIMIT as 金额上限'
    + ' FROM  dbo.Data0275 INNER JOIN ' +
    ' dbo.Data0073 ON dbo.Data0275.USER_PTR = dbo.Data0073.RKEY ' +
    ' where dbo.DATA0275.auth_group_ptr= ' +
    inttostr(cdspick.fieldbyname('rkey').asinteger) + ' ';

  gSvrIntf.IntfGetDataBySql(ssql, cds275);

end;

procedure TFrmSelAuditCode.edtFilterChange(Sender: TObject);
var
  fDate: Tdatetime;
begin

  if (FHotColumn.Field.DataType in [ftDate, ftDateTime]) and (trim(edtFilter.text)<>'') then
    if not TryStrToDate(trim(edtFilter.text), fDate) then
    begin
      Showmessage(trim(edtFilter.text) + '不是日期格式！');
      exit;
    end;
  inherited;
end;

end.
