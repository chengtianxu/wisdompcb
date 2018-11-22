unit USendDetailFrm_mod38;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseSinglePickListFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls,uCommFunc, Data.Win.ADODB,System.DateUtils;

type
  TfrmSendDetail_mod38 = class(TfrmSinglePickList)
    btnClose: TButton;
    btnExport: TButton;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    qry1: TADOQuery;
    strngfldqry1领料单号: TStringField;
    strngfldqry1出仓单号: TStringField;
    strngfldqry1材料编码: TStringField;
    strngfldqry1材料名称: TStringField;
    strngfldqry1材料规格: TStringField;
    strngfldqry1材料类型: TStringField;
    strngfldqry1供应商: TStringField;
    strngfldqry1领料工厂: TStringField;
    strngfldqry1领料部门代码: TStringField;
    strngfldqry1领料部门名称: TStringField;
    strngfldqry1部门类型: TStringField;
    fltfldqry1发料数量: TFloatField;
    strngfldqry1单位: TStringField;
    dtmfldqry1发料日期: TDateTimeField;
    strngfldqry1原供应商或批号: TStringField;
    strngfldqry1领料人员: TStringField;
    strngfldqry1发料备注: TStringField;
    strngfldqry1发料仓库: TStringField;
    strngfldqry1发料人员: TStringField;
    procedure btnCloseClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure DTPk2Change(Sender: TObject);
    procedure dtpk1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSendDetail_mod38: TfrmSendDetail_mod38;

implementation

{$R *.dfm}

procedure TfrmSendDetail_mod38.btnCloseClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmSendDetail_mod38.btnExportClick(Sender: TObject);
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

procedure TfrmSendDetail_mod38.dtpk1Change(Sender: TObject);
begin
  inherited;
   cdsPick.Filter:=' 发料日期 >= '''+formatdatetime('yyyy-MM-dd hh:mm:ss',dtpk1.Date)+''' and 发料日期 <= '''+formatdatetime('yyyy-MM-dd hh:mm:ss',dtpk2.Date)+''' ';
   cdsPick.Filtered:=true;
end;

procedure TfrmSendDetail_mod38.DTPk2Change(Sender: TObject);
begin
  inherited;
   dtpk1Change(sender);
end;

procedure TfrmSendDetail_mod38.edtFilterChange(Sender: TObject);
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

procedure TfrmSendDetail_mod38.FormCreate(Sender: TObject);
begin
  inherited;
      dtpK2.Date:=gFunc.GetSvrDateTime;
       dtpk1.Date:=dtpK2.Date-dayof(dtpK2.Date)+1;
end;

end.
