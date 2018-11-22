unit RecInf_Mode280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,uCommFunc,
  Data.Win.ADODB, Datasnap.Provider;

type
  TfrmRecInf_Mod280 = class(TfrmBase)
    Panel1: TPanel;
    Dg71: TDBGrid;
    Dg22: TDBGrid;
    Button1: TButton;
    cds71: TClientDataSet;
    cds72: TClientDataSet;
    cds22: TClientDataSet;
    cds235: TClientDataSet;
    ds71: TDataSource;
    ds22: TDataSource;
    Panel2: TPanel;
    cds71PO_NUMBER: TStringField;
    cds71INV_PART_NUMBER: TStringField;
    cds71INV_PART_DESCRIPTION: TStringField;
    cds71QUAN_ORD: TBCDField;
    cds71QUAN_RECD: TBCDField;
    cds72PO_NUMBER: TStringField;
    cds72DESCRIPTION: TStringField;
    cds72GUI_GE: TStringField;
    cds72QUAN_ORD: TFloatField;
    cds72QUANTITY_RECEIVED: TFloatField;
    cds22GRN_NUMBER: TStringField;
    cds22TDATE: TDateTimeField;
    cds22QUANTITY: TFloatField;
    cds22WAREHOUSE_CODE: TStringField;
    cds22LOCATION: TStringField;
    cds22BARCODE_ID: TStringField;
    cds22REF_NUMBER: TStringField;
    cds22EMPLOYEE_NAME: TStringField;
    cds235GRN_NUMBER: TStringField;
    cds235DATE_RECD: TDateTimeField;
    cds235QUAN_RECD: TBCDField;
    cds235REF_NUMBER: TStringField;
    cds235EMPLOYEE_NAME: TStringField;
    cds71rkey: TAutoIncField;
    cds72rkey: TAutoIncField;
    procedure cds71AfterScroll(DataSet: TDataSet);
    procedure cds72AfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecInf_Mod280: TfrmRecInf_Mod280;

implementation

{$R *.dfm}

procedure TfrmRecInf_Mod280.cds71AfterScroll(DataSet: TDataSet);
var
Lsql22:string;
begin
  inherited;
  Lsql22:='SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0022.TDATE, dbo.Data0022.QUANTITY,'+
      ' dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.LOCATION,'+
      ' dbo.Data0022.BARCODE_ID, dbo.Data0456.REF_NUMBER,'+
      ' dbo.Data0005.EMPLOYEE_NAME'+
      ' FROM dbo.Data0456 INNER JOIN'+
      ' dbo.Data0022 ON dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR INNER JOIN'+
      ' dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY INNER JOIN'+
      ' dbo.Data0015 ON'+
      ' dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY LEFT OUTER JOIN'+
      ' dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY'+
      ' where data0022.source_ptr='+cds71.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(Lsql22,cds22);
end;

procedure TfrmRecInf_Mod280.cds72AfterScroll(DataSet: TDataSet);
var
Lsql235:string;
begin
  inherited;
     Lsql235:='SELECT Data0456.GRN_NUMBER, dbo.Data0235.DATE_RECD,'+
       ' Data0235.QUAN_RECD, dbo.Data0456.REF_NUMBER,'+
       ' Data0005.EMPLOYEE_NAME'+
       ' FROM Data0456 INNER JOIN '+
       ' Data0235 ON dbo.Data0456.RKEY = dbo.Data0235.GRN_PTR INNER JOIN'+
       ' Data0005 ON dbo.Data0235.EMPL_PTR = dbo.Data0005.RKEY'+
       ' where data0235.d0072_ptr=:'+cds72.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(Lsql235,cds235);
end;

procedure TfrmRecInf_Mod280.FormActivate(Sender: TObject);
begin
  inherited;
  Dg71.Columns[0].Width := 102;
  Dg71.Columns[1].Width := 178;
  Dg71.Columns[2].Width := 215;
  Dg71.Columns[3].Width := 76;
  Dg71.Columns[4].Width := 76;
end;

procedure TfrmRecInf_Mod280.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if key=27 then
  self.ModalResult:=mrcancel;
end;

end.
