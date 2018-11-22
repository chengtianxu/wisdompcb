unit UReqDetailFrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.StdCtrls, Vcl.ExtCtrls,uBaseSinglePickListFrm, uCommFunc, System.DateUtils,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TFrmReqDetail_mod496 = class(TfrmSinglePickList)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btnExit: TBitBtn;
    btnExportToExcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure dtp1Exit(Sender: TObject);
    procedure dtp2Exit(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
    procedure ReGetData;
  public
    { Public declarations }
  end;

var
  FrmReqDetail_mod496: TFrmReqDetail_mod496;

implementation

{$R *.dfm}

procedure TFrmReqDetail_mod496.btnExitClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TFrmReqDetail_mod496.btnExportToExcelClick(Sender: TObject);
begin
  inherited;
  if MessageBox(Handle,'是否导出到EXCEL','提示',MB_YESNO) = IDYES then
  begin
    if not cdspick.IsEmpty then
    begin
      gFunc.Export_dbGridEH_to_Excel(eh1);
    end else
      ShowMessage('导出数据为空');
  end;
end;

procedure TFrmReqDetail_mod496.dtp1Change(Sender: TObject);
begin
  inherited;
  ReGetData;
end;

procedure TFrmReqDetail_mod496.dtp1Exit(Sender: TObject);
begin
  inherited;
  ReGetData;
end;

procedure TFrmReqDetail_mod496.dtp2Exit(Sender: TObject);
begin
  inherited;
  ReGetData;
end;

procedure TFrmReqDetail_mod496.edtFilterChange(Sender: TObject);
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

procedure TFrmReqDetail_mod496.FormCreate(Sender: TObject);
begin
  inherited;
  dtp2.Date := gfunc.GetSvrDateTime;
  dtp1.Date := IncDay(dtp2.Date, -7);
end;

procedure TFrmReqDetail_mod496.ReGetData;
var
  lsql, lsql2: string;
begin

  lsql := 'SELECT  dbo.DATA0268.rkey, dbo.DATA0268.number AS 领料单号, dbo.Data0005.EMPLOYEE_NAME AS 申领人员,dbo.Data0034.DEPT_NAME AS 部门,  '
    + ' dbo.Data0017.INV_PART_NUMBER AS 材料编码, dbo.Data0017.INV_NAME AS 材料名称, dbo.Data0017.INV_DESCRIPTION AS 材料规格, '
    + '  dbo.Data0468.VENDOR AS 供应商, dbo.Data0002.UNIT_NAME AS 单位, dbo.Data0468.QUAN_BOM AS 申领数量, '
    + '  dbo.Data0468.QUAN_ISSUED AS 已发放数量, dbo.DATA0268.DATE AS 申领日期, dbo.DATA0268.DATE, dbo.DATA0268.reference AS 备注, '
    + ' dbo.Data0015.WAREHOUSE_CODE AS 工厂代码, dbo.Data0015.ABBR_NAME AS 工厂简称' +
    ' FROM  dbo.Data0468 INNER JOIN   ' +
    '  dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN  '
    + '  dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo.DATA0268.rkey INNER JOIN    '
    + '  dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN   '
    + '  dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY INNER JOIN  '
    + ' dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = dbo.Data0005.RKEY INNER JOIN  '
    + '  dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY ';

  lsql2 := ' where   dbo.DATA0268.DATE >= ''' + formatdatetime('yyyy-MM-dd',
    dtp1.Date) + ''' AND dbo.DATA0268.DATE <=  ''' +
    formatdatetime('yyyy-MM-dd', dtp2.Date) + ''' ';

  lsql := lsql + lsql2;
  if not gSvrIntf.IntfGetDataBySql(lsql, cdsPick) then
    ShowMessage('取数据失败!');
end;

end.
