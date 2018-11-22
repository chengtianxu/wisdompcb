unit ChangeRecFrm_mod26;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseSinglePickListFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.Win.ADODB, Vcl.Buttons;

type
  TfrmChangeRec_mod26 = class(TfrmSinglePickList)
    cdsAVGP: TClientDataSet;
    ds_AVGP: TDataSource;
    btn_detail: TButton;
    btn_AVGChange: TButton;
    lbl1: TLabel;
    dtpk1: TDateTimePicker;
    lbl2: TLabel;
    dtpk2: TDateTimePicker;
    qrytemp: TADOQuery;
    eh_Avg: TDBGridEh;
    strngfldGROUP_NAME: TStringField;
    strngfldGROUP_DESC: TStringField;
    qrytempold_price: TFloatField;
    qrytempnew_price: TFloatField;
    qrytempchange_price: TFloatField;
    qrytempchange_rate: TFloatField;
    btnExit: TBitBtn;
    btnExportToExcel: TBitBtn;
    pnl4: TPanel;
    procedure btn_AVGChangeClick(Sender: TObject);
    procedure btn_detailClick(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure dtpk2Exit(Sender: TObject);
    procedure eh_AvgKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      procedure GetData328(ABDate, AEDate: string);
  end;

var
  frmChangeRec_mod26: TfrmChangeRec_mod26;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmChangeRec_mod26.btnExitClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmChangeRec_mod26.btnExportToExcelClick(Sender: TObject);
begin
  inherited;
     if eh1.Visible then
     if not cdspick.IsEmpty then
      gFunc.Export_dbGridEH_to_Excel(eh1);

     if eh_Avg.Visible then
     if not cdsAVGP.IsEmpty then
      gFunc.Export_dbGridEH_to_Excel(eh_Avg);

end;

procedure TfrmChangeRec_mod26.btn_AVGChangeClick(Sender: TObject);
begin
  inherited;
    eh1.Visible:=False;
    eh_Avg.Visible:=true;
end;

procedure TfrmChangeRec_mod26.btn_detailClick(Sender: TObject);
begin
  inherited;
    eh1.Visible:=true;
    eh_Avg.Visible:=False;
end;

procedure TfrmChangeRec_mod26.dtpk1Exit(Sender: TObject);
begin
  inherited;
GetData328( FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk1.Date), FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk2.Date) );
end;

procedure TfrmChangeRec_mod26.dtpk2Exit(Sender: TObject);
begin
  inherited;
 GetData328( FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk1.Date), FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk2.Date) );
end;

procedure TfrmChangeRec_mod26.eh_AvgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssAlt in Shift)  and  (Key=86) then
  begin
    showmessage(cdsAVGP.CommandText);
  end;
end;

procedure TfrmChangeRec_mod26.GetData328(ABDate, AEDate: string);
var
Lsql,Lsql_AVG:string;
begin

  Lsql:='SELECT Data0496.GROUP_NAME, Data0496.GROUP_DESC, '+
' Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION,'+
' Data0023.CODE, data0328.old_price,data0023.abbr_name,'+
' data0328.new_price, data0328.sys_longdate, data0328.reason, '+
' Data0005.EMPLOYEE_NAME,'+
' data0328.new_price-data0328.old_price as change_price,'+
' round((data0328.new_price-data0328.old_price)*100/data0328.old_price,2)'+
' as change_rate,Data0001.CURR_CODE,data0002.unit_code'+
' FROM Data0017 INNER JOIN'+
' Data0028 ON Data0017.RKEY = Data0028.INVENTORY_PTR INNER JOIN'+
' data0328 ON Data0028.RKEY = data0328.price_ptr INNER JOIN'+
' Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN'+
' Data0023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY INNER JOIN'+
' Data0005 ON data0328.user_ptr = Data0005.RKEY INNER JOIN'+
' dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'+
' dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY'+
' where data0328.sys_longdate>='''+ABDate+''' and data0328.sys_longdate<='''+AEDate+''''+
' and  (data0328.old_price > 0)' ;

  //showmessage('11:'+Lsql);
 if not gSvrIntf.IntfGetDataBySql(Lsql,cdspick) then exit;

    Lsql_AVG:='SELECT TOP 100 PERCENT dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC, '+
      ' ROUND(AVG(dbo.data0328.old_price * dbo.Data0001.BASE_TO_OTHER), 2)    AS old_price,'+
      ' ROUND(AVG(dbo.data0328.new_price * dbo.Data0001.BASE_TO_OTHER), 2)  AS new_price,'+
      ' ROUND(AVG(dbo.data0328.new_price * dbo.Data0001.BASE_TO_OTHER -'+
      ' dbo.data0328.old_price * dbo.Data0001.BASE_TO_OTHER), 2) AS avg_changeprice,'+
      ' ROUND(AVG(((data0328.new_price * Data0001.BASE_TO_OTHER -'+
      ' data0328.old_price * Data0001.BASE_TO_OTHER) * 100) ) / avg((data0328.old_price * Data0001.BASE_TO_OTHER) ), 2)  AS change_rate'+
      ' FROM dbo.data0328 INNER JOIN '+
      ' dbo.Data0028 ON dbo.data0328.price_ptr = dbo.Data0028.RKEY INNER JOIN '+
      ' dbo.Data0017 ON dbo.Data0028.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN '+
      ' dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN '+
      ' dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY '+
      ' WHERE (dbo.data0328.old_price > 0)  '+
      ' AND data0328.sys_longdate>='''+ABDate+''' and data0328.sys_longdate<='''+AEDate+''' '+
      ' GROUP BY dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC '+
      ' ORDER BY dbo.Data0496.GROUP_NAME ';
    //showmessage('22:'+Lsql_AVG);
 if not gSvrIntf.IntfGetDataBySql(Lsql_AVG,cdsAVGP) then exit;
 Lsql:='';


end;

end.
