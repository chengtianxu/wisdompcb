unit ChangQryFrm_mod26;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseSinglePickListFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.Win.ADODB, Vcl.Buttons;

type
  TfrmChangQry_mod26 = class(TfrmSinglePickList)
    btn_detail: TButton;
    btn_AVGChange: TButton;
    qrytemp: TADOQuery;
    strngfldEMPLOYEE_NAME: TStringField;
    qrytempsys_longdate: TDateTimeField;
    qrytempold_price: TFloatField;
    qrytempnew_price: TFloatField;
    strngfldqrytempreason: TStringField;
    qrytempchange: TFloatField;
    qrytemprand: TFloatField;
    qrytempsys_sortdate: TDateTimeField;
    pnl_chart: TPanel;
    pnl4: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    btnExportToExcel: TBitBtn;
    btnExit: TBitBtn;
    procedure btn_detailClick(Sender: TObject);
    procedure btn_AVGChangeClick(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure dtpk2Exit(Sender: TObject);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     //FBdate,FEDate: TDateTime;
      FRkey:string;
    procedure GetData328(Arkey:string;ABDate,AEDate:string);
  end;

var
  frmChangQry_mod26: TfrmChangQry_mod26;

implementation

{$R *.dfm}

procedure TfrmChangQry_mod26.btnExitClick(Sender: TObject);
begin
  inherited;
 close;
end;

procedure TfrmChangQry_mod26.btnExportToExcelClick(Sender: TObject);
begin
  inherited;
      if not cdspick.IsEmpty then
      gFunc.Export_dbGridEH_to_Excel(eh1);

end;

procedure TfrmChangQry_mod26.btn_AVGChangeClick(Sender: TObject);
begin
  inherited;
   pnl3.Visible:=false;
   pnl_chart.Visible:=true;
end;

procedure TfrmChangQry_mod26.btn_detailClick(Sender: TObject);
begin
  inherited;
  pnl3.Visible:=true;
  pnl_chart.Visible:=false;
end;

procedure TfrmChangQry_mod26.dtpk1Exit(Sender: TObject);
begin
  inherited;
 GetData328(Frkey,FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk1.Date), FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk2.Date) );
end ;


procedure TfrmChangQry_mod26.GetData328(Arkey:string;ABDate, AEDate: string);
var
Lsql:string;
begin
Lsql:= ' select data0005.EMPLOYEE_NAME, data0328.sys_longdate, '+
      ' data0328.old_price, data0328.new_price,data0328.reason, '+
      ' round(data0328.new_price-data0328.old_price,2) as change,'+
       ' case when data0328.old_price>0 then'+
      ' round((data0328.new_price-data0328.old_price)*100/data0328.old_price,2)'+
      ' else 100 end as rand,'+
      ' CONVERT(datetime, CONVERT(varchar, sys_longdate, 102))  as sys_sortdate'+
      ' from data0328 inner join data0005'+
      ' on data0328.user_ptr=data0005.rkey'+
      ' where data0328.price_ptr = '+Arkey+' and'+
      ' data0328.sys_longdate >= '''+ABDate+''' and'+
      ' data0328.sys_longdate <= '''+AEDate+''' '+
      ' order by data0328.sys_longdate ' ;
 //showmessage(Lsql);
if not gSvrIntf.IntfGetDataBySql(Lsql,cdspick) then exit;

end;

procedure TfrmChangQry_mod26.dtpk2Exit(Sender: TObject);
begin
  inherited;
 GetData328(Frkey,FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk1.Date), FormatDateTime('yyyy-MM-dd hh:mm:ss',dtpk2.Date) );
end;

end.
