unit PasCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ComCtrls, DB,
  ADODB;

type
  TfrmCheck = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnExit: TBitBtn;
    Label1: TLabel;
    btnExport: TBitBtn;
    dtpkbegin: TDateTimePicker;
    Label2: TLabel;
    dtpkend: TDateTimePicker;
    dbCheck: TDBGridEh;
    dsCheck: TADODataSet;
    DataSource1: TDataSource;
    btnquery: TBitBtn;
    dsCheckdepartmentname: TWideStringField;
    dsChecksumgs: TFloatField;
    intgrfldCheckdepartmentid: TIntegerField;
    fltfldCheckrwt: TFloatField;
    fltfldCheckrot: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnqueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheck: TfrmCheck;

implementation

uses DMFrm,common,DateUtils;

{$R *.dfm}

procedure TfrmCheck.FormShow(Sender: TObject);
begin
  dtpkbegin.Date:= IncDay(getsystem_date(DM1.qrytmp,1),-1);
  dtpkend.Date:=dtpkbegin.Date;
end;

procedure TfrmCheck.btnExportClick(Sender: TObject);
begin
  if dsCheck.RecordCount>0 then
    common.Export_dbGridEH_to_Excel(dbCheck,frmCheck.Caption);
end;

procedure TfrmCheck.btnqueryClick(Sender: TObject);
begin
  dsCheck.Close;
  dsCheck.Parameters.ParamByName('start').Value:=dtpkbegin.Date;
  dsCheck.Parameters.ParamByName('ed').Value:=dtpkend.Date;
  dsCheck.Open;
end;

end.
