unit USelBomFrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseSinglePickListFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, uCommFunc, System.DateUtils;

type
  TFrmSelBom_mod496 = class(TfrmSinglePickList)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure dtp1Exit(Sender: TObject);
    procedure dtp2Exit(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
  private
    { Private declarations }
    PLsql: string;
    procedure ReGetData;
  public
    { Public declarations }
  end;

var
  FrmSelBom_mod496: TFrmSelBom_mod496;

implementation

{$R *.dfm}

procedure TFrmSelBom_mod496.dtp1Exit(Sender: TObject);
begin
  inherited;
  ReGetData;
end;

procedure TFrmSelBom_mod496.dtp2Exit(Sender: TObject);
begin
  inherited;
  ReGetData;
end;

procedure TFrmSelBom_mod496.edtFilterChange(Sender: TObject);
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

procedure TFrmSelBom_mod496.FormCreate(Sender: TObject);
begin
  inherited;
  dtp1.Date := gfunc.GetSvrDateTime;
  dtp2.Date := IncDay(dtp1.Date, 1);
  PLsql := cdsPick.CommandText;

end;

procedure TFrmSelBom_mod496.ReGetData;
var
  lsql: string;
begin
  // lsql:=PLsql+
  // ' and    data0492.ISSUE_DATE>='''+formatdatetime('yyyy-MM-dd',dtp1.date)+'''   '+
  // ' and    data0492.ISSUE_DATE<='''+formatdatetime('yyyy-MM-dd',dtp2.date)+''' ';

  lsql := ' SELECT   data0492.rkey ,dbo.data0492.CUT_NO 配料单号, dbo.data0492.SO_NO 销售订单号, dbo.Data0025.MANU_PART_NUMBER 本厂编号, dbo.Data0025.MANU_PART_DESC 客户型号,  '
    + ' data0492.ISSUE_DATE 投产日期,case data0492.TTYPE when 0 then ''正常投产'' when 1 then ''补料投产'' '
    + ' when 2 then ''MRB重投'' when 3 then ''MRB返修'' when 4 then ''按料号投产'' end 投产类型,    '
    + ' dbo.data0492.ISSUED_QTY 投产数量,dbo.data0492.PANEL_1_QTY  as A板块数, dbo.data0492.PANEL_2_QTY as B板块数 '
    + ' FROM   dbo.data0492  ' +
    '  INNER JOIN  dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo.Data0025.RKEY ' +
    ' WHERE     (dbo.data0492.TSTATUS IN (0, 2)) AND  data0492.TTYPE <>3 ' +
    '  and dbo.data0492.ISSUE_DATE>=''' + formatdatetime('yyyy-MM-dd',
    dtp1.Date) + ''' and dbo.data0492.ISSUE_DATE<=''' +
    formatdatetime('yyyy-MM-dd', dtp2.Date) + '''  ';

  if not gSvrIntf.IntfGetDataBySql(lsql, cdsPick) then
    ShowMessage('取数据失败!');

end;

end.
